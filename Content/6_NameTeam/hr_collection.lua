
-- Collection
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "nameteam_collection",
    func = function (hand)
        if #hand < 3 then return {} end
        
        sticker_keys = {}
        track_cards = {}
        scoring_cards = {}
        for k, v in pairs(SMODS.Stickers) do
            sticker_keys[#sticker_keys+1] = v.key
        end
        -- First we get the cards with a sticker, alongside a list of the stickers they have
        for k, v in ipairs(hand) do
            for jk, jv in pairs(v.ability) do
                if NAMETEAM.contains(sticker_keys, jk) and jv == true then
                    if not track_cards[#track_cards+1] then track_cards[#track_cards+1] = {} end
                    track_cards[k][#track_cards[k]] = jk
                end
            end
        end

        -- Then we start by ordering the cards from least to most amount of stickers
        track_cards_arranged = {}
        while #track_cards > 0 do
            lowest_index = 1
            lowest_amount = 999
            for k, v in pairs(track_cards) do
                if #v < lowest_amount then
                    lowest_index = k
                    lowest_amount = #v
                end
            end
            track_cards_arranged[#track_cards_arranged+1] = track_cards[lowest_index]
            sendDebugMessage("Arranged cards:"..track_cards[lowest_index].base.name, "cbean_nteam_scoring_collection")
            table.remove(track_cards, lowest_index)
        end

        if #scoring_cards >= 3 then
            while #scoring_cards > 4 do
                table.remove(scoring_cards)
            end
            return {scoring_cards}
        else
            return {}
        end
    end
}

SMODS.PokerHand{
    key = "nameteam_collection",
    l_chips = 21,
    l_mult = 3,
    chips = 55,
    mult = 5,
    visible = false,
    example = {
        { "S_A", true },
        { "C_6", true },
        { "H_3", true },
        { "C_K", false },
        { "H_8", false },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_cbean_nameteam_sticker_collection') > 0) then --Checks if house rules and required joker are owned
            return parts.cbean_nameteam_collection
        end
    end
}

SMODS.PokerHand{
    key = "nameteam_collection_3oak",
    l_chips = 34,
    l_mult = 5,
    chips = 89,
    mult = 13,
    visible = false,
    example = {
        { "C_A", true },
        { "C_2", true },
        { "C_3", true },
        { "C_5", true },
        { "C_8", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_cbean_nameteam_sticker_collection') > 0) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_nameteam_collection) or not next(parts._3) then 
                return {} 
            end
            -- for k, v in pairs(parts._3)
            return { SMODS.merge_lists(parts.cbean_0chill_fibonacci, parts._flush) }
        end
    end
}

function rh_simplify_cards(cards)
    local simplecards = {}
    for i=1, #cards do
        simplecards[i] = cards[i].base.name 
    end
    return simplecards
end