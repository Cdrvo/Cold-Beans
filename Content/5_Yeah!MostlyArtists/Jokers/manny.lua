SMODS.Joker {
	key = 'yma_manny',
	rarity = 1,
	atlas = 'yma_joker_atlas',
	pos = { x = 1, y = 0 },
	cost = 4,
	blueprint_compat = true,
	config = {
        extra = {
            xmult = 1.1
        }
    },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
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