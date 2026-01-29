SMODS.Sticker({
	key = "shroom",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 3,
		y = 4,
	},
	badge_colour = HEX("5f009b"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Joker = true
	},
	sticker_type = "Negative",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
    calculate = function(self, card, context)
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Revo",
	},
})
