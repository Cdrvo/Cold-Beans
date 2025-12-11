-- ok i will admit i stole the original code for all of these from vremade because making them from scratch would TAKE TOO LONG

-- magician
SMODS.Consumable {
    key = 'yma_magician_level1',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_magician_level2',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_magician_level3',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_magician_level4',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_cbean_yma_lucky_1' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_magician_level5',
    set = 'Tarot',
    pos = { x = 1, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_cbean_yma_lucky_2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- lucky cards for the last two magician upgrades
SMODS.Enhancement {
    key = 'yma_lucky_1',
    pos = { x = 4, y = 1 },
    config = { extra = { mult = 20, dollars = 20, mult_odds = 5, dollars_odds = 15 } },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.mult_odds,
            'lucky_mult')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 2,
            card.ability.extra.dollars_odds, 'lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'lucky_mult', 2, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = card.ability.extra.mult
            end
            if SMODS.pseudorandom_probability(card, 'lucky_money', 2, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = card.ability.extra.dollars
            end
            return ret
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Enhancement {
    key = 'yma_lucky_2',
    pos = { x = 4, y = 1 },
    config = { extra = { mult = 20, dollars = 20, mult_odds = 5, dollars_odds = 15 } },
    loc_vars = function(self, info_queue, card)
        local mult_numerator, mult_denominator = SMODS.get_probability_vars(card, 3, card.ability.extra.mult_odds,
            'lucky_mult')
        local dollars_numerator, dollars_denominator = SMODS.get_probability_vars(card, 3,
            card.ability.extra.dollars_odds, 'lucky_money')
        return { vars = { mult_numerator, dollars_numerator, card.ability.extra.mult, mult_denominator, card.ability.extra.dollars, dollars_denominator } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'lucky_mult', 3, card.ability.extra.mult_odds) then
                card.lucky_trigger = true
                ret.mult = card.ability.extra.mult
            end
            if SMODS.pseudorandom_probability(card, 'lucky_money', 3, card.ability.extra.dollars_odds) then
                card.lucky_trigger = true
                ret.dollars = card.ability.extra.dollars
            end
            return ret
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- Mother is watching.
SMODS.Consumable {
    key = 'yma_high_priestess_level1',
    set = 'Tarot',
    pos = { x = 2, y = 0 },
    config = { extra = { planets = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.planets } }
    end,
    use = function(self, card, area, copier)
        local _planet, _hand, _tally = nil, nil, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                _hand = handname
                _tally = G.GAME.hands[handname].played
            end
        end
        if _hand then
            for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        for i = 1, math.min(card.ability.extra.planets - 1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet' })
                        card:juice_up(0.3, 0.5)
                    end
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', key = _planet })
                        card:juice_up(0.3, 0.5)
                    end
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_high_priestess_level2',
    set = 'Tarot',
    pos = { x = 2, y = 0 },
    config = { extra = { planets = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.planets } }
    end,
    use = function(self, card, area, copier)
        local _planet, _hand, _tally = nil, nil, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                _hand = handname
                _tally = G.GAME.hands[handname].played
            end
        end
        if _hand then
            for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        for i = 1, math.min(card.ability.extra.planets - 2, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet' })
                        card:juice_up(0.3, 0.5)
                    end
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', key = _planet })
                        card:juice_up(0.3, 0.5)
                    end
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet' })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards - 1 < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_high_priestess_level3',
    set = 'Tarot',
    pos = { x = 2, y = 0 },
    config = { extra = { planets = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.planets } }
    end,
    use = function(self, card, area, copier)
        local _planet, _hand, _tally = nil, nil, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                _hand = handname
                _tally = G.GAME.hands[handname].played
            end
        end
        if _hand then
            for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        for i = 1, math.min(card.ability.extra.planets - 2, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', key = _planet })
                        card:juice_up(0.3, 0.5)
                    end
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
                        play_sound('timpani')
                        SMODS.add_card({ set = 'Planet', key = _planet })
                        card:juice_up(0.3, 0.5)
                    end
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet' })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards - 1 < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_high_priestess_level4',
    set = 'Tarot',
    pos = { x = 2, y = 0 },
    config = { extra = { planets = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.planets } }
    end,
    use = function(self, card, area, copier)
        local _planet, _hand, _tally = nil, nil, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                _hand = handname
                _tally = G.GAME.hands[handname].played
            end
        end
        if _hand then
            for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        for i = 1, math.min(card.ability.extra.planets - 2, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet', key = _planet, edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet', key = _planet, edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet', edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards - 1 < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_high_priestess_level5',
    set = 'Tarot',
    pos = { x = 2, y = 0 },
    config = { extra = { planets = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.planets } }
    end,
    use = function(self, card, area, copier)
        local _planet, _hand, _tally = nil, nil, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                _hand = handname
                _tally = G.GAME.hands[handname].played
            end
        end
        if _hand then
            for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _hand then
                    _planet = v.key
                end
            end
        end
        for i = 1, math.min(card.ability.extra.planets - 2, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet', key = _planet, edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet', key = _planet, edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Planet', key = _planet, edition = "e_negative" })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.consumeables and #G.consumeables.cards - 1 < G.consumeables.config.card_limit or
            (card.area == G.consumeables)
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- this empresses me
SMODS.Consumable {
    key = 'yma_empress_level1',
    set = 'Tarot',
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_mult' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_empress_level2',
    set = 'Tarot',
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_mult' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_empress_level3',
    set = 'Tarot',
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_mult' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_empress_level4',
    set = 'Tarot',
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_cbean_yma_mult_1' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_empress_level5',
    set = 'Tarot',
    pos = { x = 3, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_cbean_yma_mult_2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}
-- mult cards for empress
SMODS.Enhancement {
    key = 'yma_mult_1',
    pos = { x = 2, y = 1 },
    config = { mult = 8 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Enhancement {
    key = 'yma_mult_2',
    pos = { x = 2, y = 1 },
    config = { mult = 8 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local current_mult = mult
            return {
                mult = current_mult
            }
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- this world needs a heiro(phant)
SMODS.Consumable {
    key = 'yma_heirophant_level1',
    set = 'Tarot',
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_bonus' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_heirophant_level2',
    set = 'Tarot',
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_bonus' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_heirophant_level3',
    set = 'Tarot',
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_bonus' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_heirophant_level4',
    set = 'Tarot',
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_cbean_yma_bonus_1' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_heirophant_level5',
    set = 'Tarot',
    pos = { x = 5, y = 0 },
    config = { max_highlighted = 5, mod_conv = 'm_cbean_yma_bonus_2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}
-- bonus cards for heirophant
SMODS.Enhancement {
    key = 'yma_bonus_1',
    pos = { x = 1, y = 1 },
    config = { bonus = 50 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Enhancement {
    key = 'yma_bonus_2',
    pos = { x = 1, y = 1 },
    config = { bonus = 50 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local current_chips = hand_chips
            return {
                chip = current_chips
            }
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- the king's chariot cannot be stopped
SMODS.Consumable {
    key = 'yma_chariot_level1',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_chariot_level2',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_chariot_level3',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_chariot_level4',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_cbean_yma_steel_1' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_chariot_level5',
    set = 'Tarot',
    pos = { x = 7, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_cbean_yma_steel_2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- steel cards for the chariot upgrades
SMODS.Enhancement {
    key = 'yma_steel_1',
    pos = { x = 6, y = 1 },
    config = { h_x_mult = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Enhancement {
    key = 'yma_steel_2',
    pos = { x = 6, y = 1 },
    config = { h_x_mult = 2, x_mult = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.h_x_mult, card.ability.x_mult } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- just ice
SMODS.Consumable {
    key = 'yma_justice_level1',
    set = 'Tarot',
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_justice_level2',
    set = 'Tarot',
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 3, mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_justice_level3',
    set = 'Tarot',
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_justice_level4',
    set = 'Tarot',
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_cbean_yma_glass_1' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_justice_level5',
    set = 'Tarot',
    pos = { x = 8, y = 0 },
    config = { max_highlighted = 4, mod_conv = 'm_cbean_yma_glass_2' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- glass cards for justice
SMODS.Enhancement {
    key = 'yma_glass_1',
    pos = { x = 5, y = 1 },
    config = { Xmult = 2, extra = { odds = 8 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_glass')
        return { vars = { card.ability.Xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'vremade_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Enhancement {
    key = 'yma_glass_2',
    pos = { x = 5, y = 1 },
    config = { Xmult = 3, extra = { odds = 8 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_glass')
        return { vars = { card.ability.Xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and
            SMODS.pseudorandom_probability(card, 'vremade_glass', 1, card.ability.extra.odds) then
            card.glass_trigger = true -- SMODS addition
            return { remove = true }
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- money generator
SMODS.Consumable {
    key = 'yma_hermit_level1',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 20, dollars = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max, card.ability.extra.dollars } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_hermit_level2',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 30, dollars = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_hermit_level3',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 30, dollars = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_hermit_level4',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 50, dollars = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_hermit_level5',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 50, dollars = 10 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.max } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.dollars, true)
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(math.max(0, math.min(G.GAME.dollars * 2, card.ability.extra.max)), true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- that fucking wheel
SMODS.Consumable {
    key = 'yma_wheel_of_fortune_level1',
    set = 'Tarot',
    pos = { x = 0, y = 1 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds,
            'wheel_of_fortune')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'wheel_of_fortune', 2, card.ability.extra.odds) then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

            local eligible_card = pseudorandom_element(editionless_jokers, 'wheel_of_fortune')
            local edition = poll_edition('wheel_of_fortune', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil' })
            eligible_card:set_edition(edition, true)
            check_for_unlock({ type = 'have_edition' })
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wheel_of_fortune_level2',
    set = 'Tarot',
    pos = { x = 0, y = 1 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 3, card.ability.extra.odds,
            'wheel_of_fortune')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        if SMODS.pseudorandom_probability(card, 'wheel_of_fortune', 3, card.ability.extra.odds) then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

            local eligible_card = pseudorandom_element(editionless_jokers, 'wheel_of_fortune')
            local edition = poll_edition('wheel_of_fortune', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil' })
            eligible_card:set_edition(edition, true)
            check_for_unlock({ type = 'have_edition' })
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wheel_of_fortune_level3',
    set = 'Tarot',
    pos = { x = 0, y = 1 },
    config = { extra = { } },
    loc_vars = function(self, info_queue, card)
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        local eligible_card = pseudorandom_element(editionless_jokers, 'wheel_of_fortune')
        local edition = poll_edition('wheel_of_fortune', nil, true, true,
            { 'e_polychrome', 'e_holo', 'e_foil' })
        eligible_card:set_edition(edition, true)
        check_for_unlock({ type = 'have_edition' })
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wheel_of_fortune_level4',
    set = 'Tarot',
    pos = { x = 0, y = 1 },
    config = { extra = { } },
    loc_vars = function(self, info_queue, card)
    end,
    use = function(self, card, area, copier)
        local edition = poll_edition('wheel_of_fortune', nil, true, true,
            { 'e_polychrome', 'e_holo', 'e_foil' })
        G.jokers.highlighted[1]:set_edition(edition, true)
        check_for_unlock({ type = 'have_edition' })
    end,
    can_use = function(self, card)
        return #G.jokers.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wheel_of_fortune_level5',
    set = 'Tarot',
    pos = { x = 0, y = 1 },
    config = { extra = { } },
    loc_vars = function(self, info_queue, card)
    end,
    use = function(self, card, area, copier)
        local edition = poll_edition('wheel_of_fortune', nil, true, true, G.P_CENTER_POOLS.edition)
        G.jokers.highlighted[1]:set_edition(edition, true)
        check_for_unlock({ type = 'have_edition' })
    end,
    can_use = function(self, card)
        return #G.jokers.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- le star
SMODS.Consumable {
    key = 'yma_star_level1',
    set = 'Tarot',
    pos = { x = 7, y = 1 },
    config = { max_highlighted = 4, suit_conv = 'Diamonds' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_star_level2',
    set = 'Tarot',
    pos = { x = 7, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Diamonds' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_star_level3',
    set = 'Tarot',
    pos = { x = 7, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Diamonds', mod_conv = 'm_gold' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_star_level4',
    set = 'Tarot',
    pos = { x = 7, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Diamonds', mod_conv = 'm_gold' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Blue', nil, true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_star_level5',
    set = 'Tarot',
    pos = { x = 7, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Diamonds', mod_conv = 'm_gold' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Blue', nil, true)
                    conv_card:set_edition('e_negative', true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}



-- we stealin da moon
SMODS.Consumable {
    key = 'yma_moon_level1',
    set = 'Tarot',
    pos = { x = 8, y = 1 },
    config = { max_highlighted = 4, suit_conv = 'Clubs' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_moon_level2',
    set = 'Tarot',
    pos = { x = 8, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Clubs' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_moon_level3',
    set = 'Tarot',
    pos = { x = 8, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Clubs', mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_moon_level4',
    set = 'Tarot',
    pos = { x = 8, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Clubs', mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Purple', nil, true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_moon_level5',
    set = 'Tarot',
    pos = { x = 8, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Clubs', mod_conv = 'm_glass' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Purple', nil, true)
                    conv_card:set_edition('e_foil', true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


-- the sun is leaking
SMODS.Consumable {
    key = 'yma_sun_level1',
    set = 'Tarot',
    pos = { x = 9, y = 1 },
    config = { max_highlighted = 4, suit_conv = 'Hearts' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_sun_level2',
    set = 'Tarot',
    pos = { x = 9, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Hearts' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_sun_level3',
    set = 'Tarot',
    pos = { x = 9, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Hearts', mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_sun_level4',
    set = 'Tarot',
    pos = { x = 9, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Hearts', mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Red', nil, true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_sun_level5',
    set = 'Tarot',
    pos = { x = 9, y = 1 },
    config = { max_highlighted = 5, suit_conv = 'Hearts', mod_conv = 'm_steel' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Red', nil, true)
                    conv_card:set_edition('e_polychrome', true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


-- za warudo
SMODS.Consumable {
    key = 'yma_world_level1',
    set = 'Tarot',
    pos = { x = 1, y = 2 },
    config = { max_highlighted = 4, suit_conv = 'Spades' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_world_level2',
    set = 'Tarot',
    pos = { x = 1, y = 2 },
    config = { max_highlighted = 5, suit_conv = 'Spades' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_world_level3',
    set = 'Tarot',
    pos = { x = 1, y = 2 },
    config = { max_highlighted = 5, suit_conv = 'Spades', mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_world_level4',
    set = 'Tarot',
    pos = { x = 1, y = 2 },
    config = { max_highlighted = 5, suit_conv = 'Spades', mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Gold', nil, true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_world_level5',
    set = 'Tarot',
    pos = { x = 1, y = 2 },
    config = { max_highlighted = 5, suit_conv = 'Spades', mod_conv = 'm_lucky' },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted, localize(card.ability.suit_conv, 'suits_plural'), colours = { G.C.SUITS[card.ability.suit_conv] }, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.max_highlighted do
            local conv_card = G.hand.highlighted[i]
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    conv_card:set_seal('Gold', nil, true)
                    conv_card:set_edition('e_holo', true)
                    return true
                end
            }))

            delay(0.5)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- JUUUUDGEMENT!
SMODS.Consumable {
    key = 'yma_judgement_level1',
    set = 'Tarot',
    pos = { x = 0, y = 2 },
    config = { extra = { odds = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'vremade_glass')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                if SMODS.pseudorandom_probability(card, 'judgement_level1', 1, card.ability.extra.odds) then
                    add_tag(Tag("buffoon"))
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_judgement_level2',
    set = 'Tarot',
    pos = { x = 0, y = 2 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                add_tag(Tag("buffoon"))
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_judgement_level3',
    set = 'Tarot',
    pos = { x = 0, y = 2 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                add_tag(Tag("buffoon"))
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_judgement_level4',
    set = 'Tarot',
    pos = { x = 0, y = 2 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'judgement_level4')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local rarities = {}
        for i=1, #G.P_JOKER_RARITY_POOLS do
            if G.P_JOKER_RARITY_POOLS[i] ~= 1 then
                rarities = rarities + G.P_JOKER_RARITY_POOLS[i]
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                if SMODS.pseudorandom_probability(card, 'judgement_level4', 1, card.ability.extra.odds) then
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Joker', rarity = rarities[math.random(1, #rarities)] })
                    card:juice_up(0.3, 0.5)
                end
                add_tag(Tag("buffoon"))
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_judgement_level5',
    set = 'Tarot',
    pos = { x = 0, y = 2 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'judgement_level5')
        return { vars = { numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local rarities = {}
        for i=1, #G.P_JOKER_RARITY_POOLS do
            if G.P_JOKER_RARITY_POOLS[i] ~= 1 then
                rarities = rarities + G.P_JOKER_RARITY_POOLS[i]
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker' })
                card:juice_up(0.3, 0.5)
                if SMODS.pseudorandom_probability(card, 'judgement_level5', 2, card.ability.extra.odds) then
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Joker', rarity = rarities[math.random(1, #rarities)] })
                    card:juice_up(0.3, 0.5)
                end
                add_tag(Tag("buffoon"))
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- warth
SMODS.Consumable {
    key = 'yma_wraith_level1',
    set = 'Spectral',
    pos = { x = 5, y = 4 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                card:juice_up(0.3, 0.5)
                ease_dollars(-G.GAME.dollars + 10, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wraith_level2',
    set = 'Spectral',
    pos = { x = 5, y = 4 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1) 
                local edition = poll_edition('wheel_of_fortune', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                card1:set_edition(edition, true)
                card:juice_up(0.3, 0.5)
                ease_dollars(-G.GAME.dollars + 10, true)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wraith_level3',
    set = 'Spectral',
    pos = { x = 5, y = 4 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1)
                local edition = poll_edition('wheel_of_fortune', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                card1:set_edition(edition, true)
                card:juice_up(0.3, 0.5)
                ease_dollars(-G.GAME.dollars + 10, true)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1) 
                card1:set_edition({ negative = true })
                card1.ability.perishable = true
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wraith_level4',
    set = 'Spectral',
    pos = { x = 5, y = 4 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1)
                local edition = poll_edition('wheel_of_fortune', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                card1:set_edition(edition, true)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1) 
                card1:set_edition({ negative = true })
                card1.ability.perishable = true
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or card.area == G.jokers
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_wraith_level5',
    set = 'Spectral',
    pos = { x = 5, y = 4 },
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1)
                card1:set_edition({ negative = true })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
	            local card1 = create_card("Joker", G.jokers, nil, 3, nil, nil, nil)
	            card1:add_to_deck()
	            card1:start_materialize()
	            G.jokers:emplace(card1) 
                card1:set_edition({ negative = true })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- ecto my plasms
SMODS.Consumable {
    key = 'yma_ectoplasm_level1',
    set = 'Spectral',
    pos = { x = 8, y = 4 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { G.GAME.ecto_minus - 1 or 1 } }
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local eligible_card = pseudorandom_element(editionless_jokers, 'ectoplasm')
                eligible_card:set_edition({ negative = true })

                G.GAME.ecto_minus = G.GAME.ecto_minus or 1
                G.hand:change_size(-G.GAME.ecto_minus + 1)
                G.GAME.ecto_minus = G.GAME.ecto_minus + 1

                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_ectoplasm_level2',
    set = 'Spectral',
    pos = { x = 8, y = 4 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { G.GAME.ecto_minus - 1 or 1 } }
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local eligible_card = pseudorandom_element(editionless_jokers, 'ectoplasm')
                eligible_card:set_edition({ negative = true })

                G.GAME.ecto_minus = G.GAME.ecto_minus or 1
                G.hand:change_size(-G.GAME.ecto_minus + 1)
                G.GAME.ecto_minus = G.GAME.ecto_minus + 1
                if #G.consumeables.cards >= 1 then G.consumeables.cards[math.random(1, #G.consumeables.cards)]:set_edition("e_negative", true) end

                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_ectoplasm_level3',
    set = 'Spectral',
    pos = { x = 8, y = 4 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { G.GAME.ecto_minus - 1 or 1 } }
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local eligible_card = pseudorandom_element(editionless_jokers, 'ectoplasm')
                eligible_card:set_edition({ negative = true })

                G.GAME.ecto_minus = G.GAME.ecto_minus or 1
                G.hand:change_size(-G.GAME.ecto_minus + 1)
                G.GAME.ecto_minus = G.GAME.ecto_minus + 1
                if #G.consumeables.cards >= 1 then G.consumeables.cards[math.random(1, #G.consumeables.cards)]:set_edition("e_negative", true) end
                for i = 1, 3 do
                    G.deck.cards[math.random(1, #G.deck.cards)]:set_edition("e_negative", true)
                end

                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_ectoplasm_level4',
    set = 'Spectral',
    pos = { x = 8, y = 4 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { G.GAME.ecto_minus - 1 or 1 } }
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                G.jokers.highlighted[1]:set_edition({ negative = true })
                if #G.consumeables.cards >= 1 then G.consumeables.cards[math.random(1, #G.consumeables.cards)]:set_edition("e_negative", true) end
                for i = 1, 3 do
                    G.deck.cards[math.random(1, #G.deck.cards)]:set_edition("e_negative", true)
                end
                G.GAME.ecto_minus = G.GAME.ecto_minus or 1
                G.hand:change_size(-G.GAME.ecto_minus + 1)
                G.GAME.ecto_minus = G.GAME.ecto_minus + 1

                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return #G.jokers.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_ectoplasm_level5',
    set = 'Spectral',
    pos = { x = 8, y = 4 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
        return { vars = { } }
    end,
    use = function(self, card, area, copier)
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                G.jokers.highlighted[1]:set_edition({ negative = true })
                if #G.consumeables.cards >= 1 then G.consumeables.cards[math.random(1, #G.consumeables.cards)]:set_edition("e_negative", true) end
                for i = 1, 3 do
                    G.deck.cards[math.random(1, #G.deck.cards)]:set_edition("e_negative", true)
                    G.hand.cards[math.random(1, #G.hand.cards)]:set_edition("e_negative", true)
                end
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end,
    can_use = function(self, card)
        return #G.jokers.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}