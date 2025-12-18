SMODS.Sticker({
	key = "the_manacle_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 8,
		y = 0,
	},
	badge_colour = HEX("575757"),
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
    NAMETEAM_applied = function(self, card)
        if card.area and G.hand then G.hand:change_size(-1) end
    end,
    NAMETEAM_removed = function(self, card)
        if card.area and G.hand then G.hand:change_size(1) end
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",  
	},
})