SMODS.Joker {
    key = "colon_big_shot",
    name = "Big Shot",
    config = {
        extra = {
            max = 199.7,
            min = -199.7,
            quips = {
                "N-NOWS YOUR CHANCE!",
                "[[BIG SHOT!]]",
                "HOOCHI MAMA!",
                "[[Hyperlink Blocked]]",
                "A DEAL'S A DEAL!!!",
                "1997!",
                "Smells like KROMER",
                "BUY [KeyGen]",
                "PERFECT FOR [City Livin']",
                "KRIS.",
                "LET ME SAY [Thanks]"
            }
        }
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.min,
                card.ability.extra.max,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.loc_name == "Big Blind" then
            return {
                message = card.ability.extra.quips[math.random(1, #card.ability.extra.quips)],
                dollars = math.random(card.ability.extra.min, card.ability.extra.max),
                remove_default_message = true,
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        code = "bitter",
    }
}

SMODS.Joker {
    key = "colon_modernity",
    name = "Modernity",
    config = {
        extra = {
            skip_xmult_mod = 1,
            select_xmult_mod = 0.5,
            xmult = 1,
        }
    },
    -- pos = { x = 0, y = 0 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    -- atlas = "",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.skip_xmult_mod,
                card.ability.extra.select_xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.skip_xmult_mod
            return {
                message = "X" .. card.ability.extra.xmult .. " Mult"
            }
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.xmult = math.max(card.ability.extra.xmult - card.ability.extra.select_xmult_mod, 1)
            return {
                message = "X" .. card.ability.extra.xmult .. " Mult"
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        code = "Glitchkat10",
    }
}

SMODS.Joker {
    key = "colon_square_packing",
    name = "Square Packing",
    config = {
        extra = {
            xmult_mod = 3.877084,
            requirement = 11,
            current = 0,
            xmult = 1,
        }
    },
    atlas = "colon_JokerAtlas",
    pos = { x = 1, y = 0 },
    pixel_size = { h = 71 },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.requirement,
                card.ability.extra.current,
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.current = card.ability.extra.current + 1
            if card.ability.extra.current >= card.ability.extra.requirement then
                card.ability.extra.current = 0
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return {
                    message = "X" .. card.ability.extra.xmult .. " Mult",
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        code = "Glitchkat10",
    }
}

SMODS.Joker {
    key = "colon_spectaro",
    name = "Spectaro",
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint and (G.GAME.blind_on_deck == "Teeny" or "CEO" or "Ceo" )then
            local eval = function() return G.GAME.current_round.discards_used == 0 and (G.GAME.blind_on_deck == "Teeny" or "CEO" or "Ceo") and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.end_of_round and context.cardarea == G.jokers and (G.GAME.blind_on_deck == "Teeny" or "CEO" or "Ceo")--[[can NOT be fucked checking which one]] and G.GAME.current_round.discards_used == 0 then
            return {
                message = "MAGIC!",
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            -- I hate nested stuff
                            card:juice_up()
                            SMODS.add_card({
                                set = "Spectral"
                            })
                            return true
                        end
                    }))
                end
            }
        end
    end,
    beans_credits = {
        idea = "George The Rat",
        code = "bitter",
        team = ":(",
    }
}