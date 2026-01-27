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