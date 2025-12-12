SMODS.Joker {
	key = 'yma_the_jest_around',

	rarity = 2,
	atlas = 'yma_joker_atlas',
	pos = { x = 1, y = 1 },
	cost = 6,
	blueprint_compat = false,
	config = {
        extra = {
            mult_mod = 0.5
        }
    },

	loc_vars = function(self, info_queue, card)
        local mult = card.ability.extra.mult_mod*(G.GAME.cbean_combo_index and #G.GAME.cbean_combo_index or 0)
        mult = mult + 1
		return { vars = { card.ability.extra.mult_mod, mult} }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
            local mult = card.ability.extra.mult_mod*(G.GAME.cbean_combo_index and #G.GAME.cbean_combo_index or 0)
            mult = mult + 1
            return {
                x_mult = mult
            }
        end
        
	end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}