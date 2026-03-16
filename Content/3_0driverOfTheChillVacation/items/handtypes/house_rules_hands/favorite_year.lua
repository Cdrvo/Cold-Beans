-- Big Shot Hand
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "0chill_favorite_year",
    func = function (hand)
        if #hand >= 4 then
            local one_count = 0
            local nine_count = 0
            local seven_count = 0
            local eligible_cards = {}

            for i, card in ipairs(hand) do
                if card:get_id() == 9 then 
                    nine_count = nine_count + 1
                    if nine_count <= 2 then
                        eligible_cards[#eligible_cards + 1] = card
                    end
                elseif card:get_id() == 14 then 
                    one_count = one_count + 1
                    if one_count <= 1 then
                        eligible_cards[#eligible_cards + 1] = card
                    end
                elseif card:get_id() == 7 then 
                    seven_count = seven_count + 1
                    if seven_count <= 1 then
                        eligible_cards[#eligible_cards + 1] = card
                    end
                end
            end

            if nine_count >= 2 and one_count >= 1 and seven_count >= 1  then
                return {eligible_cards}
            end
        end
    end
}

SMODS.PokerHand{
    key = "0chill_favorite_year",
    l_chips = 9,
    l_mult = 7,
    chips = 97,
    mult = 19,
    cb_house_rules = true,
    visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card('j_cbean_colon_big_shot')))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_A", true },
        { "H_9", true },
        { "D_9", true },
        { "C_7", true },
        { "C_3", false },
    },
    evaluate = function(parts, hand) 
        if next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card('j_cbean_colon_big_shot')) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_0chill_favorite_year) then 
                return {} 
            end
            return { SMODS.merge_lists(parts.cbean_0chill_favorite_year) }
        end
    end
}

SMODS.PokerHand{
    key = "0chill_favorite_year_flush",
    l_chips = 39,
    l_mult = 17,
    chips = 97,
    mult = 39,
    cb_house_rules = true,
    visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card('j_cbean_colon_big_shot')))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "H_A", true },
        { "H_9", true },
        { "H_9", true },
        { "H_7", true },
        { "H_3", true },
    },
    evaluate = function(parts, hand) 
        if next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card('j_cbean_colon_big_shot')) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_0chill_favorite_year) or not next(parts._flush) then 
                return {} 
            end
            return { SMODS.merge_lists(parts.cbean_0chill_favorite_year, parts._flush) }
        end
    end
}