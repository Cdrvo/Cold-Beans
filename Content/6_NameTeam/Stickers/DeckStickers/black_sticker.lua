SMODS.Sticker({
	key = "black",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
		y = 1,
	},
	badge_colour = G.C.BLACK,
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Deck = true
	},
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
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
				ease_hands_played(-1)
				G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) * 10
			elseif had_sticker then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
				ease_hands_played(1)
				G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) / 10
			end
		end
	end,
	apply_to_deck = function(self, back, val)
		-- check if object already had this sticker
		local had_sticker = back.ability[self.key]
		back.ability[self.key] = val
		-- if back did not already have this sticker and a sticker was applied
		if back.ability[self.key] and not had_sticker then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
			ease_hands_played(-1)
			G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) * 10
		elseif had_sticker then -- if back already had a sticker and a sticker was removed
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
			ease_hands_played(1)
			G.GAME.modifiers.cbean_negative_boost = (G.GAME.modifiers.cbean_negative_boost or 1) / 10
		end
	end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})

SMODS.Edition:take_ownership("negative", {
	get_weight = function(self)
		return (self.weight * (G.GAME.modifiers.cbean_negative_boost or 1))
	end,
}, true)
