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
        return { vars = { card.ability.extra.repetitions } }
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
	joker_display_def = function(JokerDisplay)
        return { 
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "piss_name" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.piss_name = localize{type = "name_text", set = "Enhanced", key = "m_cbean_pboys_piss", nodes = {}}
            end,
			retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
				if held_in_hand then return 0 end
				return SMODS.has_enhancement(playing_card, 'm_cbean_pboys_piss') and
					joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card) or 0
			end
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Gfsgfs",
        art =  "Gfsgfs",
        code = "Nrio_Modder",
    }
}