-- Legendaries include:
-- Sophron
-- Plato
-- Aristotle

-- Sophron
SMODS.Joker {
    key = "colon_soph",
    name = "Sophron",

    rarity = 4,
    price = 13,
    blueprint_compat = true,

    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play and not context.end_of_round then
            local times = 0
            for i, other_card in pairs(G.play.cards) do
                if other_card == context.other_card then
                    times = i-1
                end
            end
            print(times)
            if times < 1 then
                return
            end
            return {
                repetitions = times
            }
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        code = "bitterdoes",
    }
}

-- Plato
SMODS.Joker {
    key = "colon_plato",
    name = "Plato",

    rarity = 4,
    price = 13,
    blueprint_compat = true,

    loc_vars = function()
        return {
            vars = {
                colours = {
                    HEX("87a365"), -- colour text formatted with {V:1}
                },
            }
        }
    end,

    calculate = function(self,card,context)
        if context.individual then
            
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        code = "bitterdoes",
    }
}

-- Aristotle
SMODS.Joker {
    key = "colon_aris",
    name = "Aristotle",

    rarity = 4,
    price = 13,
    blueprint_compat = true,

    calculate = function(self,card,context)
        if context.individual then
            
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        code = "bitterdoes",
    }
}