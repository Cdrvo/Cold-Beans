
--House Rules Hand. Based on numbers on card
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "0chill_house_rules",
    func = function (hand)
        if #hand < 4 then return {} end

        local track_ranks = {}

        for _,card in ipairs(hand) do
            local rank = card:get_id()
            track_ranks[rank] = track_ranks[rank] or {}
            table.insert(track_ranks[rank], card)
        end

        if not (
            -- A rank is not tracked if the rank is not in the hand
            track_ranks[11] --Jack    
            and track_ranks[4] 
            and track_ranks[3] 
            and track_ranks[14]
        ) then return {} end

        local scoring_cards = SMODS.merge_lists{
            track_ranks[11],
            track_ranks[4],
            track_ranks[3],
            track_ranks[14]
        }

        return {scoring_cards}
    end
}

SMODS.PokerHand{
    key = "0chill_house_rules",
    chips = 11,
    mult = 4,
    l_chips = 3,
    l_mult = 1,
    cb_house_rules = true,
    visible = function (self)
        local joker = not not next(SMODS.find_card('j_cbean_0chill_house_rules'))
        local played = G.GAME.hands and G.GAME.hands[self.key] and (G.GAME.hands[self.key].played or 0) > 0

        return joker or played
    end,
    example = {
        { "D_J", true },
        { "H_4", true },
        { "H_3", true },
        { "C_A", true },
        { "C_6", false },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) then --Checks if house rules and required joker are owned
            return parts.cbean_0chill_house_rules
        end
    end
}