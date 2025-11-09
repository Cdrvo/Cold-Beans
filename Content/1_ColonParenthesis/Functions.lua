Colonparen.recalculateBlinds = function ()
	for type_, blind in pairs(G.GAME.round_resets.blind_choices or {}) do
        if blind then
            local newblind = Colonparen.calculateReplacedBlind(blind, type_)
            if newblind ~= blind then
                Colonparen.changeBlind(type_, newblind)
            end
        end
    end
end

-- vvv Taken from Button_callbacks.lua 2878

Colonparen.changeBlind = function(blindType, after) -- blindType | A string containing the type of blind, before | the blind name to be changed, after | the blind key to be changed into
    local before = blindType:lower()
    if not G.blind_select_opts[before] and G.GAME.round_resets.blind_choices[before] then
        print("before ", G.blind_select_opts)
        error("Could not update blind, as its not in current blinds", 1)
        return
    end
    G.E_MANAGER:add_event(Event({ -- Lower
        trigger = 'immediate',
        func = function()
            play_sound('other1')
            G.blind_select_opts[before]:set_role({
                xy_bond = 'Weak'
            })
            G.blind_select_opts[before].alignment.offset.y = 20
            return true
        end
    }))

    G.CONTROLLER.locks.boss_reroll = true -- f.. caw.. f

    -- print(G.blind_select_opts[before] or G.blind_select_opts[before])
    G.E_MANAGER:add_event(Event({
        func = function ()
            -- Change Blind 
            local par = G.blind_select_opts[before].parent
            if not G.GAME.round_resets.blind_choices[blindType] then
                print("FUCK you, for FUCKING, FUCKING thinking of FUKCING using FUCKIONG the FUCKING [[lower]] FUCKING case, you FUCKING idiot FUCKING FUCK")
                print("oh does this work tho? ", G.GAME.round_resets.blind_choices[blindType])
                print(G.GAME.round_resets.blind_choices[blindType], G.GAME.round_resets.blind_choices[before], G.GAME.round_resets.blind_choices[after])
                return true
            end
            G.GAME.round_resets.blind_choices[blindType] = after -- OHHH SO FUCK ME!!! IT HAS TO BE CAPTIALLLLL DUUUUUUUUUUH

            -- bring that shit back
            G.blind_select_opts[before]:remove() -- Doesnt seem to be required, but I may just be dumb and it might just make it available to use
            G.blind_select_opts[before] = UIBox{
                T = {
                    par.T.x, 0, 0, 0
                },
                definition = {
                    n = G.UIT.ROOT,
                    config = {
                        align = "cm",
                        colour = G.C.CLEAR -- Border Color
                    },
                    nodes = {
                        UIBox_dyn_container({create_UIBox_blind_choice(blindType --[[AGAIN FUCK ME FOR HAVING NO CAPITAL RAAAAAH]])}, false, get_blind_main_colour(before), mix_colours(G.C.BLACK, get_blind_main_colour(before), 0.8) --[[ Mix colours is for bosses duh]])
                    },
                },
                config = {
                    align = "bmi",
                    offset = {
                        x = 0,
                        y = G.ROOM.T.y + 9
                    },
                    major = par,
                    xy_bond = 'Weak'
                }
            }
            par.config.object = G.blind_select_opts[before] -- Is required to come up
            par.config.object:recalculate() -- Doesnt Seem to be required, could also be used like :remove()
            G.blind_select_opts[before].parent = par -- make it parented to the right thingy mabob
            G.blind_select_opts[before].alignment.offset.y = 0

            G.E_MANAGER:add_event(Event({blocking = false, trigger = 'after', delay = 0.5,func = function() -- I mean its boss_reroll but like close enough
                G.CONTROLLER.locks.boss_reroll = nil
                return true
            end}))
            
            save_run()
            return true
        end
    }))
end


function Colonparen.get_blind_variable(name, cb)
    
end