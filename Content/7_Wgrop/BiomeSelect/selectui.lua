G.STATES.BIOMETREE = 9223376854775807
function CBWG.get_blind_modifier_ui(biome_key) 
    local biome_text = {}
    local loc_target = localize{type = 'raw_descriptions', key = biome_key, set = 'Biome'}
    if loc_target then 
      for k, v in ipairs(loc_target) do
        biome_text[#biome_text + 1] = {n=G.UIT.R, config={align = "cm"}, nodes={{n=G.UIT.T, config={text = v, scale = 0.35, shadow = true, colour = G.C.WHITE}}}}
      end
    end
    return biome_text
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
                n = G.UIT.C, config={align = "cm", padding = 0.07},
                nodes = {
                    { -- first row, for biome title card. 
                        n = G.UIT.R,
                        config = {
                            align = "cm"
                        },
                        nodes = {
                            {n=G.UIT.O, config={object = biome_card}},
                        }
                    },
                    { -- second row, for adding select button
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                        },
                        nodes = {
                        {n=G.UIT.R, config={align = "cm", minw = 2.7, minh = 0.6, r=0.15,colour = G.C.ORANGE, ref_table = biome_key, button = 'select_biome', hover = true,shadow = true}, nodes = {
                          {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'x', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                              {n=G.UIT.T, config={text = localize('k_select_biome'), scale = 0.45, colour = G.C.WHITE, shadow = true}},
                            }},
                          }}
                        }},
                        }
                    },
                    { -- third row, for adding biome modifiers etc. 
                        n = G.UIT.R,
                        config = {
                            align = "cm",
                        },
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
    local b1 = CBWG.get_new_biome(true)
    local b2 = CBWG.get_new_biome(true, {b1})
    table.insert(destination_biome_nodes, G.UIDEF.wgrop_biome_select_individual(b1))
    table.insert(destination_biome_nodes, G.UIDEF.wgrop_biome_select_individual(G.GAME.round_resets.blind_biome))
    table.insert(destination_biome_nodes, G.UIDEF.wgrop_biome_select_individual(b2))
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
            config = {align="bm", offset = {x=0,y=G.ROOM.T.y + 15},major = G.hand, bond = 'Weak'}
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

G.FUNCS.select_biome = function(e)
    stop_use()
    local biome = e.config.ref_table
    if G.cb_wgrop_biome_selection then
    CBWG.ColdBeans_Biomes[G.GAME.round_resets.blind_biome]:exit(true)
    if not G.GAME.current_round.biomes_visited[biome] then
        G.GAME.current_round.biomes_visited[biome] = true
        G.GAME.current_round.amount_biomes_visited = G.GAME.current_round.amount_biomes_visited + 1
    end
    G.GAME.round_resets.blind_biome = biome 
    G.E_MANAGER:add_event(Event({
          trigger = 'before', delay = 0.2,
          func = function()
        e.config.button = nil
        G.cb_wgrop_biome_selection.alignment.offset.y = G.ROOM.T.y + 15
        G.cb_wgrop_biome_selection.alignment.offset.x = 0
        return true
        end
    }))
        G.E_MANAGER:add_event(Event({
          trigger = 'immediate',
          func = function()
            G.cb_wgrop_biome_selection:remove()
            G.cb_wgrop_biome_selection = nil
            G.STATE = G.STATES.SHOP
              G.STATE_COMPLETE = false
            return true
          end
        }))
        CBWG.ColdBeans_Biomes[G.GAME.round_resets.blind_biome]:enter(true)
          play_sound('timpani', 0.8)
          play_sound('generic1')
        G.VIBRATION = G.VIBRATION + 1
    end
      reset_blinds()
      delay(0.6)
end