 SMODS.Sticker({
	key = "cerulean_bell_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 4,
		y = 2,
	},
	badge_colour = SMODS.Gradients["nteam_cerulean_bell"],
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
    apply_to_deck = function(self, val)
        if val == false then
            self:NAMETEAM_removed(self)
        else
            self:NAMETEAM_applied(self)
        end
    end,
    NAMETEAM_removed = function(self, card)
        for k, v in ipairs(G.playing_cards) do
            v.ability.forced_selection = nil
        end
    end,
    calculate = function(self,card,context)
        if context.hand_drawn then
             local any_forced = nil
            for k, v in ipairs(G.hand.cards) do
                if v.ability.forced_selection then
                    any_forced = true
                end
            end
            if not any_forced then 
                G.hand:unhighlight_all()
                local forced_card = pseudorandom_element(G.hand.cards, pseudoseed('cerulean_bell'))
                forced_card.ability.forced_selection = true
                G.hand:add_to_highlighted(forced_card)
            end
        end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})
 