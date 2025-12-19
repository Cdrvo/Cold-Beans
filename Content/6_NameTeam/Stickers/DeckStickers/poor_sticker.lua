SMODS.Sticker({
	key = "poor",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
		y = 4,
	},
	badge_colour = G.C.GREEN,
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Deck = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	apply_to_deck = function(self, back, val)
		NAMETEAM.simple_apply(self, back, val, function()
            if not G.GAME.modifiers.cbean_half_money then G.GAME.modifiers.cbean_half_money = 0 end
			G.GAME.modifiers.cbean_half_money = G.GAME.modifiers.cbean_half_money + 1
		end, function()
			G.GAME.modifiers.cbean_half_money = G.GAME.modifiers.cbean_half_money - 1
		end)
	end,
	calculate = function(self,card,context)
		if context.money_altered then
			SMODS.calculate_effect({
                        message = localize("k_cbean_nteam_halved"),
                        instant = true
                    }, card)
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
	},
})