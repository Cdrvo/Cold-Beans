SMODS.Joker {
    key = "jbill_tcna",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 2, y = 4 },
    rarity = 1,
    cost = 4,
    config = { extra = { play = 0, play_req = 20, discard = 0, discard_req = 5, sum = 0, sum_req = 1200, sum_done = false, mult = 0, chips = 0, xmult = 1, mc_gain = 1, xmult_gain = 1200 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.play, card.ability.extra.play_req, card.ability.extra.discard, card.ability.extra.discard_req, 
        card.ability.extra.sum, card.ability.extra.sum_req, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.xmult, card.ability.extra.mc_gain, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.play = card.ability.extra.play + #context.full_hand
            card.ability.extra.sum = card.ability.extra.sum + #context.full_hand
        end
        if context.discard then
            card.ability.extra.discard = card.ability.extra.discard + 1
            card.ability.extra.sum = card.ability.extra.sum + 1
        end
        if card.ability.extra.play >= card.ability.extra.play_req then
            card.ability.extra.play = card.ability.extra.play - card.ability.extra.play_req
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "mc_gain",
                scaling_message = {
                    message = "+" .. card.ability.extra.mc_gain,
                    colour = G.C.MULT
                }
            })
        end
        if card.ability.extra.discard >= card.ability.extra.discard_req then
            card.ability.extra.discard = card.ability.extra.discard - card.ability.extra.discard_req
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_value = "mc_gain",
                scaling_message = {
                    message = "+" .. card.ability.extra.mc_gain,
                    colour = G.C.chips
                }
            })
        end
        if card.ability.extra.sum >= card.ability.extra.sum_req and not card.ability.extra.sum_done then
            card.ability.extra.sum_done = true
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
                scaling_message = {
                    message = "+X" .. card.ability.extra.xmult_gain,
                    colour = G.C.MULT
                }
            })
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                xmult = card.ability.extra.xmult,
            }
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "None Yet!"
    }
}