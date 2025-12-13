SMODS.Sticker({ -- fix this
	key = "hooking",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 2,
		y = 0,
	},
	badge_colour = HEX("a84024"),
	config = {},
	rate = 0.04,
	needs_enable_flag = true,
    sets = {
        Default = true,
        Enhanced = true,
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
	calculate = function(self,card,context)
        if context.press_play and card.area == G.hand then
            local change_amnt = #G.hand.cards
        G.E_MANAGER:add_event(Event({ func = function()

            NAMETEAM.discard_limit(change_amnt)
            G.hand:add_to_highlighted(card, true)
            play_sound('card1', 1)

            if card then G.FUNCS.discard_cards_from_highlighted(nil, true) end

            NAMETEAM.discard_limit(-change_amnt)
        return true end 
    })) 
        end

    
    end
})