
-- Flush Tuah
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "sdown_flush_two",
    func = function(hand)
        --eject early if hand is too small
        if #hand < 2 then return {} end
        pairsTable = get_X_same(2, hand, true)
        if next(pairsTable) == nil then return {} end
        flush_twos = {}
        for _, two_oak in ipairs(pairsTable) do
            --have to reimplement the flush calc because unlike get_straight, smods doesn't modify it
            for suit,_ in pairs(SMODS.Suits) do
                local t = {}
                local flush_count = 0
                for i,_ in pairs(two_oak) do
                    if two_oak[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = two_oak[i] end
                end
                if flush_count >= 2 then
                    table.insert(flush_twos, t)
                    break
                end
            end
        end
        if next(flush_twos) == nil then return {} end
        return flush_twos
    end
}

SMODS.PokerHand{
    key = "sdown_flush_two",
    l_chips = 20,
    l_mult = 2,
    chips = 30,
    mult = 6,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and (ColdBeans.joker_cache.jolly or ColdBeans.joker_cache.sly or ColdBeans.joker_cache.duo)
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_6", true },
        { "S_6", true },
        { "S_7", false },
        { "C_6", false },
        { "H_2", false }
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and (ColdBeans.joker_cache.jolly or ColdBeans.joker_cache.sly or ColdBeans.joker_cache.duo) then --Checks if house rules and required joker are owned
            return parts.cbean_sdown_flush_two
        end
    end
}