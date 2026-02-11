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
                local rank_table = {}
                for _, card in ipairs(straight) do
                    if not rank_table[card:get_id()] then
                        rank_table[card:get_id()] = {card}
                    else
                        rank_table[card:get_id()][#rank_table[card:get_id()]+1] = card
                    end
                end
                local t = {}
                local flush_count = 0
                -- for i,_ in pairs(straight) do
                --     if straight[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = straight[i] end
                -- end
                for _, cards in pairs(rank_table) do
                    local seen = false
                    for _, card in ipairs(cards) do
                        if card:is_suit(suit, nil, true) then
                            t[#t+1] = card
                            flush_count = flush_count + 1
                            seen = true
                        end
                    end
                    if not seen then break end
                end
                if flush_count >= SMODS.four_fingers('flush') - 1 then
                    table.insert(bobtails, t)
                    break
                end
            end
        end
        if next(bobtails) == nil then return {} end
        return bobtails
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
        return parts.cbean_sdown_bobtail
    end
}