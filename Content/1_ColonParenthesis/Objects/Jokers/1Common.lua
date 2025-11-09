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
    add_to_deck = function (self, card, from_debuff)
        if not from_debuff then
            Colonparen.recalculateBlinds(card)
        end
    end,
    calculate = function(self, card, context)
        print(context.trigger_obj)
        if context.cbean_colon_set_blind then
            if context.blind == "bl_small" then
                return {
                    blind = Colonparen.get_new_blind('Teeny')
                }
            end
            if context.blind == "bl_big" then
                return {
                    blind = Colonparen.get_new_blind('Small')
                }
            end
        end
    end,
    beans_credits = {
        idea = "Unknown",
        code = "jamirror",
        team = ":(",
    }
}