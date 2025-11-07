-- Legendaries include
-- Sophron
-- Plato
-- Aistotle

-- Sophron
SMODS.Joker {
    key = "colon_soph",

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
            if times < 1 then return end
            return {
                repetitions = times
            }
        end
    end
}

-- plato
SMODS.Joker {
    key = "colon_plato",

    rarity = 4,
    price = 13,
    blueprint_compat = true,

    loc_vars = function()
        return {vars = {
            colours = {
                HEX("87a365"), -- colour text formatted with {V:1}
            },
        }}
    end,

    calculate = function(self,card,context)
        if context.individual then
            
        end
    end
}

-- aristotle
SMODS.Joker {
    key = "colon_aris",

    rarity = 4,
    price = 13,
    blueprint_compat = true,

    calculate = function(self,card,context)
        if context.individual then
            
        end
    end
}