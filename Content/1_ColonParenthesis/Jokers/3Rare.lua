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
            card.ability.extra.xmult = math.max(card.ability.extra.xmult - card.ability.extra.select_xmult_mod, 1)
            return {
                message = "X" .. card.ability.extra.xmult .. " Mult"
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        code = "Glitchkat10",
    }
}

SMODS.Joker {
    key = "colon_packing",
    name = "Square Packing",
    config = {
        extra = {
            xmult_mod = 3.877084,
            requirement = 11,
            current = 0,
            xmult = 1,
        }
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.requirement,
                card.ability.extra.current,
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.current = card.ability.extra.current + 1
            if card.ability.extra.current >= card.ability.extra.requirement then
                card.ability.extra.current = 0
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return {
                    message = "X" .. card.ability.extra.xmult .. " Mult",
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Glitchkat10",
        code = "Glitchkat10",
    }
}