SMODS.Sticker({
	key = "mailed",
	pos = {
		x = 0,
		y = 0,
	},
	badge_colour = HEX("c8a676"),
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
	calculate = function(self,card,context)
        if context.discard and context.other_card == card then
            return{
                dollars = -2
            }
        end
    end
})