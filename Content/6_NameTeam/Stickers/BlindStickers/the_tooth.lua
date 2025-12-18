SMODS.Sticker({
	key = "the_tooth_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 7,
		y = 1,
	},
	badge_colour = HEX("b52d2d"),
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
	calculate = function(self, card, context)
		if context.press_play then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					for i = 1, #G.play.cards do
						G.E_MANAGER:add_event(Event({
							func = function()
								G.play.cards[i]:juice_up()
								return true
							end,
						}))
						ease_dollars(-1)
						delay(0.23)
					end
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
