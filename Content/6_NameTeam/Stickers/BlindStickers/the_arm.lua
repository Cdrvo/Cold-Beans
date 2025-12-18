SMODS.Sticker({
	key = "the_arm_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 0,
		y = 0,
	},
	badge_colour = HEX("6865f3"),
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
        if context.before then
            if  G.GAME.current_round.current_hand.hand_level ~= " lvl.1" then
                SMODS.smart_level_up_hand(nil,  G.GAME.current_round.current_hand.handname_text, nil, -1)
            end
        end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})