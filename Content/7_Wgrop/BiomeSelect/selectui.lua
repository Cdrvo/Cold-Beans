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
    local biome_card = Sprite(0, 0, 3.2, 1.6, G.ASSET_ATLAS[CBWG.ColdBeans_Biomes[biome_key].atlas], CBWG.ColdBeans_Biomes[biome_key].pos)
    biome_card:define_draw_steps({
      {shader = 'dissolve', shadow_height = 0.05},
      {shader = 'dissolve'}
    })
    return {
        n = G.UIT.C,
        config = {
            align = "cm",
            padding = 0.1,
            emboss = 0.05,
            r = 0.1,
            colour = G.C.DYN_UI.BOSS_MAIN
        },
        nodes = {
            { -- biome title card thanks gud
                n = G.UIT.C, config={align = "cm"},
                nodes = {
              {     n=G.UIT.O, config={object = biome_card}}
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
        table.insert(destination_biome_nodes, G.UIDEF.wgrop_biome_select_individual(CBWG.get_new_biome(true)))
    end
    return {
        n = G.UIT.ROOT,
        config = {
            padding = 0.1,
            align = 'cl',
            colour = G.C.CLEAR
        },
        nodes = {
            UIBox_dyn_container({
                { -- top row, used for destination biomes (aka biomes you can go to at any given time)
                    n = G.UIT.R,
                    config = {
                        padding = 0.1,
                        align = "cm",
                    },
                    nodes =
                    {{n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = DynaText({string = localize('ph_choose_biome_1'), colours = {G.C.WHITE}, shadow = true, bump = true, scale = 1, pop_in = 0.5, maxw = 5}), id = 'prompt_dynatext1'}}
                    }},
                    {n=G.UIT.R, config={align = "cm"}, nodes={
                    {n=G.UIT.O, config={object = DynaText({string = localize('ph_choose_biome_2'), colours = {G.C.WHITE}, shadow = true, bump = true, scale = 1.2, pop_in = 0.5, maxw = 5, silent = true}), id = 'prompt_dynatext2'}}
                    }}},
                },
                { -- top row, used for destination biomes (aka biomes you can go to at any given time)
                    n = G.UIT.R,
                    config = {
                        padding = 0.1,
                    },
                    nodes = destination_biome_nodes
                },
                { -- top row, used for destination biomes (aka biomes you can go to at any given time)
                    n = G.UIT.R, config={align = "cm"},
                    nodes = {
                        G.UIDEF.wgrop_biome_select_individual(G.GAME.round_resets.blind_biome)
                    }
                },
            })
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
            config = {align="bm", offset = {x=0,y=2},major = G.hand, bond = 'Weak'}
        }
        G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            G.cb_wgrop_biome_selection.alignment.offset.y = -8
            return true
        end)
        }))
    G.STATE_COMPLETE = true
    end
    if G.buttons then G.buttons:remove(); G.buttons = nil end
end