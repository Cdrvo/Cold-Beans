
SMODS.Sticker({
	key = "the_ox_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 0,
		y = 0,
	},
	badge_colour = HEX("b95b08"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Blind = true
    },
	loc_vars = function(self, info_queue, card)
		return {
			vars = { NAMETEAM.most_played() },
		}
	end,
    calculate = function(self,card,context)
        if context.before then
            if G.GAME.current_round.current_hand.handname_text == NAMETEAM.most_played() then
                ease_dollars(-G.GAME.dollars)
            end
        end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})