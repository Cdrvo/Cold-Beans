SMODS.Sticker({
	key = "square",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 1,
		y = 4,
	},
	badge_colour = HEX("fd5f55"),
	config = {},
	rate = 0.03,
	needs_enable_flag = true,
	sets = {
		Joker = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	sticker_type = "Negative",
	calculate = function(self, card, context)
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})


