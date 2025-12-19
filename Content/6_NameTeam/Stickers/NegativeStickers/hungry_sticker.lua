SMODS.Sticker({
	key = "hungry",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 3,
		y = 2,
	},
	badge_colour = HEX("d56a57"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
    sets = {
        Joker = true,
        Consumable = true
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
    sticker_type = "Negative",
	calculate = function(self,card,context)
        if context.setting_blind then
            local rr
           for i = 1, #card.area.cards do
                if card.area.cards[i] == card then
                    rr = i
                end
           end
           if card.area.cards[rr+1] then
                SMODS.destroy_cards(card.area.cards[rr+1])
           end
        end
    end,
    beans_credits = {
        code = "Revo",
        team = "Name Team",
        art = "GhostSalt"
    }
})