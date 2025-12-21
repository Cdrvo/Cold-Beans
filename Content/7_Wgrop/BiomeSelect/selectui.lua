G.STATES.BIOMETREE = 9223376854775807
function CBWG.get_blind_modifier_ui(biome_key) 
    return {
        {
            n = G.UIT.T,
            config = {
                text = biome_key,
                scale = 0.5,
                colour = G.C.WHITE
            }
        }
    }
end
G.UIDEF.wgrop_biome_select_individual = function ( biome_key )
    local biome_modifiers = CBWG.get_blind_modifier_ui(biome_key) 
    return {
        n = G.UIT.C,
        config = {
            padding = 0.5,
        },
        nodes = {
            { -- biome title card thanks gud
                n = G.UIT.C,
                nodes = {
                    
                }
            },
            { -- the fuckin piece of shit
                n = G.UIT.C,
                nodes = {
                    { -- first row, for adding select button
                        n = G.UIT.R,
                        nodes = {
                            -- select button goes here
                        }
                    },
                    { -- second row, for adding biome modifiers etc. 
                        n = G.UIT.R,
                        nodes = {
                            { -- adding a column so that it doesn't die midwau
                                n = G.UIT.C,
                                nodes = biome_modifiers
                            },
                        }
                    },
                }
            },
        }
    }
end


G.UIDEF.wgrop_full_biome_selection = function ()
    local destination_biome_nodes = {}
    for i = 1, 2 do
        table.insert(destination_biome_nodes, G.UIDEF.wgrop_biome_select_individual(i))
    end
    return {
        n = G.UIT.ROOT,
        config = {
            padding = 0.2,
        },
        nodes = {
            { -- top row, used for destination biomes (aka biomes you can go to at any given time)
                n = G.UIT.R,
                nodes = destination_biome_nodes
            },
            { -- top row, used for destination biomes (aka biomes you can go to at any given time)
                n = G.UIT.R,
                nodes = {
                    G.UIDEF.wgrop_biome_select_individual("current")
                }
            },
        }
    }
end



-- im crying why is it called bio-metry
-- temp while we figure our shit out
function update_wgrop_biometree()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.BALLEY)
        if G.cb_wgrop_biome_selection then
            G.cb_wgrop_biome_selection:remove()
        end
        G.cb_wgrop_biome_selection = UIBox{
            definition = G.UIDEF.wgrop_full_biome_selection(),
            config = {align="bm", offset = {x=0,y=-5.5},major = G.hand, bond = 'Weak'}
        }
    G.STATE_COMPLETE = true
    end
    if G.buttons then G.buttons:remove(); G.buttons = nil end
end