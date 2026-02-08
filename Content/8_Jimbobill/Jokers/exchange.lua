SMODS.Joker {
    key = "jbill_exchange",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 4 },
    rarity = 1,
    cost = 3,
    config = { extra = { jimbux = 2, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.jimbux, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.dollars >= 5 then
            ease_dollars(-5)
            ease_jimbux(1)
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
        art = "None Yet!"
    }
}