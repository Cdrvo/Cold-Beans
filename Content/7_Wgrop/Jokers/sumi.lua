SMODS.Joker{
    key = 'wgrop_jhett_the_poltergeist',
    atlas = 'wgrop_joker_atlas',
    wgrop_biometype = "wgrop_rosygraveyard",
    rarity = 2,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 1, y = 0},
    config = {
        extra = {
            xms = 0.25, xmc = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_wgrop_pale_remnant
        return {
            vars = {
                card.ability.extra.xms,
                card.ability.extra.xmc
            }
        }
    end,

    calculate = function(self, card, context)
        local card_in_hand = SMODS.shallow_copy(G.hand.cards)
        local enhanced = {}
        local ghostheld = 0
        --[[Old ability, kept here for people to enable if they want to have fun with it
        if context.before and G.hand then
            for i = 1, #G.hand.cards do
                local chosencard = (card_in_hand[i])
                if next(SMODS.get_enhancements(chosencard)) == "m_cbean_wgrop_pale_remnant" then
                    table.insert(enhanced, chosencard)
                end
            end
            ghostheld = #enhanced
            for i, v in ipairs(enhanced) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.E_MANAGER:add_event(Event({  
                            trigger = 'immediate',
                            delay = 0.1,
                            func = function()
                                if math.random() > 0.5 then
                                    play_sound('tarot1')
                                else
                                    play_sound('tarot2')
                                end
                                G.hand:add_to_highlighted(v)
                                v:start_dissolve({HEX('C57384')}, nil, 1.6)
                                G.E_MANAGER:add_event(Event({  
                                    func = function()
                                        v:remove()
                                        v = nil
                                        return true
                                    end    
                                }))
                                return true
                            end    
                        }))
                        G.E_MANAGER:add_event(Event({  
                            trigger = 'immediate',
                            func = function()
                                if v ~= nil then
                                    G.hand:remove_from_highlighted(v)
                                    card.ability.extra.xmc = card.ability.extra.xmc + (card.ability.extra.xms*ghostheld)
                                end
                                return true
                            end    
                        }))
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize("k_cbean_munch_ex"), colour = HEX('C57384')})
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("+ X"..card.ability.extra.xms*ghostheld.." Mult"), colour = HEX('C57384')})
                        return true
                    end 
                }))
            end
        end
        ]]
        --New Ability
        if context.before and G.hand then
            for i = 1, #G.hand.cards do
                local chosencard = (card_in_hand[i])
                if next(SMODS.get_enhancements(chosencard)) == "m_cbean_wgrop_pale_remnant" then
                    table.insert(enhanced, chosencard)
                end
            end
            for i, v in ipairs(enhanced) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.E_MANAGER:add_event(Event({  
                            trigger = 'immediate',
                            delay = 0.1,
                            func = function()
                                if math.random() > 0.5 then
                                    play_sound('tarot1')
                                else
                                    play_sound('tarot2')
                                end
                                G.hand:add_to_highlighted(v)
                                v:start_dissolve({HEX('C57384')}, nil, 1.6)
                                G.E_MANAGER:add_event(Event({  
                                    func = function()
                                        v:remove()
                                        v = nil
                                        return true
                                    end    
                                }))
                                return true
                            end    
                        }))
                        G.E_MANAGER:add_event(Event({  
                            trigger = 'immediate',
                            func = function()
                                if v ~= nil then
                                    G.hand:remove_from_highlighted(v)
                                    SMODS.scale_card(card, {
                                        ref_table = card.ability.extra,
                                        ref_value = "xmc",
                                        scalar_value = "xms",
                                        no_message = true
                                    })
                                end
                                return true
                            end    
                        }))
                        card_eval_status_text(v, 'extra', nil, nil, nil, {message = localize("k_cbean_munch_ex"), colour = HEX('C57384')})
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = ("X"..(card.ability.extra.xmc + (card.ability.extra.xms * i)).." "..localize("k_mult")), colour = HEX('C57384')})
                        return true
                    end 
                }))
            end
        end

        if context.joker_main then
            if card.ability.extra.xmc > 1 then
                return {
                    xmult = card.ability.extra.xmc
                }
            end
        end
    end,
    beans_credits = {
        team = {"wgrop"
        },
        idea = "Tje.tsu",
        art =  "Tje.tsu",
        code = "Tje.tsu",
    }
}

