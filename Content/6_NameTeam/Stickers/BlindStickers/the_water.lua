SMODS.Sticker({
	key = "the_water_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 8,
		y = 1,
	},
	badge_colour = HEX("c6e0eb"),
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
		NAMETEAM.simple_apply(self, back, val)
	end,
	calculate = function(self, card, context)
		if context.first_hand_drawn then
			ease_discard(-G.GAME.current_round.discards_left)
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
