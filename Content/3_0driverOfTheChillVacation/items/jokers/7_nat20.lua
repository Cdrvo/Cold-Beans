SMODS.Joker {
    key = "0chill_nat20",
    atlas = "0chill_joker_atlas",
    unlocked = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 10,
    pos = { x = 2, y = 2 },
    calculate = function(self, card, context)
    if context.mod_probability and not context.blueprint then
        return {
            numerator = pseudorandom("0chill_nat20_roll", 1, 19), -- someone make this not reroll when its being hovered on
            denominator = 20
        }
    end
end,
}   