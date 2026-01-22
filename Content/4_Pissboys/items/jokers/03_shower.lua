SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_shower", 
    atlas = "pboys_joker_atlas",
    pos = { x = 2, y = 0 },
    rarity = 3,
    order = 3,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { dollars = 2 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and (context.cardarea == G.play or context.cardarea == G.hand) and
            SMODS.has_enhancement(context.other_card, 'm_cbean_pboys_piss') and not context.end_of_round then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
	joker_display_def = function(JokerDisplay)
        return {
			text = {
				{ ref_table = "card.joker_display_values", ref_value = "count",   retrigger_type = "mult" },
				{ text = "x",                              scale = 0.35 },
				{ text = "$",                              colour = G.C.GOLD },
				{ ref_table = "card.ability.extra",        ref_value = "dollars", colour = G.C.GOLD },
			},
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "piss_name" },
                { text = ")" },
            },
            calc_function = function(card)
				local count = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if SMODS.has_enhancement(scoring_card, "m_cbean_pboys_piss") then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
				local playing_hand = next(G.play.cards)
				for _, playing_card in ipairs(G.hand.cards) do
					if playing_hand or not playing_card.highlighted then
						if playing_card.facing and not (playing_card.facing == 'back') and SMODS.has_enhancement(playing_card, 'm_cbean_pboys_piss') then
							count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
						end
					end
				end
				card.joker_display_values.count = count
                card.joker_display_values.piss_name = localize{type = "name_text", set = "Enhanced", key = "m_cbean_pboys_piss", nodes = {}}
            end,
        }
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