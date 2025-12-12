SMODS.Joker {
	key = 'yma_key_ring',

	rarity = 2,
	atlas = 'yma_joker_atlas',
	pos = { x = 0, y = 1 },
	cost = 6,
	blueprint_compat = false,
	config = {
        extra = {
            odds = 3
        }
    },

	loc_vars = function(self, info_queue, card)
		
	end,

	calculate = function(self, card, context)
        if context.yma and context.yma.key_triggered and context.yma.uses_left <= 0 then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local key = context.yma.key.config.center.key
                if SMODS.pseudorandom_probability(card, 'yma_key_ring', 1, card.ability.extra.odds, true) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_yma_polish_fail')})
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.0,
                        func = (function()
                            local cardd = create_card('yma_keys',G.consumeables, nil, nil, nil, nil, key, 'yma_key_ring')
                            cardd:add_to_deck()
                            G.consumeables:emplace(cardd)
                            return true
                        end)
                    }))
                end
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