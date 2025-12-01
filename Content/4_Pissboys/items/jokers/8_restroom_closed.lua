SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_restroom_closed", 
    atlas = "pboys_joker_atlas",
    pos = { x = 7, y = 0 },
    rarity = 1,
    order = 8,
    blueprint_compat = false,
    cost = 4,
    config = { extra = { chips = 25 } },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and
            SMODS.has_enhancement(context.other_card, 'm_cbean_pboys_piss') and not context.end_of_round then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_cbean_pboys_piss') then
                return true
            end
        end
        return false
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "FlameThrowerFIM",
        art =  "FlameThrowerFIM",
        code = "Nrio_Modder",
    }
}