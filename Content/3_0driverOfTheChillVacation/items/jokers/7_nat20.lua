SMODS.Joker {
    key = "0chill_nat20",
    atlas = "0chill_joker_atlas",
    unlocked = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 10,
    pos = { x = 2, y = 0 },
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = math.random(1,19), -- SOMEONE MAKE THIS CONSISTENT WITH PLAYTHROUGHS WITH THE SAME SEED PLEASE
                denominator = 20
            }
        end
    end,
}   