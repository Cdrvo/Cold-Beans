SMODS.PokerHand{
    key = "sdown_stone_hand",
    l_chips = 50,
    l_mult = 1,
    chips = 100,
    mult = 10,
    cb_house_rules = true,
    visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and (next(SMODS.find_card('j_marble'))) or next(SMODS.find_card('j_stone')))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_A", true, enhancement = "m_stone" },
        { "C_A", true, enhancement = "m_stone" },
        { "H_3", true, enhancement = "m_stone" },
        { "C_6", true, enhancement = "m_stone" },
        { "H_7", true, enhancement = "m_stone" },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and ((#SMODS.find_card('j_marble') > 0) or (#SMODS.find_card('j_stone') > 0)) then --Checks if house rules and required joker are owned
            if #hand < 5 then return {} end
            local stones = {}
            for _, card in ipairs(hand) do
                if  (SMODS.has_enhancement(card, 'm_stone')) then
                    table.insert(stones,card)
                end
            end
            if #stones >= 5 then
                return {stones}
            else return {} end
        end
    end
}