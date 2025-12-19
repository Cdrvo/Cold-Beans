SMODS.Sticker({
	key = "the_arm_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 0,
		y = 0,
	},
	badge_colour = HEX("6865f3"),
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
		if context.before and G.GAME.hands[context.scoring_name].level > 1 then
			return {
				level_up = -1
			}
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
