SMODS.Sticker({
	key = "the_serpent_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 6,
		y = 1,
	},
	badge_colour = HEX("439a4f"),
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
		if
			context.drawing_cards and (
				G.GAME.current_round.hands_played ~= 0 or G.GAME.current_round.discards_used ~= 0
			)
		then
			return {
				cards_to_draw = 3,
			}
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
