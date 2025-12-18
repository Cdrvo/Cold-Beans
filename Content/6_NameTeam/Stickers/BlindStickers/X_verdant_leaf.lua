SMODS.Sticker({
	key = "verdant_leaf_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 1,
		y = 2,
	},
	badge_colour = HEX("56a786"),
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
	apply_to_deck = function(self, back, val)
		local had_sticker = back.ability[self.key]
		back.ability[self.key] = val
		if back.ability[self.key] and not had_sticker then
			if self.NAMETEAM_removed then
				if val == false then
					self:NAMETEAM_removed(self)
				else
					self:NAMETEAM_applied(self)
				end
			end
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
		if G.playing_cards then
			for k, v in pairs(G.playing_cards) do
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
			if G.playing_cards then
				for k, v in pairs(G.playing_cards) do
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
