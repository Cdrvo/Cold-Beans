SMODS.Sticker({
	key = "black",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
		y = 1,
	},
	badge_colour = G.C.BLACK,
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Deck = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	apply_to_deck = function(self, back, val)
		NAMETEAM.simple_apply(self, back, val)
	end,
	NAMETEAM_applied = function(self, card)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
		ease_hands_played(-1)
		G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) * 10
	end,
	NAMETEAM_removed = function(self, card)
		G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
		ease_hands_played(1)
		G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) / 10
	end,
	beans_credits = {
		code = "TheAlternateDoctor",
		art = "GhostSalt",
		team = "Name Team",
	},
})

SMODS.Edition:take_ownership("negative", {
	get_weight = function(self)
		return (self.weight * (G.GAME.modifiers.cbean_negative_boost or 1))
	end,
}, true)
