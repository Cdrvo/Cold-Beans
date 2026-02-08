SMODS.Joker {
    key = "jbill_manos",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 3 },
    rarity = 3,
    cost = 6,
    config = { extra = { xmult = 1, xmult_loss = -0.1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_loss*-1 } }
    end,
    calculate = function(self, card, context)
        if context.before then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_loss",
                scaling_message = {
                    message = "" .. card.ability.extra.xmult_loss,
                    colour = G.C.MULT
                }
            })
        end
        if context.joker_main and card.ability.extra.xmult ~= 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Still None"
    }
}