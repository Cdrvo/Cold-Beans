SMODS.Sticker({
	key = "the_wall_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 7,
		y = 0,
	},
	badge_colour = HEX("8a59a5"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Blind = true
    },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
    calculate = function(self,card,context)
        if context.setting_blind then
			G.GAME.blind.chips = G.GAME.blind.chips * 2
			G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			SMODS.juice_up_blind()
		end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})