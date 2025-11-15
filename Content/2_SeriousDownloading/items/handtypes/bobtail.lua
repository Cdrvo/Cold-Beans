SMODS.PokerHandPart {
    key = 'sdown_bobtail',
    func = function(hand)
        --eject early if hand is too small
        if #hand < (SMODS.four_fingers('straight') -1) then return {} end
        straightsTable = get_straight(hand, SMODS.four_fingers('straight') -1, SMODS.shortcut(), SMODS.wrap_around_straight())
        if next(straightsTable) == nil then return {} end
        bobtails = {}
        for _,straight in pairs(straightsTable) do
            --have to reimplement the flush calc because unlike get_straight, smods doesn't modify it
            for suit,_ in pairs(SMODS.Suits) do
                local t = {}
                local flush_count = 0
                for i,_ in pairs(straight) do
                    if straight[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = straight[i] end
                end
                if flush_count >= (SMODS.four_fingers('flush') - 1) then
                    table.insert(bobtails, t)
                end
            end
        end
        if next(bobtails) == nil then return {} end
        return { bobtails }
    end
}


SMODS.PokerHand{
    key = "sdown_bobtail",
    l_chips = 30,
    l_mult = 4,
    chips = 50,
    mult = 6,
    visible = true,
    example = {
        { "H_8", true },
        { "H_9", true },
        { "H_T", true },
        { "H_J", true },
        { "S_5", false },
    },
    evaluate = function(parts, hand)
        return next(parts.cbean_sdown_bobtail) and parts.cbean_sdown_bobtail or {}
    end
}