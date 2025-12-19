SMODS.Sticker({
	key = "barren",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 5,
		y = 2,
	},
	badge_colour = HEX("aaaaaa"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
    sticker_type = "Negative",
    sets = {
        Default = true,
        Enhanced = true,
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
	NAMETEAM_applied = function(self, card)
        if card.ability.set == "Enhanced" then
            card:set_ability("c_base")
        end
    end,
    beans_credits = {
        code = "Revo",
        team = "Name Team",
        art = "GhostSalt"
    }
})