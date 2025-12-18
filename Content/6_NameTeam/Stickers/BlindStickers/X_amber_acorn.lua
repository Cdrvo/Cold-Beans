SMODS.Sticker({
	key = "amber_acorn_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 3,
		y = 2,
	},
	badge_colour = HEX("009cfd"),
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
	calculate = function(self, card, context)
		if context.setting_blind then
			G.jokers:unhighlight_all()
			for k, v in ipairs(G.jokers.cards) do
				v:flip()
			end
			if #G.jokers.cards > 1 then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers:shuffle("aajk")
								play_sound("cardSlide1", 0.85)
								return true
							end,
						}))
						delay(0.15)
						G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers:shuffle("aajk")
								play_sound("cardSlide1", 1.15)
								return true
							end,
						}))
						delay(0.15)
						G.E_MANAGER:add_event(Event({
							func = function()
								G.jokers:shuffle("aajk")
								play_sound("cardSlide1", 1)
								return true
							end,
						}))
						delay(0.5)
						return true
					end,
				}))
			end
		end
        if context.end_of_round then
            G.jokers:unhighlight_all()
			for k, v in ipairs(G.jokers.cards) do
				v:flip()
			end
        end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
