SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_short", 
    atlas = "0chill_joker_atlas",
    pos = { x = 0, y = 0 },
    rarity = 1,
    order = 1,
    blueprint_compat = true,
    cost = 3,
    config = { extra = { t_mult = 14, type = "cbean_sdown_bobtail" }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = card.ability.extra.t_mult
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