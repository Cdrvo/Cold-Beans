--The Sad Onion
YMA.TBOI_ITEMS {
    key = "yma_tboi_sad_onion",
    set = "yma_tboi_items",
    order = 1,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 1 },

    config = {
        extra = {
            xchips = 5,
        }
    },

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
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
--The Inner Eye
YMA.TBOI_ITEMS {
    key = "yma_tboi_inner_eye",
    set = "yma_tboi_items",
    order = 2,
    quaility = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 8, y = 0 },

    config = {
        extra = {
            effect_table = {
                ['x_chips'] = true,
                ['xchips'] = true,
                ['Xchips'] = true,
                ['Xchip_mod'] = true,
                ['x_chip_mod'] = true
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            local key = temp_context.effect_type
            temp_context.effects[key] = ((temp_context.effects[key] - 1) / 2) + 1
            local amt = temp_context.effects[key]
            SMODS.calculate_individual_effect(temp_context.effects, temp_context.card, key, amt, temp_context.from_edition)
            SMODS.calculate_individual_effect(temp_context.effects, temp_context.card, key, amt, temp_context.from_edition)
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}
--Spoon Bender
--YMA.TBOI_ITEMS {
--    key = "yma_tboi_spoon_bender",
--    set = "yma_tboi_items",
--    order = 3,
--    quaility = 3,
--
--    loc_vars = function(self, info_queue, card)
--        return {
--            vars = {
--                
--            }
--        }
--    end,
--
--    atlas = 'yma_tboi_atlas',
--    pos = { x = 0, y = 0 },
--    soul_pos = { x = 6, y = 0 },
--
--    config = {
--        extra = {
--            
--        }
--    },
--
--    calculate = function(self, card, context)
--        
--    end,
--    beans_credits = {
--        team = { "Yeah! Mostly Artists" },
--        idea = "RattlingSnow353",
--        art = "RattlingSnow353",
--        code = "RattlingSnow353",
--    }
--}
--Cricket's Head
YMA.TBOI_ITEMS {
    key = "yma_tboi_crickets_head",
    set = "yma_tboi_items",
    order = 4,
    quaility = 4,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    atlas = 'yma_tboi_atlas',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 7, y = 2 },

    config = {
        extra = {
            xmult = 1.5,
            effect_table = {
                ['x_mult'] = true,
                ['xmult'] = true,
                ['x_mult_mod'] = true,
                ['Xmult'] = true,
                ['Xmult_mod'] = true
            }
        }
    },

    calculate = function(self, card, context)
        local temp_context = context.yma
        if temp_context and temp_context.modify_card_effects and card.ability.extra.effect_table[temp_context.effect_type] then
            temp_context.effects[temp_context.effect_type] = ((temp_context.effects[temp_context.effect_type] - 1) * card.ability.extra.xmult) + 1
            temp_context.effects['message'] = localize{type='variable',key='a_xmult',vars={temp_context.effects[temp_context.effect_type]}} --Potentally problomatic, Fixes visual junk with vanilla Jokers
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                yma_avoid_modification = true,
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}