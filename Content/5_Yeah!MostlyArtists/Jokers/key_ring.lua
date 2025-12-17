SMODS.Joker {
	key = 'yma_key_ring',

	rarity = 2,
    atlas = "NAMETEAM_Jokers", -- HEY GUYS i animated your thing!!
    pos = { x = 0, y = 5 },
    cbean_anim = {
        { xrange = { first = 0, last = 8 }, y = 5, t = 0.1 }
    },
    pos_extra = { x = 5, y = 8 },
    cbean_anim_extra = {
        { x = 5, y = 8, t = 0.075 },
        { x = 6, y = 8, t = 0.125 },
        { x = 7, y = 8, t = 0.175 },
        { x = 8, y = 8, t = 0.3 },
        { x = 7, y = 8, t = 0.175 },
        { x = 6, y = 8, t = 0.125 },
        { x = 5, y = 8, t = 0.075 },
        { x = 9, y = 8, t = 0.125 },
        { x = 10, y = 8, t = 0.175 },
        { x = 11, y = 8, t = 0.3 },
        { x = 10, y = 8, t = 0.175 },
        { x = 9, y = 8, t = 0.125 }
    },
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