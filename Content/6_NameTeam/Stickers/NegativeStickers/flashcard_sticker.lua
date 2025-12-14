SMODS.Sticker({
	key = "flashcard",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 2,
		y = 1,
	},
	badge_colour = HEX("5fc79d"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
    sets = {
        Joker = true
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
	calculate = function(self,card,context)
        if context.reroll_shop then
            NAMETEAM.replacecards(card)
        end
    end,
    beans_credits = {
        code = "Revo",
        team = "Name Team",
        art = "Doggfly"
    }
})
