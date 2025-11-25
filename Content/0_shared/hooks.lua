local buyspace = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.ability.consumeable and SMODS.find_card("c_cbean_sdown_nyx") then return true end
    return buyspace(card)
end

--0 Drivers of the Chill Vaction
--Hides and reveals House Rules hands when House Rules is picked up or sold

--Makes the HR hand enabled without being played. Used to make planet show up
local show_default_house_hands = SMODS.is_poker_hand_visible
function SMODS.is_poker_hand_visible(handname)
    if     
        ((
            handname == 'cbean_0chill_house_rules'
        ) 
        and (#SMODS.find_card('j_cbean_0chill_house_rules') > 0))
    then 
        return true 
    end
    return show_default_house_hands(handname)
end


--Reveals all HR hands when seleceted
local show_house_hands = SMODS.is_poker_hand_visible
function SMODS.is_poker_hand_visible(handname)
    if G.jokers.highlighted[1] then
        if  
            ((#SMODS.find_card('j_cbean_0chill_house_rules') > 0)
            and (G.jokers.highlighted[1].config.center.key == 'j_cbean_0chill_house_rules')
            and
            (
                handname == 'cbean_0chill_fibonacci' or 
                handname == 'cbean_0chill_fibonacci_flush'
            ))
            
        then 
            return true 
        end
    end
    return show_house_hands(handname)
end

--Hides every HR hand when not in inventory
local show_house_hands = SMODS.is_poker_hand_visible
function SMODS.is_poker_hand_visible(handname)
    if  
        ((#SMODS.find_card('j_cbean_0chill_house_rules') < 1) and
        (
            handname == 'cbean_0chill_fibonacci' or 
            handname == 'cbean_0chill_fibonacci_flush' or 
            handname == 'cbean_0chill_house_rules'
        )) 
    then 
        return false
    end
    return show_house_hands(handname)
end