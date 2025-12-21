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
        local balley_exists = not not G.balley
        G.balley = G.balley or UIBox{
            definition = G.UIDEF.balley(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
		G.balley.definition.nodes[1].nodes[1].nodes[1].nodes[1].nodes[3].nodes[6].nodes[1].config.object.states.collide.can = true
		G.ajoker = UIBox{
            definition = G.UIDEF.alleyjoker(),
            config = {align='tmi', offset = {x=-4.3,y=G.ROOM.T.y+18}, major = G.hand, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
        }
		G.ajoker.definition.nodes[1].config.object.sprite_pos.x = 2
		G.aball = UIBox{
            definition = G.UIDEF.alleyball(),
            config = {align='tmi', offset = {x=1.75,y=G.ROOM.T.y+22}, major = G.hand, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
        }
		G.cups = G.cups or {}
		for i = 0, 2 do
				G.cups[i] = UIBox{
					definition = G.UIDEF.newcup(i),
					config = {align="tmi", offset = {x=i*2.5-0.75,y=G.ROOM.T.y+22}, major = G.hand, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
				}
		end

        G.E_MANAGER:add_event(Event({
            func = function()
                G.balley.alignment.offset.y = -5.3
				G.ajoker.alignment.offset.y = -4.8
				G.aball.config.offset.y = -4.0
				for key, ad in pairs(G.cups) do
					G.cups[key].alignment.offset.y = -4.8
				end
				G.ajoker.config.speech_bubble_align = {align= 'bm', offset = {x=0,y=0},parent = G.ajoker}
				G.ajoker.children.speech_bubble = 
				UIBox{
									definition = G.UIDEF.speech_bubble('cbean_pboys_hi_'..math.random(1,7), {quip = true}),
									config = G.ajoker.config.speech_bubble_align
				}
				G.ajoker.children.speech_bubble:set_role{
									role_type = 'Minor',
									xy_bond = 'Weak',
									r_bond = 'Strong',
									major = G.ajoker,
				}
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.balley.T.y - G.balley.VT.y) < 3 then
                            local nosave_balley = nil 
                            -- Back to shop button
							play_sound('cbean_pboy_bavoice', G.SPEEDFACTOR*(math.random()*0.4+2), 2.5)
							G.ajoker:juice_up()
                            G.CONTROLLER:snap_to({node = G.balley:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_balley then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end

end