SMODS.PokerHand{
    key = "0chill_zomboid",
    l_chips = 50,
    l_mult = 1,
    chips = 95,
    mult = 8,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and (ColdBeans.joker_cache.zoybean or ColdBeans.joker_cache.znake)
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_A", true, enhancement = "m_cbean_melon_zomboid" },
        { "C_A", true, enhancement = "m_cbean_carrot_zomboid" },
        { "H_3", true, enhancement = "m_cbean_carrot_zomboid" },
        { "C_6", true, enhancement = "m_cbean_basic_zomboid" },
        { "H_7", true, enhancement = "m_cbean_basic_zomboid" },
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and (ColdBeans.joker_cache.zoybean or ColdBeans.joker_cache.znake) then --Checks if house rules and required joker are owned
            if #hand < 5 then return {} end
            local zomboids = {}
            local basic_count = 0
            local carrot_count = 0
            local melon_count = 0
            for _, card in ipairs(hand) do
                if  (SMODS.has_enhancement(card, 'm_cbean_basic_zomboid')) then
                    basic_count = basic_count + 1
                    table.insert(zomboids,card)
                elseif (SMODS.has_enhancement(card, 'm_cbean_carrot_zomboid')) then
                    carrot_count = carrot_count + 1
                    table.insert(zomboids,card)
                elseif (SMODS.has_enhancement(card, 'm_cbean_melon_zomboid')) then
                    melon_count = melon_count + 1
                    table.insert(zomboids,card)
                end
            end
            if #zomboids >= 5 and basic_count >= 1 and carrot_count >= 1 and melon_count >= 1 then
                return {zomboids}
            else return {} end
        end
    end
}