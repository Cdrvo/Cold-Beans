
SMODS.ConsumableType {
    key = 'sdown_blessing',
    default = 'c_cbean_sdown_ares',
    primary_colour = HEX('E89A35'),
    secondary_colour = HEX('BA6900'),
    -- text_colour = HEX('F1C100'),
    collection_rows = { 6, 6 },
    shop_rate = 1,
    loc_txt = {
        name = "Blessing",
        collection = "Blessing",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase this card",
                "in an unseeded",
                "run to learn",
                "what it does"
            }
        }
    },
}

SMODS.Consumable {
    key = 'sdown_ares',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Ares',
        text = {
            "Retrigger all played",
            "{C:attention}numbered cards{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        times_left = 3,
        should_tick_down = false,
    },
    pos = { x = 0, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "",
        art = "",
        code = "notmario",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.times_left } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and 
            ((not context.other_card:is_face()) and context.other_card:get_id() ~= 14) then
            card.should_tick_down = true
            return {
                repetitions = 1
            }
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.times_left = card.ability.times_left - 1
            if card.ability.times_left <= 0 then
                SMODS.destroy_cards({card})
            else
                return {
                    message = (card.ability.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_athena',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Athena',
        text = {
            "Retrigger all played",
            "{C:attention}Aces{} and {C:attention}face cards{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        times_left = 3,
        should_tick_down = false,
    },
    pos = { x = 1, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "",
        art = "",
        code = "notmario",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.times_left } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and 
            (context.other_card:is_face() or context.other_card:get_id() == 14) then
            card.should_tick_down = true
            return {
                repetitions = 1
            }
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.times_left = card.ability.times_left - 1
            if card.ability.times_left <= 0 then
                SMODS.destroy_cards({card})
            else
                return {
                    message = (card.ability.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}