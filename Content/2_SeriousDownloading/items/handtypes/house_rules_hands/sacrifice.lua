
-- Sacrifice
SMODS.PokerHandPart {
    key = "sdown_sacrifice",
    func = function (hand)
        if #hand < 5 then return {} end
        local is_unplayed = true
        for _, card in ipairs(hand) do
            if card.base.times_played > 0 then is_unplayed = false end
        end
        if is_unplayed then return {hand} else return {} end
    end
}

SMODS.PokerHand{
    key = "sdown_sacrifice",
    l_chips = 50,
    l_mult = 4,
    chips = 130,
    mult = 13,
    cb_house_rules = true,
    visible = function (self)
        local joker = not not next(SMODS.find_card('j_cbean_0chill_house_rules'))
        local clicked
        if G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        local played = G.GAME.hands and G.GAME.hands[self.key] and (G.GAME.hands[self.key].played or 0) > 0

        return joker and (played or clicked)
    end,
    example = {
        { "S_4", true },
        { "D_A", true },
        { "H_3", true },
        { "C_6", true },
        { "H_7", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_obelisk') > 0) then --Checks if house rules and required joker are owned
            return parts.cbean_sdown_sacrifice
        end
    end
}