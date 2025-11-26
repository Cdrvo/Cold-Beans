
combo_table = { --Lists all combo_types and what they can combo into
    starter = {starter=false, taunt=true, series=true, special_move=true, ultimate_move=false, finisher=true},
    taunt = {starter=false, taunt=false, series=true, special_move=true, ultimate_move=false, finisher=false},
    series = {starter=false, taunt=true, series=true, special_move=true, ultimate_move=false, finisher=true},
    special_move = {starter=false, taunt=true, series=true, special_move=true, ultimate_move=true, finisher=true},
    ultimate_move = {starter=false, taunt=false, series=false, special_move=false, ultimate_move=false, finisher=false},
    finisher = {starter=false, taunt=false, series=false, special_move=false, ultimate_move=false, finisher=false}
} 


---Functions (By MarioFan597)

function CanCombo(card) --Checks if the card can combo. Also makes the combo index which stores the sequence of moves used.
    if not G.GAME.cbean_combo_index then --Stores the type of move used previously
        --print("Made Combo Index")
        G.GAME.cbean_combo_index = {}
    end
    if next(G.GAME.cbean_combo_index) == nil and card.ability.immutable.sequence <= 0 then
        if card.ability.immutable.combo_type == ("starter" or "taunt") then
            --print("Can Combo Sucessfully From Empty Index") 
            return true
        else
            --print("Can't Combo From Empty Index") 
            return false
        end
    elseif combo_table[G.GAME.cbean_combo_index[#G.GAME.cbean_combo_index]][card.ability.immutable.combo_type] --Checks combo table if the previous combo would allow the new combo card type
        and card.ability.immutable.sequence <= 0 then 
            --print("Can Combo Sucessfully In Populated Index") 
            return true
    else
        --print(#G.GAME.cbean_combo_index)
        --print(G.GAME.cbean_combo_index)
        --print("Can't Combo In Populated Index")
        return false
    end
end

function CanUncombo(card) --Checks if the card can uncombo.
    if card.ability.immutable.sequence == #G.GAME.cbean_combo_index then
        return true
    else
        return false
    end
end

function SelectCombo(card)
    table.insert(G.GAME.cbean_combo_index, card.ability.immutable.combo_type)
    card.ability.immutable.sequence = #G.GAME.cbean_combo_index

    local eval = function(card) return (card.ability.immutable.sequence ~= 0) end
        juice_card_until(card, eval, true)
    print(#G.GAME.cbean_combo_index)
end

function UnselectCombo(card)
    G.GAME.cbean_combo_index[#G.GAME.cbean_combo_index] = nil
    card.ability.immutable.sequence = 0
    print(#G.GAME.cbean_combo_index)
end





---Combo Cards

SMODS.ConsumableType {
    key = '0chill_combo',
    default = 'c_cbean_0chill_starter1',
    primary_colour = HEX('E89A35'), --placeholder for now, we can update these once we know what we want to do.
    secondary_colour = HEX('BA6900'), --placeholder for now, we can update these once we know what we want to do.
    collection_rows = { 6, 6 },
    shop_rate = 1,
    loc_txt = {
        name = "Combo",
        collection = "Combo",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase this card",
                "in an unseeded",
                "run to learn",
                "what it does"
            }
        }
    },
}

SMODS.Consumable {
    key = '0chill_starter1',
    set = '0chill_combo',
    atlas = '0chill_combo_atlas',
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "starter",
            sequence = 0
            ----------------------
            --mult_
        }
    },
    pos = { x = 2, y = 0 },
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "", --TODO
        art = "",  --TODO
        code = {"MarioFan597",
                "Inspector_B"
                },
    },
    generate_ui = 0,
     loc_txt = {
        name = 'starter',
        text = {
            "Lorem Ipsem",
            "Lorem Ipsem",
            "Lorem Ipsem"
        }
    },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier) --Each card will have two uses. The first is when it is selected  and the second is when it is de-selected

        if G.GAME.blind.in_blind and CanCombo(card) --Selecting Card
        then
            SelectCombo(card)
        elseif G.GAME.blind.in_blind and CanUncombo(card) then --Deselecting Card
            UnselectCombo(card)
        else
            return nil
        end              
    end,                                    
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    remove_from_deck = function(self, card, from_debuff) 
        UnselectCombo(card)
    end
}

SMODS.Consumable {
    key = '0chill_taunt1',
    set = '0chill_combo',
    atlas = '0chill_combo_atlas',
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "series",
            sequence = 0
            ----------------------
            --mult_
        }
    },
    pos = { x = 2, y = 0 },
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "", --TODO
        art = "",  --TODO
        code = {"MarioFan597",
                "Inspector_B"
                },
    },
    generate_ui = 0,
     loc_txt = {
        name = 'series',
        text = {
            "Lorem Ipsem",
            "Lorem Ipsem",
            "Lorem Ipsem"
        }
    },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier) --Each card will have two uses. The first is when it is selected  and the second is when it is de-selected
        if G.GAME.blind.in_blind and CanCombo(card) --Selecting Card
        then
            SelectCombo(card)
        elseif G.GAME.blind.in_blind and CanUncombo(card) then --Deselecting Card
            UnselectCombo(card)
        else
            return nil
        end              
    end,                                    
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    remove_from_deck = function(self, card, from_debuff) 
        UnselectCombo(card)
    end
}