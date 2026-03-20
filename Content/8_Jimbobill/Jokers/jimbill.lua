SMODS.Joker {
    key = "jbill_jimbill",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 0, y = 4 },
    rarity = 2,
    cost = 5,
    config = { extra = { jimbux = 2, odds = 2 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jimbill')
        return { vars = { card.ability.extra.jimbux, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local enchance_check = false
            for i = 1, #context.scoring_hand do
                if next(SMODS.get_enhancements(context.scoring_hand[i])) then
                    enchance_check = true
                    print("card has enhancment")
                end
            end
            if enchance_check and SMODS.pseudorandom_probability(card, 'jimbill', 1, card.ability.extra.odds) then
                ease_jimbux(card.ability.extra.jimbux)
                    return {
                        message = "+J"..card.ability.extra.jimbux,
                        colour = G.C.GREEN
                    }
            end
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "None Yet!"
    }
}