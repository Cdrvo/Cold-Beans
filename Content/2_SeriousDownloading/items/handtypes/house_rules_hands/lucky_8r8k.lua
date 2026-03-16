
-- Lucky 8r8k
SMODS.PokerHandPart {
    key = "sdown_8r8k",
    func = function (hand)
        if #hand < 2 then return {} end
        local eights_count = 0
        local eights = {}
        local lucky_eight = false
        for _, card in ipairs(hand) do
            if card:get_id() == 8 then
                eights_count = eights_count + 1
                table.insert(eights,card)
                if (SMODS.has_enhancement(card, 'm_lucky')) then lucky_eight = true end
            end
        end
        if eights_count >1 and lucky_eight then
            return {eights}
        else return {} end
    end
}

SMODS.PokerHand{
    key = "sdown_8r8k",
    l_chips = 33,
    l_mult = 3,
    chips = 88,
    mult = 8,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.eight_ball
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_8", true, enhancement = "m_lucky" },
        { "D_8", true },
        { "H_8", true },
        { "C_8", true },
        { "H_7", false },
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.eight_ball then --Checks if house rules and required joker are owned
            return parts.cbean_sdown_8r8k
        end
    end
}