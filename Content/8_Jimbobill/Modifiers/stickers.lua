SMODS.Sticker {
	key = 'jaded',
	atlas = "emplatlas",
	pos = { x = 1, y = 2 },
    badge_colour = HEX("687ee7"),
	loc_vars = function(self, info_queue, card)
	end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Evgast Placeholder"
    }
}

SMODS.Sticker {
	key = 'banished',
	atlas = "emplatlas",
	pos = { x = 2, y = 2 },
    badge_colour = HEX("e8b867"),
	loc_vars = function(self, info_queue, card)
	end,
    calculate = function(self, card, context)
        if card.area == G.hand and context.hand_drawn then
            draw_card(G.hand, G.discard, nil, "up", true, card)
            SMODS.draw_cards(1)
        end
        if context.end_of_round and (G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo") then
           card.ability.cbean_banished = nil 
        end
    end,
    beans_credits = {
        idea = "D.J..?",
        code = "Evgast",
        team = "Jimbobill",
        art = "Evgast Placeholder"
    }
}

SMODS.Sticker {
	key = 'stick2',
	atlas = "jbill_enhance",
	pos = { x = 2, y = 0 },
    badge_colour = HEX("FFD800"),
	loc_vars = function(self, info_queue, card)
	end,
    apply = function(self, card, val)
        if G.consumeables then
            if val then
                G.consumeables.config.card_limit = G.consumeables.config.card_limit + 0.5
            else
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - 0.5
            end
        end
        card.ability[self.key] = val
    end,
    calculate = function(self, card, context)
		if context.cbean_destroyed and context.cbean_destroyed_card == card then
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - 0.5
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Evgast Placeholder"
    }
}