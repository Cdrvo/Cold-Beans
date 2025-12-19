SMODS.Sticker({
	key = "the_wheel_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 9,
		y = 1,
	},
	badge_colour = HEX("50bf7c"),
	config = {
		odds = 7,
	},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Blind = true,
	},
	apply_to_deck = function(self, back, val)
		NAMETEAM.simple_apply(self, back, val)
	end,
	loc_vars = function(self, info_queue)
		local numerator, denominator = SMODS.get_probability_vars(
			self,
			1,
			self.config.odds,
			"cbean_the_wheel_sticker"
		)
		return { vars = { numerator, denominator } }
	end,
	calculate = function(self, card, context)
		local s = self.config
		if
			context.stay_flipped
			and context.to_area == G.hand
			and SMODS.pseudorandom_probability(
				card,
				"cbean_the_wheel_sticker",
				1,
				s.odds
			)
		then
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
