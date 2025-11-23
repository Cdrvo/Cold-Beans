SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_clique", 
    atlas = "0chill_joker_atlas",
    pos = { x = 1, y = 0 },
    rarity = 3,
    order = 3,
    blueprint_compat = true,
    cost = 8,
    config = { extra = { x_mult = 4, type = "cbean_sdown_bobtail" }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art =  "TBA",
        code = "MarioFan597",
    }
}