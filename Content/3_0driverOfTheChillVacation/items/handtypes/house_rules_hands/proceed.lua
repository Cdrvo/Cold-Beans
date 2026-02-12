
-- Fibonacci
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "0chill_proceed",
    func = function (hand)
         if #hand >= 5 then
            local nine_count = 0
            local eligible_cards = {}

            for i, card in ipairs(hand) do
                if card:get_id() == 9 and card:is_suit("Hearts") then 
                    nine_count = nine_count + 1
                    eligible_cards[#eligible_cards + 1] = card
                end
            end

            if nine_count >= 5  then
                return {eligible_cards}
            end
        end
    end
}

SMODS.PokerHand{
    key = "0chill_proceed",
    l_chips = 99,
    l_mult = 9,
    chips = 999,
    mult = 99,
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
        { "H_9", true },
        { "H_9", true },
        { "H_9", true },
        { "H_9", true },
        { "H_9", true },
    },
    evaluate = function(parts, hand) --Was going to track hearts but ran out of time
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_cbean_0chill_thorn_ring') > 0) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_0chill_proceed) or not next(parts._flush) then 
                return {} 
            end
            return { SMODS.merge_lists(parts.cbean_0chill_proceed, parts._flush) }
        end
    end
}