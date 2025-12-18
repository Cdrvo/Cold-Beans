SMODS.Sticker({
	key = "the_plant_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 4,
		y = 1,
	},
	badge_colour = HEX("709284"),
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
		if G.playing_cards then
			for k, v in pairs(G.playing_cards) do
				if v:is_face() and not v.debuff then
					v.debuffed_by_plantstkr = true
					SMODS.debuff_card(v, true, "NAMETEAM_plant_sticker")
				end
			end
		end
	end,
	NAMETEAM_removed = function(self, card)
		if G.playing_cards then
			for k, v in pairs(G.playing_cards) do
				if v.debuffed_by_plantstkr then
					v.debuffed_by_plantstkr = nil
					SMODS.debuff_card(v, false, "NAMETEAM_plant_sticker")
				end
			end
		end
	end,
	calculate = function(self, card, context)
		if context.playing_card_added then
			for k, v in pairs(context.cards) do
				if v:is_face() and not v.debuff then
					v.debuffed_by_plantstkr = true
					SMODS.debuff_card(v, true, "NAMETEAM_plant_sticker")
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
