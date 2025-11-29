SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "4piss_molotov", 
    atlas = "4piss_joker_atlas",
    pos = { x = 0, y = 0 },
    rarity = 2,
    order = 1,
    blueprint_compat = false,
    cost = 6,
    config = { extra = { destroy_max = 5}, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy_max } }
    end,
	
    calculate = function(self, card, context)
	if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.joker_main and context.full_hand and G.GAME.current_round.hands_played == 0 then
			local possible_cards = math.min(#G.hand.cards, pseudorandom('molotov', 1, card.ability.extra.destroy_max))
				
			local destroyed_cards = {}
			local temp_hand = {}

			for num, playing_card in ipairs(G.hand.cards) do
				if playing_card and not playing_card.burned then
					temp_hand[#temp_hand + 1] = playing_card
				end
			end

			pseudoshuffle(temp_hand, 'molotov')

			for i = 1,  possible_cards do
				destroyed_cards[#destroyed_cards + 1] = temp_hand[i]
				if destroyed_cards[#destroyed_cards] then
					destroyed_cards[#destroyed_cards].burned = true
				end
			end
			SMODS.destroy_cards(destroyed_cards)
			return {
                message = localize { type = 'variable', key = 'a_burned_cards', vars = { #destroyed_cards } } ,
                colour = G.C.RED,
            }
        end
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "FlameThrowerFIM",
        art =  "FlameThrowerFIM",
        code = "Nrio_Modder",
    }
}