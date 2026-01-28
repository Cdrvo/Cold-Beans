SMODS.Sticker({
	key = "spore",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 2,
		y = 3,
	},
	badge_colour = HEX("9bad4f"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
	sets = {
		Joker = true,
		Consumable = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	sticker_type = "Negative",
	calculate = function(self, card, context)
		if context.setting_blind then
			local _set
			if card.set ~= "Joker" then
				_set = "Consumable"
			else
				_set = "Joker"
			end
            local _card = NAMETEAM.random_joker(card.area.cards, card)
            local ae = NAMETEAM.poll_sticker(true, _card, false, _set)
			if ae then
				_card:add_sticker(ae, true)
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "GhostSalt",
	},
})
