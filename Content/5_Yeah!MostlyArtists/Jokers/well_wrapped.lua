SMODS.Joker {
	key = 'yma_well_wrapped',

	rarity = 3,
	atlas = 'yma_joker_atlas',
	pos = { x = 2, y = 2 },
	cost = 8,
	blueprint_compat = false,
	config = {
        extra = {
            odds = 3,
        }
    },

	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_well_wrapped')
        return {
            vars = {
                numerator, denominator,
            }
        }
	end,

	remove_from_deck = function(self, card, from_debuff)
		if not card.ability.yma_sold_self and SMODS.pseudorandom_probability(card, 'yma_well_wrapped', 1, card.ability.extra.odds) then
			if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('Consumeables',G.consumeables, nil, nil, nil, nil, 'c_soul', 'yma_well_wrapped')
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
            end
		end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}