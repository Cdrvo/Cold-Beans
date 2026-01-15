#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 test;
extern MY_HIGHP_OR_MEDIUMP float dissolve;
extern MY_HIGHP_OR_MEDIUMP float time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;  // image_details uniform
extern MY_HIGHP_OR_MEDIUMP vec2 frozen;  // frozen uniform
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

// Function to apply dissolve effect - This is boilerplate code that pretty much all other mods use to make shaders work.
vec4 dissolve_mask(vec4 final_pixel, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : final_pixel.xyz, shadow ? final_pixel.a*0.3: final_pixel.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);

	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (final_pixel.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            final_pixel.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            final_pixel.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : final_pixel.xyz, res > adjusted_dissolve ? (shadow ? final_pixel.a*0.3: final_pixel.a) : .0);
}

// This is the actual meat and potatoes of the effect. The idea is to make a shimmery blueish color spread that kinda dances.
// Basically, MAKE SOME NOISE!!! then, MAKE IT BLUE!!!
vec4 effect(vec4 fragColor, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 originalTexColor = Texel(texture, texture_coords);
    vec2 uv = texture_coords * image_details.xy;
    // These lines above basically make sure the effect actual stays in the bounds as it is supposed to, and doesn't piss all over the underlying card.

    vec2 ice_uv = floor(uv * 6.0) / 6.0;
    // Noise definition (I just picked random numbers after watching a youtube tutorial and it worked so idk sue me)
    float n = sin(dot(ice_uv, vec2(13, 78))) * 43758; // Think of this code as "Give me a stable pseudo-random value for this coordinate."
    float noise = fract(n); // This part cleans up the value to be between 0 and 1

    float shimmer = 0.5 + 0.5 * sin(time * 0.8 + ice_uv.x * 3.0 + ice_uv.y * 2.0); //This sin is not the same implimentation as before.
    // This implimentation is to create intentional smooth motion between the effects that is somewhat predictable and stable. If we just did sin(time) - 
    // the entire shader would pulse all together, which is not the look I think we should be going for "Frozen."  We want a little bit of oscillation,
    // but not so much that it wobbles noticeably


    //Color definitions - these get mixed to help create a spread of colors.
    vec3 ice_dark  = vec3(0.10, 0.25, 0.45);
    vec3 ice_mid   = vec3(0.25, 0.55, 0.85);
    vec3 ice_light = vec3(0.75, 0.90, 1.00);

    vec3 ice_color = mix(ice_dark, ice_mid, noise);

    ice_color = mix(ice_color, ice_light, smoothstep(0.75, 1.0, noise) * 0.6);
    ice_color += shimmer * 0.05;

    // Once we get those colors mixed, we just need to get it onto the original texture and alpha.
    fragColor = vec4(ice_color, 0.45);
    fragColor.a *= originalTexColor.a;

    // This is for F# compiler BS
    fragColor.rgb += frozen.x * 0.00001;

    return dissolve_mask(fragColor, texture_coords, texture_coords);
}



// More boilerplate code for uniforms and vertex manipulation - All mods use something like this for their shaders
extern MY_HIGHP_OR_MEDIUMP vec2 mouse_screen_pos;
extern MY_HIGHP_OR_MEDIUMP float hovering;
extern MY_HIGHP_OR_MEDIUMP float screen_scale;

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position) {
    if (hovering <= 0.0) {
        return transform_projection * vertex_position;
    }
    
    // Calculate distance from screen center
    float mid_dist = length(vertex_position.xy - 0.5 * love_ScreenSize.xy) / length(love_ScreenSize.xy);
    
    // Calculate mouse offset effect
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy) / screen_scale;

    // Scale transformation effect only on position, not affecting texture coordinates
    float scale = 0.2 * (-0.03 - 0.3 * max(0.0, 0.3 - mid_dist)) * hovering * 
                  (length(mouse_offset) * length(mouse_offset)) / (2.0 - mid_dist);

    // Use uniforms in a non-disruptive way to prevent compiler optimization issues
    scale += frozen.x * 0.0 + frozen.y * 0.0 + image_details.x * 0.0 + image_details.y * 0.0;

    return transform_projection * vertex_position + vec4(0.0, 0.0, 0.0, scale);
}
#endif