SMODS.Sticker({
	key = "crimson_heart_sticker",
	showdown_sticker = true,
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 5,
		y = 2,
	},
	badge_colour = HEX("ac3232"),
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
	NAMETEAM_removed = function(self, card)
		local jokers = {}
		for i = 1, #G.jokers.cards do
			if not G.jokers.cards[i].debuff or #G.jokers.cards < 2 then
				jokers[#jokers + 1] = G.jokers.cards[i]
			end
			SMODS.debuff_card(G.jokers.cards[i], false, "NAMETEAM_crimson_heart_sticker")
		end
	end,
	calculate = function(self, card, context)
		if context.hand_drawn then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if not G.jokers.cards[i].debuff or #G.jokers.cards < 2 then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
				SMODS.debuff_card(G.jokers.cards[i], true, "NAMETEAM_crimson_heart_sticker")
			end
			local _card = pseudorandom_element(jokers, pseudoseed("crimson_heart"))
			if _card then
				SMODS.debuff_card(_card, true, "NAMETEAM_crimson_heart_sticker")
				_card:juice_up()
			end
		end
		if context.end_of_round then
			local jokers = {}
			for i = 1, #G.jokers.cards do
				if not G.jokers.cards[i].debuff or #G.jokers.cards < 2 then
					jokers[#jokers + 1] = G.jokers.cards[i]
				end
				SMODS.debuff_card(G.jokers.cards[i], false, "NAMETEAM_crimson_heart_sticker")
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
