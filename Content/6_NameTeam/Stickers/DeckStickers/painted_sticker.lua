SMODS.Sticker({
	key = "painted",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 1,
		y = 1,
	},
	badge_colour = HEX("cc73d9"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
    apply = function(self, card, val)
        card.ability[self.key] = val
        if G.hand ~= nil then
            if card.ability[self.key] then
                G.hand:change_size(1)
                G.jokers:change_size(-1)
            else
                G.hand:change_size(-1)
                G.jokers:change_size(1)
            end
        end
    end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})