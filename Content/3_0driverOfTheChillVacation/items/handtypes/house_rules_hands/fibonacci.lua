
-- Fibonacci
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "0chill_fibonacci",
    func = function (hand)
        if #hand < 5 then return {} end

        local track_ranks = {}

        for _,card in ipairs(hand) do
            local rank = card:get_id()
            track_ranks[rank] = track_ranks[rank] or {}
            table.insert(track_ranks[rank], card)
        end

        if not (
            -- A rank is not tracked if the rank is not in the hand
            track_ranks[8]     
            and track_ranks[5] 
            and track_ranks[3] 
            and track_ranks[2]
            and track_ranks[14] 
        ) then return {} end

        local scoring_cards = SMODS.merge_lists{
            track_ranks[8],
            track_ranks[5],
            track_ranks[3],
            track_ranks[2],
            track_ranks[14] -- Ace
        }

        return {scoring_cards}
    end
}

SMODS.PokerHand{
    key = "0chill_fibonacci",
    l_chips = 21,
    l_mult = 3,
    chips = 55,
    mult = 5,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.fibonacci
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
        { "D_2", true },
        { "H_3", true },
        { "C_5", true },
        { "H_8", true },
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.fibonacci then --Checks if house rules and required joker are owned
            return parts.cbean_0chill_fibonacci
        end
    end
}

SMODS.PokerHand{
    key = "0chill_fibonacci_flush",
    l_chips = 34,
    l_mult = 5,
    chips = 89,
    mult = 13,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.fibonacci
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "C_A", true },
        { "C_2", true },
        { "C_3", true },
        { "C_5", true },
        { "C_8", true },
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.fibonacci then --Checks if house rules and required joker are owned
            if not next(parts.cbean_0chill_fibonacci) or not next(parts._flush) then 
                return {} 
            end
            return { SMODS.merge_lists(parts.cbean_0chill_fibonacci, parts._flush) }
        end
    end
}