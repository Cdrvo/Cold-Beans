SMODS.Joker({
    key = "nteam_self_insert",
    -- add atlas NOW
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 0, y = 0 },
    cbean_anim_states = {
        ["attract"] = {
            anim = {
                { xrange = { first = 0, last = 6 }, y = 4, t = 1 },
            },
            loop = true,
        },
    },
    config = {
        extra = {
            current_effect = "NONE",
            thunderedge = {
                xmult = 1,
                xmult_inc = 0.25,
            },
            revo = {
                xmult = 1,
                xmult_inc = 0.25,
            },
            dave = {
                xmult = 1.5,
            },
            ghost = {
                xmult = 1,
                xmult_inc = 0.1,
            },
            doggfly = {
                odds = 4,
                num = 1,
            },
            inky = {
                xchips = 1,
                xchips_inc = 0.4,
            },
            doctor = {
                xmult = 1,
                xmult_inc = 0.5,
            },
        },
    },
    set_ability = function(self, card, initial, delay_sprites)
        card:cbean_set_anim_state("attract")
        if card.ability.extra.current_effect ~= "NONE" then
            NAMETEAM.set_sprite_self_insert(card)
        end
    end,
    loc_vars = function(self, info_queue, card)
        local tbl = card.ability.extra[card.ability.extra.current_effect]
        if card.ability.extra.current_effect == "NONE" then
        elseif card.ability.extra.current_effect ~= "doggfly" then
            if card.ability.extra.current_effect == "ghost" then
                info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
            end
            local final_xmult = nil
            if card.ability.extra.current_effect == "revo" then
                final_xmult = tbl.xmult + (G.GAME.total_stickers_applied or 0) * tbl.xmult_inc
            end
            return {
                vars = {
                    tbl.xmult_inc or tbl.xchips_inc,
                    final_xmult or tbl.xmult or tbl.xchips,
                },
                key = self.key .. "_" .. card.ability.extra.current_effect,
            }
        else
            local plant_count = 0
            if G.jokers then
                for _, j in ipairs(G.jokers.cards) do
                    if j.config.center.pvz_plant then
                        plant_count = plant_count + 1
                    end
                end
            end
            local n, d = SMODS.get_probability_vars(card, tbl.num + plant_count, tbl.odds, "nteam_self_insert")
            return {
                vars = {
                    n,
                    d,
                },
                key = self.key .. "_" .. card.ability.extra.current_effect,
            }
        end
    end,
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    beans_credits = {
        team = "Name Team",
        idea = "Name Team",
        art = "Name Team",
        code = "ThunderEdge",
    },
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            card.ability.extra.current_effect = pseudorandom_element({
                "thunderedge",
                "revo",
                "dave",
                "ghost",
                "doggfly",
                "inky",
                "doctor",
            }, "nteam_self_insert")
            NAMETEAM.set_sprite_self_insert(card)
        end
    end,
    calculate = function(self, card, context)
        local tbl = card.ability.extra[card.ability.extra.current_effect]
        if context.starting_shop and card.ability.extra.current_effect == "doggfly" then
            local plant_count = 0
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.pvz_plant then
                    plant_count = plant_count + 1
                end
            end
            if
                SMODS.pseudorandom_probability(
                    card,
                    "nteam_self_insert",
                    tbl.num + plant_count,
                    tbl.odds,
                    "nteam_self_insert"
                )
            then
                local pool = {}
                for _, sticker in pairs(SMODS.Stickers) do
                    if sticker.sticker_type == "Positive" and sticker.sets and sticker.sets["Joker"] then
                        pool[#pool + 1] = sticker.key
                    end
                end
                local added = pseudorandom_element(pool, "nteam_doggfly")
                local target = pseudorandom_element(G.jokers.cards, "nteam_doggfly")
                if target then
                    target:add_sticker(added, true)
                end
            end
        end
        if context.ending_shop and card.ability.extra.current_effect == "dave" then
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                local pool = {}
                for _, center in pairs(G.P_CENTER_POOLS.Joker) do
                    if center.pvz_plant then
                        pool[#pool + 1] = center.key
                    end
                end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card({
                            key = pseudorandom_element(pool, "nteam_dave"),
                        })
                        G.GAME.joker_buffer = 0
                        return true
                    end,
                }))
            end
        end
        if context.using_consumeable then
            if
                not context.blueprint
                and card.ability.extra.current_effect == "doctor"
                and context.consumeable.config.center.set == "cbean_StickerSheet"
            then
                SMODS.scale_card(card, {
                    ref_table = tbl,
                    ref_value = "xmult",
                    scalar_value = "xmult_inc",
                })
            end
            if card.ability.extra.current_effect == "ghost" then
                if context.consumeable.config.center.set == "cbean_StickerSheet" then
                    SMODS.add_card({
                        set = "Tarot",
                        edition = "e_negative",
                    })
                elseif context.consumeable.config.center.set == "Tarot" and not context.blueprint then
                    SMODS.scale_card(card, {
                        ref_table = tbl,
                        ref_value = "xmult",
                        scalar_value = "xmult_inc",
                    })
                end
            end
        end
        if
            not context.blueprint
            and card.ability.extra.current_effect == "thunderedge"
            and (context.nteam_reroll_stationery or context.nteam_exchange_stationery)
        then
            SMODS.scale_card(card, {
                ref_table = tbl,
                ref_value = "xmult",
                scalar_value = "xmult_inc",
            })
        end
        if
            context.other_joker
            and context.other_joker.config.center.pvz_plant
            and card.ability.extra.current_effect == "dave"
        then
            return {
                xmult = tbl.xmult,
            }
        end
        if context.joker_main then
            local final_xmult = nil
            if card.ability.extra.current_effect == "revo" then
                final_xmult = tbl.xmult + (G.GAME.total_stickers_applied or 0) * tbl.xmult_inc
            end
            return {
                xmult = final_xmult or tbl.xmult,
                xchips = tbl.xchips,
            }
        end
        if
            context.before
            and not context.blueprint
            and #context.full_hand == 4
            and card.ability.extra.current_effect == "inky"
        then
            SMODS.scale_card(card, {
                ref_table = tbl,
                ref_value = "xchips",
                scalar_value = "xchips_inc",
            })
        end
        if context.end_of_round and not context.game_over and context.main_eval and not context.blueprint then
            local has_deck_sticker = false
            for key, item in pairs(G.GAME.selected_back.ability) do
                if SMODS.Stickers[key] then
                    has_deck_sticker = true
                    break
                end
            end
            if has_deck_sticker and card.ability.extra.current_effect == "doctor" then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({
                                set = "cbean_StickerSheet",
                            })
                            G.GAME.consumeable_buffer = 0
                            return true
                        end,
                    }))
                end
            end
            if context.beat_ceo then
                card.ability.extra.current_effect = pseudorandom_element({
                    "thunderedge",
                    "revo",
                    "dave",
                    "ghost",
                    "doggfly",
                    "inky",
                    "doctor",
                }, "nteam_self_insert")
                card:juice_up()
                NAMETEAM.set_sprite_self_insert(card)
                NAMETEAM.msg(card, (localize({ type = "name_text", key = card.config.center.key .. "_" .. card.ability.extra.current_effect, set = "Joker" }) .. "!"))
            end
        end
    end,
    update = function(self, card)
        if card.added_to_deck then
            if card.children and card.children.center.sprite_pos.x == 0 and card.children.center.sprite_pos.y == 0 then
                NAMETEAM.set_sprite_self_insert(card)
            end
        end
    end
})

function NAMETEAM.set_sprite_self_insert(card)
    if card.ability.extra.current_effect == "inky" then
        card.children.center:set_sprite_pos({ x = 0, y = 4 })
    elseif card.ability.extra.current_effect == "revo" then
        card.children.center:set_sprite_pos({ x = 1, y = 4 })
    elseif card.ability.extra.current_effect == "dave" then
        card.children.center:set_sprite_pos({ x = 2, y = 4 })
    elseif card.ability.extra.current_effect == "doggfly" then
        card.children.center:set_sprite_pos({ x = 3, y = 4 })
    elseif card.ability.extra.current_effect == "doctor" then
        card.children.center:set_sprite_pos({ x = 4, y = 4 })
    elseif card.ability.extra.current_effect == "ghost" then
        card.children.center:set_sprite_pos({ x = 5, y = 4 })
    elseif card.ability.extra.current_effect == "thunderedge" then
        card.children.center:set_sprite_pos({ x = 6, y = 4 })
    end
