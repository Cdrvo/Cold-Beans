--Common Medal
YMA.MEDAL {
    key = "yma_common",
    order = 1,
    badge_colour = HEX("009dff"),

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.yma_medal.extra.chips,
                card.ability.yma_medal.extra.mult,
            }
        }
    end,

    atlas = 'yma_medals_atlas',
    pos = { x = 2, y = 0 },

    config = {
        extra = {
            chips = 25,
            mult = 5,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            local which = pseudorandom("yma_common_pick", 1, 3)
            local chips = (which == 1 and card.ability.yma_medal.extra.chips or nil)
            local mult = (which == 2 and card.ability.yma_medal.extra.mult or nil)
            local dollars = (which == 3 and pseudorandom("yma_common", 1, 2) or nil)
            return {
                chips = chips,
                mult = mult,
                dollars = dollars,
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Unommon Medal
YMA.MEDAL {
    key = "yma_uncommon",
    order = 2,
    badge_colour = HEX("4bc292"),

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.yma_medal.extra.odds, 'yma_uncommon')
        return {
            vars = {
                card.ability.yma_medal.extra.chips,
                card.ability.yma_medal.extra.mult,
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_medals_atlas',
    pos = { x = 3, y = 0 },

    config = {
        extra = {
            chips = 50,
            mult = 10,
            odds = 4,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            local which = pseudorandom("yma_uncommon_pick", 1, 3)
            local chips = (which == 1 and card.ability.yma_medal.extra.chips or nil)
            local mult = (which == 2 and card.ability.yma_medal.extra.mult or nil)
            local dollars = (which == 3 and SMODS.pseudorandom_probability(card, 'yma_uncommon', 1, card.ability.yma_medal.extra.odds) and 5 or nil)
            return {
                chips = chips,
                mult = mult,
                dollars = dollars,
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Rare Medal
YMA.MEDAL {
    key = "yma_rare",
    order = 3,
    badge_colour = HEX("fe5f55"),

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.yma_medal.extra.odds, 'yma_rare')
        return {
            vars = {
                card.ability.yma_medal.extra.xchips,
                card.ability.yma_medal.extra.xmult,
                numerator, denominator,
            }
        }
    end,

    atlas = 'yma_medals_atlas',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            xchips = 1.5,
            xmult = 1.2,
            odds = 4,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            local which = pseudorandom("yma_rare_pick", 1, 3)
            local xchips = (which == 1 and card.ability.yma_medal.extra.xchips or nil)
            local xmult = (which == 2 and card.ability.yma_medal.extra.xmult or nil)
            if which == 3 then
                if SMODS.pseudorandom_probability(card, 'yma_rare', 1, card.ability.yma_medal.extra.odds) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            local cardd = create_card('Consumeables',G.consumeables, nil, nil, nil, nil, nil, 'yma_rare_card')
                            cardd:add_to_deck()
                            G.consumeables:emplace(cardd)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                end
            else
                return {
                    xchips = xchips,
                    xmult = xmult,
                }
            end
            
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Legendary Medal
YMA.MEDAL {
    key = "yma_legendary",
    order = 4,
    badge_colour = HEX("b26cbb"),

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.yma_medal.extra.xchips,
                card.ability.yma_medal.extra.cur_xchips,
                card.ability.yma_medal.extra.xmult,
                card.ability.yma_medal.extra.cur_xmult,
            }
        }
    end,

    atlas = 'yma_medals_atlas',
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            xchips = 0.05,
            cur_xchips = 1,
            xmult = 0.05,
            cur_xmult = 1
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            for k, v in pairs(context.full_hand) do
                card.ability.yma_medal.extra.cur_xchips = card.ability.yma_medal.extra.cur_xchips + card.ability.yma_medal.extra.xchips
            end
            card.ability.yma_medal.extra.cur_xmult = card.ability.yma_medal.extra.cur_xmult + card.ability.yma_medal.extra.xmult
            return {
                xchips = card.ability.yma_medal.extra.cur_xchips,
                xmult = card.ability.yma_medal.extra.cur_xmult,
            }
        end
        if context.end_of_round and context.main_eval then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local cardd = create_card('Consumeables',G.consumeables, nil, nil, nil, nil, nil, 'yma_legendary_card')
                    cardd:set_edition({ negative = true })
                    cardd:add_to_deck()
                    G.consumeables:emplace(cardd)
                    return true
                end)
            }))
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}