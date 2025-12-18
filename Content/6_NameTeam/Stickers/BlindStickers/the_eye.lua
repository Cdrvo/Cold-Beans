SMODS.Sticker({
	key = "the_eye_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 2,
		y = 0,
	},
	badge_colour = HEX("4b71e4"),
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
    hands = {},
    calculate = function(self,card,context)
            if context.setting_blind then
                self.hands = {}
                for _, poker_hand in ipairs(G.handlist) do
                     self.hands[poker_hand] = false
                end
            end
            if context.debuff_hand then
                if self.hands[context.scoring_name] then
                    return {
                        debuff = true
                    }
                end
                if not context.check then
                    self.hands[context.scoring_name] = true
                end
            end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})