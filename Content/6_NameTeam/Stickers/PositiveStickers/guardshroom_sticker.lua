SMODS.Sticker({
	key = "guardshroom",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 4,
		y = 4,
	},
	badge_colour = HEX("634d84"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
    sticker_type = "Positive",
    sets = {
		Joker = true
	},
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
	NAMETEAM_applied = function(self, card)
		Colonparen.manipulate(card, {
			type = "X",
			value = 1.05,
			no_deck_effects = true
		})
    end,
    NAMETEAM_removed = function(self,card)
		Colonparen.manipulate(card, {
			type = "/",
			value = 1.05,
			no_deck_effects = true
		})
    end,
    beans_credits = {
        code = "Revo",
        team = "Name Team",
        art = "Crazy Dave"
    }
})
