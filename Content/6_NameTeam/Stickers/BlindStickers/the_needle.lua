SMODS.Sticker({
	key = "the_needle_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 1,
		y = 1,
	},
	badge_colour = HEX("5c6e31"),
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
        if context.first_hand_drawn then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.blind.chips = G.GAME.blind.chips / 2
					G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
					G.GAME.blind:juice_up()
                    SMODS.calculate_effect({
                        message = localize("k_cbean_nteam_halved"),
                        colour = { 0.8, 0.45, 0.85, 1 },
                        instant = true
                    }, card)
					return true
				end,
			}))
		end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})