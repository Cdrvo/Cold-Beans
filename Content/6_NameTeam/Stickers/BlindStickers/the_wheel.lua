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
	loc_vars = function(self, info_queue)
		local numerator, denominator = SMODS.get_probability_vars(
			self,
			(G.GAME.probabilities.normal or 1),
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
				(G.GAME.probabilities.normal or 1),
				self.config.odds
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
