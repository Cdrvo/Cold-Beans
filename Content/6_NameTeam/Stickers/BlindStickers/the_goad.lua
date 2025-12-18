SMODS.Sticker({
	key = "the_goad_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 5,
		y = 0,
	},
	badge_colour = HEX("b95c96"),
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
            for k, v in pairs(G.playing_cards) do
                if v:is_suit("Spades") and not v.debuff then
                    v.debuff = true
                    v.debuffed_by_goadstkr = true
                end
            end
        end
        if context.end_of_round then
            for k, v in pairs(G.playing_cards) do
                if v:is_suit("Spades") and v.debuffed_by_goadstkr then
                    v.debuffed_by_goadstkr = nil
                    v.debuff = false
                end
            end
        end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})