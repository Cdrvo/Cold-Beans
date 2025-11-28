SMODS.Consumable {
    key = '0chill_jump',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "starter",
            sequence = 0,
            ----------------------
        },
        extra = {
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
    end,
    pos = { x = 2, y = 1 },
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
    calculate = function(self, card, context) --This is just taken from vanilla remade. Will try to comback to give more original effect
        if context.modify_scoring_hand and card.ability.immutable.sequence > 0 and not context.blueprint  then
            return {
                add_to_hand = true
            }
        end
        if context.after and card.ability.immutable.sequence > 0 then
            SMODS.destroy_cards(card, nil, nil, true)
        end
    end,                             
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    remove_from_deck = function(self, card, from_debuff)
        if CanUncombo(card) and card.ability.immutable.sequence > 0 then 
            UnselectCombo(card)
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = {"cmykl",
            "MarioFan597"},
        art = "cmykl", 
        code = "MarioFan597"
    },
}