SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_kidney", 
    atlas = "pboys_joker_atlas",
    pos = { x = 5, y = 0 },
    rarity = 1,
    order = 6,
    blueprint_compat = false,
    cost = 6,
    config = { extra = { odds = 3, mult = 3 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'kidney')
        info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
		return { vars = { numerator, denominator, card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.other_card and context.discard and
            SMODS.has_enhancement(context.other_card, 'm_cbean_pboys_piss') and SMODS.pseudorandom_probability(card, 'cbean_pboys_kidney', 1, card.ability.extra.odds) then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                card.ability.extra.mult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULTS
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
        idea = "Gfsgfs",
        art =  "Gfsgfs",
        code = "Nrio_Modder",
    }
}