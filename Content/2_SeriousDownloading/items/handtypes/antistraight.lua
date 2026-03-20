SMODS.PokerHandPart {
    key = 'sdown_antistraight',
    func = function(hand)
        --eject early if hand is too small
        if #hand < 5 then return {} end
        if next(get_X_same(2, hand, true)) then return {} end
        if next(get_straight(hand, 2)) then return {} end
        for _, card in ipairs(hand) do
           if SMODS.has_no_rank(card) then return {} end
        end
        return {hand}
    end
}


SMODS.PokerHand{
    key = "sdown_antistraight",
    l_chips = 35,
    l_mult = 3,
    chips = 25,
    mult = 4,
    visible = true,
    example = {
        { "H_4", true },
        { "H_7", true },
        { "C_9", true },
        { "H_J", true },
        { "S_K", true },
    },
    evaluate = function(parts, hand)
        return parts.cbean_sdown_antistraight
    end
}

SMODS.PokerHand{
    key = "sdown_antistraight_flush",
    l_chips = 45,
    l_mult = 4,
    chips = 90,
    mult = 8,
    visible = true,
    example = {
        { "D_4", true },
        { "D_7", true },
        { "D_9", true },
        { "D_J", true },
        { "D_K", true },
    },
    evaluate = function(parts, hand)
        if not next(parts.cbean_sdown_antistraight) or not next(parts._flush) then return {} end
        return { SMODS.merge_lists(parts.cbean_sdown_antistraight, parts._flush) }
    end
}