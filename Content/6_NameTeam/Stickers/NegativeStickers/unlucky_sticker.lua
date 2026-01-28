SMODS.Sticker({
	key = "unlucky",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
		y = 3,
	},
	badge_colour = HEX("3c5f35"),
	config = {extra = {prob_div = 2}},
	rate = 0.06,
	needs_enable_flag = true,
    sets = {
        Joker = true,
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {self.config.extra.prob_div},
	}
	end,
    sticker_type = "Negative",
	calculate = function(self,card,context)
        if context.mod_probability then
            return {
                numerator = context.numerator / self.config.extra.prob_div
            }
        end
    end,
    beans_credits = {
        code = "ThunderEdge",
        team = "Name Team",
        art = "GhostSalt"
    }
})