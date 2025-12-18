SMODS.Sticker({
	key = "the_head_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 6,
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
    NAMETEAM_removed = function(self, card)
		if G.playing_cards then
			for k, v in pairs(G.playing_cards) do
				if v.debuffed_by_headstkr then
					v.debuffed_by_headstkr = nil
					SMODS.debuff_card(v, false, "NAMETEAM_head_sticker")
				end
			end
		end
	end,
    calculate = function(self,card,context)
        if context.setting_blind then
            for k, v in pairs(G.playing_cards) do
                if v:is_suit("Hearts") and not v.debuff then
                    SMODS.debuff_card(v, true, "NAMETEAM_head_sticker")
                    v.debuffed_by_headstkr = true
                end
            end
        end
        if context.end_of_round then
            for k, v in pairs(G.playing_cards) do
                if v:is_suit("Hearts", true) and v.debuffed_by_headstkr then
                    v.debuffed_by_headstkr = nil
                    SMODS.debuff_card(v, false, "NAMETEAM_head_sticker")
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