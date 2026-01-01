SMODS.Joker {
    key = "jbill_tlane",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    config = { extra = { xmult = 3, xchips = 3, type = 'Straight' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xchips, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Straight"])then
            local ace_check = false
            local five_check = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 14 then
                    ace_check = true
                end
                if context.scoring_hand[i]:get_id() == 5 then
                    five_check = true
                end
            end
            if ace_check and not five_check then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
            if five_check and not ace_check then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
            if five_check and ace_check then
                return {
                    xmult = card.ability.extra.xmult,
                    xchips = card.ability.extra.xchips
                }
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

