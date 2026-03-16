
-- Jackpot
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "0chill_jackpot",
    func = function (hand)
         if #hand >= 3 then
            local seven_count = 0
            local eligible_cards = {}

            for i, card in ipairs(hand) do
                if card:get_id() == 7 then 
                    seven_count = seven_count + 1
                    if seven_count <= 3 then
                        eligible_cards[#eligible_cards + 1] = card
                    end
                end
            end

            if seven_count >= 3  then
                return {eligible_cards}
            end
        end
    end
}

SMODS.PokerHand{
    key = "0chill_jackpot",
    l_chips = 37,
    l_mult = 4,
    chips = 77,
    mult = 7,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and (ColdBeans.joker_cache.oops or ColdBeans.joker_cache.nat20 or ColdBeans.joker_cache.set_of_dice)
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_7", true },
        { "D_7", true },
        { "H_7", true },
        { "C_3", false },
        { "H_K", false }
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and (ColdBeans.joker_cache.oops or ColdBeans.joker_cache.nat20 or ColdBeans.joker_cache.set_of_dice) then --Checks if house rules and required joker are owned
            return parts.cbean_0chill_jackpot
        end
    end
}