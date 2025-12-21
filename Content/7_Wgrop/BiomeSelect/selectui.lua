G.STATES.BIOMETREE = 9223376854775807
function CBWG.get_blind_modifier() 
end
G.UIDEF.wgrop_biome_select_individual = function ()
    local biome_modifiers = CBWG.get_blind_modifier() 
    return {
        n = G.UIT.ROOT,
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



-- im crying why is it called bio-metry
-- temp while we figure our shit out
function update_wgrop_biometree()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.BALLEY)
        local tree_exists = not not G.biometree
        G.biometree = G.biometree or UIBox{
            definition = G.UIDEF.biometree(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+11},major = G.hand, bond = 'Weak'}
        }
        G.E_MANAGER:add_event(Event({
            func = function()
                G.biometree.alignment.offset.y = -5.3
                G.biometree.alignment.offset.x = 0
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.biometree.T.y - G.biometree.VT.y) < 3 then
                            G.ROOM.jiggle = G.ROOM.jiggle + 3
                            play_sound('cardFan2')
                            if not tree_exists then
                                
                            end
                            G.CONTROLLER:snap_to({node = G.biometree:get_UIE_by_ID('next_round_button')})
                            G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
    if G.buttons then G.buttons:remove(); G.buttons = nil end   
end