SMODS.Sticker({
	key = "mitosis",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 2,
		y = 4,
	},
	badge_colour = HEX("c671ff"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Playing_cards = true
	},
	sticker_type = "Positive",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {G.GAME.probabilities.normal,6},
		}
	end,
	calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual then
            if not card.cbean_just_created then
                card.cbean_just_created = true
                local will_duplicate = (pseudorandom(pseudoseed('nteam_mitosis'), G.GAME.probabilities.normal, 6) == 1)
                if will_duplicate then
                    local _card = copy_card(card, nil, nil, G.playing_card)
                    _card.cbean_just_created = true
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    G.deck:emplace(_card)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            _card:start_materialize()
                            return true
                        end
                    })) 
                    return {
                        message = 'Mitosis!'
                    }
                end
            else
                card.cbean_just_created = nil
            end
        end
    end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "",
	},
})
