SMODS.Sticker({
	key = "black",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
		y = 1,
	},
	badge_colour = HEX("cc73d9"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	apply = function(self, card, val)
		card.ability[self.key] = val
		if card.area then
			if card.ability[self.key] then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
				ease_hands_played(-1)
				G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) * 10
			else
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
				ease_hands_played(1)
				G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) / 10
			end
		end
	end,
	apply_to_deck = function(self, back, val)
		back.ability[self.key] = val
		if back.ability[self.key] then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
			ease_hands_played(-1)
			G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) * 10
		else
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
			ease_hands_played(1)
			G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) / 10
		end
	end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})

SMODS.Edition:take_ownership("negative", {
	get_weight = function(self)
		return (self.weight * (G.GAME.modifiers.cbean_negative_boost or 1))
	end,
}, true)