end

SMODS.Joker({
    key = "nameteam_topsyturvy",
    config = { extra = { three_given_chips = 20, two_given_chips = 40 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 0, y = 0 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.three_given_chips, card.ability.extra.two_given_chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 3 then
            return { chips = card.ability.extra.three_given_chips }
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 then
            return { chips = card.ability.extra.two_given_chips }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_bettercreditcard",
    config = { extra = { bankrupt_at = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bankrupt_at } }
    end,
    rarity = 3,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 1, y = 0 },
    draw = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.children.center:draw_shader("booster", nil, card.ARGS.send_to_shader)
        end
    end,
    cost = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
        if G.GAME.dollars < G.GAME.bankrupt_at then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(-G.GAME.bankrupt_at - G.GAME.dollars)
                    return true
                end,
            }))
        end
    end,
})

SMODS.Joker({
    key = "nameteam_hollyjollyjoker",
    config = { extra = { money = 2, type = "Pair" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, localize(card.ability.extra.type, "poker_hands") } }
    end,
    rarity = 2,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 2, y = 0 },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
            if next(context.poker_hands[card.ability.extra.type]) then
                return { dollars = card.ability.extra.money }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_stachenscarfen",
    rarity = 3,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 3, y = 0 },
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
})

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local staches = SMODS.find_card("j_cbean_nameteam_stachenscarfen")
    if next(staches) and not (forced_key and G.P_CENTERS[forced_key] and G.P_CENTERS[forced_key].rarity == 2) then
        legendary = nil
        _rarity = 0.71
        forced_key = nil
    end
    return create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end

local smods_create_card_ref = SMODS.create_card
function SMODS.create_card(t)
    local staches = SMODS.find_card("j_cbean_nameteam_stachenscarfen")
    if
        next(staches)
        and not (t and t.forced_key and G.P_CENTERS[t.forced_key] and G.P_CENTERS[t.forced_key].rarity == 2)
    then
        if not t then
            t = {}
        end
        t.legendary = nil
        t.rarity = 0.71
        t.forced_key = nil
    end
    return smods_create_card_ref(t)
end

SMODS.Joker({
    key = "nameteam_aldus",
    rarity = 3,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 9, y = 11 },
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
})

local main_menu_ref = Game.main_menu
Game.main_menu = function(change_context)
    local ret = main_menu_ref(change_context)

    for k, v in pairs(G.P_CENTERS) do
        if
            v.set == "Tarot"
            and v.config
            and ((v.config.mod_conv and v.config.mod_conv ~= "card") or v.config.suit_conv or v.config.cbean_banned_by_aldus)
            and not v.config.cbean_whitelisted_by_aldus
        then
            v.in_pool = v.in_pool or function()
                return true
            end

            local in_pool_ref = v.in_pool
            v.in_pool = function()
                return in_pool_ref() and not next(SMODS.find_card("j_cbean_nameteam_aldus"))
            end
        end
    end

    return ret
end

SMODS.Sound({
    key = "bwow",
    path = "6_NameTeam/cbean_bwow.ogg",
})

SMODS.Joker({
    key = "nameteam_manface",
    rarity = 1,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 4, y = 0 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = SMODS.Stickers["cbean_man"]
        return {}
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local candidates = {}
            for i = 1, #G.hand.cards do
                if not (G.hand.cards[i].ability and G.hand.cards[i].ability.cbean_man ~= nil) then
                    candidates[#candidates + 1] = G.hand.cards[i]
                end
            end
            if #candidates > 0 then
                local chosen_card = pseudorandom_element(candidates, pseudoseed("manface"))
                chosen_card:add_sticker("cbean_man", true)
                card:juice_up()
                play_sound("cbean_bwow", 1, 0.7)
                return { message = localize("cbean_man", "labels"), colour = G.C.FILTER }
            end
        end
    end,
    pronouns = "he_him",
})

SMODS.Joker({
    key = "nameteam_jimboss",
    rarity = 2,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 5, y = 0 },
    cost = 6,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_played == 2 and not context.blueprint then
            if G.GAME.blind and not G.GAME.blind.disabled and Colonparen.BossOrCEO() then
                return {
                    message = localize("ph_boss_disabled"),
                    func = function()
                        G.GAME.blind:disable()
                    end,
                }
            end
        end
    end,
    pronouns = "he_him",
})

