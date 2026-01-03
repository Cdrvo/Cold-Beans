Colonparen.GreekBlind{
    key = "colon_beta",
    name = "Beta",
    mult = 1,
    boss_colour = HEX("de886c"),
    pos = { x = 0, y = 1 },
    lower = {
        set_blind = function(self, card, from_blind)
            for i, area in ipairs(SMODS.get_card_areas('jokers')) do
                for q, card in ipairs(area.cards) do
                    Colonparen.manipulate(card, {
                        value = 1.1,
                        type = "X"
                    })
                end
            end
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.press_play then
                for i, area in ipairs(SMODS.get_card_areas('jokers')) do
                    for q, card in ipairs(area.cards) do
                        Colonparen.manipulate(card, {
                            value = 1.1,
                            type = "X"
                        })
                    end
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.GreekBlind{
    key = "colon_gamma",
    name = "Gamma",
    mult = 1,
    boss_colour = HEX("de9c6c"),
    pos = { x = 0, y = 2 },
    lower = {
        config = {
            retriggers = 2,
        },
        calculate = function(self, blind, context)
            if context.repetition and context.cardarea == G.play then
                return {
                    repetitions = self.config.retriggers
                }
            end
        end
    },
    upper = {
        config = {
            retriggers = 3,
        },
        calculate = function(self, blind, context)
            if context.repetition and ((context.cardarea == G.play) or (context.cardarea == G.hand)) then
                return {
                    repetitions = self.config.retriggers
                }
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

Colonparen.GreekBlind{
    key = "colon_delta",
    name = "Delta",
    mult = 1,
    boss_colour = HEX("deb56c"),
    pos = { x = 0, y = 3 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.retrigger_joker_check and context.other_context.pre_discard then
                return {
                    repetitions = 1
                }
            end
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.discard or (context.retrigger_joker_check and context.other_context.discard) then
                return {
                    repetitions = 1
                }
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.GreekBlind{
    key = "colon_epsilon",
    name = "Epsilon",
    mult = 1,
    boss_colour = HEX("d5de6c"),
    pos = { x = 0, y = 4 },
    lower = {
        calculate = function(self, blind, context)
            if context.discard then
                return {
                    remove = true
                }
            end
        end
    },
    upper = {
        calculate = function(self, blind, context)
            if context.before and G.GAME.current_round.hands_played == 0 then
                local copied_cards = {}
                for _, card in ipairs(context.full_hand) do
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local card_copied = copy_card(card, nil, nil, G.playing_card)
                    card_copied:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, card_copied)
                    G.hand:emplace(card_copied)
                    card_copied.states.visible = nil
                    table.insert(copied_cards, card_copied)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card_copied:start_materialize()
                            return true
                        end
                    }))
                end
                if #copied_cards > 0 then
                    return {
                        message = localize("k_copied_ex"),
                        colour = G.C.CHIPS,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.calculate_context({
                                        playing_card_added = true,
                                        cards = copied_cards
                                    })
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "",
    }
}

-- Improved This blind - RattlingSnow353
Colonparen.GreekBlind{
    key = "colon_zeta",
    name = "Zeta",
    mult = 1,
    boss_colour = HEX("bcde6c"),
    pos = { x = 0, y = 5 },
    discovered = true,
    lower = {
        config = {
            xmult = 0.5
        },
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round then
                if SMODS.has_enhancement(context.other_card, "m_glass") then
                    context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                    context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + 0.5
                end
            end
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round then
                if SMODS.has_enhancement(context.other_card, "m_glass") then
                    card.ability.extra = card.ability.extra + 1
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.GreekBlind{
    key = "colon_eta",
    name = "Eta",
    mult = 1,
    boss_colour = HEX("adde6c"),
    pos = { x = 0, y = 6 },
    lower = {
        calculate = function(self, blind, context)
            if context.before then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card:is_face() then
                        local effect_choice = pseudorandom("bl_cbean_lower_colon_eta_effect_choice", 1, 3)
                        if effect_choice == 1 then
                            local enhancement_pool = {}
                            for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                                if enhancement.key ~= 'm_stone' then
                                    table.insert(enhancement_pool, enhancement)
                                end
                            end
                            if #enhancement_pool > 0 then
                                local random_enhancement = pseudorandom_element(enhancement_pool, "bl_cbean_lower_colon_eta_enhancement")
                                scored_card:set_ability(random_enhancement)
                            end
                        elseif effect_choice == 2 then
                            local edition_pool = {}
                            for _, ed in pairs(G.P_CENTER_POOLS["Edition"]) do
                                if ed.key and ed.key ~= "base" then
                                    table.insert(edition_pool, ed.key)
                                end
                            end
                            if #edition_pool > 0 then
                                local edition = pseudorandom_element(edition_pool, "bl_cbean_lower_colon_eta_edition")
                                scored_card:set_edition(edition, true)
                            end
                        else
                            local random_seal = SMODS.poll_seal({ mod = 10, guaranteed = true, seed = pseudoseed("bl_cbean_lower_colon_eta_seal") })
                            if random_seal then
                                scored_card:set_seal(random_seal, true)
                            end
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                    end
                end
            end
        end
    },
    upper = {
        calculate = function(self, blind, context)
            if context.before then
                local enhanced_cards = 0
                for _, scored_card in ipairs(context.scoring_hand) do
                    if scored_card:is_face() then
                        local enhancement_pool = {}
                        for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                            if enhancement.key ~= 'm_stone' then
                                table.insert(enhancement_pool, enhancement)
                            end
                        end
                        if #enhancement_pool > 0 then
                            local random_enhancement = pseudorandom_element(enhancement_pool, "bl_cbean_upper_colon_eta_enhancement")
                            scored_card:set_ability(random_enhancement)
                        end
                        local edition_pool = {}
                        for _, ed in pairs(G.P_CENTER_POOLS["Edition"]) do
                            table.insert(edition_pool, ed.key)
                        end
                        if #edition_pool > 0 then
                            local edition = pseudorandom_element(edition_pool, "bl_cbean_upper_colon_eta_edition")
                            scored_card:set_edition(edition, true)
                        end
                        local random_seal = SMODS.poll_seal({ mod = 10, guaranteed = true })
                        if random_seal then
                            scored_card:set_seal(random_seal, true)
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                scored_card:juice_up()
                                return true
                            end
                        }))
                        enhanced_cards = enhanced_cards + 1
                    end
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "",
    }
}

Colonparen.GreekBlind{
    key = "colon_kappa",
    name = "Kappa",
    mult = 1,
    boss_colour = HEX("6cde99"),
    pos = { x = 0, y = 9 },
    lower = {
        config = {
            hand_size = 1
        },
        set_blind = function(self, card, from_blind)
            G.hand:change_size(self.config.hand_size)
        end,
    },
    upper = {
        config = {
            hands = 1
        },
        set_blind = function(self, card, from_blind)
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + self.config.hands
            ease_hands_played(self.config.hands)
            G.play:change_size(self.config.hand_size)
        end,
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

Colonparen.GreekBlind{
    key = "colon_nu",
    name = "Nu",
    mult = 1,
    boss_colour = HEX("6cddde"),
    pos = { x = 0, y = 12 },
    lower = {
        config = {
            chips = 50
        },
        calculate = function(self, blind, context)
            if context.cardarea == G.play and context.individual and next(context.poker_hands["Flush"]) then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + self.config.chips
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS
                }
            end
        end,
    },
    upper = {
        config = {
            xmult = 0.5
        },
        calculate = function(self, blind, context)
            if context.cardarea == G.play and context.individual and next(context.poker_hands["Flush"]) then
                context.other_card.ability.perma_x_mult = (context.other_card.ability.perma_x_mult or 1) + self.config.xmult
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.MULT,
                }
            end
        end,
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

Colonparen.GreekBlind{
    key = "colon_xi",
    name = "Xi",
    mult = 1,
    boss_colour = HEX("6ccede"),
    pos = { x = 0, y = 13 },
    lower = {
        calculate = function(self, blind, context)
            if context.before then
                return {
                    level_up = true
                }
            end
        end
    },
    upper = {
        calculate = function(self, blind, context)
            if context.before then
                local most_played_hand = nil
                local max_played = 0
                for hand_name, hand_data in pairs(G.GAME.hands) do
                    if hand_data.visible and (not most_played_hand or (hand_data.played or 0) > max_played) then
                        most_played_hand = hand_name
                        max_played = hand_data.played or 0
                    end
                end
                if most_played_hand then
                    return {
                        level_up = true,
                        level_up_hand = most_played_hand
                    }
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}


Colonparen.GreekBlind{
    key = "colon_chi",
    name = "Chi",
    mult = 1,
    boss_colour = HEX("C26CDE"),
    pos = { x = 0, y = 21 },
    lower = {
        set_blind = function(self, card, from_blind)
            local card1 = SMODS.create_card({set = "Joker", area = G.jokers, rarity = "Common", edition = "e_negative"})
            local card2 = SMODS.create_card({set = "Joker", area = G.jokers, rarity = "Uncommon", edition = "e_negative"})
            card1:add_to_deck()
            G.jokers:emplace(card1)
            card1:start_materialize()
            card2:add_to_deck()
            G.jokers:emplace(card2)
            card2:start_materialize()
        end,
    },
    upper = {
        set_blind = function(self, card, from_blind)
            local card1 = SMODS.create_card({set = "Joker", area = G.jokers, rarity = "Uncommon", edition = "e_negative"})
            local card2 = SMODS.create_card({set = "Joker", area = G.jokers, rarity = "Rare", edition = "e_negative"})
            card1:add_to_deck()
            G.jokers:emplace(card1)
            card1:start_materialize()
            card2:add_to_deck()
            G.jokers:emplace(card2)
            card2:start_materialize()
        end,
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "SMG9000",
    }
}

Colonparen.GreekBlind{
    key = "colon_sigma",
    name = "Sigma",
    mult = 1,
    boss_colour = HEX("6c8dde"),
    pos = { x = 0, y = 17 },
    lower = {
        calculate = function(self, blind, context)
            if context.before then
                for _, card in ipairs(context.full_hand) do
                    if card.config.center == G.P_CENTERS.c_base then
                        if #G.P_CENTER_POOLS.Enhanced > 0 then
                            local random_enhancement = pseudorandom_element(G.P_CENTER_POOLS.Enhanced, "bl_cbean_lower_colon_sigma_enhancement")
                            card:set_ability(random_enhancement)
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:juice_up()
                                return true
                            end
                        }))
                    end
                end
            end
        end
    },
    upper = {
        calculate = function(self, blind, context)
            if context.before then
                for _, card in ipairs(context.full_hand) do
                    if card.config.center == G.P_CENTERS.c_base then
                        if #G.P_CENTER_POOLS.Enhanced > 0 then
                            local random_enhancement = pseudorandom_element(G.P_CENTER_POOLS.Enhanced, "bl_cbean_upper_colon_sigma_enhancement")
                            card:set_ability(random_enhancement)
                        end
                        local edition_pool = {}
                        for _, ed in pairs(G.P_CENTER_POOLS["Edition"]) do
                            if ed.key and ed.key ~= "base" then
                                table.insert(edition_pool, ed.key)
                            end
                        end
                        if #edition_pool > 0 then
                            local edition = pseudorandom_element(edition_pool, "bl_cbean_upper_colon_sigma_edition")
                            card:set_edition(edition, true)
                        end
                        local random_seal = SMODS.poll_seal({ mod = 10, guaranteed = true, seed = pseudoseed("bl_cbean_upper_colon_sigma_seal") })
                        if random_seal then
                            card:set_seal(random_seal, true)
                        end
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card:juice_up()
                                return true
                            end
                        }))
                    end
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

local tauic_sticker = SMODS.Sticker{
    key = "colon_tauic",
    badge_colour = HEX("6d6cde"),
    atlas = "colon_LowercaseGreekBlind",
    pos = { x = -1, y = -1 }
}

Colonparen.GreekBlind{
    key = "colon_tau",
    name = "Tau",
    mult = 1,
    boss_colour = HEX("6d6cde"),
    pos = { x = 0, y = 18 },
    lower = {
        set_blind = function (self)
            for i = 1, 5 do
                local card = SMODS.add_card{
                    key = "c_wheel_of_fortune",
                    edition = "e_negative"
                }
                tauic_sticker:apply(card, true)
            end
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        calculate = function(self, blind, context)
            if context.before then
                for i = 1, 5 do
                    local card = SMODS.add_card{
                        key = "c_wheel_of_fortune",
                        edition = "e_negative"
                    }
                    tauic_sticker:apply(card, true)
                end
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}


Colonparen.GreekBlind{
    key = "colon_upsilon",
    name = "Upsilon",
    mult = 1,
    boss_colour = HEX("956cde"),
    pos = { x = 0, y = 19 },
    lower = {
        set_blind = function (self)
            ease_ante(-1)
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function (self)
            ease_ante(-math.floor((G.GAME.cbean_colon_teenies_played or 0) / 5))
        end,
        calculate = function(self, blind, context)
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.GreekBlind{
    key = "colon_phi",
    name = "Phi",
    mult = 1,
    boss_colour = HEX("a96cde"),
    pos = { x = 0, y = 20 },
    lower = {
        set_blind = function (self)
            if #G.jokers.cards > 0 then
                local chosen_joker = pseudorandom_element(G.jokers.cards, 'colon_phi')
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        local copied_joker = copy_card(chosen_joker, nil, nil, nil)
                        copied_joker:start_materialize()
                        copied_joker:add_to_deck()
                        G.jokers:emplace(copied_joker)
                        return true
                    end
                }))
            end
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function (self)
            if #G.jokers.cards > 0 then
                local chosen_jokera = pseudorandom_element(G.jokers.cards, 'colon_phi')
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        local copied_joker = copy_card(chosen_jokera, nil, nil, nil)
                        copied_joker:start_materialize()
                        copied_joker:add_to_deck()
                        copied_joker:set_edition("e_negative", true)
                        G.jokers:emplace(copied_joker)
                        return true
                    end
                }))
                local chosen_jokerb = pseudorandom_element(G.jokers.cards, 'colon_phi')
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        local copied_joker = copy_card(chosen_jokerb, nil, nil, nil)
                        copied_joker:start_materialize()
                        copied_joker:add_to_deck()
                        copied_joker:set_edition("e_negative", true)
                        G.jokers:emplace(copied_joker)
                        return true
                    end
                }))
            end
        end,
        calculate = function(self, blind, context)
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}


