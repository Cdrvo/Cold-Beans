SMODS.Joker {
    key = 'yma_set_of_dice',

    rarity = 3,
    atlas = 'NAMETEAM_Jokers', -- get absolutely animated on you absolute geezers
    pos = { x = 0, y = 3 },
    cbean_anim = {
        { xrange = { first = 0, last = 11 }, y = 3, t = 0.1 },
        { xrange = { first = 0, last = 5 },  y = 4, t = 0.1 }
    },
    pos_extra = { x = 6, y = 4 },
    cbean_anim_extra = {
        { x = 6,                             y = 4, t = 3 },
        { x = 11,                            y = 9, t = 0.3 },
        { xrange = { first = 6, last = 11 }, y = 4, t = 0.1 },
        { x = 9,                             y = 5, t = 0.2 },
        { x = 10,                            y = 5, t = 0.4 },
        { x = 11,                            y = 5, t = 0.2 },
        { xrange = { first = 6, last = 9 },  y = 9, t = 0.1 },
        { x = 10,                            y = 9, t = 0.2 },
    },
    cost = 8,
    blueprint_compat = false,
    config = {
        extra = {
            area = ''
        }
    },

    loc_vars = function(self, info_queue, card)
        local area = card.ability.extra.area
        local area_text = area:sub(1, 1):upper() .. area:sub(2)
        if area == '' then
            area_text = '(random area)'
        elseif area_text == 'Deck' then
            area_text = 'Playing Cards'
        end
        return { vars = { area_text } }
    end,
    add_to_deck = function(self, card, from_debuff)
        local areas = { 'jokers', 'nothings', 'deck', 'consumeables', 'nothings' }
        card.ability.extra.area = pseudorandom_element(areas, pseudoseed('yma_set_of_dice'))
    end,
    calculate = function(self, card, context)
        if context.mod_probability and context.trigger_obj then
            if card.ability.extra.area == 'nothing' then
                return
            end
            if card.ability.extra.area == 'deck' then
                if (G.play and context.trigger_obj.area == G.play) or (G.hand and context.trigger_obj.area == G.hand) then
                    return {
                        numerator = context.denominator,
                        denominator = context.denominator
                    }
                end
            elseif G[card.ability.extra.area] and context.trigger_obj.area == G[card.ability.extra.area] then
                return {
                    numerator = context.denominator,
                    denominator = context.denominator
                }
            end
        end
        if context.end_of_round and not context.blueprint and context.main_eval then
            local areas = { 'jokers', 'deck', 'consumeables' }
            card.ability.extra.area = pseudorandom_element(areas, pseudoseed('yma_set_of_dice'))
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_reset'), colour = G.C.FILTER })
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
