SMODS.Joker {
    key = "colon_chalk",
    name = "Chalk",
    config = {
        extra = {
            xmult = 1,
            winning_ante_mod = 2
        }
    },
    -- pos = { x = 0, y = 0 },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    -- atlas = "",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.winning_ante_mod
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.win_ante = G.GAME.win_ante + card.ability.extra.winning_ante_mod     
    end,
    beans_credits = {
        team = ":( Team",
        idea = "George The Rat",
        code = "Glitchkat10",
    }
}

-- bebble
SMODS.Joker {
    key = "colon_pibble",
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    add_to_deck = function(self, card, from_debuff)
        if from_debuff then
            return
        end
            local small, big = false, false
            for _,blind in pairs(G.GAME.round_resets.blind_choices) do
                print(blind)
                if blind == "bl_small" and not small then
                    print("small iterated")
                    Colonparen.changeblind("Small", "small", "bl_cbean_colon_wee")
                    small = true
                elseif blind == "bl_big" and not big then
                    print("big iterated")
                    Colonparen.changeblind("Big", "big", "bl_small")
                    big = true
                end
            end
    end,
    calculate = function(self, card, context)
        if context.ante_change or context.ending_shop then
            local small, big = false, false
            for _,blind in pairs(G.GAME.round_resets.blind_choices) do
                print(blind)
                if blind == "bl_small" and not small then
                    print("small iterated")
                    Colonparen.changeblind("Small", "small", "bl_cbean_colon_wee")
                    small = true
                elseif blind == "bl_big" and not big then
                    print("big iterated")
                    Colonparen.changeblind("Big", "big", "bl_small")
                    big = true
                end
            end
        end
    end,
    beans_credits = {
        idea = "idk",
        code = "Bitter",
        team = ":(",
    }
}