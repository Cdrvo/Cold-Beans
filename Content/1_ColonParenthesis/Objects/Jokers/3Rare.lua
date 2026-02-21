SMODS.Joker {
    key = "colon_big_shot",
    name = "Big Shot",
    atlas = "colon_JokerAtlas",
    pos = { x = 2, y = 0 },
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
        local num1 = card.ability.extra.min;
        if num1 == -199.7 then
            num1 = "-199.7"
        end
        local num2 = card.ability.extra.max;
        if num2 == 199.7 then
            num2 = "199.7"
        end
        return {
            vars = {
                num1,
                num2,
            }
        }
    end,

    joker_display_def = function(JokerDisplay)
        return {
            text = { -- Almost a direct rip from misprint lololo
            { text = "+", colour = G.C.MONEY },
            {
                dynatext = {
                    string = (
                        function()
                            local r_dollar = {}
                            for i = G.P_CENTERS["j_cbean_colon_big_shot"].config.extra.min, G.P_CENTERS["j_cbean_colon_big_shot"].config.extra.max do
                                r_dollar[#r_dollar + 1] = tostring(i)
                            end
                            return r_dollar
                        end
                    )(),
                    colours = { G.C.MONEY },
                    pop_in_rate = 999999,
                    silent = true,
                    random_element = true,
                    pop_delay = 0.5,
                    scale = 0.4,
                    min_cycle_time = 0
                }
            }
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
    atlas = "colon_JokerAtlas",
    pos = { x = 2, y = 2 },
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
    atlas = "colon_JokerAtlas",
    pos = { x = 6, y = 0 },
    rarity = 3,
    cost = 10,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint and not (G.GAME.blind_on_deck ~= "Teeny" and G.GAME.blind_on_deck ~= "CEO" and G.GAME.blind_on_deck ~= "Ceo") then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not (G.GAME.blind_on_deck ~= "Teeny" and G.GAME.blind_on_deck ~= "CEO" and G.GAME.blind_on_deck ~= "Ceo") and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.end_of_round and context.cardarea == G.jokers and not (G.GAME.blind_on_deck ~= "Teeny" and G.GAME.blind_on_deck ~= "CEO" and G.GAME.blind_on_deck ~= "Ceo") --[[can NOT be fucked checking which one]] and G.GAME.current_round.discards_used == 0 then
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

SMODS.Joker {
    key = "colon_jester",
    blueprint_compat = true,
    atlas = "colon_JokerAtlas",
    pos = { x = 8, y = 1 },
    rarity = 3,
    cost = 9,

    config = { extra = { mult = 7, xmult = 1.4 } },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.xmult }}
    end,

    joker_display_def = function(JokerDisplay)
        return {
            text = { -- Modified version of baron
                {
                    border_nodes = {
                        { text = "+" },
                        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
                    },
                    text_config = { colour = G.C.MULT },
                },
                {text = ""}, -- spacing (I saw this in cryptid once)
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            calc_function = function(card)
                local playing_hand = next(G.play.cards)
                local count = 0
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_hand or not playing_card.highlighted then
                        if not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() and playing_card:get_id() == 14 then
                            count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                        end
                    end
                end
                card.joker_display_values.mult = card.ability.extra.mult * count
                card.joker_display_values.xmult = card.ability.extra.xmult ^ count -- I have no fucking idea what im doing 🙏
            end
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 14 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = card.ability.extra.mult,
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,
}




