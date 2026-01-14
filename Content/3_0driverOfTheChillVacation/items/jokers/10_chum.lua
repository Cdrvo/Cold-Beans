SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_chum",
    atlas = "0chill_joker_atlas",
    pos = { x = 3, y = 1 },
    rarity = 1,
    order = 1,
    unlocked = true,
    blueprint_compat = false,
    cost = 3,
    config = { 
        immutable = {xmult = 3}
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.immutable.xmult,
            } 
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local current_index

            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    current_index = i
                    break
            end
            end

            SMODS.destroy_cards(card)
            play_sound('cbean_0chill_chum_infect')
            if G.jokers.cards[current_index - 1] then G.jokers.cards[current_index - 1]:set_ability("j_cbean_0chill_chum") end
            if G.jokers.cards[current_index + 1] then G.jokers.cards[current_index + 1]:set_ability("j_cbean_0chill_chum") end
            return {
                x_mult = card.ability.immutable.xmult
            }
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"restruct"},
        art =  "restruct",
        code = "restruct",
    }
}
