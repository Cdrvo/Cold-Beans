-- The Sad Onion
YMA.TBOI_ITEMS {
    key = "yma_tboi_sad_onion",
    set = "yma_tboi_items",
    order = 1,

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