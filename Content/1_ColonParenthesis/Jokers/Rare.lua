SMODS.Joker {
    key = "colon_modernity",
    name = "Modernity",
    config = {
        extra = {
            skip_xmult_mod = 1,
            select_xmult_mod = 0.5,
            xmult = 1,
        }
    },
    -- pos = { x = 0, y = 0 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    -- atlas = "",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.skip_xmult_mod,
                card.ability.extra.select_xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.skip_xmult_mod
            return {
                message = "X" .. card.ability.extra.xmult .. " Mult"
            }
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.select_xmult_mod
            return {
                message = "X" .. card.ability.extra.xmult .. " Mult"
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}