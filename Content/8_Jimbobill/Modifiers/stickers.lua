SMODS.Sticker {
	key = 'jaded',
	atlas = "emplatlas",
	pos = { x = 1, y = 2 },
    badge_colour = HEX("687ee7"),
    loc_txt = {
        name = "Jaded",
		text = {"Considered a {C:attention}Face Card{}"} 
    }, 
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
    loc_txt = {
        name = "Banished",
		text = {"Discards itself when drawn",
                "Draws a new card",
                "Removes this sticker",
                "after three rounds"} 
    },
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