--Pansexual
SMODS.PokerHand{
    key = "sdown_pansexual",
    l_chips = 20,
    l_mult = 3,
    chips = 50,
    mult = 4,
    visible = false,
    example = {
        { "S_4", true },
        { "D_6", true },
        { "H_8", true },
        { "C_T", true },
        { "H_Q", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_shortcut') > 0) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_sdown_antistraight) or not next(parts._straight) then return {} end
            return { SMODS.merge_lists(parts.cbean_sdown_antistraight, parts._straight) }
        end
    end
}

--Pansexual Flush
SMODS.PokerHand{
    key = "sdown_pansexual_flush",
    l_chips = 50,
    l_mult = 4,
    chips = 70,
    mult = 5,
    visible = false,
    example = {
        { "S_4", true },
        { "S_6", true },
        { "S_8", true },
        { "S_T", true },
        { "S_Q", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_shortcut') > 0) then --Checks if house rules and required joker are owned
            if not next(parts.cbean_sdown_antistraight) or not next(parts._straight) or not next(parts._flush) then return {} end
            return { SMODS.merge_lists(parts.cbean_sdown_antistraight, parts._straight, parts._flush) }
        end
    end
}