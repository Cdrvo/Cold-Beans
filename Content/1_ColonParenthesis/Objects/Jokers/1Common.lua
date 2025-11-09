
SMODS.Joker {
    key = "colon_minnesang",
    -- atlas = "",
    -- pos = { x = 0, y = 0 },

    config = {
        extra = {
            discards = 2,
            dollars = -1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.discards,
                card.ability.extra.dollars
            }
        }
    end,

    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER.add_event(Event({
                        trigger = "ease",
                        delay = 1,
                        ref_table = G.GAME,
                        ref_value = "chips",-- someone make this discards I gtg school
                        ease_to = G.GAME.chips + card.ability.extra.discards,
                    }))
                end,
            }
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Bitter",
        code = "Bitter",
    }
}
            -- j_cbean_colon_minnesang = { -- Minnesang | Common | Bitter | tbd
            --     name = "Minnesang",
            --     text = {
            --         "{C:red}+2{} discards each round,",
            --         "{C:money}-1{} dollar per round"
            --     }
            -- },

-- misc
SMODS.Joker {
    key = "colon_chalk",
    name = "Chalk",
    config = {
        extra = {
            xmult = 3,
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