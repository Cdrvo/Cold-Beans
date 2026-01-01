SMODS.Joker {
    key = "jbill_spill",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 2, y = 0 },
    rarity = 2,
    cost = 6,
    config = { extra = { bean = 5 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["m_cbean_jbill_bean"]
        return { vars = { card.ability.extra.bean } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind_on_deck == "Small" then
            for i = 1, card.ability.extra.bean do
                SMODS.add_card( { set = "Enhanced", enhancement = "m_cbean_jbill_bean", area = G.deck })
            end
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "ZayDerg"
    }
}

