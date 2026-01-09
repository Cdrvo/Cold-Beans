
-- Define the PokerHand using the part
SMODS.PokerHand{
    key = "wgrop_thorny_boquete",
    chips = 35,
    mult = 10,
    l_chips = 8,
    l_mult = 2,
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
        { "D_J", true },
        { "S_5", true },
        { "H_3", true },
        { "C_A", true },
        { "H_6", true },
    },
    evaluate = function(parts, hand)
        if (#SMODS.find_card('j_cbean_0chill_house_rules') > 0) and (#SMODS.find_card('j_cbean_wgrop_withering_memory') > 0) then --Checks if house rules and required joker are owned 
            local lightcount = 0
            local darkcount = 0

            for _, fcard in ipairs(hand) do
                if fcard.base.suit == "Hearts" or fcard.base.suit == "Diamonds" then
                    lightcount = lightcount + 1
                elseif fcard.base.suit == "Spades" or fcard.base.suit == "Clubs" then
                    darkcount = darkcount + 1
                end
            end

            if (lightcount == 3 and darkcount == 2)
            or (lightcount == 2 and darkcount == 3) then
                return { hand }
            end

            return {}
        end
    end

}