SMODS.Joker({
    key = "nameteam_alecwatson",
    rarity = 2,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 6, y = 0 },
    cbean_anim = {
        { xrange = { first = 6, last = 8 }, y = 0, t = 0.1 },
        { x = 7,                            y = 0, t = 0.1 },
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",
    hpot_unbreedable = true,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if
            context.buying_card
            and context.card.ability.consumeable
            and count_consumables() < G.consumeables.config.card_limit
        then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            local _card = context.card
            return {
                extra = {
                    focus = card,
                    message = localize("k_copied_ex"),
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "before",
                            delay = 0.0,
                            func = function()
                                play_sound("timpani")
                                local new_card = SMODS.create_card({
                                    set = _card.config.center.set,
                                    area = G.consumeables,
                                    key = _card.config.center.key,
                                })
                                new_card:add_to_deck()
                                G.consumeables:emplace(new_card)
                                G.GAME.consumeable_buffer = 0
                                new_card:juice_up(0.3, 0.5)
                                return true
                            end,
                        }))
                    end,
                },
                colour = G.C.FILTER,
                card = card,
            }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_diamondshapewithadotinside",
    config = { extra = { mult = 7 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 0, y = 1 },
    cbean_anim = { { xrange = { first = 0, last = 3 }, y = 1, t = 0.1 } },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
            local valid = false
            for _, v in ipairs(context.scoring_hand) do
                if not v:is_suit("Diamonds") or SMODS.has_any_suit(v) then
                    valid = true
                    break
                end
            end

            if valid then
                return { mult = card.ability.extra.mult }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_giveway",
    config = { extra = { xmult = 2 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 4, y = 1 },
    pos_extra = { x = 5, y = 1 },
    draw_extra = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.cbean_extra:draw_shader("booster", nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.initial_scoring_step then
            return { xmult = 2 }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_ghostimage",
    config = { extra = { levels = 1 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 6, y = 1 },
    pos_extra = { x = 7, y = 1 },
    draw_extra = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.cbean_extra:draw_shader("negative_shine", nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.set == "Planet" then
            local valid_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(k) then
                    valid_hands[#valid_hands + 1] = k
                end
            end
            local chosen_hand = pseudorandom_element(valid_hands, pseudoseed("ghostimage"))

            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.smart_level_up_hand(card, chosen_hand, nil, card.ability.extra.levels)
                    return true
                end,
            }))
            return { message = localize("k_level_up_ex"), colour = G.C.FILTER }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_tipoftheiceberg",
    config = { extra = { counted_rerolls = 0, added_chips = 15, current_chips = 0 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 8, y = 1 },
    cbean_anim = {
        { xrange = { first = 8, last = 10 }, y = 1, t = 0.3 },
    },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.added_chips, card.ability.extra.current_chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_chips > 0 then
            return { chips = card.ability.extra.current_chips }
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.counted_rerolls = card.ability.extra.counted_rerolls + 1
        end
        if context.ending_shop and not context.blueprint then
            card.ability.extra.counted_rerolls = 0
        end

        if context.buying_card and not context.blueprint and card.ability.extra.counted_rerolls == 0 then
            card.ability.extra.current_chips = card.ability.extra.current_chips + card.ability.extra.added_chips
            return { message = localize("k_upgrade_ex"), colour = G.C.FILTER }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_bottomofthebarrel",
    config = { extra = { purchased_cards = 0, added_mult = 2, current_mult = 0 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 10, y = 3 },
    cbean_anim = {
        { xrange = { first = 10, last = 11 }, y = 3, t = 0.1 },
        { xrange = { first = 0, last = 7 },   y = 4, t = 0.1 },
    },
    pos_extra = { x = 8, y = 4 },
    cbean_anim_extra = {
        { x = 8,  y = 4, t = 0.075 },
        { x = 9,  y = 4, t = 0.125 },
        { x = 10, y = 4, t = 0.175 },
        { x = 11, y = 4, t = 0.3 },
        { x = 10, y = 4, t = 0.175 },
        { x = 9,  y = 4, t = 0.125 },
        { x = 8,  y = 4, t = 0.075 },
        { x = 0,  y = 5, t = 0.125 },
        { x = 1,  y = 5, t = 0.175 },
        { x = 2,  y = 5, t = 0.3 },
        { x = 1,  y = 5, t = 0.175 },
        { x = 0,  y = 5, t = 0.125 },
    },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.added_mult, card.ability.extra.current_mult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "Inky",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_mult > 0 then
            return { mult = card.ability.extra.current_mult }
        end

        if context.reroll_shop and not context.blueprint then
            card.ability.extra.purchased_cards = 0
        end
        if context.buying_card and not context.blueprint then
            card.ability.extra.purchased_cards = card.ability.extra.purchased_cards + 1
        end

        if context.ending_shop and not context.blueprint and card.ability.extra.purchased_cards > 0 then
            card.ability.extra.current_mult = card.ability.extra.current_mult
                + (card.ability.extra.added_mult * card.ability.extra.purchased_cards)
            card.ability.extra.purchased_cards = 0
            return { message = localize("k_upgrade_ex"), colour = G.C.FILTER }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_halfbodyjoker",
    config = { extra = { mult = 2 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 1, y = 2 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and not context.end_of_round and context.cardarea == G.hand then
            return { mult = card.ability.extra.mult }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_teenyweenyjoker",
    config = { extra = { added_mult = 2, current_mult = 0 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 2, y = 2 },
    display_size = { w = 0.75 * 71, h = 0.75 * 95 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.added_mult, card.ability.extra.current_mult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_mult > 0 then
            return { mult = card.ability.extra.current_mult }
        end

        if context.before and not context.blueprint then
            local valid = true
            for _, v in ipairs(G.play.cards) do
                if v:get_id() ~= 2 then
                    valid = false
                    break
                end
            end

            if valid then
                card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.added_mult
                return { message = localize("k_upgrade_ex"), colour = G.C.FILTER }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_presidenthathaway",
    config = { extra = { xmult = 2 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 3, y = 2 },
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if
            context.individual
            and context.cardarea == G.play
            and context.other_card:get_id() == 13
            and context.other_card:is_suit("Spades")
        then
            return { xmult = card.ability.extra.xmult }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff and not G.CONTROLLER.locks.selling_card then
            G.STATE = G.STATES.GAME_OVER
            if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
                G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
            end
            G:save_settings()
            G.FILE_HANDLER.force = true
            G.STATE_COMPLETE = false
            G.SETTINGS.paused = false
            return
        end
    end,
})

SMODS.Joker({
    key = "nameteam_collager",
    rarity = 2,
    atlas = "NAMETEAM_Jokers",
    pos = { x = 4, y = 2 },
    pos_extra = { x = 5, y = 2 },
    draw_extra = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.cbean_extra:draw_shader("booster", nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt/Inky",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and not card.getting_sliced then
            local destructable_tarot = {}
            for i = 1, #G.consumeables.cards do
                if
                    G.consumeables.cards[i].ability.set == "Tarot"
                    and not G.consumeables.cards[i].getting_sliced
                    and not G.consumeables.cards[i].ability.eternal
                then
                    destructable_tarot[#destructable_tarot + 1] = G.consumeables.cards[i]
                end
            end
            local tarot_to_destroy = #destructable_tarot > 0
                and pseudorandom_element(destructable_tarot, pseudoseed("candle"))
                or nil

            if tarot_to_destroy then
                tarot_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.8, 0.8)
                        tarot_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end,
                }))
                return {
                    extra = {
                        focus = card,
                        message = localize("k_plus_stickersheet"),
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                trigger = "before",
                                delay = 0.0,
                                func = function()
                                    play_sound("timpani")
                                    local new_card = create_card(
                                        "cbean_StickerSheet",
                                        G.consumables,
                                        nil,
                                        nil,
                                        nil,
                                        nil,
                                        nil,
                                        "collager"
                                    )
                                    new_card:add_to_deck()
                                    G.consumeables:emplace(new_card)
                                    G.GAME.consumeable_buffer = 0
                                    new_card:juice_up(0.3, 0.5)
                                    return true
                                end,
                            }))
                        end,
                    },
                    colour = G.C.FILTER,
                    card = card,
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_sticker_collection",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.add_mult,
                card.ability.extra.current_mult,
            },
        }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "NAMETEAM_Jokers",
    pos = {
        x = 11,
        y = 1,
    },
    config = {
        extra = {
            add_mult = 0.1,
            current_mult = 1,
        },
    },

    set_ability = function(self, card, initial, delay_sprites)
        if G.deck ~= nil then
            card.ability.extra.current_mult = NAMETEAM.get_amount_of_unique_stickers() * card.ability.extra.add_mult + 1
        end
    end,

    calculate = function(self, card, context)
        -- Recalculating stickers whenever anything happens
        -- Should probably like, add a context for "on adding a sticker" or something??? How does that even work
        if context.sticker_applied or context.sticker_removed then
            card.ability.extra.current_mult = NAMETEAM.get_amount_of_unique_stickers() * card.ability.extra.add_mult + 1
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = card.ability.extra.current_mult,
            }
        end
    end,

    beans_credit = {
        code = "TheAlternateDoctor",
        team = "Name Team",
        art = "TheAlternateDoctor",
    },
})

SMODS.Joker({
    key = "nameteam_stickerbomb",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.add_mult,
                card.ability.extra.current_mult,
            },
        }
    end,
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "NAMETEAM_Jokers",
    pos_extra = {
        x = 0,
        y = 2,
    },
    config = {
        extra = {
            add_mult = 2,
            current_mult = 0,
            current_back = "none",
        },
    },

    set_ability = function(self, card, initial, delay_sprites)
        if G.deck ~= nil then
            card.ability.extra.current_mult = NAMETEAM.get_amount_of_stickers() * card.ability.extra.add_mult
        end
        -- And removing it here as well
        card.ability.extra.current_back = G.GAME.cbean_nteam_stickerbomb_back
        G.GAME.cbean_nteam_stickerbomb_back = nil
    end,
    set_sprites = function(self, card, front)
        donor_joker = {}
        if not card.ability then
            -- First we cull the non Jokers off
            jokers = {}
            for k, v in pairs(G.P_CENTERS) do
                if string.find(k, "j_") == 1 then
                    jokers[#jokers + 1] = v
                end
            end
            idx = pseudorandom("stickerbomb", 1, #jokers)
            donor_joker = jokers[idx]
            -- Temporarily storing it here because ability is not yet initialized
            G.GAME.cbean_nteam_stickerbomb_back = donor_joker.key
        else
            donor_joker = G.P_CENTERS[card.ability.extra.current_back]
        end
        sendDebugMessage("Setting joker to ", "cbean_nteam_stickerbomb")
        sendDebugMessage(donor_joker.key, "cbean_nteam_stickerbomb")
        if donor_joker.atlas then
            sendDebugMessage(donor_joker.atlas, "cbean_nteam_stickerbomb")
            card.children.center.atlas = G.ASSET_ATLAS[donor_joker.atlas]
        else
            sendDebugMessage("Joker", "cbean_nteam_stickerbomb")
            card.children.center.atlas = G.ASSET_ATLAS["Joker"]
        end
        sendDebugMessage(inspect(donor_joker.pos), "cbean_nteam_stickerbomb")
        card.children.center:set_sprite_pos(donor_joker.pos)
    end,

    calculate = function(self, card, context)
        -- Recalculating stickers whenever anything happens
        -- Should probably like, add a context for "on adding a sticker" or something??? How does that even work
        if context.sticker_applied or context.sticker_removed then
            card.ability.extra.current_mult = NAMETEAM.get_amount_of_stickers() * card.ability.extra.add_mult
        end
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.current_mult,
            }
        end
    end,

    beans_credit = {
        code = "TheAlternateDoctor",
        team = "Name Team",
        art = "TheAlternateDoctor",
    },
})

