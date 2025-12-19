SMODS.Sticker({
	key = "mailed",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 1,
		y = 0,
	},
	badge_colour = HEX("55a383"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
    sets = {
        Default = true,
        Enhanced = true,
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
    sticker_type = "Negative",
	calculate = function(self,card,context)
        if context.discard and context.other_card == card then
            return{
                dollars = -2
            }
        end
    end,
    beans_credits = {
        code = "Revo",
        team = "Name Team",
        art = "GhostSalt"
    }
})