SMODS.Sticker({
	key = "dangerous",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
		y = 2,
	},
	badge_colour = G.C.RED,
	config = { odds = 4 },
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Consumable = true,
	},
	loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(self, 1, self.config.odds, "cbean_dangerous_sticker")
		return {
			vars = { num, denom },
		}
	end,
	NAMETEAM_removed = function(self, card)
		if SMODS.pseudorandom_probability(card, "cbean_dangerous_sticker", 1, self.config.odds, "cbean_dangerous_sticker") and G.CONTROLLER.locks.use then
			G.GAME.dangerous_mult = G.GAME.dangerous_mult * 2
			SMODS.calculate_effect({
				message = localize("k_cbean_nteam_uhoh"),
			}, G.deck.cards[1] or G.deck)
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})

ColdBeans.OnCalculate(function(mod, context)
	if context.first_hand_drawn and G.GAME.dangerous_mult > 1 then
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.blind.chips = G.GAME.blind.chips * G.GAME.dangerous_mult
				G.GAME.dangerous_mult = 1
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				G.GAME.blind:juice_up()
				SMODS.calculate_effect({
					message = localize("k_cbean_nteam_danger"),
					colour = G.C.RED,
					instant = true,
				}, G.deck.cards[1] or G.deck)
				return true
			end,
		}))
	end
end)
