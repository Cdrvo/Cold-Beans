SMODS.Joker {
    key = "jbill_pythagoras",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 2, y = 3 },
    rarity = 2,
    cost = 5,
    config = { extra = { xmult = 1, xmult_gain = 1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_jbill_bean
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for k, v in pairs(context.removed) do
                if SMODS.has_enhancement(v, "m_cbean_jbill_bean") then
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
            end
        end
        if context.joker_main and card.ability.extra.xmult ~= 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_cbean_jbill_bean') then
                return true
            end
        end
        return false
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "None Yet!"
    }
}