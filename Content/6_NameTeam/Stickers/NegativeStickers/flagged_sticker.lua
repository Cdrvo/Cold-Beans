SMODS.Sticker({
	key = "flagged",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 7,
		y = 4,
	},
	sets = {
		Joker = true,
		Default = true,
		Enhanced = true,
		Consumable = true,
	},
	badge_colour = HEX("878787"),
	needs_enable_flag = true,
	rate = 0.03,
	sticker_type = "Negative",
	loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal or 0 } }
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.01,
				func = function()
					if SMDOS.pseudorandom_probability(card, "flag_seed", 1, 8) then
						if card:on_the("right") then
							SMDOS.destroy_cards(card:on_the("right"))
						end
					end
					if SMDOS.pseudorandom_probability(card, "flag_seed_left", 1, 8) then
						if card:on_the("left") then
							SMDOS.destroy_cards(card:on_the("left"))
						end
					end
					return true
				end,
			}))
		end
	end,
	beans_credits = {
		code = "Revo",
		art = "Inky",
		team = "Name Team",
	},
})
