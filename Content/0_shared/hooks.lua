local buyspace = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.ability.consumeable and SMODS.find_card("c_cbean_sdown_nyx") then return true end
    return buyspace(card)
end