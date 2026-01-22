SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_coriolis", 
    atlas = "pboys_joker_atlas",
    pos = { x = 4, y = 0 },
    rarity = 1,
    order = 5,
    blueprint_compat = true,
    cost = 4,
    config = { extra = { chips = 10, mult = 4, type = 'Flush' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
		 if context.individual and context.cardarea == G.play and next(context.poker_hands[card.ability.extra.type]) then
			local is_first_card = false
			local is_last_card = false
            for i = 1, #context.scoring_hand do
                if not context.scoring_hand[i].debuff then
					is_first_card = context.scoring_hand[i] == context.other_card
					break
                end
            end
			for i = #context.scoring_hand,0,-1 do
                if not context.scoring_hand[i].debuff then
					is_last_card = context.scoring_hand[i] == context.other_card
					break
                end
            end
            if is_first_card then
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
				context.other_card.ability.perma_mult = is_first_card == is_last_card and ((context.other_card.ability.perma_mult or 0) + card.ability.extra.mult) or (context.other_card.ability.perma_mult or 0)
                return {
					message = localize('k_upgrade_ex'),
					colour = is_first_card == is_last_card and G.C.PURPLE or G.C.CHIPS
				}
            elseif is_last_card then
				context.other_card.ability.perma_mult =  (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
                return {
					message = localize('k_upgrade_ex'),
					colour = G.C.MULT
				}
            end
        end
    end,
	joker_display_def = function(JokerDisplay)
        return {
            text = {
			  { text = "+", colour = G.C.CHIPS },
			  { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "chips", colour = G.C.CHIPS },
			  { text = "/"}, 
			  { text = "+", colour = G.C.MULT },
			  { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
			},
			text_config = { colour = G.C.UI.TEXT_INACTIVE },
            reminder_text = {
                { text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
				{ text = ")" },
			},
            calc_function = function(card)
                local mult = 0
				local chips = 0
				local _, poker_hands, _ = JokerDisplay.evaluate_hand()
				if poker_hands[card.ability.extra.type] and next(poker_hands[card.ability.extra.type]) then
					mult = card.ability.extra.mult
					chips = card.ability.extra.chips
				end
				card.joker_display_values.mult = mult
				card.joker_display_values.chips = chips
				card.joker_display_values.localized_text = localize(card.ability.extra.type, 'poker_hands')
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