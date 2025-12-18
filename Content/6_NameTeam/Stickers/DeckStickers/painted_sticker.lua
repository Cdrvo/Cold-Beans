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
	sets = {},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	apply = function(self, card, val)
		local had_sticker = card.ability[self.key]
		card.ability[self.key] = val
		if card.area then
			if card.ability[self.key] and not had_sticker then
				G.hand:change_size(1)
				G.jokers:change_size(-1)
			elseif had_sticker then
				G.hand:change_size(-1)
				G.jokers:change_size(1)
			end
		end
	end,
	apply_to_deck = function(self, back, val)
		local had_sticker = back.ability[self.key]
		back.ability[self.key] = val
		if back.ability[self.key] and not had_sticker then
			G.hand:change_size(1)
			G.jokers:change_size(-1)
		elseif had_sticker then
			G.hand:change_size(-1)
			G.jokers:change_size(1)
		end
	end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})
