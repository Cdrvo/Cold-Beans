Colonparen.GreekBlind{
    key = "colon_alpha",
    name = "The Alpha",
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
    name = "The Beta",
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
    name = "The Gamma",
    mult = 1,
    boss_colour = HEX("de9c6c"),
    pos = { x = 0, y = 2 },
    lower = {
        config = {
            retriggers = 1,
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
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        code = "Glitchkat10",
    }
}

Colonparen.GreekBlind{
    key = "colon_delta",
    name = "The Delta",
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
    key = "colon_kappa",
    name = "The Kappa",
    config = {
        hand_size = 1,
    },
    mult = 1,
    -- boss_colour = HEX("000000"),
    -- pos = { x = 0, y = 0 },
    lower = {
        set_blind = function(self, card, from_blind)
            G.hand:change_size(self.config.hand_size)
        end,
    },
    upper = {
        set_blind = function(self, card, from_blind)
            G.play:change_size(card.ability.extra.hand_size)
        end,
    },
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        code = "",
    }
}