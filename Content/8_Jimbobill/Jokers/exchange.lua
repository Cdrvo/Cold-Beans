SMODS.Joker {
    key = "jbill_exchange",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 4 },
    rarity = 1,
    cost = 3,
    config = { extra = { jimbux = 1, cost = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.jimbux, card.ability.extra.cost } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.dollars >= card.ability.extra.cost then
            ease_dollars(-card.ability.extra.cost)
            ease_jimbux(card.ability.extra.jimbux)
            return {
                message = localize("k_dollar_jimbux"),
                colour = G.C.PURPLE
            }
        elseif context.setting_blind then
            return {
                message = localize("k_nope_ex"),
                colour = G.C.PURPLE
            }
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}