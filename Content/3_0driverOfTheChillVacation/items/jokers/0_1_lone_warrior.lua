SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_lone_warrior", 
    atlas = "0chill_joker_atlas",
    pos = { x = 2, y = 2 },
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    config = { extra = { x_mult = 1, x_mult_gain = 0.1 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.x_mult_gain, } }
    end,
    calculate = function(self, card, context)
        if G.GAME.cbean_combos_used_total then
            card.ability.extra.x_mult = ((G.GAME.cbean_combos_used_total * card.ability.extra.x_mult_gain) + 1)
        end

        if context.joker_main and G.GAME.cbean_combos_used and card.ability.extra.x_mult > 1 then
           return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        --G.GAME.hands["cbean_0chill_fibonacci"].discovered = true
        --G.GAME.hands["cbean_0chill_fibonacci_flush"].discovered = true
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "ChapitalChirp",
        art =  "N/A",
        code = "MarioFan597",
    }
}