--The Sad Onion
YMA.TBOI_ITEMS {
    key = "yma_tboi_sad_onion",
    set = "yma_tboi_items",
    order = 1,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 1 },

    config = {
        extra = {
            xchips = 5,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--The Inner Eye
YMA.TBOI_ITEMS {
    key = "yma_tboi_inner_eye",
    set = "yma_tboi_items",
    order = 2,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 8, y = 0 },

    config = {
        extra = {
            effect_table = {
                ['x_chips'] = true,
                ['xchips'] = true,
                ['Xchips'] = true,
                ['Xchip_mod'] = true,
                ['x_chip_mod'] = true
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local key = temp_context.effect_type
            temp_context.effects[key] = ((temp_context.effects[key] - 1) / 2) + 1
            local amt = temp_context.effects[key]
            SMODS.calculate_individual_effect(temp_context.effects, temp_context.card, key, amt, temp_context.from_edition)
            SMODS.calculate_individual_effect(temp_context.effects, temp_context.card, key, amt, temp_context.from_edition)
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Spoon Bender
YMA.TBOI_ITEMS {
    key = "yma_tboi_spoon_bender",
    set = "yma_tboi_items",
    order = 3,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 6, y = 0 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.modify_pseudorandom_result then  
            card.ability.yma_backend_fail = true
            if not context.result and context.trigger_obj and not context.trigger_obj.ability.yma_backend_fail then
                card_eval_status_text(context.trigger_obj, 'extra', nil, nil, nil, {message = localize('k_failed_ex'), colour = G.C.RED})
                card_eval_status_text(context.trigger_obj, 'extra', nil, nil, nil, {message = localize('k_again_ex')})
                if pseudorandom('yma_tboi_spoon_bender_1') < context.numerator / context.denominator then
                    return {
                        new_result = true
                    }
                else
                    card_eval_status_text(context.trigger_obj, 'extra', nil, nil, nil, {message = localize('k_failed_ex'), colour = G.C.RED})
                    card_eval_status_text(context.trigger_obj, 'extra', nil, nil, nil, {message = localize('k_again_ex')})
                    if pseudorandom('yma_tboi_spoon_bender_2') < context.numerator / context.denominator then
                        return {
                            new_result = true
                        }
                    end
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
--Cricket's Head
YMA.TBOI_ITEMS {
    key = "yma_tboi_crickets_head",
    set = "yma_tboi_items",
    order = 4,
    quaility = 4,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 2 },

    config = {
        extra = {
            xmult = 1.5,
            effect_table = {
                ['x_mult'] = true,
                ['xmult'] = true,
                ['x_mult_mod'] = true,
                ['Xmult'] = true,
                ['Xmult_mod'] = true
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            temp_context.effects[temp_context.effect_type] = ((temp_context.effects[temp_context.effect_type] - 1) * card.ability.extra.xmult) + 1
            if temp_context.effects['message'] then
                temp_context.effects['message'] = localize{type='variable',key='a_xmult',vars={temp_context.effects[temp_context.effect_type]}} --Potentally problomatic, Fixes visual junk with vanilla Jokers
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                yma_avoid_modification = true,
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--My Reflection
YMA.TBOI_ITEMS {
    key = "yma_tboi_my_reflection",
    set = "yma_tboi_items",
    order = 5,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_my_reflection')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 6, y = 1 },

    config = {
        extra = {
            odds = 3,
            yma = {
                to_hand = {
                    cards = nil
                }
            }
        }
    },

    calculate = function(self, card, context)
        if context.joker_main and context.full_hand then
            card.ability.extra.yma.to_hand.cards = nil
            local cards = {}
            local i = 1
            for k, v in pairs(context.full_hand) do
                if SMODS.pseudorandom_probability(card, 'yma_tboi_my_reflection'..i, 1, card.ability.extra.odds) then
                    cards[#cards+1] = v
                end
                print()
                i = i + 1
            end
            card.ability.extra.yma.to_hand.cards = cards
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Steven
YMA.TBOI_ITEMS {
    key = "yma_tboi_steven",
    set = "yma_tboi_items",
    order = 6,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.score
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 10, y = 0 },

    config = {
        extra = {
            score = 50,
        }
    },

    calculate = function(self, card, context)
        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                    yma_add_score(card, card.ability.extra.score)
                return true end)
            }))
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Pentagram
YMA.TBOI_ITEMS {
    key = "yma_tboi_pentagram",
    set = "yma_tboi_items",
    order = 7,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_pentagram')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 8, y = 1 },

    config = {
        extra = {
            odds = 5,
            active = false,
            trigger = false,
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and context.beat_boss and not card.ability.extra.active and G.GAME.blind.colonparen_blindtype == 'CEO' then 
            if SMODS.pseudorandom_probability(card, 'yma_tboi_pentagram', 1, card.ability.extra.odds) then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_active'), colour = G.C.FILTER})
                G.GAME.yma_everywhere_open = true
                card.ability.extra.active = true
                card.ability.extra.trigger = true
            end
        end
        if context.cashing_out then
            card.ability.extra.trigger = false
        end
        if context.ante_end and context.ante_change and not card.ability.extra.trigger then 
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset'), colour = G.C.FILTER})
            G.GAME.yma_everywhere_open = false
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--1up!
YMA.TBOI_ITEMS {
    key = "yma_tboi_one_up",
    set = "yma_tboi_items",
    order = 10,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 0 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.game_over then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    SMODS.destroy_cards(card, nil, nil, true)
                    return true
                end
            })) 
            return {
                message = localize('k_saved_ex'),
                saved = true,
                colour = G.C.RED
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Number One
YMA.TBOI_ITEMS {
    key = "yma_tboi_number_one",
    set = "yma_tboi_items",
    order = 11,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.perma_blind_req + 1,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 6, y = 2 },

    config = {
        extra = {
            xchips = 10,
            perma_blind_req = 0.5,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.yma_blind_req_increase = G.GAME.yma_blind_req_increase or 1
        G.GAME.yma_blind_req_increase = G.GAME.yma_blind_req_increase + card.ability.extra.perma_blind_req
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Blood of the Martyr
YMA.TBOI_ITEMS {
    key = "yma_tboi_blood_martyr",
    set = "yma_tboi_items",
    order = 12,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.score,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },

    config = {
        extra = {
            mult = 15,
            score = 30,
        }
    },

    calculate = function(self, card, context)
        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                    yma_add_score(card, card.ability.extra.score)
                return true end)
            }))
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}