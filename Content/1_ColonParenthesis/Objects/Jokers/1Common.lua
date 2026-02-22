
SMODS.Joker {
    key = "colon_chalk",
    name = "Chalk",
    atlas = "colon_JokerAtlas",
    pos = { x = 3, y = 2 },
    config = {
        extra = {
            xmult = 5,
            winning_ante_mod = 3
        }
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
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
        team = ":(",
        idea = "George The Rat",
        code = "Glitchkat10",
    }
}

-- Lead

SMODS.Joker {
    key = "colon_loan_shark",
    name = "Loan Shark",
    config = {
        extra = {
            dollars1 = 5,
            dollars2 = 15
        }
    },
    atlas = "colon_JokerAtlas",
    pos = { x = 0, y = 0 },
    cost = 6,
    rarity = 1,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars1,
                card.ability.extra.dollars2
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and (G.GAME.blind_on_deck == "Teeny" or context.blind.key == "bl_small" or context.blind.key == "bl_big") then
            return {
                dollars = -card.ability.extra.dollars1,
                colour = G.C.RED
            }
        end
        if context.setting_blind and (G.GAME.blind.boss or G.GAME.blind.CEO) then
            return {
                dollars = card.ability.extra.dollars2
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

-- Lumberjack

SMODS.Joker {
    key = "colon_pebble",
    name = "Pebble",
    atlas = "colon_JokerAtlas",
    pos = { x = 4, y = 2 },
    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    add_to_deck = function (self, card, from_debuff)
        if not from_debuff then
            Colonparen.recalculateBlinds(card)
        end
    end,
    calculate = function(self, card, context)
        if context.cbean_colon_set_blind then   
            if context.blind == "bl_small" and not context.blind_object.affected_by_pebble then
                return {
                    blind = Colonparen.get_new_blind("Teeny")
                }
            end
            if context.blind == "bl_big" then
                return {
                    blind = Colonparen.get_new_blind("Small")
                }
            end
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        code = { "jamirror", "bitter" },
    }
}

-- Top Rope
