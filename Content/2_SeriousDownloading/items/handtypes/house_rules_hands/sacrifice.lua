
-- Sacrifice
SMODS.PokerHandPart {
    key = "sdown_sacrifice",
    func = function (hand)
        if #hand < 5 then return {} end
        local is_unplayed = true
        for _, card in ipairs(hand) do
            --todo: this doesn't really work because being a part of this hand increments times played and makes
            --the card no longer valid for the hand. move this calculation so that the hand can actually be played (somehow?)
            if card.ability.sdown_sacrifice_played then is_unplayed = false end
        end
        if is_unplayed then return {hand} else return {} end
    end
}

ColdBeans.OnCalculate(function (mod, context)
    if context.after then
        for _, c in ipairs(context.full_hand) do
            c.ability.sdown_sacrifice_played = true
        end
    end
end)

SMODS.PokerHand{
    key = "sdown_sacrifice",
    l_chips = 50,
    l_mult = 4,
    chips = 130,
    mult = 13,
    cb_house_rules = true,
    visible = function (self)
        local jokers = ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.obelisk
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
    example = {
        { "S_4", true },
        { "D_A", true },
        { "H_3", true },
        { "C_6", true },
        { "H_7", true },
    },
    evaluate = function(parts, hand)
        if ColdBeans.joker_cache.house_rules and ColdBeans.joker_cache.obelisk then --Checks if house rules and required joker are owned
            return parts.cbean_sdown_sacrifice
        end
    end
}