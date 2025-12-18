SMODS.Sticker({
	key = "violet_vessel_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 2,
		y = 2,
	},
	badge_colour = HEX("8a71e1"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Blind = true
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
    calculate = function(self,card,context)
        if context.first_hand_drawn then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.blind.chips = G.GAME.blind.chips * 3
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
					G.GAME.blind:juice_up()
                    SMODS.calculate_effect({
                        message = localize("k_cbean_nteam_tripled"),
                        colour = G.C.PURPLE,
                        instant = true
                    }, card)
					return true
				end,
			}))
		end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})