SMODS.Joker {
    key = "pboys_breuhh",
    atlas = "pboys_joker_atlas",
    pos = { x = 4, y = 1 },
    rarity = 1,
    order = 14,
    blueprint_compat = true,
    cost = 5,
    config = {extra = {mult_min = 1, mult_max = 10}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult_min, card.ability.extra.mult_max}}
    end,
    calculate = function(self, card, context)
        if context.initial_scoring_step then
			local possible_value = math.min(pseudorandom("streamer_donate", card.ability.extra.mult_min, card.ability.extra.mult_max),hand_chips)
            return {
                mult = possible_value,
				chips = -possible_value,
            }
        end
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Nrio_Modder",
        art = "FlameThrowerFIM",
        code = "Nrio_Modder",
    }
}