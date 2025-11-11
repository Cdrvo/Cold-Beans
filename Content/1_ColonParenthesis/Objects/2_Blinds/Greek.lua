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
        code = "Glitchkat10",
    }
}

Colonparen.GreekBlind{
    key = "colon_lambda",
    name = "Lambda",
    mult = 1,
    boss_colour = HEX("6cde99"),
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
        code = "",
    }
}
