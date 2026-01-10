
-- Flush Threeah
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "sdown_flush_three",
    func = function(hand)
        --eject early if hand is too small
        if #hand < 3 then return {} end
        pairsTable = get_X_same(3, hand, true)
        if next(pairsTable) == nil then return {} end
        flush_threes = {}
        for _, three_oak in pairs(pairsTable) do
            --have to reimplement the flush calc because unlike get_straight, smods doesn't modify it
            for suit,_ in pairs(SMODS.Suits) do
                local t = {}
                local flush_count = 0
                for i,_ in pairs(three_oak) do
                    if three_oak[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = three_oak[i] end
                end
                if flush_count >= (#three_oak) then
                    table.insert(flush_threes, t)
                end
            end
        end
        if next(flush_threes) == nil then return {} end
        return flush_threes
    end
}

SMODS.PokerHand{
    key = "sdown_flush_three",
    l_chips = 30,
    l_mult = 3,
    chips = 60,
    mult = 14,
    cb_house_rules = true,
    visible = function (self)
        local joker = not not next(SMODS.find_card('j_cbean_0chill_house_rules'))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        local played = G.GAME.hands and G.GAME.hands[self.key] and (G.GAME.hands[self.key].played or 0) > 0

        return joker and (played or clicked)
    end,
    example = {
        { "S_6", true },
        { "S_6", true },
        { "S_6", true },
        { "C_6", false },
        { "S_7", false }
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and ((#SMODS.find_card('j_zany') > 0) or (#SMODS.find_card('j_wily') > 0) or (#SMODS.find_card('j_trio') > 0)) then --Checks if house rules and required joker are owned
            return parts.cbean_sdown_flush_three
        end
    end
}