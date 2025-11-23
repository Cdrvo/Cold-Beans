SMODS.Consumable {
    key = '0chill_qilin',
    set = "Spectral",
    hidden = true,
    soul_set = "0chill_spectral_atlas",
    atlas = '0chill_spectral_atlas',
    cost = 8,
    pos = { x = 0, y = 0},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Edition", key = "e_negative_playing_card", config = G.P_CENTERS.e_negative.config }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i=1, #G.hand.highlighted do
            local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
        end
        delay(0.2)

        local highlighted_table = {}
        for i=1, #G.hand.highlighted do 
            table.insert(highlighted_table, {card = G.hand.highlighted[i], placement = G.hand.highlighted[i].T.x})
        end
        table.sort(highlighted_table, function(a, b) return a.placement < b.placement end)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                for i=1, #highlighted_table do
                    SMODS.change_base(highlighted_table[i].card, nil, highlighted_table[1].card.base.value)
                    highlighted_table[i].card:set_edition("e_negative", true)
                end
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted >= 2 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"MarioFan597",
            "CapitalChirp"
        },
        art = "cmykl",
        code = "MarioFan597",
    },
}