SMODS.Joker({
    key = "nameteam_theworldshardestjoker",
    config = { extra = { counted = 0, target = 3 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 3, y = 5 },
    pos_extra = { x = 4, y = 5 },
    cbean_anim_extra = {
        { xrange = { first = 4, last = 11 }, y = 5,                            t = 0.025 },
        { xrange = { first = 0, last = 11 }, yrange = { first = 6, last = 7 }, t = 0.025 },
        { xrange = { first = 0, last = 2 },  y = 8,                            t = 0.025 },
        { xrange = { first = 1, last = 0 },  y = 8,                            t = 0.025 },
        { xrange = { first = 11, last = 0 }, yrange = { first = 7, last = 6 }, t = 0.025 },
        { xrange = { first = 11, last = 4 }, y = 5,                            t = 0.025 },
        { x = 3,                             y = 8,                            t = 0.025 },
    },
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
        return { vars = { card.ability.extra.target, card.ability.extra.target - card.ability.extra.counted } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.before and next(context.poker_hands["Straight Flush"]) then
            card.ability.extra.counted = card.ability.extra.counted + 1
            if card.ability.extra.counted >= card.ability.extra.target then
                card.ability.extra.counted = 0
                if count_consumables() < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    return {
                        extra = {
                            focus = card,
                            message = localize("k_plus_soul"),
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    trigger = "before",
                                    delay = 0.0,
                                    func = function()
                                        play_sound("timpani")
                                        local new_card = SMODS.create_card({
                                            set = "Spectral",
                                            area = G.consumeables,
                                            key = "c_soul",
                                        })
                                        new_card:add_to_deck()
                                        G.consumeables:emplace(new_card)
                                        G.GAME.consumeable_buffer = 0
                                        new_card:juice_up(0.3, 0.5)
                                        return true
                                    end,
                                }))
                            end,
                        },
                        colour = G.C.GREEN,
                        card = card,
                    }
                else
                    return { message = localize("k_no_room_ex"), colour = G.RED }
                end
            else
                return { message = card.ability.extra.counted .. "/" .. card.ability.extra.target, colour = G.FILTER }
            end
        elseif context.before and card.ability.extra.counted > 0 then
            card.ability.extra.counted = 0
            return { message = localize("k_reset"), colour = G.RED }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_coffeemug",
    config = { extra = { retriggers = 2, hands_left = 10 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 7, y = 2 },
    cbean_anim = {
        { xrange = { first = 7, last = 11 }, y = 2, t = 0.1 },
        { xrange = { first = 0, last = 2 },  y = 3, t = 0.1 },
    },
    pools = {
        Food = true,
    },
    pos_extra = { x = 3, y = 3 },
    cbean_anim_extra = {
        { x = 3, y = 3, t = 0.075 },
        { x = 4, y = 3, t = 0.125 },
        { x = 5, y = 3, t = 0.175 },
        { x = 6, y = 3, t = 0.3 },
        { x = 5, y = 3, t = 0.175 },
        { x = 4, y = 3, t = 0.125 },
        { x = 3, y = 3, t = 0.075 },
        { x = 7, y = 3, t = 0.125 },
        { x = 8, y = 3, t = 0.175 },
        { x = 9, y = 3, t = 0.3 },
        { x = 8, y = 3, t = 0.175 },
        { x = 7, y = 3, t = 0.125 },
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retriggers, card.ability.extra.hands_left } }
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "Inky",
        art = "Inky",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        local sticker_keys = {}
        for _, v in pairs(SMODS.Stickers) do
            sticker_keys[#sticker_keys + 1] = v.key
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card and context.other_card.ability then
                for k, vv in pairs(context.other_card.ability) do
                    if NAMETEAM.contains(sticker_keys, k) and vv then
                        return { repetitions = card.ability.extra.retriggers }
                    end
                end
            end
        end
        if context.after and not context.blueprint then
            if card.ability.extra.hands_left - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize("k_drank_ex"),
                    colour = G.C.FILTER,
                }
            else
                card.ability.extra.hands_left = card.ability.extra.hands_left - 1
                return {
                    message = card.ability.extra.hands_left .. "",
                    colour = G.C.FILTER,
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_poorphotography",
    config = { extra = { xmult = 2 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 4, y = 8 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if
            context.individual
            and not context.end_of_round
            and context.cardarea == G.hand
            and context.other_card:is_face()
        then
            local is_first_face = false
            for i = 1, #G.hand.cards do
                if G.hand.cards[i]:is_face() then
                    is_first_face = G.hand.cards[i] == context.other_card
                    break
                end
            end
            if is_first_face then
                return { xmult = card.ability.extra.xmult }
            end
        end
    end,
})

SMODS.Sound({
    key = "chicanery",
    path = "6_NameTeam/cbean_chicanery.ogg",
})

SMODS.Joker({
    key = "nameteam_chuckmcgill",
    config = { extra = { xmult = 3 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 5, y = 8 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                (
                    G.GAME
                    and G.GAME.current_round
                    and G.GAME.current_round.hands_played ~= 0
                    and G.GAME.last_hand_played
                )
                and localize(G.GAME.last_hand_played, "poker_hands")
                or localize("k_cbean_unknown"),
            },
        }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.joker_main then
            local is_valid = context.scoring_name ~= card.ability.extra.prev_hand
            card.ability.extra.prev_hand = context.scoring_name
            if is_valid then
                if not card.ability.extra.chicanery then
                    card.ability.extra.chicanery = true
                    play_sound("cbean_chicanery", 1, 0.7)
                end
                return { xmult = card.ability.extra.xmult }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_brodyfoxx",
    config = { extra = { mama_ix = 1, mamas = {}, money = 2 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 6, y = 8 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    add_to_deck = function(self, card, from_debuff)
        play_sound("cbean_yomama_intro", 1, 1)

        card.ability.extra.mama_ix = 1

        card.ability.extra.mamas = {}
        for i = 1, 100 do
            card.ability.extra.mamas[i] = string.format("%02d", i)
        end
        for i = #card.ability.extra.mamas, 2, -1 do
            local j = math.random(i)
            card.ability.extra.mamas[i], card.ability.extra.mamas[j] =
                card.ability.extra.mamas[j], card.ability.extra.mamas[i]
        end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if
                not card.ability.extra.mamas
                or #card.ability.extra.mamas <= 0
                or card.ability.extra.mama_ix >= #card.ability.extra.mamas
            then
                card.ability.extra.mama_ix = 1

                card.ability.extra.mamas = {}
                for i = 1, 100 do
                    card.ability.extra.mamas[i] = string.format("%02d", i)
                end

                for i = #card.ability.extra.mamas, 2, -1 do
                    local j = math.random(i)
                    card.ability.extra.mamas[i], card.ability.extra.mamas[j] =
                        card.ability.extra.mamas[j], card.ability.extra.mamas[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound(
                        "cbean_yomama-"
                        .. card.ability.extra.mamas[math.min(
                            math.max(math.floor(card.ability.extra.mama_ix), 1),
                            #card.ability.extra.mamas
                        )],
                        1,
                        1
                    )
                    card.ability.extra.mama_ix = card.ability.extra.mama_ix + 1
                    return true
                end,
            }))
            return { message = localize("k_cbean_yomama") }
        end

        if
            context.individual
            and not context.repetition
            and context.cardarea == G.play
            and context.other_card:get_id() == 13
        then
            return { dollars = card.ability.extra.money }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_theannouncement",
    config = { extra = { odds = 2 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 7, y = 8 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
        info_queue[#info_queue + 1] = G.P_CENTERS.c_moon
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "theannouncement")
        return { vars = { num, denom } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.setting_blind and not card.getting_sliced then
            if SMODS.pseudorandom_probability(card, "theannouncement", 1, card.ability.extra.odds) then
                local piss_card =
                    SMODS.create_card({ set = "Base", enhancement = "m_cbean_pboys_piss", area = G.discard })
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                piss_card.playing_card = G.playing_card
                table.insert(G.playing_cards, piss_card)

                G.E_MANAGER:add_event(Event({
                    func = function()
                        piss_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                        G.play:emplace(piss_card)
                        return true
                    end,
                }))
                return {
                    message = localize("k_plus_piss"),
                    colour = G.C.SECONDARY_SET.Enhanced,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end,
                        }))
                        draw_card(G.play, G.deck, 90, "up")
                        SMODS.calculate_context({ playing_card_added = true, cards = { piss_card } })
                    end,
                }
            else
                if count_consumables() < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local new_card = create_card(
                                "Tarot",
                                G.consumables,
                                nil,
                                nil,
                                nil,
                                nil,
                                "c_moon",
                                "theannouncementtarot"
                            )
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            G.GAME.consumeable_buffer = 0
                            new_card:juice_up(0.3, 0.5)
                            return true
                        end,
                    }))
                    return { message = "+1 Moon", colour = G.C.PURPLE }
                end
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_intheway",
    config = { extra = { retriggers = 1 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 9, y = 8 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retriggers } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if
                context.other_card == context.scoring_hand[1]
                and context.other_card == context.scoring_hand[#context.scoring_hand]
            then
                return { repetitions = card.ability.extra.retriggers * 2 }
            elseif
                context.other_card == context.scoring_hand[1]
                or context.other_card == context.scoring_hand[#context.scoring_hand]
            then
                return { repetitions = card.ability.extra.retriggers }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_riverstyx",
    config = { extra = { joker_slots = 2, target_sold = 13, current_sold = 0, slots_given = false } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 10, y = 8 },
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.joker_slots,
                card.ability.extra.target_sold,
                card.ability.extra.target_sold - card.ability.extra.current_sold,
                card.ability.extra.slots_given and localize("k_styx_active") or localize("k_styx_inactive"),
            },
        }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "any_all",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.selling_card
            and context.card.config.center.set == "Joker"
            and context.card ~= card
            and not card.ability.extra.slots_given
            and not context.blueprint
        then
            card.ability.extra.current_sold = card.ability.extra.current_sold + 1

            if card.ability.extra.current_sold >= card.ability.extra.target_sold then
                card.ability.extra.slots_given = true
                G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots

                return { message = localize("k_active_ex") }
            else
                return { message = card.ability.extra.current_sold .. "/" .. card.ability.extra.target_sold }
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.slots_given then
            G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots
        end
    end,
})

