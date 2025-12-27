JBEAN = {}
JBEAN.size = 0

SMODS.Consumable {
    key = 'currency',
    set = 'Tarot',
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_cbean_banknote' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

SMODS.Enhancement {
    key = 'banknote',
    config = { extra = { dollars = 1 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            SMODS.modify_rank(card, -1)
            return {
                dollars = card.ability.extra.dollars,
            }
        end
    end,
}

