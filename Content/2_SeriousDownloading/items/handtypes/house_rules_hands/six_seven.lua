
-- six seven
SMODS.PokerHandPart { --Modifed from Potassium Remake
    key = "sdown_67",
    func = function (hand)
        if #hand < 2 then return {} end

        local track_ranks = {}

        for _,card in ipairs(hand) do
            local rank = card:get_id()
            track_ranks[rank] = track_ranks[rank] or {}
            table.insert(track_ranks[rank], card)
        end

        if not (
                -- A rank is not tracked if the rank is not in the hand
                track_ranks[6]
                        and track_ranks[7]
        ) then return {} end

        local scoring_cards = SMODS.merge_lists{
            track_ranks[6],
            track_ranks[7]
        }

        return {scoring_cards}
    end
}

SMODS.PokerHand{
    key = "sdown_67",
    l_chips = 20,
    l_mult = 0.5,
    chips = 67,
    mult = 0.5,
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
        { "D_7", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and ((#SMODS.find_card('j_sixth_sense') > 0) or (#SMODS.find_card('j_cbean_colon_mu_cube') > 0)) then --Checks if house rules and required joker are owned
            return parts.cbean_sdown_67
        end
    end
}

SMODS.PokerHand{
    key = "sdown_flush_67",
    l_chips = 120,
    l_mult = 0.5,
    chips = 670,
    mult = 0.5,
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
        { "S_7", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and ((#SMODS.find_card('j_sixth_sense') > 0) or (#SMODS.find_card('j_cbean_colon_mu_cube') > 0)) then --Checks if house rules and required joker are owned
            if not parts.cbean_sdown_67 then return {} end
            flush_67s = {}
            for _, six_seven in pairs(parts.cbean_sdown_67) do
                --have to reimplement the flush calc because unlike get_straight, smods doesn't modify it
                for suit,_ in pairs(SMODS.Suits) do
                    local t = {}
                    local flush_count = 0
                    for i,_ in pairs(six_seven) do
                        if six_seven[i]:is_suit(suit, nil, true) then flush_count = flush_count + 1;  t[#t+1] = six_seven[i] end
                    end
                    if flush_count >= (#six_seven) then
                        table.insert(flush_67s, t)
                    end
                end
            end
            if next(flush_67s) == nil then return {} end
            return flush_67s
        end
    end
}