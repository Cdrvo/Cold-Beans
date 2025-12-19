SMODS.Sticker({
	key = "green",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 3,
		y = 1,
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
			G.GAME.modifiers.no_interest = true
            G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) + 1
            G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) + 1
		end, function()
			G.GAME.modifiers.no_interest = G.GAME.already_no_interest
            G.GAME.modifiers.money_per_hand = (G.GAME.modifiers.money_per_hand or 1) - 1
            G.GAME.modifiers.money_per_discard = (G.GAME.modifiers.money_per_discard or 0) - 1
		end)
	end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})