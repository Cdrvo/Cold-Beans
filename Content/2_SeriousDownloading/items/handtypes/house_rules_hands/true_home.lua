SMODS.PokerHand{
    key = "sdown_true_home",
    l_chips = 50,
    l_mult = 4,
    chips = 145,
    mult = 15,
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
        { "S_A", true},
        { "S_A", true},
        { "D_K", true},
        { "D_K", true},
        { "D_K", true},
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and ((#SMODS.find_card('j_seeing_double') > 0) or (#SMODS.find_card('j_cbean_nameteam_diamondshapewithadotinside') > 0)) then --Checks if house rules and required joker are owned
            if not next(parts._straight) then return {} end
            local stones = {}
            for _, card in ipairs(hand) do
                if  (SMODS.has_enhancement(card, 'm_stone')) then
                    table.insert(stones,card)
                end
            end
            if #stones >= 5 then
                return {stones}
            else return {} end
        end
    end
}