SMODS.Sticker({
	key = "black",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 0,
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
            -- If there's anything changing the negative rate, we keep the old one so we can revert it
            G.GAME.modifiers.cbean_base_negative_rate = G.P_CENTERS.e_negative:get_weight()
            G.GAME.modifiers.cbean_negative_rate = G.GAME.modifiers.cbean_base_negative_rate * 10
            
            if card.ability[self.key] then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
                ease_hands_played(-1)                
                SMODS.Edition:take_ownership("negative", {
                    get_weight = function(self)
                        return self.weight * (G.GAME.modifiers.cbean_negative_rate or 1)
                    end,
                }, true)
            else
                G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                ease_hands_played(1)                
                SMODS.Edition:take_ownership("negative", {
                    get_weight = function(self)
                        return (G.GAME.modifiers.cbean_base_negative_rate or self.weight)
                    end,
                }, true)
            end
        end
    end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})