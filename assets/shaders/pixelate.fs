#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP float dissolve;
extern MY_HIGHP_OR_MEDIUMP float time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;  // image_details uniform
extern MY_HIGHP_OR_MEDIUMP vec2 pixelate;  // frozen uniform
extern bool shadow;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_1;
extern MY_HIGHP_OR_MEDIUMP vec4 burn_colour_2;

vec4 RGB(vec4 c);

// [Util]
// Transform color from RGB to HSL
vec4 HSL(vec4 c);



vec4 lighten(vec4 colour1, vec4 colour2) {
    vec4 result;
    result.r = max(colour1.r, colour2.r);
    result.g = max(colour1.g, colour2.g);
    result.b = max(colour1.b, colour2.b);
    result.a = max(colour1.a, colour2.a);
    return result;
}

// Function to apply dissolve effect - This is boilerplate code that pretty much all other mods use to make shaders work.
vec4 dissolve_mask(vec4 final_pixel, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : final_pixel.xyz, shadow ? final_pixel.a*0.3: final_pixel.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	float dissolvePixel = 4.0; // SAME VALUE

    vec2 floored_uv =
        floor(uv * image_details / dissolvePixel)
        * dissolvePixel / image_details;

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

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec2 temp_image_details = image_details;
    float PIXELATE = 2.0;
    vec2 onepixel = vec2(1.0, 1.0) / image_details.xy;
    float card_x = texture_details.z / image_details.x;
    texture_coords = clamp(texture_coords, 0.0, 0.999);
    screen_coords = clamp(screen_coords, 0.0, 0.999);

    vec2 local_uv =
    (texture_coords - texture_details.xy) / texture_details.zw;

    vec2 sprite_pixels = texture_details.zw * image_details/PIXELATE;

    vec2 pixel_size = 1.0 / (texture_details.zw * image_details.xy / PIXELATE);
    vec2 snapped_local_uv = floor(local_uv * sprite_pixels) / sprite_pixels + 0.5 * pixel_size;


    vec2 snapped_uv = texture_details.xy + snapped_local_uv * texture_details.zw;    

    vec2 sprite_min = texture_details.xy + onepixel * 0.3;
    vec2 sprite_max = texture_details.xy + texture_details.zw - onepixel * 0.3;

    snapped_uv = clamp(snapped_uv, sprite_min, sprite_max);

    vec4 pixel = Texel(texture, snapped_uv);

    if (snapped_uv.y + pixelate.y + texture_coords.y + image_details.y == snapped_uv.y)
    {
        snapped_uv.y = pixelate.y;
    }

    vec2 aligned_uv = floor(snapped_uv * image_details / PIXELATE) * PIXELATE / image_details;

    return dissolve_mask(pixel, aligned_uv, aligned_uv);
}

number hue(number s, number t, number h)
{
	number hs = mod(h, 1.)*6.;
	if (hs < 1.) return (t-s) * hs + s;
	if (hs < 3.) return t;
	if (hs < 4.) return (t-s) * (4.-hs) + s;
	return s;
}

vec4 RGB(vec4 c)
{
	if (c.y < 0.0001)
		return vec4(vec3(c.z), c.a);

	number t = (c.z < .5) ? c.y*c.z + c.z : -c.y*c.z + (c.y+c.z);
	number s = 2.0 * c.z - t;
	return vec4(hue(s,t,c.x + 1./3.), hue(s,t,c.x), hue(s,t,c.x - 1./3.), c.w);
}

vec4 HSL(vec4 c)
{
	number low = min(c.r, min(c.g, c.b));
	number high = max(c.r, max(c.g, c.b));
	number delta = high - low;
	number sum = high+low;

	vec4 hsl = vec4(.0, .0, .5 * sum, c.a);
	if (delta == .0)
		return hsl;

	hsl.y = (hsl.z < .5) ? delta / sum : delta / (2.0 - sum);

	if (high == c.r)
		hsl.x = (c.g - c.b) / delta;
	else if (high == c.g)
		hsl.x = (c.b - c.r) / delta + 2.0;
	else
		hsl.x = (c.r - c.g) / delta + 4.0;

	hsl.x = mod(hsl.x / 6., 1.);
	return hsl;
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
    scale += pixelate.x * 0.0 + pixelate.y * 0.0 + image_details.x * 0.0 + image_details.y * 0.0;

    return transform_projection * vertex_position + vec4(0.0, 0.0, 0.0, scale);
}
#endif