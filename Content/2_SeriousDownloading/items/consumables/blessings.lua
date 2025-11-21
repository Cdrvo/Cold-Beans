
SMODS.ConsumableType {
    key = 'sdown_blessing',
    default = 'c_cbean_sdown_ares',
    primary_colour = HEX('E89A35'),
    secondary_colour = HEX('BA6900'),
    -- text_colour = HEX('F1C100'),
    collection_rows = { 6, 6 },
    shop_rate = 1,
    loc_txt = {
        name = "Blessing",
        collection = "Blessing",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase this card",
                "in an unseeded",
                "run to learn",
                "what it does"
            }
        }
    },
}

SMODS.Consumable {
    key = 'sdown_ares',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Ares',
        text = {
            "Retrigger all played",
            "{C:attention}numbered cards{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        extra = {
            times_left = 3,
            should_tick_down = false,
        }
    },
    pos = { x = 0, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "notmario",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and
            ((not context.other_card:is_face()) and context.other_card:get_id() ~= 14) then
            card.should_tick_down = true
            return {
                repetitions = 1
            }
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_athena',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Athena',
        text = {
            "Retrigger all played",
            "{C:attention}Aces{} and {C:attention}face cards{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        extra = {
            times_left = 3,
            should_tick_down = false,
        }
    },
    pos = { x = 1, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "notmario",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and
            (context.other_card:is_face() or context.other_card:get_id() == 14) then
            card.should_tick_down = true
            return {
                repetitions = 1
            }
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_aphrodite',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Aphrodite',
        text = {
            "Add permanent copies",
            "of scored cards to deck",
            "{C:inactive}({C:attention}#1#{C:inactive} cards left)",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        extra = {
            times_left = 5
        }
    },
    pos = { x = 2, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "Athebyne",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #context.scoring_hand do
                if card.ability.extra.times_left > 0 then
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local card_copied = copy_card(context.scoring_hand[i], nil, nil, G.playing_card)
                    card_copied:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, card_copied)
                    G.deck:emplace(card_copied)
                    card_copied.states.visible = nil
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card_copied:start_materialize()
                            return true
                        end
                    }))
                    card.ability.extra.times_left = card.ability.extra.times_left - 1
                    SMODS.calculate_effect({message = localize('k_copied_ex'),colour = G.C.CHIPS }, context.scoring_hand[i])
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                            return true
                        end
                    }))
                end
                if card.ability.extra.times_left <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
                    return
                else
                    SMODS.calculate_effect({message = (card.ability.extra.times_left).."/5" }, card)
                end
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_demeter',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Demeter',
        text = {
            "{C:green}#2# in #3#{} chance for each",
            "played {C:attention}#4#{} to create a",
            "consumable card when scored",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)",
        }
    },
    config = {
        extra = {
            times_left = 3,
            odds = 4,
            should_tick_down = false,
            rank = "MEOWWWW"
        }
    },
    pos = { x = 3, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "mys. minty",
    },
    set_ability = function (self, card, initial, delay_sprites)
        local cards = {}
        local rank = "Ace"
        for k, v in ipairs(G.playing_cards or {}) do
            if not SMODS.has_no_rank(v) then
                cards[#cards+1] = v
            end
        end
        if next(cards) then
            rank = pseudorandom_element(cards, "cbsd_demeter_init").base.value
        end
        card.ability.extra.rank = rank
    end,
    loc_vars = function(self, info_queue, card)
        local rank = localize(card.ability.extra.rank or "Ace", "ranks")
        if G.your_collection then
            for k, v in pairs(G.your_collection) do
                if card.area == v then
                    rank = localize('demeter_random_rank')
                    break
                end
            end
        end
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cbean_sdown_demeter')
        return { vars = { card.ability.extra.times_left, numerator, denominator, rank } }
    end,
    collection_loc_vars = function (self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cbean_sdown_demeter')
        return {
            vars = {
                card.ability.extra.times_left,
                numerator,
                denominator,
                localize('demeter_random_rank')
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == SMODS.Ranks[card.ability.extra.rank].id then
            card.ability.extra.should_tick_down = true
            if SMODS.pseudorandom_probability(card, "cbsd_demeter_chance", 1, card.ability.extra.odds) then
                card.ability.extra.success = true
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        SMODS.add_card({
                            set = "Consumeables",
                            area = G.consumeables,
                            key_append = "cbsd_demeter_card"
                        })
                        card:juice_up()
                        return true
                    end
                }))
            end
        end

        if context.after and card.ability.extra.should_tick_down then
            card.ability.extra.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if not card.ability.extra.success then
                SMODS.calculate_effect({message = (localize("k_nope_ex")) }, card)
            end
            card.ability.extra.success = nil
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
                return
            else
                SMODS.calculate_effect({message = (card.ability.extra.times_left).."/3" }, card)
            end
        end
    end,
    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_poseidon',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Poseidon',
        text = {
            "Played cards with {C:clubs}#3#{} suit",
            "permanently gain {C:red}+#2#{} Mult",
            "when scored",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        extra = {
            times_left = 3,
            should_tick_down = false,
            mult = 2,
            suit = 'Clubs'
        }
    },
    pos = { x = 0, y = 1 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "athebyne",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left, card.ability.extra.mult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if(context.other_card:is_suit(card.ability.extra.suit)) then
            card.should_tick_down = true
            context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.RED
                }
            end
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_hermes',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Hermes',
        text = {
            "Gain {C:money}$#2#{} per",
            "unused {C:blue}hand{}",
            "at end of round",
            "{C:inactive}({C:attention}#1#{C:inactive} rounds left)",
        }
    },
    config = {
        extra = {
            times_left = 2,
            should_tick_down = false,
            dollars = 3
        }
    },
    pos = { x = 1, y = 1 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "mys. minty",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left, card.ability.extra.dollars } }
    end,
    calc_dollar_bonus = function (self, card)
        local amt = card.ability.extra.dollars * G.GAME.current_round.hands_left
        if amt == 0 then return end --Disable this line if we want it to still tick down if you don't earn money
        card.ability.extra.times_left = card.ability.extra.times_left - 1
        G.E_MANAGER:add_event(Event({
            func = function ()
                if card.ability.extra.times_left <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
                else
                    SMODS.calculate_effect({message = (card.ability.extra.times_left).."/2" }, card)
                end
                return true
            end
        }))
        return amt
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_hades',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Hades',
        text = {
            "Destroy scored cards",
            "{C:inactive}({C:attention}#1#{C:inactive} cards left)",
            "{C:inactive}(Drag to rearrange)",
            " ",
            "{C:inactive,s:0.8}My hair is fire, your argument is invalid."
        }
    },
    config = {
        extra = {
            times_left = 5,
            should_tick_down = false,
        }
    },
    pos = { x = 2, y = 1 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "Athebyne",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,

    calculate = function(self, card, context)
        if context.after then
            for i = 1, #context.scoring_hand do
                if card.ability.extra.times_left > 0 then
                    SMODS.destroy_cards(context.scoring_hand[i])
                    card.ability.extra.times_left = card.ability.extra.times_left - 1
                end
                if card.ability.extra.times_left <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
                    return
                else
                    SMODS.calculate_effect({message = (card.ability.extra.times_left).."/5" }, card)
                end
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_helios',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Helios',
        text = {
            "{C:green}#2# in #3#{} chance for",
            "played cards with {C:hearts}#4#{} suit",
            "to give {X:mult,C:white} X#5# {} Mult when scored",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        extra = {
            times_left = 3,
            should_tick_down = false,
            odds = 2,
            Xmult = 1.5,
            suit = 'Hearts'
        }
    },
    pos = { x = 3, y = 1 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "kars",
        code = "athebyne",
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cbean_sdown_helios')
        return { vars = { card.ability.extra.times_left, numerator, denominator, localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.Xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if(context.other_card:is_suit(card.ability.extra.suit)) then
                card.should_tick_down = true
                if SMODS.pseudorandom_probability(card, 'helios', 1, card.ability.extra.odds) then
                    card:juice_up()
                    return {
                        xmult = card.ability.extra.Xmult
                    }
                end
            end
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

--I'll do this one later, calculating how many suits are in a hand seems non-trivial actually
SMODS.Consumable {
    key = 'sdown_dionysus',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Dionysus',
        text = {
            "If {C:attention}poker hand{} contains",
            "at least {C:attention}4{} different suits, {C:attention}first two{}",
            "scored cards become {C:attention}Wild{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)",
            "{C:inactive}(Drag to rearrange)",
        }
    },
    config = {
        extra = {
            times_left = 3,
            should_tick_down = false,
        }
    },
    pos = { x = 0, y = 2 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "mys. minty",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,

    calculate = function(self, card, context)
        if context.before then
            local suits = {}
            local count = 0
            for i,v in ipairs(context.scoring_hand) do
                if not SMODS.has_no_suit(v) then
                    if not SMODS.has_any_suit(v) then
                        for kk,vv in pairs(SMODS.Suits) do
                            if not suits[kk] and v:is_suit(kk) then --Fucky if a card has multiple-but-not-all suits
                                suits[kk] = true                    --but only like two mods ever do that ¯\_(ツ)_/¯
                                count = count + 1
                                break
                            end
                        end
                    else
                        count = count + 1
                    end
                end
            end
            if count >= 4 then
                card.should_tick_down = true
                return {
                    func = function ()
                        context.scoring_hand[1]:set_ability("m_wild", nil, true)
                        SMODS.calculate_effect({message = "Wild!" }, context.scoring_hand[1])
                        context.scoring_hand[2]:set_ability("m_wild", nil, true)
                        SMODS.calculate_effect({message = "Wild!" }, context.scoring_hand[2])
                    end
                }
            end
            return
        end

        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_nyx',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Nyx',
        text = {
            "When you get a consumable card,",
            "add {C:dark_edition}Negative{} to it",
            "{C:inactive}({C:attention}#1#{C:inactive} cards left)"
        }
    },
    config = {
        extra = {
            times_left = 3,
            should_tick_down = false,
        }
    },
    pos = { x = 1, y = 2 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "athebyne",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,
    calculate = function(self, card, context)
        if context.card_added and context.card.ability.consumeable and card.ability.extra.times_left > 0 and (not context.card.edition or not context.card.edition.negative) and not context.card.nyxed then
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            local bought = context.card
            bought.nyxed = true
            local sell_cost = bought.sell_cost
            G.E_MANAGER:add_event(Event({
                func = function ()
                    bought:set_edition("e_negative", true)
                    bought.sell_cost = sell_cost
                    bought.nyxed = nil
                    return true
                end
            }))
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/3"
                }
            end
        end
    end,
    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_hera',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Hera',
        text = {
            "The next {C:attention}Booster Pack{}",
            "you open has {C:attention}+1{} card option and choice",
            "{C:inactive}({C:attention}#1#{C:inactive} packs left)"
        }
    },
    config = {
        extra = {
            times_left = 2,
            should_tick_down = false,
        }
    },
    pos = { x = 2, y = 2 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.times_left } }
    end,

    calculate = function(self, card, context)
        if context.open_booster then
            G.GAME.pack_choices = G.GAME.pack_choices + 1
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local card
                    local _card_to_spawn = context.card.config.center:create_card(context.card, #G.pack_cards.cards+1)
                    if type((_card_to_spawn or {}).is) == 'function' and _card_to_spawn:is(Card) then
                        card = _card_to_spawn
                    else
                        card = SMODS.create_card(_card_to_spawn)
                    end
                    G.pack_cards:emplace(card)
                    return true
                end)
            }))
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/2"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_zeus',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Zeus',
        text = {
            "{C:green}#2# in #3#{} chance to create",
            "a free {C:attention}Double Tag{} if played",
            "{C:attention}poker hand{} has already",
            "been played this round",
            "{C:inactive}({C:attention}#1#{C:inactive} rounds left)"
        }
    },
    config = {
        extra = {
            times_left = 2,
            odds = 4,
            should_tick_down = false,
        }
    },
    pos = { x = 3, y = 2 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "Slipstream",
        code = "Athebyne",
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cbean_sdown_zeus')
        return { vars = { card.ability.extra.times_left, numerator, denominator } }
    end,

    calculate = function(self, card, context)
        if context.before and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 and card.ability.extra.times_left > 0 then
            card.should_tick_down = true
            if SMODS.pseudorandom_probability(card, "zeus", 1, card.ability.extra.odds) then
                card:juice_up()
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag('tag_double'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end)
                }))
            else
                SMODS.calculate_effect({message = (localize("k_nope_ex")) }, card)
            end
        end
        if context.end_of_round and not context.game_over and card.should_tick_down then
            card.should_tick_down = false
            card.ability.extra.times_left = card.ability.extra.times_left - 1
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            else
                return {
                    message = (card.ability.extra.times_left).."/2"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}