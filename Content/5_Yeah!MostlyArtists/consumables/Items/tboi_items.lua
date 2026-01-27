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
--Mom's Eye
YMA.TBOI_ITEMS {
    key = "yma_tboi_moms_eye",
    set = "yma_tboi_items",
    order = 8,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 9, y = 0 },

    config = {
        extra = {
            odds = 4,
            effect_table = {
                ['mult'] = true,
                ['h_mult'] = true,
                ['mult_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local key = temp_context.effect_type
            local amt = temp_context.effects[key]
            if SMODS.pseudorandom_probability(card, 'yma_tboi_pentagram' .. G.SEED, 1, card.ability.extra.odds, nil, true) then
                card_eval_status_text(temp_context.card, 'extra', nil, nil, nil, {message = localize('k_again_ex')})
                SMODS.calculate_individual_effect(temp_context.effects, temp_context.card, key, amt, temp_context.from_edition)
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
--The Ladder
YMA.TBOI_ITEMS {
    key = "yma_tboi_ladder",
    set = "yma_tboi_items",
    order = 9,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 9, y = 1},

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.poker_hands and context.scoring_hand then
            local new_results = {}
            for k, _hand in pairs(SMODS.PokerHands) do
                if SMODS.is_poker_hand_visible(k) then
	                new_results[#new_results+1] = {hand = k, order = _hand.order}
                end
            end
            table.sort(new_results, function(a,b) return a.order > b.order end)
            local new_results = {}
            local hand1 = nil
            local hand2 = nil
            local var = context.scoring_name
            local trigger = false
            for k, v in pairs(new_results) do
	            if trigger then
		             if not hand1 then
			            hand1 = v.hand
		             elseif not hand2 then
			            hand2 = v.hand
		             end
	            end
	            if v.hand == var then
		            trigger = true
	            end
            end
            if hand1 and not next(context.poker_hands[hand1]) then
                table.insert(context.poker_hands[hand1], context.scoring_hand)
            end
            if hand2 and not next(context.poker_hands[hand2]) then
                table.insert(context.poker_hands[hand2], context.scoring_hand)
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
--The Virus
YMA.TBOI_ITEMS {
    key = "yma_tboi_virus",
    set = "yma_tboi_items",
    order = 13,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_cut,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 0 },

    config = {
        extra = {
            blind_cut = 10,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            yam_ease_blind_requirement(nil, -1 * math.ceil(G.GAME.blind.chips * card.ability.extra.blind_cut * 0.01))
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    if G.GAME.chips - G.GAME.blind.chips >= 0 then
                        G.STATE = G.STATES.NEW_ROUND
                        G.STATE_COMPLETE = false
                    end
                    return true
                end
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
--<3
YMA.TBOI_ITEMS {
    key = "yma_tboi_heart",
    set = "yma_tboi_items",
    order = 13,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ante,
                card.ability.extra.money,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 3, y = 0 },

    config = {
        extra = {
            money = 5,
            ante = 1,
        }
    },

    add_to_deck = function(self, card, from_debuff)
        ease_dollars(card.ability.extra.money, true)
        ease_ante(-card.ability.extra.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Skeleton Key
YMA.TBOI_ITEMS {
    key = "yma_tboi_skeleton_key",
    set = "yma_tboi_items",
    order = 14,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 4, y = 0 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local cardd = create_card('yma_keys',G.consumeables, nil, nil, nil, nil, nil, 'yma_tboi_skeleton_key')
                    cardd:set_edition({ negative = true })
                    cardd:add_to_deck()
                    G.consumeables:emplace(cardd)
                    return true
                end)
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
--A Dollar
YMA.TBOI_ITEMS {
    key = "yma_tboi_dollar",
    set = "yma_tboi_items",
    order = 15,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 5, y = 0 },

    config = {
        extra = {
            money = 50,
        }
    },

    add_to_deck = function(self, card, from_debuff)
        ease_dollars(card.ability.extra.money, true)
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Transcendence
YMA.TBOI_ITEMS {
    key = "yma_tboi_transcendence",
    set = "yma_tboi_items",
    order = 16,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 10, y = 1 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            local val = context.other_card:get_chip_bonus()
            local id = context.other_card:get_id()
            local is_numbered_card = rank and string.find(rank.key, "%d*%d?%d+") ~= nil
            if context.other_card and to_big(val) > to_big(0) and (to_big(id) > to_big(0)) then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                    }
                else
                    return {
                        h_chips = val
                    }
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
--Dinner
YMA.TBOI_ITEMS {
    key = "yma_tboi_dinner",
    set = "yma_tboi_items",
    order = 17,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ante,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },

    config = {
        extra = {
            ante = 1,
        }
    },

    add_to_deck = function(self, card, from_debuff)
        ease_ante(-card.ability.extra.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Breakfast
YMA.TBOI_ITEMS {
    key = "yma_tboi_breakfast",
    set = "yma_tboi_items",
    order = 18,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ante,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 1 },

    config = {
        extra = {
            ante = 1,
        }
    },

    add_to_deck = function(self, card, from_debuff)
        ease_ante(-card.ability.extra.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Wooden Spoon
YMA.TBOI_ITEMS {
    key = "yma_tboi_wooden_spoon",
    set = "yma_tboi_items",
    order = 19,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_wooden_spoon')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 1 },

    config = {
        extra = {
            odds = 4,
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.other_card.area == G.play then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_wooden_spoon' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card, 
                }
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
--The Belt
YMA.TBOI_ITEMS {
    key = "yma_tboi_belt",
    set = "yma_tboi_items",
    order = 20,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_belt')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 3, y = 1 },

    config = {
        extra = {
            odds = 4,
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.other_card.area == G.play then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_belt' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card, 
                }
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
--Wire Coat Hanger
YMA.TBOI_ITEMS {
    key = "yma_tboi_wire_coat_hanger",
    set = "yma_tboi_items",
    order = 21,
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
    soul_pos = { x = 4, y = 1 },

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
--Lucky Foot
YMA.TBOI_ITEMS {
    key = "yma_tboi_lucky_foot",
    set = "yma_tboi_items",
    order = 22,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.probability,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 2 },

    config = {
        extra = {
            probability = 1,
        }
    },

    calculate = function(self, card, context)
        if context.mod_probability and context.trigger_obj then
            return {
                numerator = context.numerator + card.ability.extra.probability,
                denominator = context.denominator
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
--Cupid's Arrow
YMA.TBOI_ITEMS {
    key = "yma_tboi_cupids_arrow",
    set = "yma_tboi_items",
    order = 23,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percent,
                card.ability.extra.cur_chips,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 2 },

    config = {
        extra = {
            percent = 75,
            cur_chips = 0
        }
    },

    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.tboi_items then
            card.ability.extra.cur_chips = math.floor((hand_chips/100)*card.ability.extra.percent)
        end
        if context.joker_main and card.ability.extra.cur_chips > 0 then
            return {
                chips = card.ability.extra.cur_chips
            }
        end
        if context.end_of_round and context.main_eval then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_reset'), colour = G.C.FILTER})
            card.ability.extra.cur_chips = 0
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Dr. Fetus
YMA.TBOI_ITEMS {
    key = "yma_tboi_dr_fetus",
    set = "yma_tboi_items",
    order = 24,
    quaility = 4,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_val,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 2 },

    config = {
        extra = {
            x_val = 0.1,
            effect_table = {
                ['chips'] = true,
                ['h_chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local amt = (temp_context.effects[temp_context.effect_type] * card.ability.extra.x_val) + 1
            temp_context.effects[temp_context.effect_type] = nil
            temp_context.effects['x_chips'] = amt
            if temp_context.effects['message'] then
                temp_context.effects['message'] = localize{type='variable',key='a_xchips',vars={amt}} --Potentally problomatic, Fixes visual junk with vanilla Jokers
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Magneto
YMA.TBOI_ITEMS {
    key = "yma_tboi_magneto",
    set = "yma_tboi_items",
    order = 25,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 3, y = 2 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.starting_shop and G.shop_booster then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                    juice_card:juice_up()
                    play_sound('tarot1')
                    for i = 1, #G.shop_booster.cards do
                        if #G.shop_booster.cards > 0 then
                            local booster = pseudorandom_element(G.shop_booster.cards, pseudoseed('yma_tboi_magneto'))
                            booster.ability.couponed = true
                            booster:set_cost() 
                            booster:juice_up()
                            for k, v in pairs(G.shop_booster.cards) do
                                if v == booster then
                                    v = nil
                                end
                            end
                        end
                    end
                    return true
                end)
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
--Charm of the Vampire
YMA.TBOI_ITEMS {
    key = "yma_tboi_charm_vampire",
    set = "yma_tboi_items",
    order = 26,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hand_mod,
                card.ability.extra.cur_hand,
                card.ability.extra.blind_req,
                card.ability.extra.cur_blind,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 4, y = 2 },

    config = {
        extra = {
            hand_mod = 2,
            cur_hand = 0,
            blind_req = 13,
            cur_blind = 0,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.cur_hand = card.ability.extra.cur_hand + 1
            if card.ability.extra.cur_hand >= card.ability.extra.hand_mod then
                ease_discard(1)
                card.ability.extra.cur_hand = 0
            end
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.cur_hand = 0
            card.ability.extra.cur_blind = card.ability.extra.cur_blind + 1
            if card.ability.extra.cur_blind >= card.ability.extra.blind_req then
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                ease_discard(1)
                card.ability.extra.cur_blind = 0
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
--The Battery
YMA.TBOI_ITEMS {
    key = "yma_tboi_battery",
    set = "yma_tboi_items",
    order = 27,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_belt')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 5, y = 2 },

    config = {
        extra = {
            odds = 2,
        }
    },

    calculate = function(self, card, context)
        if context.yma and context.yma.before_using_consumeable and not context.yma.consumeable.ability.yma_battery_first_used then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_battery' .. G.SEED, 1, card.ability.extra.odds) then
                context.yma.consumeable.ability.yma_keep_on_use = true
                context.yma.consumeable.ability.yma_battery_first_used = true
            end
        end
        if context.using_consumeable and context.consumeable.ability.yma_keep_on_use then
            SMODS.calculate_context({yma_battery = true, consumeable = context.consumeable})
        end
        if context.yma_battery then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                    context.consumeable.ability.yma_keep_on_use = nil
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
--Steam Sale
YMA.TBOI_ITEMS {
    key = "yma_tboi_steam_sale",
    set = "yma_tboi_items",
    order = 28,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.reduce,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 8, y = 2 },

    config = {
        extra = {
            reduce = 50,
        }
    },

    add_to_deck = function(self, card, from_debuff)
        G.GAME.yma_discount_percent = G.GAME.yma_discount_percent or 0
        G.GAME.yma_discount_percent = G.GAME.yma_discount_percent + card.ability.extra.reduce
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Sister Maggy
YMA.TBOI_ITEMS {
    key = "yma_tboi_sister_maggy",
    set = "yma_tboi_items",
    order = 29,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 9, y = 2 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.before then
            for i = 1, 2 do
                local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('yma_tboi_sister_maggy')),
                center = G.P_CENTERS.m_bonus}, nil, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                _card.ability.yma_rankless_like_stone = true
                _card.ability.yma_disposable = true
                _card.base.nominal = 0
                table.insert(context.scoring_hand, _card)
                G.play:emplace(_card)
                _card:highlight(true)
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
--Technology
YMA.TBOI_ITEMS {
    key = "yma_tboi_technology",
    set = "yma_tboi_items",
    order = 30,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_val,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 10, y = 2 },

    config = {
        extra = {
            x_val = 0.75,
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
            local amt = ((temp_context.effects[temp_context.effect_type] - 1) * card.ability.extra.x_val) + 1
            temp_context.effects[temp_context.effect_type] = 1
            temp_context.effects['x_mult'] = amt
            if temp_context.effects['message'] then
                temp_context.effects['message'] = localize{type='variable',key='a_xmult',vars={amt}} --Potentally problomatic, Fixes visual junk with vanilla Jokers
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
--Chocolate Milk
YMA.TBOI_ITEMS {
    key = "yma_tboi_chocolate_milk",
    set = "yma_tboi_items",
    order = 31,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_val,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 3 },

    config = {
        extra = {
            x_val = 0.05,
            amt = 0,
            effect_table = {
                ['chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            if temp_context.card.area == G.play then
                local key = temp_context.effect_type
                card.ability.extra.amt = card.ability.extra.amt + (temp_context.effects[key] * card.ability.extra.x_val)
            end
        end
        if context.joker_main then
            local amt = card.ability.extra.amt + 1
            card.ability.extra.amt = 0
            return {
                xchips = amt
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
--Growth Hormones
YMA.TBOI_ITEMS {
    key = "yma_tboi_growth_hormones",
    set = "yma_tboi_items",
    order = 32,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_growth_hormones')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.score,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 5, y = 1 },

    config = {
        extra = {
            odds = 6,
            score = 30,
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.other_card.area == G.play then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_growth_hormones' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card, 
                }
            end
        end
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
--Rosary
YMA.TBOI_ITEMS {
    key = "yma_tboi_rosary",
    set = "yma_tboi_items",
    order = 33,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.total_blinds,
                card.ability.extra.blinds,
                card.ability.extra.xchips,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 11, y = 1 },

    config = {
        extra = {
            total_blinds = 3,
            blinds = 3,
            xchips = 3,
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind and card.ability.extra.blinds > 0 then
            local nextlist = {
                Teeny = 'Small',
                Small = 'Big',
                Big = 'Boss',
                Boss = 'CEO'
            }
            G.GAME.cbean_jbill_arch_nope = true;
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    Colonparen.set_upcoming_blind(Colonparen.get_new_blind('Teeny'));
                    return true
                end
            }))
            card.ability.extra.blinds = card.ability.extra.blinds - 1
        end
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
--PHD
YMA.TBOI_ITEMS {
    key = "yma_tboi_phd",
    set = "yma_tboi_items",
    order = 34,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 11, y = 2 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.money_altered and to_big(context.amount) >= to_big(1) then
            SMODS.ease_dollars_calc = true
            ease_dollars(context.amount) 
            SMODS.ease_dollars_calc = false
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--X-Ray Vision
YMA.TBOI_ITEMS {
    key = "yma_tboi_x_ray_vision",
    set = "yma_tboi_items",
    order = 35,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 3 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        for k, v in pairs(G.I.CARD) do
            if (v.area == G.jokers or v.area == G.consumeables or v.area == G.hand or v.area == G.play) and v.facing and v.facing == 'back' then
                v:flip()
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--The Mark
YMA.TBOI_ITEMS {
    key = "yma_tboi_mark",
    set = "yma_tboi_items",
    order = 36,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_mark')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.score,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 11, y = 0 },

    config = {
        extra = {
            odds = 3,
            score = 20,
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
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function() 
                     if SMODS.pseudorandom_probability(card, 'yma_tboi_mark' .. G.SEED, 1, card.ability.extra.odds) then
                        ease_hands_played(1)
                     end
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
--Dead Cat
YMA.TBOI_ITEMS {
    key = "yma_tboi_dead_cat",
    set = "yma_tboi_items",
    order = 37,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.times,
                card.ability.extra.perma_blind_req + 1,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 3 },

    config = {
        extra = {
            times = 9,
            perma_blind_req = 2.5,
        }
    },

    calculate = function(self, card, context)
        if context.game_over then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    card.ability.extra.times = card.ability.extra.times - 1
                    if card.ability.extra.times <= 0 then
                        SMODS.destroy_cards(card, nil, nil, true)
                    end
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
    add_to_deck = function(self, card, from_debuff)
        G.GAME.yma_blind_req_increase = G.GAME.yma_blind_req_increase or 1
        G.GAME.yma_blind_req_increase = G.GAME.yma_blind_req_increase + card.ability.extra.perma_blind_req
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Loki's Horns
YMA.TBOI_ITEMS {
    key = "yma_tboi_lokis_horns",
    set = "yma_tboi_items",
    order = 38,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 3, y = 3 },

    config = {
        extra = {
            odds = 2,
            effect_table = {
                ['chips'] = true,
                ['h_chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local key = temp_context.effect_type
            local amt = temp_context.effects[key]
            if SMODS.pseudorandom_probability(card, 'yma_tboi_lokis_horns' .. G.SEED, 1, card.ability.extra.odds, nil, true) then
                card_eval_status_text(temp_context.card, 'extra', nil, nil, nil, {message = localize('k_again_ex')})
                SMODS.calculate_individual_effect(temp_context.effects, temp_context.card, key, amt, temp_context.from_edition)
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
--The Small Rock
YMA.TBOI_ITEMS {
    key = "yma_tboi_small_rock",
    set = "yma_tboi_items",
    order = 39,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_small_rock')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.xchips,
                card.ability.extra.score,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 4, y = 3 },

    config = {
        extra = {
            odds = 6,
            xchips = 2,
            score = 40,
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
                xchips = card.ability.extra.xchips
            }
        end
        if context.modify_scoring_hand then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_small_rock' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    remove_from_hand = true
                }
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
--Robo-Baby
YMA.TBOI_ITEMS {
    key = "yma_tboi_robo_baby",
    set = "yma_tboi_items",
    order = 40,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 5, y = 3 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.before then
            for i = 1, 2 do
                local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('yma_tboi_robo_baby')),
                center = G.P_CENTERS.m_mult}, nil, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                _card.ability.yma_rankless_like_stone = true
                _card.ability.yma_disposable = true
                _card.base.nominal = 0
                table.insert(context.scoring_hand, _card)
                G.play:emplace(_card)
                _card:highlight(true)
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
--The Halo
YMA.TBOI_ITEMS {
    key = "yma_tboi_halo",
    set = "yma_tboi_items",
    order = 41,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_halo')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.ante,
                card.ability.extra.xchips,
                card.ability.extra.score,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 6, y = 3 },

    config = {
        extra = {
            odds = 8,
            ante = 1,
            xchips = 1.5,
            score = 10,
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
                xchips = card.ability.extra.xchips
            }
        end
        if context.repetition and context.other_card and context.other_card.area == G.play then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_halo' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card, 
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        ease_ante(-card.ability.extra.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--The Parasite
YMA.TBOI_ITEMS {
    key = "yma_tboi_parasite",
    set = "yma_tboi_items",
    order = 42,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 3 },

    config = {
        extra = {
            effect_table = {
                ['chips'] = true,
                ['h_chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local key = temp_context.effect_type
            local amt = math.floor(temp_context.effects[key] / 2)
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
--Money = Power
YMA.TBOI_ITEMS {
    key = "yma_tboi_money_power",
    set = "yma_tboi_items",
    order = 43,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                math.max(0,to_big(G.GAME.dollars) * card.ability.extra.xmult) + 1
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 8, y = 3 },

    config = {
        extra = {
            xmult = 0.1,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            local total = math.max(0,to_big(G.GAME.dollars) * card.ability.extra.xmult) + 1
            return {
                xmult = total
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
--Mom's Knife
YMA.TBOI_ITEMS {
    key = "yma_tboi_moms_knife",
    set = "yma_tboi_items",
    order = 44,
    quaility = 4,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.val1,
                card.ability.extra.val2,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 9, y = 3 },

    config = {
        extra = {
            val1 = 3,
            val2 = 2,
            effect_table = {
                ['x_chips'] = true,
                ['xchips'] = true,
                ['Xchips'] = true,
                ['Xchip_mod'] = true,
                ['x_chip_mod'] = true
            },
            effect_table2 = {
                ['chips'] = true,
                ['h_chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local key = temp_context.effect_type
            temp_context.effects[key] = ((temp_context.effects[key] - 1) * card.ability.extra.val1) + 1
        end
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table2[temp_context.effect_type] then
            local key = temp_context.effect_type
            temp_context.effects[key] = math.floor(temp_context.effects[key] / 2)
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Dead Bird
YMA.TBOI_ITEMS {
    key = "yma_tboi_dead_bird",
    set = "yma_tboi_items",
    order = 45,
    quaility = 0,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 10, y = 3 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played ~= 0 then
            for i = 1, 2 do
                local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('yma_tboi_dead_bird')),
                center = G.P_CENTERS.c_base}, nil, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                _card.ability.yma_disposable = true
                table.insert(context.scoring_hand, _card)
                G.play:emplace(_card)
                _card:highlight(true)
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
--Brimstone
YMA.TBOI_ITEMS {
    key = "yma_tboi_brimstone",
    set = "yma_tboi_items",
    order = 46,
    quaility = 4,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_val,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 11, y = 3 },

    config = {
        extra = {
            x_val = 0.05,
            effect_table = {
                ['chips'] = true,
                ['h_chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local amt = (temp_context.effects[temp_context.effect_type] * card.ability.extra.x_val) + 1
            temp_context.effects[temp_context.effect_type] = nil
            temp_context.effects['x_mult'] = amt
            if temp_context.effects['message'] then
                temp_context.effects['message'] = localize{type='variable',key='a_xmult',vars={amt}} --Potentally problomatic, Fixes visual junk with vanilla Jokers
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
--Blood Bag
YMA.TBOI_ITEMS {
    key = "yma_tboi_blood_bag",
    set = "yma_tboi_items",
    order = 47,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ante,
                card.ability.extra.mult,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 4 },

    config = {
        extra = {
            ante = 1,
            mult = 10,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        ease_ante(-card.ability.extra.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Whore of Babylon
YMA.TBOI_ITEMS {
    key = "yma_tboi_whore_babylon",
    set = "yma_tboi_items",
    order = 48,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_halo')
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.xmult,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 4 },

    config = {
        extra = {
            odds = 2,
            xmult = 4,
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.other_card.area == G.play and G.GAME.current_round.hands_left == 0 then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_belt' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card, 
                }
            end
        end
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.xmult
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
--A Lump of Coal
YMA.TBOI_ITEMS {
    key = "yma_tboi_lump_coal",
    set = "yma_tboi_items",
    order = 49,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 2, y = 4 },

    config = {
        extra = {
             effect_table = {
                  ['chips'] = true,
                  ['h_chips'] = true,
                  ['chip_mod'] = true,
             }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            if temp_context.card.area == G.play then
                local index = 1
                for i = 1, #G.play.cards do
                    if G.play.cards[i] == temp_context.card then
                        index = i
                    end
                end
                local key = temp_context.effect_type
                temp_context.effects[key] = math.floor(temp_context.effects[key] * index)
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
--Technology 2
YMA.TBOI_ITEMS {
    key = "yma_tboi_technology_two",
    set = "yma_tboi_items",
    order = 50,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 3, y = 4 },

    config = {
        extra = {
            effect_table = {
                ['chips'] = true,
                ['h_chips'] = true,
                ['chip_mod'] = true,
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local amt = math.floor(temp_context.effects[temp_context.effect_type] / 2)
            temp_context.effects[temp_context.effect_type] = nil
            temp_context.effects['mult'] = amt
            if temp_context.effects['message'] then
                temp_context.effects['message'] = localize{type='variable',key='a_mult',vars={amt}} --Potentally problomatic, Fixes visual junk with vanilla Jokers
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
--Ankh
YMA.TBOI_ITEMS {
    key = "yma_tboi_ankh",
    set = "yma_tboi_items",
    order = 51,
    quaility = 0,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.total_blinds,
                card.ability.extra.blinds,
                card.ability.extra.perma_blind_req + 1,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 4, y = 4 },

    config = {
        extra = {
            total_blinds = 3,
            blinds = 3,
            perma_blind_req = 1,
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind and card.ability.extra.blinds > 0 then
            local nextlist = {
                Teeny = 'Small',
                Small = 'Big',
                Big = 'Boss',
                Boss = 'CEO'
            }
            G.GAME.cbean_jbill_arch_nope = true;
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    Colonparen.set_upcoming_blind(Colonparen.get_new_blind('Teeny'));
                    return true
                end
            }))
            card.ability.extra.blinds = card.ability.extra.blinds - 1
        end
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
--Sacred Heart
YMA.TBOI_ITEMS {
    key = "yma_tboi_sacred_heart",
    set = "yma_tboi_items",
    order = 52,
    quaility = 4,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ante,
                card.ability.extra.money,
                card.ability.extra.chips,
                card.ability.extra.xchips,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 5, y = 4 },

    config = {
        extra = {
            money = 5,
            ante = 1,
            chips = 50,
            xchips = 2
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
        if context.joker_main then
            return {
                chips = -card.ability.extra.chips,
                xchips = card.ability.extra.xchips
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        ease_dollars(card.ability.extra.money, true)
        ease_ante(-card.ability.extra.ante)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Magic 8 Ball
YMA.TBOI_ITEMS {
    key = "yma_tboi_magic_ball",
    set = "yma_tboi_items",
    order = 53,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 6, y = 4 },

    config = {
        extra = {
            
        }
    },

    add_to_deck = function(self, card, from_debuff)
        G.GAME.spectral_rate = G.GAME.spectral_rate + 4
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local cardd = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'for')
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                        G.GAME.consumeable_buffer = 0
                    return true
                end)}))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.spectral_rate = G.GAME.spectral_rate - 4
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Birthright
YMA.TBOI_ITEMS {
    key = "yma_tboi_birthright",
    set = "yma_tboi_items",
    order = 54,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 4 },

    config = {
        extra = {
            no_deck = false
        }
    },

    calculate = function(self, card, context)
        if (G.GAME.selected_back and G.GAME.selected_back.name == 'Magic Deck') then
            if context.starting_shop and #G.shop_booster.cards >= 1 then
                G.E_MANAGER:add_event(Event ({
                    trigger = 'before',
                    func = function()
                        YMA_reroll_card(G.shop_booster.cards[1], get_pack('yma_tboi_birthright', 'Arcana').key, "Booster", 'yma_tboi_birthright')
                        return true
                    end 
                }))
            end
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Nebula Deck') then
            if context.starting_shop and #G.shop_jokers.cards >= 1 and G.GAME.last_hand_played then
                G.E_MANAGER:add_event(Event ({
                    trigger = 'before',
                    func = function()
                        local _planet = 0
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet == 0 then _planet = nil end
                        YMA_reroll_card(G.shop_jokers.cards[#G.shop_jokers.cards], _planet, "Planet", 'yma_tboi_birthright')
                        return true
                    end 
                }))
            end
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Checkered Deck') then
            if context.setting_blind then
                for k, v in pairs(G.playing_cards) do
                    if v:is_suit("Clubs") then
                        v:change_suit("Spades")
                    elseif v:is_suit("Diamonds") then
                        v:change_suit("Hearts")
                    end
                end
            end
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Anaglyph Deck') then
            if context.setting_blind then
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_double'))
                        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                        return true
                   end)
                }))
            end
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Plasma Deck') then
            if context.yma and context.yma.before_after then
                return {
                    xchips = 2,
                    xmult = 2
                }
            end
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'b_cbean_nameteam_urine') then
            if context.individual and context.cardarea == G.play then
                if SMODS.has_enhancement(context.other_card, 'm_cbean_pboys_piss') then
                     return {
                         message = localize('k_again_ex'),
                         repetitions = 2,
                         card = card, 
                     }
                end
            end
        elseif card.ability.extra.no_deck then
            if context.joker_main then
                return {
                    xchips = 5
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if (G.GAME.selected_back and G.GAME.selected_back.name == 'Red Deck') then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards + 3
            ease_discard(3)
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Blue Deck') then
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Yellow Deck') then
            ease_dollars(60)
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Green Deck') then
            G.GAME.modifiers.money_per_discard = G.GAME.modifiers.money_per_discard or 0
            G.GAME.modifiers.money_per_discard = G.GAME.modifiers.money_per_discard + 3
            G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand or 1
            G.GAME.modifiers.money_per_hand = G.GAME.modifiers.money_per_hand + 3
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Black Deck') then
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Magic Deck') then
            local voucher_key = 'v_omen_globe'
			
			local new_card = create_card("Voucher", G.play, nil, nil, nil, nil, voucher_key, nil)
			new_card:start_materialize()
			new_card.cost = 0
			new_card.from_tag = true
			new_card:redeem()
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.2,
				func = (function()
					new_card:start_dissolve()                    
					return true
				end
            )}))
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Ghost Deck') then
            G.GAME.spectral_rate = G.GAME.spectral_rate + 4
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Abandoned Deck') then
            local ranks = {}
            for k, v in pairs(G.playing_cards) do
                ranks[v:get_id()] = ranks[v:get_id()] or 0
                ranks[v:get_id()] = ranks[v:get_id()] + 1
            end
            local least_vals = {}
            for i = 1, 3 do
                local least = 0
                local index = nil
                for k, v in pairs(ranks) do
                    if not index or v < index then
                        index = v
                        least = k
                    end
                end
                least_vals[#least_vals+1] = least
                ranks[least] = nil
            end
            local card_to_destroy = {}
            for k, v in pairs(G.playing_cards) do
                for _k, _v in pairs(least_vals) do
                    if v:get_id() == _v then
                        card_to_destroy[#card_to_destroy+1] = v
                    end
                end
            end
            SMODS.destroy_cards(card_to_destroy, nil, nil, true)
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Zodiac Deck') then
            G.GAME.spectral_rate = G.GAME.spectral_rate + G.GAME.joker_rate
            G.GAME.joker_rate = 0
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Painted Deck') then
            G.hand:change_size(6)
        elseif (G.GAME.selected_back and G.GAME.selected_back.name == 'Erratic Deck') then
            play_sound('tarot2')
            for k, v in pairs(G.playing_cards) do
                local cen_pool = {}
                for _k, _v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                    if _v.key ~= 'm_stone' then 
                        cen_pool[#cen_pool+1] = _v
                    end
                end
                center = pseudorandom_element(cen_pool, pseudoseed('yma_tboi_birthright'))
                    
                v:juice_up(0.3, 0.3)
                v:set_ability(center)
            end
        else
            card.ability.extra.no_deck = true
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Speed Ball
YMA.TBOI_ITEMS {
    key = "yma_tboi_speed_ball",
    set = "yma_tboi_items",
    order = 55,
    quaility = 2,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'yma_tboi_speed_ball')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 9, y = 4 },

    config = {
        extra = {
            odds = 4,
        }
    },

    calculate = function(self, card, context)
        if context.repetition and context.other_card and context.other_card.area == G.play then
            if SMODS.pseudorandom_probability(card, 'yma_tboi_belt' .. G.SEED, 1, card.ability.extra.odds) then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card, 
                }
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
--Ghost Baby
YMA.TBOI_ITEMS {
    key = "yma_tboi_ghost_baby",
    set = "yma_tboi_items",
    order = 56,
    quaility = 1,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 10, y = 4 },

    config = {
        extra = {
            
        }
    },

    calculate = function(self, card, context)
        if context.before then
            for i = 1, 2 do
                local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('yma_tboi_ghost_baby')),
                center = G.P_CENTERS.m_cbean_wgrop_coarse}, nil, nil, nil, {G.C.SECONDARY_SET.Enhanced})
                _card.ability.yma_rankless_like_stone = true
                _card.ability.yma_disposable = true
                _card.base.nominal = 0
                table.insert(context.scoring_hand, _card)
                G.play:emplace(_card)
                _card:highlight(true)
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