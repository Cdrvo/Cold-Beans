SMODS.Joker {
    key = "jbill_tlane",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    config = { extra = { xmult = 3, type = 'Straight', retrigger = 1, ready = false } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, localize(card.ability.extra.type, 'poker_hands') } }
    end,
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands["Straight"])then
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
            if ace_check and five_check then
                card.ability.extra.retrigger = 1
                card.ability.extra.ready = true
            end
            if (ace_check and not five_check) or (five_check and not ace_check) then
                card.ability.extra.retrigger = 0
                card.ability.extra.ready = true
            end
        end
        if context.joker_main and card.ability.extra.ready then
            return {
                xmult = card.ability.extra.xmultm
            }
        end
        if context.retrigger_joker_check and context.other_card == card then
            return {
                repetitions = card.ability.extra.retrigger,
            }
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

