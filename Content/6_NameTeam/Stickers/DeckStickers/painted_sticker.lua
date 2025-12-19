local painted_gradient = SMODS.Gradient({
	key = "painted_gradient",
	colours = {
		G.C.GREEN,
		G.C.ORANGE,
		G.C.BLUE,
		G.C.RED,
	},
})

SMODS.Sticker({
	key = "painted",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 1,
		y = 1,
	},
	badge_colour = painted_gradient,
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
		NAMETEAM.simple_apply(self, back, val, function()
			G.hand:change_size(1)
			G.jokers:change_size(-1)
		end, function()
			G.hand:change_size(-1)
			G.jokers:change_size(1)
		end)
	end,
	beans_credits = {
		code = "TheAlternateDoctor",
		art = "GhostSalt",
		team = "Name Team"
	}
})
