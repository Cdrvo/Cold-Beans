SMODS.Sticker({
	key = "square",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 1,
		y = 4,
	},
	badge_colour = HEX("fd5f55"),
	config = {},
	rate = 0.03,
	needs_enable_flag = true,
	sets = {
		Joker = true,
	},
	loc_vars = function(self, info_queue, card)
		if type(card.ability.cbean_square) == 'number' then
			info_queue[#info_queue+1] = {
				key = 'cbean_nteam_square_scale',
				set = 'Other'
			}
		end
		return {
			vars = {},
		}
	end,
	sticker_type = "Negative",
	calculate = function(self, card, context)
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
	apply = function (self, card, val)
		if type(val) == 'number' then
			NAMETEAM.values("*", card, val, true)
		elseif (val == false) and (type(card.ability.cbean_square) == 'number') then
			NAMETEAM.values("/", card, card.ability.cbean_square, true)
		end
		return SMODS.Sticker.apply(self, card, val)
	end
})