function last_supper_count_faces(rank)
    local cards = {}
    if G.playing_cards then
        for i = 1, #G.playing_cards do
            if not SMODS.has_no_rank(G.playing_cards[i]) and G.playing_cards[i]:is_face() then
                cards[#cards + 1] = G.playing_cards[i]
            end
        end
    end
    return #cards
end

SMODS.Joker({
    key = "nameteam_thelastsupper",
    config = { extra = { xmult = 3, faces = 12 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 11, y = 8 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.faces,
                last_supper_count_faces(),
                last_supper_count_faces() == card.ability.extra.faces and localize("k_styx_active")
                or localize("k_styx_inactive"),
            },
        }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.joker_main and last_supper_count_faces() == card.ability.extra.faces then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_pipelinepunch",
    config = { extra = { hands_left = 10, odds = 2 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 0, y = 9 },
    cbean_anim = {
        { xrange = { first = 0, last = 9 },   y = 9,  t = 0.1 },
        { x = 0,                              y = 9,  t = 0.1 },
        { xrange = { first = 10, last = 11 }, y = 9,  t = 0.1 },
        { xrange = { first = 0, last = 6 },   y = 10, t = 0.1 },
    },
    pos_extra = { x = 7, y = 10 },
    cbean_anim_extra = {
        { x = 7,  y = 10, t = 0.075 },
        { x = 8,  y = 10, t = 0.125 },
        { x = 9,  y = 10, t = 0.175 },
        { x = 10, y = 10, t = 0.3 },
        { x = 9,  y = 10, t = 0.175 },
        { x = 8,  y = 10, t = 0.125 },
        { x = 7,  y = 10, t = 0.075 },
        { x = 11, y = 10, t = 0.125 },
        { x = 0,  y = 11, t = 0.175 },
        { x = 1,  y = 11, t = 0.3 },
        { x = 0,  y = 11, t = 0.175 },
        { x = 11, y = 10, t = 0.125 },
    },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "pipelinepunch")
        return { vars = { card.ability.extra.hands_left, num, denom } }
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    pools = { ["Food"] = true },
    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, "pipelinepunch", 1, card.ability.extra.odds) then
            local _card = context.scoring_hand[1]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("tarot1")
                    card:juice_up()
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.15,
                func = function()
                    _card:flip()
                    play_sound("card1", 1)
                    _card:juice_up(0.3, 0.3)
                    delay(0.2)
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.1,
                func = function()
                    assert(SMODS.change_base(_card, nil, "Queen"))
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                delay = 0.1,
                func = function()
                    _card:flip()
                    play_sound("tarot2", 1)
                    _card:juice_up(0.3, 0.3)
                    return true
                end,
            }))
            delay(0.2)
        end

        if context.after and not context.blueprint then
            if card.ability.extra.hands_left - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize("k_drank_ex"),
                    colour = G.C.FILTER,
                }
            else
                card.ability.extra.hands_left = card.ability.extra.hands_left - 1
                return {
                    message = card.ability.extra.hands_left .. "",
                    colour = G.C.FILTER,
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_butterfly",
    config = { extra = { added_mult = 2, current_mult = 0 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 2, y = 11 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.added_mult, card.ability.extra.current_mult } }
    end,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pronouns = "she_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_mult > 0 then
            return { mult = card.ability.extra.current_mult }
        end

        if context.before and G.GAME.current_round.hands_played >= 2 and not context.blueprint then
            card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.added_mult
            return { message = localize("k_upgrade_ex"), colour = G.C.FILTER }
        end

        if context.selling_self and not context.blueprint and card.ability.extra.current_mult > 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("timpani")
                    local new_card = create_card(
                        "Joker",
                        G.jokers,
                        nil,
                        nil,
                        nil,
                        nil,
                        "j_cbean_nameteam_butterflywing",
                        "butterfly"
                    )
                    new_card:add_to_deck()
                    G.jokers:emplace(new_card)
                    new_card:juice_up(0.3, 0.5)
                    new_card.ability.extra.chips = card.ability.extra.current_mult * 8
                    return true
                end,
            }))
        end
    end,
})

SMODS.Joker({
    key = "nameteam_butterflywing",
    config = { extra = { chips = 0 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 3, y = 11 },
    cost = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.chips > 0 then
            return { chips = card.ability.extra.chips }
        end
    end,
    in_pool = function()
        return false
    end,
})

SMODS.Joker({
    key = "nameteam_goldenghost",
    config = { extra = { current_money = 1, added_money = 1 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 5, y = 11 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.current_money, card.ability.extra.added_money } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_left <= 0 and not context.blueprint then
            card.ability.extra.current_money = card.ability.extra.current_money + card.ability.extra.added_money
            return { message = localize("k_upgrade_ex"), colour = G.C.FILTER }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.current_money
    end,
})

function count_rares_minus_one()
    local count = 0
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v:is_rarity("Rare") then
                count = count + 1
            end
        end
    end

    return count - 1
end

SMODS.Joker({
    key = "nameteam_liam",
    config = { extra = { is_contestant = true, added_hand_size = 1, max_hand_size = 3, curr_hand_size = 0 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 6, y = 11 },
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.added_hand_size,
                card.ability.extra.added_hand_size
                * math.min(card.ability.extra.max_hand_size, math.max(card.ability.extra.curr_hand_size, 0)),
                card.ability.extra.max_hand_size,
            },
        }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.hand:change_size(-card.ability.extra.curr_hand_size)
        end
    end,
    update = function(self, card, dt)
        if card.added_to_deck then
            if card.debuff and card.ability.extra.curr_hand_size > 0 then
                G.hand:change_size(-card.ability.extra.curr_hand_size)
                card.ability.extra.curr_hand_size = 0
            end
            if
                math.min(count_rares_minus_one(), card.ability.extra.max_hand_size)
                ~= card.ability.extra.curr_hand_size
                and not card.debuff
            then
                local final_amt = math.min(count_rares_minus_one(), card.ability.extra.max_hand_size)
                G.hand:change_size(final_amt - card.ability.extra.curr_hand_size)
                card.ability.extra.curr_hand_size = final_amt
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_bryce",
    config = { extra = { is_contestant = true, xmult = 1.5 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 8, y = 4 },
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.individual
            and context.cardarea == G.hand
            and not context.end_of_round
            and context.other_card:get_id() == 11
        then
            if context.other_card.debuff then
                return {
                    message = localize("k_debuffed"),
                    colour = G.C.RED,
                }
            else
                return { xmult = card.ability.extra.xmult }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_crowbar",
    config = { extra = { hands_converted = 1, discards_converted = 1 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 7, y = 11 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards_converted, card.ability.extra.hands_converted } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.individual
            and not context.repetition
            and context.cardarea == G.play
            and context.other_card:get_id() == 14
            and G.GAME.current_round.discards_left >= card.ability.extra.discards_converted
        then
            ease_hands_played(card.ability.extra.hands_converted)
            ease_discard(-card.ability.extra.discards_converted)
            return { message = localize("k_converted") }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_littlegarnet",
    config = { extra = { normal_money = 2, bonus_money = 4 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 8, y = 11 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.normal_money, card.ability.extra.bonus_money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.individual
            and not context.repetition
            and context.cardarea == G.play
            and context.other_card:get_id() == 2
        then
            if context.other_card:is_suit("Hearts") then
                return { dollars = card.ability.extra.bonus_money }
            else
                return { dollars = card.ability.extra.normal_money }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_wayne",
    config = { extra = { saved = false, antes = -1 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 0, y = 3 },
    cbean_anim_states = {
        ["normal"] = {
            anim = {
                { x = 0, y = 3, t = 1 },
            },
            loop = false,
        },
        ["dead"] = {
            anim = {
                { x = 10, y = 3, t = 1 },
            },
            loop = false,
        },
        ["happening"] = {
            anim = {
                { x = 1,                             y = 3, t = 0.5 + (0.94 / 2) / 4 },
                { x = 2,                             y = 3, t = 0.5 + (0.94 / 2) / 4 },
                { xrange = { first = 3, last = 10 }, y = 3, t = (0.94 / 2) / 9 },
            },
            loop = false,
        },
    },
    cbean_anim_current_state = "normal",
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_biome_nameteam_afterlife", set = "Other" }
        return { vars = { card.ability.extra.antes * -1 } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "TheAltDoc",
        art = "TheAltDoc",
        code = "TheAltDoc",
    },
    add_to_deck = function(self, card, from_debuff)
        card:cbean_set_anim_state("normal")
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card:cbean_set_anim_state("normal")
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            card.ability.extra.saved = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("cbean_wayne_death", 1, 1)
                    card:cbean_set_anim_state("happening")
                    card:juice_up()
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                timer = "REAL",
                delay = 1.5,
                func = function()
                    card:juice_up()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound("tarot1")
                    return true
                end,
            }))
            G.FUNCS.switch_biome("nameteam_afterlife")
            return { saved = "ph_cbean_nameteam_wayne" }
        end
        if (context.starting_shop or context.blind_select) and card.ability.extra.saved then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_ante(card.ability.extra.antes)
                    card:cbean_set_anim_state("dead")
                    card:start_dissolve()
                    return true
                end,
            }))
        end
    end,
})

