SMODS.Joker {
    key = "pboys_ihaveagun",
    atlas = "pboys_joker_atlas",
    pos = { x = 9, y = 1 },
    rarity = 1,
    order = 19,
    blueprint_compat = true,
    cost = 5,
    config = {extra = {percent = 0.4}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.percent*100}}
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Gfsgfs",
        art = "Gfsgfs",
        code = "HuyTheKiller",
    }
}