SMODS.Sticker({
	key = "the_manacle_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 8,
		y = 0,
	},
	badge_colour = HEX("575757"),
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
		NAMETEAM.simple_apply(self, back, val)
	end,
	NAMETEAM_applied = function(self, card)
		G.hand:change_size(-1)
	end,
	NAMETEAM_removed = function(self, card)
		G.hand:change_size(1)
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
