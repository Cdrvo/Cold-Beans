Colonparen.GreekBlind{
    key = "colon_alpha",
    name = "The Alpha",
    mult = 1,
    -- boss_colour = HEX("000000"),
    -- pos = { x = 0, y = 0 },
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
    -- boss_colour = HEX("000000"),
    -- pos = { x = 0, y = 0 },
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
    -- boss_colour = HEX("000000"),
    -- pos = { x = 0, y = 0 },
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
    name = "The Delta",
    mult = 1,
    -- boss_colour = HEX("000000"),
    -- pos = { x = 0, y = 0 },
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
