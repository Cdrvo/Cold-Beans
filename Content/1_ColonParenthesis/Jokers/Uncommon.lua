
-- RNA 
SMODS.Joker {
    key = "colon_rna",
    pronouns = "it_its",

    rarity = 2,
    price = 6,
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            print(context.full_hand[1].base or context.full_hand[1])
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local card_copied = SMODS.create_card({
                set = 'Playing Card',
                rank = context.full_hand[1].base.id,
                suit = context.full_hand[1].base.suit,
                no_edition = true
            })
            card_copied:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, card_copied)
            G.hand:emplace(card_copied)
            card_copied.states.visible = nil

            G.E_MANAGER:add_event(Event({
                func = function()
                    card_copied:start_materialize()
                    return true
                end
            }))
            return {
                message = "Copied!",
                colour = G.C.CHIPS,
                func = function() -- This is for timing purposes, it runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                            return true
                        end
                    }))
                end
            }
        end
    end
}

-- Sproinky 
SMODS.Joker {
    key = "colon_sproinky",
    pronouns = "it_its",

    rarity = 2,
    price = 8,
    blueprint_compat = true,

    calculate = function(self, card, context)
        if context.before then
            local scored = {}
            for _, c in pairs(context.scoring_hand) do
                scored[c] = true
            end

            return {
                func = function()
                    for _, other_card in pairs(G.play.cards) do
                        print('wawa ', SMODS.has_enhancement(other_card, 'm_steel'), not scored[other_card])
                        if not scored[other_card] then 
                            other_card:set_ability('m_steel', nil, true)
                            print("wawa")
                        elseif SMODS.has_enhancement(other_card, 'm_steel') then
                            print(SMODS.has_enhancement(other_card, 'm_steel'))
                            -- debuff or smth idk
                            SMODS.debuff_card(other_card, true, "Sproinky")
                            -- Oh yea, does a backflip
                        end
                    end
                end
            }
        end
    end
}