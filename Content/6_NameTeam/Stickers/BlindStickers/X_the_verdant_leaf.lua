SMODS.Sticker({
	key = "the_verdant_leaf_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 1,
		y = 2,
	},
	badge_colour = SMODS.Gradients["nteam_verdant_leaf"],
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Blind = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	apply_to_deck = function(self, val)
		if val == false then
			self:NAMETEAM_removed(self)
		else
			self:NAMETEAM_applied(self)
		end
	end,
	NAMETEAM_applied = function(self, card)
		if G.jokers.cards then
			for k, v in pairs(G.jokers.cards) do
				if not v.debuffed_by_verdantstkr then
					v.debuffed_by_verdantstkr = true
					SMODS.debuff_card(v, true, "NAMETEAM_verdant_leaf_sticker")
				end
			end
		end
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker" then
			if G.jokers.cards then
				for k, v in pairs(G.jokers.cards) do
					if v.debuffed_by_verdantstkr then
						v.debuffed_by_verdantstkr = nil
						SMODS.debuff_card(v, false, "NAMETEAM_verdant_leaf_sticker")
					end
				end
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