Colonparen.GreekBlind{
    key = "colon_psi",
    name = "Psi",
    mult = 1,
    boss_colour = HEX("db6cde"),
    pos = { x = 0, y = 22 },
    lower = {
        set_blind = function (self)
            for i = 1, 5 do
                SMODS.add_card{
                    set = "Spectral",
                    edition = "e_negative"
                }
            end
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function (self)            
            G.E_MANAGER:add_event(Event({
                func = function()
                    local to_add = {}
                    for i = 1, 2 do
                        for i, card_to_copy in ipairs(G.consumeables.cards) do
                            local copied_card = copy_card(card_to_copy)
                            copied_card:set_edition("e_negative", true)
                            to_add[#to_add+1] = copied_card;
                        end
                    end
                    for i, copied_card in ipairs(to_add) do
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                    end
                    return true
                end
            }))
        end,
        calculate = function(self, blind, context)
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}


Colonparen.GreekBlind{
    key = "colon_omega",
    name = "Omega",
    mult = 1,
    boss_colour = HEX("de6cc2"),
    pos = { x = 0, y = 23 },
    lower = {
        set_blind = function (self) end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function (self) end,
        calculate = function(self, blind, context)
        end,
        loc_vars = function (self)
            if not G.GAME.colon_cbean_last_upper_greek then
                return {
                    key = self.key .. "_alternate"
                }
            else
                return {
                    vars = {
                        localize{set = "Blind", key = G.GAME.colon_cbean_last_upper_greek, type = "name_text" }
                    }
                }
            end
        end,
        collection_loc_vars = function (self)
            if not ((G.GAME or {}).colon_cbean_last_upper_greek) then
                return {
                    vars = {
                        localize('k_none')
                    }
                }
            else
                return {
                    vars = {
                        localize{set = "Blind", key = G.GAME.colon_cbean_last_upper_greek, type = "name_text" }
                    }
                }
            end
        end
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

local old_set_blind = Blind.set_blind;
function Blind:set_blind(blind, reset, silent)
    if blind then
        if blind.key == "bl_cbean_lower_colon_omega" then
            local pool = {}
            for k, v in pairs(G.P_LOWER_GREEK_BLINDS) do
                if k ~= "bl_cbean_lower_colon_omega" then
                    pool[#pool+1] = v
                end
            end
            blind = pseudorandom_element(pool)
        elseif blind.key == "bl_cbean_upper_colon_omega" then
            if not G.GAME.colon_cbean_last_upper_greek then 
                -- fallback. whatever spawn condition SHOULD prevent this but there are other ways of spawning greeks
                local pool = {}
                for k, v in pairs(G.P_UPPER_GREEK_BLINDS) do
                    if k ~= "bl_cbean_upper_colon_omega" then
                        pool[#pool+1] = v
                    end
                end
                blind = pseudorandom_element(pool)
            else
                blind = G.P_UPPER_GREEK_BLINDS[G.GAME.colon_cbean_last_upper_greek]
            end
        end
    end
    return old_set_blind(self, blind, reset, silent)
end