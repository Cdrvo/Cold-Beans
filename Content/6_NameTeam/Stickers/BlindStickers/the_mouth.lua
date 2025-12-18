SMODS.Sticker({
	key = "the_mouth_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 0,
		y = 1,
	},
	badge_colour = HEX("ae718e"),
	config = {},
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
	hands = {},
	calculate = function(self, card, context)
            if context.initial_scoring_step and not self.hand_set then
                self.hands = {}
                for _, poker_hand in ipairs(G.handlist) do
                    if poker_hand ~= G.GAME.current_round.current_hand.handname_text then
                     self.hands[poker_hand] = true
                     self.hand_set = true
                    end
                end
            end
            if context.debuff_hand then
                if self.hands[context.scoring_name] then
                    return {
                        debuff = true
                    }
                end
            end
        if context.end_of_round then
            self.hand_set = false
            self.hands = {}
        end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
