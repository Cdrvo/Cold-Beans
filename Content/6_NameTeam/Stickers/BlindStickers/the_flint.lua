SMODS.Sticker({
	key = "the_flint_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 4,
		y = 0,
	},
	badge_colour = HEX("e56a2f"),
	config = {
    },
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
       if context.modify_hand then
        	mult = mod_mult(math.max(math.floor(mult * 0.5 + 0.5), 1))
			hand_chips = mod_chips(math.max(math.floor(hand_chips * 0.5 + 0.5), 0))
			update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
       end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
