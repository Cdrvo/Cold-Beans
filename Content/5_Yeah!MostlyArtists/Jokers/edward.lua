SMODS.Joker {
	key = 'yma_edward',
	rarity = 2,
	atlas = 'yma_joker_atlas',
	pos = { x = 0, y = 0 },
	cost = 6,
	blueprint_compat = false,
	config = {
        extra = {
            emult = 1.1
        }
    },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.emult } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			local current_mult = mult
			current_mult = current_mult ^ 1.1
			return {
				xmult = 0,
				extra = {
					mult = current_mult
				}
			}
		end
	end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "lyre",
        art = "FirstTry",
        code = "Rainstar",
    }
}