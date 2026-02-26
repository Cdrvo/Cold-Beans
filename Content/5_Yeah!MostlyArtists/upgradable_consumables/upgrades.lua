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
            if G.GAME.hands[_hand].cb_house_rules then
                _planet = "c_cbean_0chill_house_rules_planet"
            end
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
            if G.GAME.hands[_hand].cb_house_rules then
                _planet = "c_cbean_0chill_house_rules_planet"
            end
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
            if G.GAME.hands[_hand].cb_house_rules then
                _planet = "c_cbean_0chill_house_rules_planet"
            end
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
            if G.GAME.hands[_hand].cb_house_rules then
                _planet = "c_cbean_0chill_house_rules_planet"
            end
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
            if G.GAME.hands[_hand].cb_house_rules then
                _planet = "c_cbean_0chill_house_rules_planet"
            end
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
    key = 'yma_hermit_level3',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 30, dollars = 10 } },
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
    key = 'yma_hermit_level4',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 50, dollars = 10 } },
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
    key = 'yma_hermit_level5',
    set = 'Tarot',
    pos = { x = 9, y = 0 },
    config = { extra = { max = 50, dollars = 10 } },
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
            local list = { 'e_polychrome', 'e_holo', 'e_foil' };
            if card.ability.cbean_colon_tauic then
                list[#list+1] = "e_negative"
            end
            local edition = poll_edition('wheel_of_fortune', nil, false, true, list)
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
            local list = { 'e_polychrome', 'e_holo', 'e_foil' };
            if card.ability.cbean_colon_tauic then
                list[#list+1] = "e_negative"
            end
            local edition = poll_edition('wheel_of_fortune', nil, false, true, list)
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
        local list = { 'e_polychrome', 'e_holo', 'e_foil' };
        if card.ability.cbean_colon_tauic then
            list[#list+1] = "e_negative"
        end
        local edition = poll_edition('wheel_of_fortune', nil, false, true, list)
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
        local list = { 'e_polychrome', 'e_holo', 'e_foil' };
        if card.ability.cbean_colon_tauic then
            list[#list+1] = "e_negative"
        end
        local edition = poll_edition('wheel_of_fortune', nil, false, true, list)
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
        local edition = poll_edition('wheel_of_fortune', nil, not card.ability.cbean_colon_tauic, true)
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

-- this looks rather familiar doesnt it
SMODS.Consumable {
    key = 'yma_familiar_level1',
    set = 'Spectral',
    pos = { x = 0, y = 4 },
    config = { extra = { destroy = 1, cards = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local faces = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank.face then table.insert(faces, rank) end
                    end
                    local _rank = pseudorandom_element(faces, 'familiar_level1').card_key
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_familiar_level2',
    set = 'Spectral',
    pos = { x = 0, y = 4 },
    config = { extra = { destroy = 1, cards = 4, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'familiar_level2')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank.face then table.insert(faces, rank) end
                    end
                    local _rank = pseudorandom_element(faces, 'familiar_level1').card_key
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'familiar_level2'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                    if SMODS.pseudorandom_probability(card, 'familiar_level2', 1, card.ability.extra.odds) then
                        cards[i]:set_seal(seal, nil, true)
                    end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_familiar_level3',
    set = 'Spectral',
    pos = { x = 0, y = 4 },
    config = { extra = { destroy = 1, cards = 4, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'familiar_level3')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank.face then table.insert(faces, rank) end
                    end
                    local _rank = pseudorandom_element(faces, 'familiar_level1').card_key
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'familiar_level3'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'familiar_level3', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'familiar_level3', 1, card.ability.extra.odds) then
                local edition = poll_edition('wraith_level4', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_familiar_level4',
    set = 'Spectral',
    pos = { x = 0, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'familiar_level4')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank.face then table.insert(faces, rank) end
                    end
                    local _rank = pseudorandom_element(faces, 'familiar_level1').card_key
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'familiar_level4'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'familiar_level4', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'familiar_level4', 1, card.ability.extra.odds) then
                local edition = poll_edition('familiar_level4', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}



SMODS.Consumable {
    key = 'yma_familiar_level5',
    set = 'Spectral',
    pos = { x = 0, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'familiar_level5')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank.face then table.insert(faces, rank) end
                    end
                    local _rank = pseudorandom_element(faces, 'familiar_level1').card_key
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'familiar_level5'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'familiar_level5', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'familiar_level5', 1, card.ability.extra.odds) then
                local edition = poll_edition('familiar_level5', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- shits looking very grim these days
SMODS.Consumable {
    key = 'yma_grim_level1',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    config = { extra = { destroy = 1, cards = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = 'Ace', enhancement = enhancement.key }
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_grim_level2',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    config = { extra = { destroy = 1, cards = 3, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'grim_level2')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'grim_level2'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = 'Ace', enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'grim_level2', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_grim_level3',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    config = { extra = { destroy = 1, cards = 3, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'grim_level3')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'grim_level3'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = 'Ace', enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'grim_level3', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'grim_level3', 1, card.ability.extra.odds) then
                local edition = poll_edition('wraith_level4', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_grim_level4',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'grim_level4')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'grim_level4'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = 'Ace', enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'grim_level4', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'grim_level4', 1, card.ability.extra.odds) then
                local edition = poll_edition('grim_level4', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}



SMODS.Consumable {
    key = 'yma_grim_level5',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'grim_level5')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'grim_level5'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = 'Ace', enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'grim_level5', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'grim_level5', 1, card.ability.extra.odds) then
                local edition = poll_edition('grim_level5', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                end
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


-- i cant think of anything with incantation im sorry
SMODS.Consumable {
    key = 'yma_incantation_level1',
    set = 'Spectral',
    pos = { x = 2, y = 4 },
    config = { extra = { destroy = 1, cards = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank_key ~= 'Ace' and not rank.face then table.insert(numbers, rank) end
                    end
                    local _rank = pseudorandom_element(numbers, 'incantation_create').card_key
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_incantation_level2',
    set = 'Spectral',
    pos = { x = 2, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'incantation_level2')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank_key ~= 'Ace' and not rank.face then table.insert(numbers, rank) end
                    end
                    local _rank = pseudorandom_element(numbers, 'incantation_create').card_key
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'incantation_level2'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'incantation_level2', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_incantation_level3',
    set = 'Spectral',
    pos = { x = 2, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'incantation_level3')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = pseudorandom_element(G.hand.cards, 'random_destroy')
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        if rank_key ~= 'Ace' and not rank.face then table.insert(numbers, rank) end
                    end
                    local _rank = pseudorandom_element(numbers, 'incantation_create').card_key
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'incantation_level3'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'incantation_level3', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'incantation_level3', 1, card.ability.extra.odds) then
                local edition = poll_edition('wraith_level4', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_incantation_level4',
    set = 'Spectral',
    pos = { x = 2, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'incantation_level4')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                    local rank = SMODS.Ranks[rank_key]
                    if rank_key ~= 'Ace' and not rank.face then table.insert(numbers, rank) end
                end
                local _rank = pseudorandom_element(numbers, 'incantation_create').card_key
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'incantation_level4'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'incantation_level4', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'incantation_level4', 1, card.ability.extra.odds) then
                local edition = poll_edition('incantation_level4', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}



SMODS.Consumable {
    key = 'yma_incantation_level5',
    set = 'Spectral',
    pos = { x = 2, y = 4 },
    config = { extra = { destroy = 1, cards = 5, odds = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'incantation_level5')
        return { vars = { card.ability.extra.destroy, card.ability.extra.cards, numerator, denominator } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        local card_to_destroy = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(card_to_destroy)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.7,
            func = function()
                local cards = {}
                for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                    local rank = SMODS.Ranks[rank_key]
                    if rank_key ~= 'Ace' and not rank.face then table.insert(numbers, rank) end
                end
                local _rank = pseudorandom_element(numbers, 'incantation_create').card_key
                for i = 1, card.ability.extra.cards do
                    local cen_pool = {}
                    local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'incantation_level5'})
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    local enhancement = pseudorandom_element(cen_pool, 'spe_card')
                    cards[i] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
                if SMODS.pseudorandom_probability(card, 'incantation_level5', 1, card.ability.extra.odds) then
                    cards[i]:set_seal(seal, nil, true)
                end
                if SMODS.pseudorandom_probability(card, 'incantation_level5', 1, card.ability.extra.odds) then
                local edition = poll_edition('incantation_level5', nil, true, true,
                { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' })
                    cards[i]:set_edition(edition, true)
                end
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- just like the hit balatro mod that is incompatible with every mod ever
SMODS.Consumable {
    key = 'yma_talisman_level1',
    set = 'Spectral',
    pos = { x = 3, y = 4 },
    config = { extra = { seal = 'Gold' }, max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        for i=1, #G.hand.highlighted do
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
                    conv_card:set_seal(card.ability.extra.seal, nil, true)
                    return true
                end
            }))

            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_talisman_level2',
    set = 'Spectral',
    pos = { x = 3, y = 4 },
    config = { extra = { seal = 'Gold', retriggers = 1 }, max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                repetition = card.ability.extra.retriggers
            end
        end
    end,
    use = function(self, card, area, copier)
        for i=1, #G.hand.highlighted do
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
                    conv_card:set_seal(card.ability.extra.seal, nil, true)
                    return true
                end
            }))

            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_talisman_level3',
    set = 'Spectral',
    pos = { x = 3, y = 4 },
    config = { extra = { seal = 'Gold', retriggers = 1 }, max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    calculate = function(self, card, context)
        local gold_seals = 0
        for k, v in ipairs(G.deck.cards) do
            if v.seal == "Gold" then
                gold_seals = gold_seals + 1
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                ease_dollars(gold_seals)
            end
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                repetition = card.ability.extra.retriggers
            end
        end
    end,
    use = function(self, card, area, copier)
        for i=1, #G.hand.highlighted do
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
                    conv_card:set_seal(card.ability.extra.seal, nil, true)
                    return true
                end
            }))

            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_talisman_level4',
    set = 'Spectral',
    pos = { x = 3, y = 4 },
    config = { extra = { seal = 'Gold', retriggers = 1 }, max_highlighted = 3 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    calculate = function(self, card, context)
        local gold_seals = 0
        for k, v in ipairs(G.deck.cards) do
            if v.seal == "Gold" then
                gold_seals = gold_seals + 1
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                ease_dollars(gold_seals)
            end
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                repetition = card.ability.extra.retriggers
            end
        end
    end,
    use = function(self, card, area, copier)
        for i=1, #G.hand.highlighted do
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
                    conv_card:set_seal(card.ability.extra.seal, nil, true)
                    return true
                end
            }))

            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_talisman_level5',
    set = 'Spectral',
    pos = { x = 3, y = 4 },
    config = { extra = { seal = 'Gold', retriggers = 1 }, max_highlighted = 3 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    calculate = function(self, card, context)
        local gold_seals = 0
        local gold_seals_not_played = 0
        for k, v in ipairs(G.deck.cards) do
            if v.seal == "Gold" then
                gold_seals = gold_seals + 1
            end
        end
        for k, v in ipairs(G.deck.cards) do
            for i=1, #G.play.cards do
                if v.seal == "Gold" and v ~= G.play.cards[i] then
                    gold_seals_not_played = gold_seals_not_played + 1
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                ease_dollars(gold_seals)
            end
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card.seal == "Gold" then
                repetition = card.ability.extra.retriggers
            end
        end
        if context.final_scoring_step and context.cardarea == G.consumeables then
            ease_dollars(6 * (gold_seals_not_played))
        end
    end,
    use = function(self, card, area, copier)
        for i=1, #G.hand.highlighted do
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
                    conv_card:set_seal(card.ability.extra.seal, nil, true)
                    return true
                end
            }))

            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
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
                local edition = poll_edition('wraith_level2', nil, true, true,
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
                local edition = poll_edition('wraith_level3', nil, true, true,
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
                local edition = poll_edition('wraith_level4', nil, true, true,
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

-- we summonin da sigil w this one
SMODS.Consumable {
    key = 'yma_sigil_level1',
    set = 'Spectral',
    pos = { x = 6, y = 4 },
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_sigil_level2',
    set = 'Spectral',
    pos = { x = 6, y = 4 },
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        local cen_pool = {}
        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                cen_pool[#cen_pool + 1] = enhancement_center
            end
        end
        local enhancement = pseudorandom_element(cen_pool, 'spe_card')
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    _card:set_ability(enhancement)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_sigil_level3',
    set = 'Spectral',
    pos = { x = 6, y = 4 },
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        local cen_pool = {}
        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                cen_pool[#cen_pool + 1] = enhancement_center
            end
        end
        local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'sigil_level3'})
        local enhancement = pseudorandom_element(cen_pool, 'spe_card')
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    _card:set_ability(enhancement)
                    _card:set_seal(seal, nil, true)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_sigil_level4',
    set = 'Spectral',
    pos = { x = 6, y = 4 },
    config = { cards = 10 },
    use = function(self, card, area, copier)
        local cards_to_convert = {}
        for i = 1, card.ability.cards do
            if G.deck.cards[i] ~= G.hand.highlighted[1].base.suit then
                cards_to_convert = cards_to_convert + v
            end
        end
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        local cen_pool = {}
        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                cen_pool[#cen_pool + 1] = enhancement_center
            end
        end
        local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'sigil_level3'})
        local enhancement = pseudorandom_element(cen_pool, 'spe_card')
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    _card:set_ability(enhancement)
                    _card:set_seal(seal, nil, true)
                    return true
                end
            }))
        end
        for i = 1, #cards_to_convert do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = cards_to_convert[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    _card:set_ability(enhancement)
                    _card:set_seal(seal, nil, true)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}


SMODS.Consumable {
    key = 'yma_sigil_level5',
    set = 'Spectral',
    pos = { x = 6, y = 4 },
    config = { cards = 10 },
    use = function(self, card, area, copier)
        local cards_to_convert = {}
        for i = 1, card.ability.cards do
            if G.deck.cards[i] ~= G.hand.highlighted[1].base.suit then
                cards_to_convert = cards_to_convert + v
            end
        end
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        local cen_pool = {}
        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                cen_pool[#cen_pool + 1] = enhancement_center
            end
        end
        local seal = SMODS.poll_seal({ guaranteed = true, type_key = 'sigil_level3'})
        local edition = SMODS.poll_edition({ guaranteed = true, type_key = 'sigil_level3'})
        local enhancement = pseudorandom_element(cen_pool, 'spe_card')
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    _card:set_ability(enhancement)
                    _card:set_seal(seal, nil, true)
                    _card:set_edition(edition, nil, true)
                    return true
                end
            }))
        end
        for i = 1, #cards_to_convert do
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = cards_to_convert[i]
                    assert(SMODS.change_base(_card, G.hand.highlighted[1].base.suit))
                    _card:set_ability(enhancement)
                    _card:set_seal(seal, nil, true)
                    _card:set_edition(edition, nil, true)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1
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

-- Deal 21 damage to ALL enemies. Add a burn to your discard pile.
SMODS.Consumable {
    key = 'yma_immolate_level1',
    set = 'Spectral',
    pos = { x = 9, y = 4 },
    config = { extra = { destroy = 4, dollars = 20, max_highlighted = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.dollars, card.ability.extra.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, 'immolate')

        for i = 1, card.ability.extra.destroy do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        delay(0.5)
        ease_dollars(card.ability.extra.dollars)
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_immolate_level2',
    set = 'Spectral',
    pos = { x = 9, y = 4 },
    config = { extra = { destroy = 2, dollars = 20, max_highlighted = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.dollars, card.ability.extra.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, 'immolate')

        for i = 1, card.ability.extra.destroy do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        delay(0.5)
        ease_dollars(card.ability.extra.dollars)
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 3
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_immolate_level3',
    set = 'Spectral',
    pos = { x = 9, y = 4 },
    config = { extra = { destroy = 2, dollars = 40, max_highlighted = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy, card.ability.extra.dollars, card.ability.extra.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}

        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, 'immolate')

        for i = 1, card.ability.extra.destroy do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        delay(0.5)
        ease_dollars(card.ability.extra.dollars)
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.hand.highlighted == 3
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_immolate_level4',
    set = 'Spectral',
    pos = { x = 9, y = 4 },
    config = { extra = { dollars = 40, max_highlighted = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        delay(0.5)
        ease_dollars(card.ability.extra.dollars)
        delay(0.3)
    end,
    can_use = function(self, card)
        return #G.hand.highlighted == 5
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_immolate_level5',
    set = 'Spectral',
    pos = { x = 9, y = 4 },
    config = { extra = { dollars = 40, max_highlighted = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, card.ability.extra.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        SMODS.destroy_cards(destroyed_cards)
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end
        delay(0.5)
        ease_dollars(card.ability.extra.dollars)
        delay(0.3)
    end,
    can_use = function(self, card)
        return #G.hand.highlighted >= 1
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

-- le soule
SMODS.Consumable {
    key = 'yma_soul_level1',
    set = 'Spectral',
    pos = { x = 2, y = 2 },
    hidden = true,
    soul_set = 'Tarot',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local legendary = SMODS.add_card({ set = 'Joker', legendary = true })
                legendary.ability.extra_value = card.ability.extra_value * 2.5
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
    key = 'yma_soul_level2',
    set = 'Spectral',
    pos = { x = 2, y = 2 },
    hidden = true,
    soul_set = 'Tarot',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local legendary = SMODS.add_card({ set = 'Joker', legendary = true, edition = poll_edition('soul_level2', nil, true, true, { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' }) })
                legendary.ability.extra_value = card.ability.extra_value * 2.5
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
    key = 'yma_soul_level3',
    set = 'Spectral',
    pos = { x = 2, y = 2 },
    hidden = true,
    soul_set = 'Tarot',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local legendary = SMODS.add_card({ set = 'Joker', legendary = true, edition = poll_edition('soul_level2', nil, true, true, { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative' }) })
                legendary.ability.extra_value = card.ability.extra_value * 2.5
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

SMODS.Consumable {
    key = 'yma_soul_level4',
    set = 'Spectral',
    pos = { x = 2, y = 2 },
    hidden = true,
    soul_set = 'Tarot',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local legendary = SMODS.add_card({ set = 'Joker', legendary = true, edition = 'e_negative' })
                legendary.ability.extra_value = card.ability.extra_value * 2.5
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

SMODS.Consumable {
    key = 'yma_soul_level5',
    set = 'Spectral',
    pos = { x = 2, y = 2 },
    hidden = true,
    soul_set = 'Tarot',
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                local legendary = SMODS.add_card({ set = 'Joker', legendary = true, edition = 'e_negative' })
                legendary.ability.extra_value = card.ability.extra_value * 2.5
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
        if math.random(0, 1) > 0.5 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local legendary = SMODS.add_card({ set = 'Joker', rarity = 'Rare', edition = 'e_negative' })
                    legendary.ability.extra_value = card.ability.extra_value * 2.5
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
        else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    local legendary = SMODS.add_card({ set = 'Joker', legendary = true, edition = 'e_negative' })
                    legendary.ability.extra_value = card.ability.extra_value * 2.5
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    can_use = function(self, card)
        return true
    end,
    no_collection = true,
}

SMODS.DrawStep {
    key = 'yma_soul',
    order = 50,
    func = function(card)
        if (card.config.center.key == "c_cbean_yma_soul_level1" or card.config.center.key == "c_cbean_yma_soul_level2" or
        card.config.center.key == "c_cbean_yma_soul_level3" or card.config.center.key == "c_cbean_yma_soul_level4" or
        card.config.center.key == "c_cbean_yma_soul_level5") and (card.config.center.discovered or card.bypass_discovery_center) then
            local scale_mod = 0.05 + 0.05 * math.sin(1.8 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL) +
                0.07 * math.sin((G.TIMERS.REAL) * math.pi * 5) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

            G.shared_soul.role.draw_major = card
            G.shared_soul:draw_shader('dissolve', 0, nil, nil, card.children.center, scale_mod, rotate_mod, nil,
                0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL), nil, 0.6)
            G.shared_soul:draw_shader('dissolve', nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}

-- this hole is black
SMODS.Consumable {
    key = 'yma_black_hole_level1',
    set = 'Spectral',
    pos = { x = 9, y = 3 },
    hidden = true,
    soul_set = 'Planet',
    use = function(self, card, area, copier)
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+2' })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.level = poker_hand_key.level + 2
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
    draw = function(self, card, layer)
        -- This is for the Spectral shader. You don't need this with `set = "Spectral"`
        -- Also look into SMODS.DrawStep if you make multiple cards that need the same shader
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_black_hole_level2',
    set = 'Spectral',
    pos = { x = 9, y = 3 },
    hidden = true,
    soul_set = 'Planet',
    use = function(self, card, area, copier)
        local _hand1, _hand2, _hand3, _tally1, _tally2, _tally3 = nil, nil, nil, 0, 0, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally1 then
                _hand1 = handname
                _tally1 = G.GAME.hands[handname].played
            end
            if tally1 > tally2 then
                _hand2 = handname
                _tally2 = G.GAME.hands[handname].played
            end
            if tally2 > tally3 then
                _hand3 = handname
                _tally3 = G.GAME.hands[handname].played
            end
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+2' })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.level = poker_hand_key.level + 2
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = '3 most played hands', chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+3' })
        delay(1.3)
        G.GAME.hands[_hand1].level = G.GAME.hands[_hand1].level + 3
        G.GAME.hands[_hand2].level = G.GAME.hands[_hand2].level + 3
        G.GAME.hands[_hand3].level = G.GAME.hands[_hand3].level + 3
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
    draw = function(self, card, layer)
        -- This is for the Spectral shader. You don't need this with `set = "Spectral"`
        -- Also look into SMODS.DrawStep if you make multiple cards that need the same shader
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_black_hole_level3',
    set = 'Spectral',
    pos = { x = 9, y = 3 },
    hidden = true,
    soul_set = 'Planet',
    use = function(self, card, area, copier)
        local _hand1, _hand2, _hand3, _tally1, _tally2, _tally3 = nil, nil, nil, 0, 0, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally1 then
                _hand1 = handname
                _tally1 = G.GAME.hands[handname].played
            end
            if tally1 > tally2 then
                _hand2 = handname
                _tally2 = G.GAME.hands[handname].played
            end
            if tally2 > tally3 then
                _hand3 = handname
                _tally3 = G.GAME.hands[handname].played
            end
        end
        local lowest, lowesttally = nil, 1000000
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played < lowesttally then
                lowest = handname
                lowesttally = G.GAME.hands[handname].level
            end
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+' .. 2 + G.GAME.hands[lowest].level })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.level = poker_hand_key.level + 2 + G.GAME.hands[lowest].level
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = '3 most played hands', chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+3' })
        delay(1.3)
        G.GAME.hands[_hand1].level = G.GAME.hands[_hand1].level + 3
        G.GAME.hands[_hand2].level = G.GAME.hands[_hand2].level + 3
        G.GAME.hands[_hand3].level = G.GAME.hands[_hand3].level + 3
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
    draw = function(self, card, layer)
        -- This is for the Spectral shader. You don't need this with `set = "Spectral"`
        -- Also look into SMODS.DrawStep if you make multiple cards that need the same shader
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}

SMODS.Consumable {
    key = 'yma_black_hole_level4',
    set = 'Spectral',
    pos = { x = 9, y = 3 },
    hidden = true,
    soul_set = 'Planet',
    use = function(self, card, area, copier)
        local _hand1, _hand2, _hand3, _tally1, _tally2, _tally3 = nil, nil, nil, 0, 0, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally1 then
                _hand1 = handname
                _tally1 = G.GAME.hands[handname].played
            end
            if tally1 > tally2 then
                _hand2 = handname
                _tally2 = G.GAME.hands[handname].played
            end
            if tally2 > tally3 then
                _hand3 = handname
                _tally3 = G.GAME.hands[handname].played
            end
        end
        local lowest, lowesttally = nil, 1000000
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played < lowesttally then
                lowest = handname
                lowesttally = G.GAME.hands[handname].level
            end
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+' .. 2 + G.GAME.hands[lowest].level })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.level = poker_hand_key.level + 2 + G.GAME.hands[lowest].level
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = '3 most played hands', chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+3' })
        delay(1.3)
        G.GAME.hands[_hand1].level = G.GAME.hands[_hand1].level + 3
        G.GAME.hands[_hand2].level = G.GAME.hands[_hand2].level + 3
        G.GAME.hands[_hand3].level = G.GAME.hands[_hand3].level + 3
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = 'X2', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = 'X2', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.chips = poker_hand_key.chips * 2
            poker_hand_key.mult = poker_hand_key.mult * 2
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })
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
    key = 'yma_black_hole_level5',
    set = 'Spectral',
    pos = { x = 9, y = 3 },
    hidden = true,
    soul_set = 'Planet',
    use = function(self, card, area, copier)
        local _hand1, _hand2, _hand3, _tally1, _tally2, _tally3 = nil, nil, nil, 0, 0, 0
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally1 then
                _hand1 = handname
                _tally1 = G.GAME.hands[handname].played
            end
            if tally1 > tally2 then
                _hand2 = handname
                _tally2 = G.GAME.hands[handname].played
            end
            if tally2 > tally3 then
                _hand3 = handname
                _tally3 = G.GAME.hands[handname].played
            end
        end
        local lowest, lowesttally = nil, 1000000
        for _, handname in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played < lowesttally then
                lowest = handname
                lowesttally = G.GAME.hands[handname].level
            end
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+' .. 2 + G.GAME.hands[lowest].level })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.level = poker_hand_key.level + 2 + G.GAME.hands[lowest].level
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = '3 most played hands', chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+3' })
        delay(1.3)
        G.GAME.hands[_hand1].level = G.GAME.hands[_hand1].level + 3
        G.GAME.hands[_hand2].level = G.GAME.hands[_hand2].level + 3
        G.GAME.hands[_hand3].level = G.GAME.hands[_hand3].level + 3
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
            { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = true
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { mult = 'X2', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                return true
            end
        }))
        update_hand_text({ delay = 0 }, { chips = 'X2', StatusText = true })
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.9,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.8, 0.5)
                G.TAROT_INTERRUPT_PULSE = nil
                return true
            end
        }))
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { })
        delay(1.3)
        for poker_hand_key, _ in pairs(G.GAME.hands) do
            poker_hand_key.chips = poker_hand_key.chips * 2
            poker_hand_key.mult = poker_hand_key.mult * 2
            poker_hand_key.level_chips = poker_hand_key.level_chips * 2
            poker_hand_key.level_mult = poker_hand_key.level_mult * 2
        end
        update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
            { mult = 0, chips = 0, handname = '', level = '' })
    end,
    can_use = function(self, card)
        return true
    end,
    in_pool = function(self, args)
        return false
    end,
    no_collection = true,
}