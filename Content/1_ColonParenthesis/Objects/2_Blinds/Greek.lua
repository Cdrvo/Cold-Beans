Colonparen.GreekBlind{
    key = "colon_alpha",
    name = "Alpha",
    mult = 1,
    boss_colour = HEX("de6c6c"),
    pos = { x = 0, y = 0 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
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
    key = "colon_beta",
    name = "Beta",
    mult = 1,
    boss_colour = HEX("de886c"),
    pos = { x = 0, y = 1 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
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
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
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

Colonparen.GreekBlind{
    key = "colon_zeta",
    name = "Zeta",
    mult = 1,
    boss_colour = HEX("bcde6c"),
    pos = { x = 0, y = 5 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
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
    key = "colon_theta",
    name = "Theta",
    mult = 1,
    boss_colour = HEX("76de6c"),
    pos = { x = 0, y = 7 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
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
    key = "colon_iota",
    name = "Iota",
    mult = 1,
    boss_colour = HEX("6cde80"),
    pos = { x = 0, y = 8 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
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
    config = {
        hand_size = 1,
        hands = 1
    },
    mult = 1,
    boss_colour = HEX("6cde99"),
    pos = { x = 0, y = 9 },
    lower = {
        set_blind = function(self, card, from_blind)
            G.hand:change_size(self.config.hand_size)
        end,
    },
    upper = {
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
    key = "colon_lambda",
    name = "Lambda",
    mult = 1,
    boss_colour = HEX("6cdea3"),
    pos = { x = 0, y = 10 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "",
    }
}

Colonparen.GreekBlind{
    key = "colon_mu",
    name = "Mu",
    mult = 1,
    boss_colour = HEX("6cdec6"),
    pos = { x = 0, y = 11 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "",
    }
}

Colonparen.GreekBlind{
    key = "colon_nu",
    name = "Nu",
    mult = 1,
    boss_colour = HEX("6cddde"),
    pos = { x = 0, y = 12 },
    lower = {
        calculate = function(self, blind, context)
            if next(context.poker_hands["Flush"]) and context.individual and context.cardarea == G.play then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + self.config.chips
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS
                }
            end
        end,
    },
    upper = {
        calculate = function(self, blind, context)
            if next(context.poker_hands["Flush"]) and context.individual and context.cardarea == G.play then
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
        code = "",
    }
}