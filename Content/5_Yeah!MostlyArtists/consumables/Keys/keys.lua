--Alpha Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_alpha",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'other',
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then
            local vaild_jokers = {}
            for i = 1, #G.jokers.cards do
                local stickers = {}
                for key, value in pairs(G.jokers.cards[i].ability) do
                    if G.shared_stickers[key] and value == true then
                        stickers[#stickers+1] = key
                        vaild_jokers[i] = {joker = G.jokers.cards[i]}
                    end
                end
                if vaild_jokers[i] then 
                    vaild_jokers[i] = {joker = G.jokers.cards[i], stickers = stickers}
                end
            end
            if #vaild_jokers > 0 then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                local ran_selection = pseudorandom_element(vaild_jokers, pseudoseed('yma_alpha'))
                local sticker = pseudorandom_element(ran_selection.stickers, pseudoseed('yma_alpha'))
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        ran_selection.joker:juice_up(0.3, 0.5)
                        ran_selection.joker:remove_sticker(sticker)
                        return true
                    end)
                }))
                SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)

        -- Check vanilla stickers
        if G.GAME.modifiers.enable_eternals_in_shop or G.GAME.modifiers.enable_perishables_in_shop or G.GAME.modifiers.enable_rentals_in_shop then
            return true
        end

        -- Check non-vanilla stickers
        local fake_card = SMODS.Joker:create_fake_card()
        local fake_center = SMODS.Center:create_fake_card()
        fake_center.set = "Joker"
        for _, v in ipairs(SMODS.Sticker.obj_buffer) do
            local sticker = SMODS.Stickers[v]
            if sticker.should_apply and type(sticker.should_apply) == 'function' and sticker:should_apply(fake_card, fake_center, nil, true) then
                return true
            end
        end

        return false
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Angel Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_angel",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'packs',
        }
    },

    calculate = function(self, card, context)
        if context.open_booster then 
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('sdown_blessing',G.consumeables, nil, nil, nil, nil, nil, 'for')
                        if cardd.ability.extra.times_left == 5 then
                            cardd.ability.extra.times_left = cardd.ability.extra.times_left - 1 
                        end
                        cardd.ability.extra.times_left = cardd.ability.extra.times_left - 1 
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Animal Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_animal",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 2, y = 0 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local cardd = create_card('sdown_czodiac',G.consumeables, nil, nil, nil, nil, nil, 'yma_animal')
                    cardd:set_edition({ negative = true })
                    cardd:add_to_deck()
                    G.consumeables:emplace(cardd)
                    return true
                end)
            }))
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Anywhere Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_anywhere",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 3, y = 0 },

    config = {
        extra = {
            uses = 1,
            max_uses = 1,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Bitey Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_bitey",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
                card.ability.consumeable.extra.mult_mod,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 4, y = 0 },

    config = {
        extra = {
            uses = 8,
            max_uses = 8,
            mult_mod = 2,
            usage_type = 'cards',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            local enhanced_cards_amt = 0
            for k, v in ipairs(context.scoring_hand) do
                if v.config.center ~= G.P_CENTERS.c_base and not v.debuff and not v.vampired then 
                    enhanced_cards_amt = enhanced_cards_amt + 1
                end
            end
            if enhanced_cards_amt >= 1 then
                for k, v in ipairs(context.scoring_hand) do
                    if v.config.center ~= G.P_CENTERS.c_base and not v.debuff and not v.vampired then 
                        card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                        v.vampired = true
                        v:set_ability(G.P_CENTERS.c_base, nil, true)
                        v.ability.perma_mult = v.ability.perma_mult or 0
                        v.ability.perma_mult = v.ability.perma_mult + card.ability.extra.mult_mod
                        card_eval_status_text(v, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.MULT })
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                v.vampired = nil
                                return true
                            end
                        })) 
                        SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                        if card.ability.consumeable.extra.uses <= 0 then
                            SMODS.destroy_cards(card, nil, nil, true)
                            SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                        else
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)})
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Chain Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_chain",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 5, y = 0 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'other',
        },
        extra_slots_used = -1
    },

    calculate = function(self, card, context)
        if context.yma and context.yma.key_triggered and context.yma.key ~= card then
            local left_card = nil
            local right_card = nil
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'yma_keys' then
                    if v == card then
                        if G.consumeables.cards[k-1] and G.consumeables.cards[k-1].config.center.set == 'yma_keys' then
                            left_card = G.consumeables.cards[k-1]
                        end
                        if G.consumeables.cards[k+1] and G.consumeables.cards[k+1].config.center.set == 'yma_keys' then
                            right_card = G.consumeables.cards[k+1]
                        end
                    end
                end
            end
            if left_card and right_card then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                right_card.ability.consumeable.extra.uses = right_card.ability.consumeable.extra.uses + 1
                SMODS.calculate_effect({message = localize('k_cbean_pboys_aplus')..' 1 '..localize('k_yma_key_plus_use') }, right_card)
                SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.consumeables and #G.consumeables.cards > 0 then
            local keys = 0
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'yma_keys' then
                    keys = keys + 1
                end
            end
            if keys >= 2 then
                return true 
            end
        end
        return false
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Creation Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_creation",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 6, y = 0 },

    config = {
        extra = {
            uses = 4,
            max_uses = 4,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.starting_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            local booster_card = SMODS.add_booster_to_shop()
            booster_card.ability.couponed = true
            booster_card:set_cost()
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Demon Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_demon",

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.consumeable.extra.odds, 'yma_demon')
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
                numerator, denominator,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 7, y = 0 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            odds = 3,
            usage_type = 'hands',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            if #G.play.cards > 1 then 
                G.play:shuffle('yma_demon')
                play_sound('cardSlide1', 0.85)
                delay(0.15)
                G.play:shuffle('yma_demon')
                play_sound('cardSlide1', 1.15)
                delay(0.15)
                G.play:shuffle('yma_demon')
                play_sound('cardSlide1', 1)
                delay(0.5) 
                local leftmost_cards = {}
                for k, v in pairs(G.play.cards) do
                    if v == G.play.cards[1] or v == G.play.cards[2] then
                        leftmost_cards[#leftmost_cards+1] = v
                    end
                end
                for k, v in pairs(leftmost_cards) do
                    if SMODS.pseudorandom_probability(card, 'yma_demon', 1, card.ability.extra.odds) then
                        local edition = poll_edition('yma_demon'..G.GAME.round_resets.ante, nil, true, true)
                        v:set_edition(edition)
                    end
                end
            end
        end
        if context.after then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Echo Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_echo",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 0, y = 1 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'hands',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            local left_card = nil
            for k, v in pairs(G.consumeables.cards) do
                if v == card then
                    if G.consumeables.cards[k-1] and G.consumeables.cards[k-1].config.center.set == 'Tarot' then
                        left_card = G.consumeables.cards[k-1]
                    end
                end
            end
            if left_card then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                local used_consumeable = copy_card(left_card)
                local prev_state = G.STATE
                G.STATE = G.STATES.PLAY_TAROT
                G.CONTROLLER.locks.use = true
                draw_card(G.hand, G.play, 1, 'up', true, used_consumeable, nil, true)
                card:juice_up()
                local temp_hand = G.hand.highlighted
                G.hand.highlighted = context.scoring_hand
                used_consumeable:use_consumeable(used_consumeable.area)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.7,
                    func = function()
                        G.hand.highlighted = temp_hand
                        used_consumeable:start_dissolve()
                        card:juice_up()
                        G.STATE = prev_state
                        G.CONTROLLER.locks.use = false
                        return true
                    end
                }))
                SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.consumeables and #G.consumeables.cards > 0 then
            local tarots = 0
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'Tarot' then
                    tarots = tarots + 1
                end
            end
            if tarots >= 1 then
                return true 
            end
        end
        return false
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Enigma Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_enigma",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 1 },

    config = {
        extra = {
            uses = 1,
            max_uses = 1,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                SMODS.calculate_effect({message = "?/?" }, card)
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        local uses = pseudorandom_element({1,2,3}, pseudoseed('yma_enigma'))
        card.ability.consumeable.extra.uses = uses
        card.ability.consumeable.extra.max_uses = uses
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Gender Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_gender",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 2, y = 1 },

    config = {
        extra = {
            uses = 10,
            max_uses = 10,
            usage_type = 'cards',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            local face_cards_amt = 0
            for k, v in ipairs(context.scoring_hand) do
                if v:is_face() and not v.debuff then 
                    face_cards_amt = face_cards_amt + 1
                end
            end
            if face_cards_amt >= 1 then
                for k, v in ipairs(context.scoring_hand) do
                    if v:is_face() and not v.debuff then 
                        card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                        
                        if v:get_id() ~= 12 then
                            SMODS.modify_rank(v, 12-v:get_id())
                        else
                            local rank = pseudorandom_element({11, 13}, pseudoseed('yma_gender'))
                            SMODS.modify_rank(v, rank-v:get_id())
                        end

                        SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                        if card.ability.consumeable.extra.uses <= 0 then
                            SMODS.destroy_cards(card, nil, nil, true)
                            SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                        else
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)})
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Ghost Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_ghost",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 3, y = 1 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind then 
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    for i = 1, 2 do
                        local cardd = create_card('Joker',G.jokers, nil, nil, nil, nil, nil, 'yma_ghost')
                        cardd:set_edition({ negative = true })
                        cardd:add_to_deck()
                        cardd.ability = cardd.ability or {}
                        cardd.ability.yma_ghost_temporary = true
                        G.jokers:emplace(cardd)
                    end
                    return true
                end)
            }))
        end
        if context.ending_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            for k, v in pairs(G.jokers.cards) do
                if v.ability and v.ability.yma_ghost_temporary then
                    v.ability.yma_ghost_temporary = nil
                    SMODS.destroy_cards(v, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_faded') }, v)
                end
            end
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Giant Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_giant",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 4, y = 1 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            local pool = {}
            for k, v in pairs(G.P_CENTER_POOLS['Combo']) do
                if v.config.immutable.combo_type == "ultimate" or v.config.immutable.combo_type == "finisher" then
                    pool[#pool+1] = v.key
                end
            end
            local ran_combo = pseudorandom_element(pool, pseudoseed('yma_giant'))
            local cardd = create_card('Combo',G.consumeables, nil, nil, nil, nil, ran_combo, 'yma_giant')
            cardd:add_to_deck()
            G.consumeables:emplace(cardd)
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Harlequin Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_harlequin",

    loc_vars = function(self, info_queue, card)
        local target_joker = G.jokers and #G.jokers.cards >= 1 and G.jokers.cards[1]


        if target_joker then
            local other_vars = nil
            if target_joker.config.center.loc_vars then
                local ret = target_joker.config.center:loc_vars({}, target_joker)
                if ret then
                    other_vars = ret.vars
                end
            else
                other_vars, _, _ = target_joker:generate_UIBox_ability_table(true)
            end

            if other_vars then
                target_joker.config.center.specific_vars = other_vars
                target_joker.config.center.specific_vars.aij_elder = true
            end

            info_queue[#info_queue + 1] = target_joker.config.center
        end
        local compatible = target_joker and target_joker.config.center.blueprint_compat
        main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        return { 
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            },
            main_end = main_end 
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 5, y = 1 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        local target_joker = G.jokers and #G.jokers.cards >= 1 and G.jokers.cards[1]
        if context.end_of_round and not context.blueprint and context.main_eval and target_joker and target_joker.config.center.blueprint_compat then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
        if target_joker then
            return SMODS.blueprint_effect(card, target_joker, context)
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Head Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_head",

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.consumeable.extra.odds, 'yma_head')
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
                numerator, denominator,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 6, y = 1 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            odds = 3,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval and context.beat_boss then 
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                if SMODS.pseudorandom_probability(card, 'yma_head', 1, card.ability.extra.odds) then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            local cardd = create_card('yma_keys',G.consumeables, nil, nil, nil, nil, nil, 'yma_head')
                            cardd:add_to_deck()
                            G.consumeables:emplace(cardd)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                end
                SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Hercules Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_hercules",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 7, y = 1 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind then 
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    for i = 1, 2 do
                        local cardd = create_card('sdown_blessing',G.consumeables, nil, nil, nil, nil, nil, 'yma_hercules')
                        cardd:set_edition({ negative = true })
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                    end
                    return true
                end)
            }))
        end
        if context.end_of_round and not context.blueprint and context.main_eval then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'sdown_blessing' then
                    SMODS.destroy_cards(v, nil, nil, true)
                end
            end
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Identity Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_identity",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 0, y = 2 },

    config = {
        extra = {
            uses = 6,
            max_uses = 6,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind then 
            local pool = {}
            for k, v in pairs(G.P_CENTER_POOLS['Combo']) do
                if v.config.immutable.combo_type == "series" or v.config.immutable.combo_type == "special" then
                    pool[#pool+1] = v.key
                end
            end
            local ran_combo = pseudorandom_element(pool, pseudoseed('yma_giant'))
            YMA_reroll_card(card, ran_combo, 'Combo', 'yma_identity', card.config.center.key)
        end
        if context.yma and context.yma.after_reroll and context.yma.card == card then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Key to Hell
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_key_to_hell",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 2 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}

--Ankh Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_ankh",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 2 },

    config = {
        extra = {
            uses = 1,
            max_uses = 1,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "jamirror",
    }
}

--Matchstick Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_matchstick",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 2, y = 2 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.yma and context.yma.before_after then
            if (context.total_chips + G.GAME.chips >= (G.GAME.blind.chips)) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function() 
                        yma_add_tag(yma_poll_tag('yma_matchstick'))
                        return true 
                    end 
                }))
            end
        end
        if context.end_of_round and not context.blueprint and context.main_eval then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'sdown_blessing' then
                    SMODS.destroy_cards(v, nil, nil, true)
                end
            end
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Mending Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_mending",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 3, y = 2 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'other',
        }
    },

    calculate = function(self, card, context)
        if context.yma and context.yma.key_triggered and context.yma.key ~= card then
            local left_card = nil
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'yma_keys' then
                    if v == card then
                        if G.consumeables.cards[k-1] and G.consumeables.cards[k-1].config.center.set == 'yma_keys' then
                            left_card = G.consumeables.cards[k-1]
                        end
                    end
                end
            end
            if left_card then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                left_card.ability.consumeable.extra.uses = left_card.ability.consumeable.extra.uses + 1
                SMODS.calculate_effect({message = localize('k_cbean_pboys_aplus')..' 1 '..localize('k_yma_key_plus_use') }, left_card)
                SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        if G.consumeables and #G.consumeables.cards > 0 then
            local keys = 0
            for k, v in pairs(G.consumeables.cards) do
                if v.config.center.set == 'yma_keys' then
                    keys = keys + 1
                end
            end
            if keys >= 1 then
                return true 
            end
        end
        return false
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Mirror Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_mirror",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 4, y = 2 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'other',
        },
        extra_slots_used = -1
    },

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            YMA_reroll_card(G.consumeables.cards[#G.consumeables.cards], G.consumeables.cards[1].config.center.key, G.consumeables.cards[1].config.center.set)
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Moon Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_moon",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 5, y = 2 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return G.GAME and G.GAME.cbean and #G.GAME.cbean.destroyed_jokers > 0 
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Music Box Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_music_box",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 6, y = 2 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            if #G.jokers.cards > 1 then 
                G.jokers:shuffle('yma_music_box')
                play_sound('cardSlide1', 0.85)
                delay(0.15)
                G.jokers:shuffle('yma_music_box')
                play_sound('cardSlide1', 1.15)
                delay(0.15)
                G.jokers:shuffle('yma_music_box')
                play_sound('cardSlide1', 1)
                delay(0.5) 
            end
        end
        if context.repetition_only or (context.retrigger_joker_check) and #G.jokers.cards >= 1 then
            if context.other_card == G.jokers.cards[1] then
                return {
                    repetitions = 1,
                    card = context.other_card,
                    message = localize('k_again_ex')
                }  
            end
        end
        if context.end_of_round and not context.blueprint and context.main_eval and #G.jokers.cards >= 1 then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Omega Key (this one is a spectral)
SMODS.Consumable {
    set = "Spectral",
    key = "yma_omega",
    hidden = true,
    soul_set = "yma_keys",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 7, y = 2 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'hands',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local cardd = create_card('yma_keys',G.consumeables, nil, nil, nil, nil, nil, 'yma_omega')
                    cardd:set_edition({ negative = true })
                    cardd:add_to_deck()
                    G.consumeables:emplace(cardd)
                    return true
                end)
            }))
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Orchestra Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_orchestra",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 0, y = 3 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'hands',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    for i = 1, 2 do
                        local pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS['Combo']) do
                            if v.config.immutable.combo_type == "taunt" or v.config.immutable.combo_type == "starter" then
                                pool[#pool+1] = v.key
                            end
                        end
                        local ran_combo = pseudorandom_element(pool, pseudoseed('yma_giant'))
                        for k, v in pairs(pool) do
                            if v == ran_combo then
                                table.remove(pool, k)
                            end
                        end
                        
                        local cardd = SMODS.add_card{
                            key = ran_combo,
                            area = G.consumeables,
                            edition = "e_negative",
                            key_append = "yma_orchestra",
                            set = "Combo"
                        }
                        
                        --[[local cardd = create_card('Combo',G.consumeables, nil, nil, nil, nil, ran_combo, 'yma_orchestra')
                        cardd:set_edition({ negative = true })
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)]]
                    end
                    return true
                end)
            }))
            for k, v in pairs(G.consumeables.cards) do
                if v.config.immutable and v.config.immutable.combo_type and (v.config.immutable.combo_type == "taunt" or v.config.immutable.combo_type == "starter") then
                    SMODS.destroy_cards(v, nil, nil, true)
                end
            end
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Reali Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_reali",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 3 },

    config = {
        extra = {
            uses = 4,
            max_uses = 4,
            usage_type = 'shops',
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Shadow Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_shadow",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 2, y = 3 },

    config = {
        extra = {
            uses = 5,
            max_uses = 5,
            usage_type = 'other',
        }
    },

    calculate = function(self, card, context)
        if context.selling_card then
            if context.other_card and context.other_card.ability then
                context.other_card.ability.yma_sold_self = true
            end
        end
        if context.yma and context.yma.shadow_trigged and context.yma.decrease then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            context.yma.decrease = false
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Stamp Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_stamp",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 3, y = 3 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'cards',
        }
    },

    calculate = function(self, card, context)
        if context.before then
            local blue_seal_cards_amt = 0
            for k, v in ipairs(context.scoring_hand) do
                if v.seal == 'Blue' then 
                    blue_seal_cards_amt = blue_seal_cards_amt + 1
                end
            end
            if blue_seal_cards_amt >= 1 then
                for k, v in ipairs(context.scoring_hand) do
                    if v.seal == 'Blue' then 
                        card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                        v.ability.perma_repetitions = v.ability.perma_repetitions or 0
                        v.ability.perma_repetitions = v.ability.perma_repetitions + 1
                        card_eval_status_text(v, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.FILTER })
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:juice_up()
                                return true
                            end
                        })) 
                        SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                        if card.ability.consumeable.extra.uses <= 0 then
                            SMODS.destroy_cards(card, nil, nil, true)
                            SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                        else
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)})
                        end
                    end
                end
            end
        end
    end,

    in_pool = function(self, args)
        local seal_count = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal == 'Blue' then
                    seal_count = seal_count + 1
                end
            end
        end
        if seal_count > 0 then
            return true
        else
            return false
        end
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Sword Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_sword",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 4, y = 3 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            yam_ease_blind_requirement(nil, -1 * math.ceil(G.GAME.blind.chips * 50 * 0.01))
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
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)})
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Teddy Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_teddy",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
                card.ability.consumeable.extra.discards_and_hands,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 5, y = 3 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            discards_and_hands = 1,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            ease_hands_played(card.ability.consumeable.extra.discards_and_hands)
            ease_discard(card.ability.consumeable.extra.discards_and_hands)
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)})
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Tempus Fugit Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_tempus_fugit",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 6, y = 3 },

    config = {
        extra = {
            uses = 4,
            max_uses = 4,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            YMA_reroll_card(card, nil, 'Joker', 'yma_identity', card.config.center.key, nil, 'after')
        end
        if context.yma and context.yma.after_reroll and context.yma.card == card then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Thorn Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_thorn",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 7, y = 3 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
            usage_type = 'blinds',
        }
    },

    calculate = function(self, card, context)
        if context.mod_probability and context.trigger_obj and G.jokers.cards and context.trigger_obj == G.jokers.cards[1] then
            return {
                numerator = context.denominator,
                denominator = context.denominator
            }
        end
        if context.end_of_round and not context.blueprint and context.main_eval and #G.jokers.cards >= 1 then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1

            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Timeshift Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_timeshift",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 0, y = 4 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'other',
        }
    },

    calculate = function(self, card, context)
        if context.selling_card then
            if context.other_card and context.other_card.ability then
                context.other_card.ability.yma_sold_self = true
            end
        end
        if context.yma and context.yma.timeshift_trigged and context.yma.decrease then 
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
            context.yma.decrease = false
            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
            if card.ability.consumeable.extra.uses <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
            else
                return {
                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                }
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Undertree Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_undertree",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 4 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
            usage_type = 'packs',
        }
    },

    calculate = function(self, card, context)
        if context.open_booster then
            if context.card.ability.name:find('Arcana') then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.6*math.sqrt(G.SETTINGS.GAMESPEED),
                    func = (function()
                        local vaild_cards = {}
                        for k, v in pairs(G.pack_cards.cards) do
                            if yma_can_upgrade_consumable(v) then
                                vaild_cards[#vaild_cards+1] = v
                            end
                        end
                        if #vaild_cards >= 1 then
                            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                            local upgraded_tarot = pseudorandom_element(vaild_cards, pseudoseed('yma_undertree'))
                            yma_upgrade_consumable(upgraded_tarot)
                
                            SMODS.calculate_context({yma = {uses_left = card.ability.consumeable.extra.uses, max_uses = card.ability.consumeable.extra.max_uses, key = card, key_triggered = true}})
                            if card.ability.consumeable.extra.uses <= 0 then
                                SMODS.destroy_cards(card, nil, nil, true)
                                SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                            else
                                return {
                                    message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                                }
                            end
                        end
                        return true
                    end)
                }))
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}