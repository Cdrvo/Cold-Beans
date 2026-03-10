SMODS.Consumable {
    key = '0chill_fighting_stance',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "taunt",
            sequence = 0,
            ----------------------
        },
        extra = {
            combo_size = 3 --Needed to say how big it is
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
        return { vars = { card.ability.extra.combo_size }}
    end,
    pos = { x = 0, y = 0 },
    can_use = function(self, card)
        if CanCombo(card) or CanUncombo(card) then return true end
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
    calculate = function(self, card, context)
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
        idea = "MarioFan597",
        art = "cmykl",
        code = "MarioFan597",
    },
}