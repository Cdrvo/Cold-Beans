SMODS.PokerHandPart { --inspired by manitro
    key = "0chill_deer_in_headlights",
    func = function (hand)
         if #hand == 1 then
            local king_count = 0
            local eligible_cards = {}

            for i, card in ipairs(hand) do
                if card:get_id() == 13 then 
                    king_count = king_count + 1
                    eligible_cards[#eligible_cards + 1] = card
                end
            end

            if king_count >= 1  then
                return {eligible_cards}
            end
        end
    end
}

SMODS.PokerHand{
    key = "0chill_deer_in_headlights",
    l_chips = 5,
    l_mult = 1,
    chips = 50,
    mult = 5,
    cb_house_rules = true,
    visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card('j_cbean_0chill_driving_in_my_truck')))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_K", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_cbean_0chill_driving_in_my_truck') > 0) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_0chill_deer_in_headlights) then 
                return {} 
            end
            return parts.cbean_0chill_deer_in_headlights
        end
    end
}