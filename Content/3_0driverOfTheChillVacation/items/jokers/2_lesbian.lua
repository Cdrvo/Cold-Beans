SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_lesbian", 
    atlas = "0chill_joker_atlas",
    pos = { x = 1, y = 1 },
    rarity = 1,
    order = 2,
    blueprint_compat = true,
    cost = 3,
    config = { extra = { t_chips = 50, type = "cbean_sdown_antistraight" }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.t_chips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                chips = card.ability.extra.t_chips
            }
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art =  "cmykl",
        code = "MarioFan597",
    }
}