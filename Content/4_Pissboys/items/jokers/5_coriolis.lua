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
                return {
					chips = card.ability.extra.chips,
					mult = card.ability.extra.mult * (is_first_card == is_last_card and 1 or 0)
				}
            elseif is_last_card then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Gfsgfs",
        art =  "Gfsgfs",
        code = "Nrio_Modder",
    }
}