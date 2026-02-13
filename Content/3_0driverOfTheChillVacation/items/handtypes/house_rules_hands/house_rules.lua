
--House Rules Hand. Based on numbers on card
SMODS.PokerHandPart {
    key = "0chill_house_rules",
    func = function (hand)
        if #hand < 5 then return {} end
        local stone_count = false
        local four_count = false
        local three_count = false
        local ace_count = false
        local jack_count = false
        local card_collection = {}
        for _, card in ipairs(hand) do
            if card:get_id() == 4 then
                four_count = true
                table.insert(card_collection, card)
            elseif card:get_id() == 3 then
                three_count = true
                table.insert(card_collection,card)
            elseif card:get_id() == 14 then
                ace_count = true
                table.insert(card_collection,card)
            elseif card:get_id() == 11 then
                jack_count = true
                table.insert(card_collection,card)
            elseif (SMODS.has_enhancement(card, 'm_stone')) then
                stone_count = true
                table.insert(card_collection,card)
            end

        end
        if stone_count and four_count and three_count and ace_count and jack_count then
            return {card_collection}
        else return {} end
    end
}

SMODS.PokerHand{
    key = "0chill_house_rules",
    chips = 50,
    mult = 4,
    l_chips = 11,
    l_mult = 3,
    cb_house_rules = true,
    visible = function (self)
        local joker = not not next(SMODS.find_card('j_cbean_0chill_house_rules'))
        local played = G.GAME.hands and G.GAME.hands[self.key] and (G.GAME.hands[self.key].played or 0) > 0

        return joker or played
    end,
    example = {
        { "D_4", true, enhancement = "m_stone"},
        { "H_4", true },
        { "H_3", true },
        { "C_A", true },
        { "C_J", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) then --Checks if house rules and required joker are owned
            return parts.cbean_0chill_house_rules
        end
    end
}