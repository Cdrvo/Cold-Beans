SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_hydrant", 
    atlas = "pboys_joker_atlas",
    pos = { x = 3, y = 0 },
    rarity = 2,
    order = 4,
    blueprint_compat = true,
    cost = 7,
    config = { extra = { repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_cbean_pboys_piss') then
            return {
                repetitions = card.ability.extra.repetitions
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