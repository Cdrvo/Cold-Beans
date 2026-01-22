SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_flag_japan", 
    atlas = "pboys_joker_atlas",
    pos = { x = 6, y = 0 },
    rarity = 1,
    order = 7,
    blueprint_compat = true,
    cost = 5,
    config = { extra = { mult = 3 } },
    loc_vars = function(self, info_queue, card)
		local en_tally = 0
        if G.deck and G.deck.cards then
            for _, deck_card in ipairs(G.deck.cards) do
                if next(SMODS.get_enhancements(deck_card)) then en_tally = en_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * en_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
			local en_tally = 0
			if G.deck.cards then
				for _, deck_card in ipairs(G.deck.cards) do
					if next(SMODS.get_enhancements(deck_card)) then en_tally = en_tally + 1 end
				end
			end
            if en_tally > 0 then
                return {
                    mult = card.ability.extra.mult * en_tally
                }
            end
        end
    end,
	joker_display_def = function(JokerDisplay)
			return {
				text = {
				{ text = "+" },
				{ ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
			},
			text_config = { colour = G.C.MULT },
			calc_function = function(card)
				local en_tally = 0
				if G.deck.cards then
					for _, deck_card in ipairs(G.deck.cards) do
						if next(SMODS.get_enhancements(deck_card)) then en_tally = en_tally + 1 end
					end
				end
				card.joker_display_values.mult = card.ability.extra.mult * en_tally
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