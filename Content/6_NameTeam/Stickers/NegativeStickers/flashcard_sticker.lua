SMODS.Sticker({
	key = "flashcard",
	pos = {
		x = 0,
		y = 0,
	},
	badge_colour = HEX("86dd94"),
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
    end
})