SMODS.Joker({
    key = "nameteam_adapaige",
    config = { extra = { chance = 1, max_chance = 3 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 4, y = 11 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal * card.ability.extra.chance, card.ability.extra.max_chance } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "TheAltDoc",
        art = "TheAltDoc",
        code = "TheAltDoc",
    },
    calculate = function(self, card, context)
        if context.press_play then
            local has_rebuffs = false
            for k, v in pairs(G.hand.cards) do
                if v.debuff then
                    local will_rebuff = pseudorandom(pseudoseed("nteam_adapaige"), 1, 100)
                        < (
                            (G.GAME.probabilities.normal * card.ability.extra.chance) / card.ability.extra.max_chance
                        )
                        * 100
                    if will_rebuff then
                        v:set_debuff(false)
                        has_rebuffs = true
                    end
                end
            end
            if has_rebuffs then
                return {
                    sound = "cbean_adapaige_heal",
                    message = localize("k_cbean_adapaige_heal"),
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_edega",
    config = { extra = { chance = 1, max_chance = 4, mult = 2, current_mult = 0 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 10, y = 11 },
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal * card.ability.extra.chance,
                card.ability.extra.max_chance,
                card.ability.extra.mult,
                card.ability.extra.current_mult,
            },
        }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "TheAltDoc",
        art = "TheAltDoc",
        code = "TheAltDoc",
    },
    calculate = function(self, card, context)
        if context.press_play then
            for k, v in pairs(G.hand.cards) do
                if not v.debuff then
                    local will_rebuff = pseudorandom(pseudoseed("nteam_edega"), 1, 100)
                        < (
                            (G.GAME.probabilities.normal * card.ability.extra.chance) / card.ability.extra.max_chance
                        )
                        * 100
                    if will_rebuff then
                        v:set_debuff(true)
                        card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult
                    end
                end
            end
            if card.ability.extra.current_mult > 0 then
                return {
                    sound = "cbean_edega_debuff",
                    message = localize("k_cbean_edega_debuff"),
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.current_mult,
            }
        end
        if context.end_of_round and context.main_eval then
            card.ability.extra.current_mult = 0
            return {
                message = localize("k_reset"),
            }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_ian",
    config = { extra = { upgrade = 30, losing = 1 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers2",
    pos = { x = 11, y = 11 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.upgrade, card.ability.extra.losing } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "TheAltDoc",
        art = "TheAltDoc",
        code = "TheAltDoc",
    },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if card.ability.extra.upgrade > 0 then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus
                    + card.ability.extra.upgrade
                card.ability.extra.upgrade = card.ability.extra.upgrade - card.ability.extra.losing
                local disappear_func = nil
                return {
                    extra = { message = localize("k_upgrade_ex"), colour = G.C.CHIPS },
                    colour = G.C.CHIPS,
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.upgrade <= 0 then
                return {
                    message = localize("k_cbean_ian_exhausted"),
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.debuff_card(card, true, "cbean_nameteam_ian")
                                return true
                            end,
                        }))
                    end,
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_charles",
    config = { extra = { money = 20 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 0, y = 0 },
    cbean_anim_states = {
        ["normal"] = {
            anim = {
                { x = 0, y = 0, t = 1 },
            },
            loop = false,
        },
        ["happening"] = {
            anim = {
                { x = 1,                             y = 0, t = 1.8 + (0.94 / 2) },
                { xrange = { first = 2, last = 11 }, y = 0, t = (0.94 / 2) / 18 },
                { xrange = { first = 0, last = 7 },  y = 1, t = (0.94 / 2) / 18 },
            },
            loop = false,
        },
    },
    cbean_anim_current_state = "normal",
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    add_to_deck = function(self, card, from_debuff)
        card:cbean_set_anim_state("normal")
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card:cbean_set_anim_state("normal")
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("cbean_greatest_plan", 1, 1)
                    card:cbean_set_anim_state("happening")
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                timer = "REAL",
                delay = 2.74,
                func = function()
                    local me = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            me = i
                        end
                    end

                    if me and me >= 1 and me <= #G.jokers.cards then
                        local marked = G.jokers.cards[me - 1]
                            and G.jokers.cards[me + 1]
                            and (pseudorandom("nameteam_charles", 1, 2) == 1 and G.jokers.cards[me - 1] or G.jokers.cards[me + 1])
                            or G.jokers.cards[me - 1]
                            or G.jokers.cards[me + 1]

                        if marked then
                            marked:start_dissolve()
                        end
                    end

                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound("tarot1")
                    return true
                end,
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:cbean_set_anim_state("normal")
                    card:start_dissolve()
                    return true
                end,
            }))
            return { saved = "ph_cbean_nameteam_charles", dollars = card.ability.extra.money }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_intentionallyblank",
    config = { extra = { xmult = 1.3 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 8, y = 1 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.other_joker then
            local me = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    me = i
                end
            end

            if context.other_joker == G.jokers.cards[me - 1] or context.other_joker == G.jokers.cards[me + 1] then
                return { xmult = card.ability.extra.xmult }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_bountyhunter",
    config = { extra = { money = 13 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 9, y = 1 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if
                my_pos
                and G.jokers.cards[my_pos + 1]
                and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card)
                and not G.jokers.cards[my_pos + 1].getting_sliced
            then
                local sliced_card = G.jokers.cards[my_pos + 1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound("slice1", 0.96 + math.random() * 0.08)
                        return true
                    end,
                }))
                return { dollars = card.ability.extra.money }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_pawn",
    config = { extra = { current_rounds = 0, rounds_required = 5 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 10, y = 1 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_cbean_nameteam_queen
        return { vars = { card.ability.extra.current_rounds, card.ability.extra.rounds_required } }
    end,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    pronouns = "she_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1
            if card.ability.extra.current_rounds == card.ability.extra.rounds_required then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        card:flip()
                        play_sound("card1", 1)
                        card:juice_up(0.3, 0.3)
                        return true
                    end,
                }))
                delay(0.2)
                G.E_MANAGER:add_event(Event({
                    trigger = "before",
                    delay = 2,
                    func = function()
                        delay(1)
                        card:juice_up()
                        return true
                    end,
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.15,
                    func = function()
                        card:set_ability("j_cbean_nameteam_queen")
                        card:flip()
                        play_sound("tarot2", 1, 0.6)
                        return true
                    end,
                }))
                return { message = localize("k_cbean_promoted_ex") }
            else
                return {
                    message = (card.ability.extra.current_rounds < card.ability.extra.rounds_required)
                        and (card.ability.extra.current_rounds .. "/" .. card.ability.extra.rounds_required)
                        or localize("k_active_ex"),
                    colour = G.C.FILTER,
                }
            end
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.current_rounds = 0
    end,
})

