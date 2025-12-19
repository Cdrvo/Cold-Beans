SMODS.Sticker({
	key = "the_mark_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 9,
		y = 0,
	},
	badge_colour = HEX("3e85bd"),
	config = {
		shld_stay_flipped = false,
	},
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
	calculate = function(self, card, context)
		local s = self.config
		if context.stay_flipped and context.to_area == G.hand and context.other_card:is_face() then
			return {
				stay_flipped = true,
			}
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
