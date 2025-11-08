-- vvv Taken from Button_callbacks.lua 2878

Colonparen.changeblind = function(blindType, before, after) -- blindType | A string containing the type of blind, before | the blind to be changed, after | the blind to be changed into
    if not G.blind_select_opts[before] then
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

    -- Change Blind 
    local par = G.blind_select_opts[before].parent
    G.GAME.round_resets.blind_choices[before] = after
    G.GAME.round_resets.blind_choices.Teeny = Colonparen.get_new_blind('Teeny')
    G.GAME.round_resets.blind_choices.Small = Colonparen.get_new_blind('Small')
    G.GAME.round_resets.blind_choices.Big = Colonparen.get_new_blind('Big')
    G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO')

    -- bring that shit back
    G.blind_select_opts.boss:remove()
    G.blind_select_opts.boss = UIBox{
        T = {
            par.T.x, 0, 0, 0
        },
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                colour = G.C.CLEAR
            },
            nodes = {
                UIBox_dyn_container({ create_UIBox_blind_choice(blindType) }, false, get_blind_main_colour(blindType), mix_colours(G.C.BLACK, get_blind_main_colour(blindType), 0.8))
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
    par.config.object = G.blind_select_opts.boss
    par.config.object:recalculate()
    G.blind_select_opts.boss.parent = par
    G.blind_select_opts.boss.alignment.offset.y = 0
end