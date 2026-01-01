JBEAN = {}
JBEAN.size = 0

SMODS.Consumable {
    key = "jbill_currency",
    set = "Tarot",
    atlas = "jbill_tarot",
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = "m_cbean_jbill_banknote" },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize{ type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "ZayDerg"
    }
}



