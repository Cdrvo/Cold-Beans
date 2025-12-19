SMODS.Sticker({
	key = "egg",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 7,
		y = 3,
	},
	badge_colour = HEX("fda200"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Joker = true,
        Consumable = true
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	sticker_type = "Positive",
    calculate = function(self, card, context)
        if context.end_of_round and (context.cardarea == G.jokers or context.cardarea == G.consumeables) then
            if card.set_cost then 
                card.ability.extra_value = (card.ability.extra_value or 0) + 2
                card:set_cost()
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})
