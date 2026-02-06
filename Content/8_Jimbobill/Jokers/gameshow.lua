SMODS.Joker {
    key = "jbill_gameshow",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 2 },
    rarity = 2,
    cost = 5,
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "intestinal")
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.hand_drawn and G.GAME.current_round.discards_left == 0 then
            for k, v in pairs(context.hand_drawn) do
                if SMODS.pseudorandom_probability(card, "intestinal", 1, card.ability.extra.odds) then
                    local enhancement = SMODS.poll_enhancement({guaranteed = true})
                    v:set_ability(enhancement)
                end
            end
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}