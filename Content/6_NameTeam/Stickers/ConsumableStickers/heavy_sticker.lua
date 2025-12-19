SMODS.Sticker({
	key = "heavy",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 4,
		y = 1,
	},
	badge_colour = HEX("808794"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Consumable = true
    },
	sticker_type = "Negative",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
    NAMETEAM_applied = function(self, card)
        if not card:in_collection() and G.hand then G.hand:change_size(-1) end
    end,
    NAMETEAM_removed = function(self, card)
        if not card:in_collection() and G.hand then G.hand:change_size(1) end
    end,
	beans_credits = {
		code = "Revo",
		art = "GhostSalt",
		team = "Name Team"
	},
})