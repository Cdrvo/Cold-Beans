SMODS.Sticker({
	key = "minuscule",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 5,
		y = 0,
	},
	badge_colour = HEX("949494"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Joker = true,
        Consumable = true,
        Playing_cards = true
	},
	sticker_type = "Positive",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
    NAMETEAM_applied = function(self, card)
        card.ability.extra_slots_used = -0.5
    end,
    NAMETEAM_removed = function(self, card)
        card.ability.extra_slots_used = 0
    end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})
