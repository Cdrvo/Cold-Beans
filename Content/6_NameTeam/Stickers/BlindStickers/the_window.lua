SMODS.Sticker({
	key = "the_window_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 0,
		y = 2,
	},
	badge_colour = HEX("a9a295"),
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
		if G.playing_cards then
			for k, v in pairs(G.playing_cards) do
				if v.debuffed_by_windowstkr then
					v.debuffed_by_windowstkr = nil
					SMODS.debuff_card(v, false, "NAMETEAM_window_sticker")
				end
			end
		end
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			for k, v in pairs(G.playing_cards) do
				if v:is_suit("Diamonds", false) then
					SMODS.debuff_card(v, true, "NAMETEAM_window_sticker")
					v.debuffed_by_windowstkr = true
				end
			end
		end
		if context.end_of_round then
			for k, v in pairs(G.playing_cards) do
				if v:is_suit("Diamonds", true) and v.debuffed_by_windowstkr then
					v.debuffed_by_windowstkr = nil
					SMODS.debuff_card(v, false, "NAMETEAM_window_sticker")
				end
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
