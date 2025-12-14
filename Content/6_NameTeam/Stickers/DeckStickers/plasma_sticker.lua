SMODS.Sticker({
	key = "plasma",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 4,
		y = 0,
	},
	badge_colour = HEX("cc73d9"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.blind.chips = G.GAME.blind.chips * 2
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    SMODS.calculate_effect({
                        message = localize("k_cbean_nteam_doubled"),
                        colour = { 0.8, 0.45, 0.85, 1 },
                        instant = true
                    }, card)
					return true
				end,
			}))
		end
		if context.final_scoring_step then
			local f_chips = math.floor(hand_chips / 10)
			local f_mult = math.floor(mult / 10)

			hand_chips = mod_chips(hand_chips - f_chips)
			mult = mod_mult(mult - f_mult)

			local total = f_chips + f_mult
			hand_chips = mod_chips(math.floor(total / 2) + hand_chips)
			mult = mod_mult(math.floor(total / 2) + mult)
			NAMETEAM.plasma_visuals(card)
		end
	end,
	beans_credits = {
		code = "ThunderEdge",
		team = "Name Team",
		art = "GhostSalt",
	},
})
