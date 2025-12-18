SMODS.Sticker({
	key = "the_fish_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 3,
		y = 0,
	},
	badge_colour = HEX("3e85bd"),
	config = {
        shld_stay_flipped = false
    },
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Blind = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	calculate = function(self, card, context)
        local s = self.config
        if context.end_of_round then
            s.shld_stay_flipped = false
        end
        if context.hand_drawn then
            s.shld_stay_flipped = false
        end
		if (context.before or context.joker_main) and not s.shld_stay_flipped then
            s.shld_stay_flipped = true
        end
		if context.stay_flipped and s.shld_stay_flipped and context.to_area == G.hand then
			return {
				stay_flipped = true,
			}
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
