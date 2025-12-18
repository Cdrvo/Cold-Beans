SMODS.Sticker({
	key = "the_serpent_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 6,
		y = 1,
	},
	badge_colour = HEX("439a4f"),
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
	NAMETEAM_applied = function(self, card)
		G.GAME.NAMETEAM_Serpent_Sticker = true
		G.GAME.serpent_sticker_counter = G.GAME.serpent_sticker_counter + 1
	end,
	NAMETEAM_removed = function(self, card)
		G.GAME.serpent_sticker_counter = G.GAME.serpent_sticker_counter - 1
		if G.GAME.serpent_sticker_counter == 0 then
			G.GAME.NAMETEAM_Serpent_Sticker = false
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
