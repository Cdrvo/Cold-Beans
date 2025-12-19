SMODS.Sticker({
	key = "the_psychic_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 5,
		y = 1,
	},
	badge_colour = HEX("efc03c"),
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
		if context.debuff_hand then
			if #context.full_hand < 5 then
				return {
					debuff = true,
				}
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
