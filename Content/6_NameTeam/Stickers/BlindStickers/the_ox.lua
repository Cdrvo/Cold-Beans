SMODS.Sticker({
	key = "the_ox_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 2,
		y = 1,
	},
	badge_colour = HEX("b95b08"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Blind = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = { NAMETEAM.most_played() },
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
	calculate = function(self, card, context)
		if context.before then
			if G.GAME.current_round.current_hand.handname_text == NAMETEAM.most_played() then
				ease_dollars(-G.GAME.dollars)
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
