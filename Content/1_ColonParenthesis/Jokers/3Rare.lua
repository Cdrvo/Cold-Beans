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
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        code = "Glitchkat10",
    }
}

SMODS.Joker {
    key = "colon_packing",

    config = {extra = {
        xmult = 3.877084,
        gain = 3.877084,
        requirement = 11,
        count = 0,
    }},

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.gain,
                card.ability.extra.requirement,
                card.ability.extra.count,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and context.cardarea == G.jokers then
            card.ability.extra.count = card.ability.extra.count + 1 -- all that just for the plus 1
            if card.ability.extra.count >= card.ability.extra.requirement then
                card.ability.extra.count = 0
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain -- :(
                return { message = "Mult Up!" }
            else
                return { message = "Blind Up!" } -- blind up???
            end
        elseif context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}