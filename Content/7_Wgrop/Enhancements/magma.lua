SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_magma',
    pos = {x = 0, y = 4}, 
    atlas = 'wgrop_enhancement_atlas',
    wgrop_biometype = "wgrop_rosygraveyard",
    config = {cards = 1},
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.cards
        }}
    end,
    calculate = function (self, card, context) --check copied from handsome devils
        if context.main_scoring and context.cardarea == G.play then
            local card_in_hand = SMODS.shallow_copy(G.hand.cards)
            local random_cards = {}
            for i = 1, card.ability.cards do
                local chosencard, i = pseudorandom_element(card_in_hand, pseudoseed("riceiloveyou"))
                if not next(SMODS.get_enhancements(chosencard)) then
                    table.insert(random_cards, chosencard)
                    table.remove(card_in_hand, i)
                end
            end
            if #random_cards > 0 then
                for i, v in ipairs(random_cards) do
                    local enhtable = {
                        'm_stone',
                        'm_glass',
                        'm_steel'
                    }
                    local selected = pseudorandom_element(enhtable, "riceshower")
                    if random_cards[i] then
                        G.E_MANAGER:add_event(Event({  
                            trigger = 'after',
                            delay = 0.3,
                            func = function()
                                play_sound('cardSlide1')
                                play_sound('tarot1')
                                G.hand:add_to_highlighted(random_cards[i])
                                random_cards[i]:juice_up()
                                random_cards[i]:set_ability(selected)
                                return true
                            end    
                        }))
                        G.E_MANAGER:add_event(Event({  
                            trigger = 'after',
                            delay = 0.3,
                            func = function()
                                G.hand:remove_from_highlighted(random_cards[i])
                                play_sound('cardSlide2')
                                return true
                            end    
                        }))
                    end
                end
            end
        end
        if context.after and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                    card:start_dissolve({G.C.RED}, nil, 1.6)
                    G.E_MANAGER:add_event(Event({  
                        func = function()
                            card:remove()
                            return true
                        end    
                    }))           
                    return true
                end
            }))
        end
    end
}