SMODS.Joker({
    key = "nameteam_queen",
    config = { extra = { chips = 30, mult = 4, xmult = 1.5 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 11, y = 1 },
    cost = 10,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.individual
            and not context.repetition
            and context.cardarea == G.play
            and context.other_card:get_id() == 12
        then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult,
            }
        end
    end,
    in_pool = function()
        return false
    end,
})

SMODS.Joker({
    key = "nameteam_zirconiumpants",
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 1, y = 2 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return {}
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands["Two Pair"]) then
            local candidates = {}
            for _, v in ipairs(G.hand.cards) do
                if not next(SMODS.get_enhancements(v)) then
                    candidates[#candidates + 1] = v
                end
            end

            if next(candidates) then
                local _card = pseudorandom_element(candidates, pseudoseed("zirconiumpants"))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        _card:set_ability("m_steel")
                        _card:juice_up()
                        return true
                    end,
                }))
                return {
                    message = localize({ key = "m_steel", type = "name_text", set = "Enhanced" }),
                    colour = G.C.FILTER,
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_mappedout",
    config = { extra = { scaling = 0.5 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 2, y = 2 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.scaling,
                (G.GAME.current_round.amount_biomes_visited or 0) * card.ability.extra.scaling + 1,
            },
        }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "Inky",
        art = "GhostSalt",
        code = "TheAltDoc",
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = (G.GAME.current_round.amount_biomes_visited or 0) * card.ability.extra.scaling + 1,
            }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_beentheredonethat",
    config = { extra = { xmult = 3 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 3, y = 2 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                G.GAME.NAMETEAM.voucher_this_ante and localize("k_styx_active") or localize("k_styx_inactive"),
            },
        }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.NAMETEAM.voucher_this_ante then
            return { xmult = card.ability.extra.xmult }
        end

        if
            context.buying_card
            and context.card
            and context.card.config
            and context.card.config.center
            and context.card.config.center.set == "Voucher"
            and not context.blueprint
        then
            return { message = localize("k_active_ex") }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_miraclemachine",
    config = { extra = { money = 1 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 0, y = 2 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if
                (
                    context.other_card:get_id() <= 10
                    and context.other_card:get_id() >= 0
                    and context.other_card:get_id() % 2 == 1
                ) or (context.other_card:get_id() == 14)
            then
                return { dollars = card.ability.extra.money }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_greenmatador",
    config = { extra = { current_money = 0, added_money = 1 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 4, y = 2 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.current_money, card.ability.extra.added_money } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.end_of_round
            and context.cardarea == G.jokers
            and not (G.GAME.blind_on_deck ~= "CEO" and G.GAME.blind_on_deck ~= "Ceo")
            and not context.blueprint
        then
            if G.GAME.current_round.discards_left > 0 then
                card.ability.extra.current_money = card.ability.extra.current_money
                    + (card.ability.extra.added_money * G.GAME.current_round.discards_left)
                return { message = localize("k_upgrade_ex") }
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.current_money > 0 then
            return card.ability.extra.current_money
        end
    end,
})

SMODS.Joker({
    key = "nameteam_bluematador",
    config = { extra = { current_money = 0, added_money = 1 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 5, y = 2 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.current_money, card.ability.extra.added_money } }
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "she_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if
            context.end_of_round
            and context.cardarea == G.jokers
            and not (G.GAME.blind_on_deck ~= "CEO" and G.GAME.blind_on_deck ~= "Ceo")
            and not context.blueprint
        then
            if G.GAME.current_round.hands_left > 0 then
                card.ability.extra.current_money = card.ability.extra.current_money
                    + (card.ability.extra.added_money * G.GAME.current_round.hands_left)
                return { message = localize("k_upgrade_ex") }
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.current_money > 0 then
            return card.ability.extra.current_money
        end
    end,
})

SMODS.Joker({
    key = "nameteam_splashman",
    config = { extra = { xmult = 1.1 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 6, y = 2 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.modify_scoring_hand and not context.blueprint then
            return { add_to_hand = true }
        end

        if context.individual and not context.repetition and context.cardarea == G.play then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_bozobrain",
    config = { extra = { money = 2 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 7, y = 2 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.before and to_number(G.GAME.hands[context.scoring_name].level) == 1 then
            return { dollars = card.ability.extra.money }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_walledin",
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 8, y = 2 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return {}
    end,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
})

SMODS.Booster:take_ownership_by_kind("Standard", {
    create_card = function(self, card, i)
        local _edition = poll_edition("standard_edition" .. G.GAME.round_resets.ante, 2, true)
        local _seal = SMODS.poll_seal({ mod = 10 })
        return {
            set = (next(SMODS.find_card("j_cbean_nameteam_walledin")) or pseudorandom(
                pseudoseed("stdset" .. G.GAME.round_resets.ante)
            ) > 0.6) and "Enhanced" or "Base",
            enhancement = next(SMODS.find_card("j_cbean_nameteam_walledin")) and "m_stone" or nil,
            edition = _edition,
            seal = _seal,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "sta",
        }
    end,
})

SMODS.Joker({
    key = "nameteam_trafficlight",
    config = { extra = { xmult = 2 } },
    rarity = 3,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 9, y = 2 },
    cbean_anim_states = {
        ["go"] = { anim = { { x = 9, y = 2, t = 15 } }, loop = false, continuation = "prepare" },
        ["prepare"] = { anim = { { x = 10, y = 2, t = 3 } }, loop = false, continuation = "stop" },
        ["stop"] = { anim = { { x = 11, y = 2, t = 15 } }, loop = false, continuation = "almost" },
        ["almost"] = { anim = { { x = 11, y = 3, t = 3 } }, loop = false, continuation = "go" },
    },
    cbean_anim_current_state = "go",
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.press_play and not context.blueprint then
            card.ability.extra.active = card.config.center.cbean_anim_current_state == "go"
                or card.config.center.cbean_anim_current_state == "prepare"
        end

        if context.joker_main and card.ability.extra.active then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_cacklejack",
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 7, y = 4 },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            local me = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    me = i
                end
            end

            if me and me >= 1 and me <= #G.jokers.cards then
                local candidates = {}
                for _, v in ipairs(G.jokers.cards) do
                    if
                        v
                        and v ~= G.jokers.cards[me - 1]
                        and not (v.config and v.config.center and v.config.center.key == "j_cbean_nameteam_cacklejack")
                    then
                        candidates[#candidates + 1] = v
                    end
                end

                if next(candidates) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up()
                            local _card = pseudorandom_element(candidates, "cacklejack")
                            play_sound("cbean_flashcardreroll", 1, 0.2)
                            NAMETEAM.replacecards(_card)
                            return true
                        end,
                    }))
                    return { message = localize("k_cbean_replaced_ex"), colour = G.C.GREEN }
                end
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_absoluteschnozz",
    config = { extra = { retriggers = 2 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 0, y = 5 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retriggers } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if
                context.other_card == context.scoring_hand[math.floor((#context.scoring_hand + 1) / 2)]
                or context.other_card == context.scoring_hand[math.ceil((#context.scoring_hand + 1) / 2)]
            then
                return { repetitions = card.ability.extra.retriggers }
            end
        end
    end,
})

SMODS.Joker({
    key = "nameteam_face",
    config = { extra = { xmult = 1.2 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 1, y = 5 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and not context.repetition and context.cardarea == G.play and context.other_card:is_face() then
            return { xmult = card.ability.extra.xmult }
        end
    end,
})

SMODS.Joker({
    key = "nameteam_markiplier",
    config = { extra = { added_xmult = 0.1, current_xmult = 1 } },
    rarity = 2,
    atlas = "NAMETEAM_Markiplier",
    pos = { x = 0, y = 0 },
    cbean_anim_states = {
        ["sob"] = {
            anim = {
                { xrange = { first = 0, last = 7 }, yrange = { first = 0, last = 6 }, t = 0.1 },
                { xrange = { first = 0, last = 5 }, y = 7,                            t = 0.1 }
            },
            loop = true
        },

        ["happy"] = {
            anim = { { x = 6, y = 7, t = 5 } },
            loop = false,
            continuation = "sob"
        },

        ["shocked"] = {
            anim = { { x = 7, y = 7, t = 2 } },
            loop = false,
            continuation = "sob"
        }
    },
    cbean_anim_current_state = "sob",
    cost = 7,
    loc_vars = function(self, info_queue, card)
        key = self.key .. "_" .. math.random(1, 8)
        return { key = key, vars = { card.ability.extra.added_xmult, card.ability.extra.current_xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    add_to_deck = function(self, card, from_debuff)
        play_sound("cbean_markiplier-0" .. math.random(7), 0.6 + (math.random() * 0.8), 1)
        card:cbean_set_anim_state("happy")
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_xmult > 1 then return { xmult = card.ability.extra.current_xmult } end

        if context.before and not context.blueprint then
            for _, v in ipairs(context.scoring_hand) do
                if v and not SMODS.has_no_rank(v) and (v:get_id() == 9 or v:get_id() == 8 or v:get_id() == 7) then
                    G.E_MANAGER:add_event(Event({
                        trigger = "before",
                        timer = "REAL",
                        delay = 1.9,
                        func = function()
                            card:cbean_set_anim_state("shocked")
                            play_sound("cbean_eightyseven", 0.9 + (math.random() * 0.1), 0.87)
                            return true
                        end
                    }))
                    card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.added_xmult
                    return { message = localize("k_upgrade_ex") }
                end
            end
        end
    end
})

SMODS.Joker({
    key = "nameteam_fashionismypassion",
    config = { extra = { chips = 50 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 4, y = 5 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and not context.repetition and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            return { chips = card.ability.extra.chips }
        end
    end
})

SMODS.Joker({
    key = "smoke_merchant",
    config = { extra = { xmult = 1, xmult_gain = 0.5 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 11, y = 4 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    beans_credits = {
        team = "Name Team",
        idea = "Inky",
        art = "Inky",
        code = "Revo",
    },

    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.money_altered and not context.blueprint and context.amount < 0 and G.shop then
            cae.xmult = 1
            NAMETEAM.msg(card, localize("k_reset"))
        end
        if context.ending_shop and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = cae,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
                scaling_message = {
                    colour = G.C.MULT,
                    message = localize("k_upgrade_ex"),
                },
            })
        end
        if context.joker_main then
            return {
                xmult = cae.xmult,
            }
        end
    end,
})

SMODS.Joker({
    key = "commit_farming",
    config = { extra = { chips = 5 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 10, y = 4 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips, (#G.GAME.NAMETEAM.unique_consumables or 0) * card.ability.extra.chips },
        }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    beans_credits = {
        team = "Name Team",
        idea = "Inky",
        art = "Inky",
        code = "Revo",
    },

    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.joker_main then
            return {
                chips = #G.GAME.NAMETEAM.unique_consumables * cae.chips,
            }
        end
    end,
})

SMODS.Joker({
    key = "nteam_mix_up",
    config = { extra = { max_hands = 2, hands = 1, hands_given = 0 } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 2, y = 5 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands, card.ability.extra.max_hands } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    beans_credits = {
        team = "Name Team",
        idea = "Inky",
        art = "Inky",
        code = "ThunderEdge",
    },

    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.joker_main and context.scoring_name ~= NAMETEAM.most_played() and cae.hands_given < 2 then
            ease_hands_played(cae.hands)
            if not context.blueprint then
                cae.hands_given = cae.hands_given + 1
            end
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            cae.hands_given = 0
        end
    end,
})

SMODS.Joker({
    key = "nteam_rick_astley",
    config = { extra = { xmult = 1, xmult_inc = 0.1, vid_played = false } },
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 3, y = 5 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        if not card.ability.extra.vid_played
            and not (ColdBeansConfig and ColdBeansConfig["copyright_disabled"])
        then
            info_queue[#info_queue + 1] = {
                set = "Other",
                key = "cbean_nteam_secret",
            }
        end
        return { vars = { card.ability.extra.xmult_inc, card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    beans_credits = {
        team = "Name Team",
        idea = "ThunderEdge",
        art = "ThunderEdge",
        code = "ThunderEdge",
    },

    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.joker_main then
            return {
                xmult = cae.xmult,
            }
        end
        if context.before and not context.blueprint then
            local ranks = {}
            local count = 0
            for _, c in ipairs(context.full_hand) do
                if not ranks[c:get_id()] then
                    count = count + 1
                    ranks[c:get_id()] = true
                end
            end
            if count >= 3 then
                SMODS.scale_card(card, {
                    ref_table = cae,
                    ref_value = "xmult",
                    scalar_value = "xmult_inc",
                })
            end
        end
    end,
})

local card_click_hook = Card.click
function Card:click()
    local ret = card_click_hook(self)
    if
        self.config.center.key == "j_cbean_nteam_rick_astley"
        and not self.ability.extra.vid_played
        and self.added_to_deck
        and not (ColdBeansConfig and ColdBeansConfig["copyright_disabled"])
    then
        NAMETEAM.start_secret_video()
        self.ability.extra.vid_played = true
    end
    return ret
end

SMODS.Joker({
    key = "nameteam_yjh",
    rarity = 2,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 5, y = 5 },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.setting_blind and G.jokers.config.card_limit > #G.jokers.cards and count_consumables() < G.consumeables.config.card_limit then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound("timpani")
                            return true
                        end
                    }))

                    local counter = 0
                    for i = 1, G.jokers.config.card_limit - #G.jokers.cards do
                        if count_consumables() < G.consumeables.config.card_limit then
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            counter = counter + 1

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local new_card = create_card("Tarot", G.consumables, nil, nil, nil, nil, nil, "nameteam_yjh")
                                    new_card:add_to_deck()
                                    G.consumeables:emplace(new_card)
                                    new_card:juice_up(0.3, 0.5)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                        end
                    end

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if counter == 1 then
                                card_eval_status_text(card, 'extra', nil, nil, nil,
                                    {
                                        message = localize { type = 'variable', key = 'a_tarot', vars = { counter } },
                                        colour = G.C.SECONDARY_SET.Tarot
                                    })
                            else
                                card_eval_status_text(card, 'extra', nil, nil, nil,
                                    {
                                        message = localize { type = 'variable', key = 'a_tarots', vars = { counter } },
                                        colour = G.C.SECONDARY_SET.Tarot
                                    })
                            end
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
    end
})























































-- I'd like these to be at the end of the file, for thematic reasons.

SMODS.Sound({
    key = "bye",
    path = "6_NameTeam/cbean_bye.ogg",
})

SMODS.Joker({
    key = "nameteam_wavegoodbye",
    config = { extra = { money = 8 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 9, y = 4 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.before and G.GAME.current_round.hands_left == 0 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("cbean_bye", 1, 1)
                    return true
                end,
            }))
            return { dollars = card.ability.extra.money }
        end
    end,
})

--[[SMODS.Joker({
	key = "redacted",
	atlas = "NAMETEAM_PlantJokers",
	pos = { x = 8, y = 5 },
	cost = 5,
	rarity = 2,
	blueprint_compat = false,
	config = {
		extra = {
            xmult = 1,
            xmult_gain = 0.2
        },
	},
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
        return{vars={cae.xmult, cae.xmult_gain,((#G.GAME.NAMETEAM.redacted_scale or 0)*cae.xmult_gain+cae.xmult) }}
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
	calculate = function(self, card, context)
		local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = 1 + (#G.GAME.NAMETEAM.redacted_scale*cae.xmult_gain)
            }
        end
	end,
})]]

SMODS.Joker({
    key = "nameteam_tokenofappreciation",
    config = { extra = { money = 5 } },
    rarity = 1,
    atlas = "NAMETEAM_Jokers3",
    pos = { x = 8, y = 8 },
    pixel_size = { h = 71 },
    --[[draw = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,]]-- -- nah this doesn't look nice
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.set == "Joker" and context.card ~= card and not card.getting_sliced then
            return { dollars = card.ability.extra.money }
        end
    end,
})
