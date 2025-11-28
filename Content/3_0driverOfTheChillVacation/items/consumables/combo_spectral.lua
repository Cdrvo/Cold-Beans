SMODS.Consumable {
    key = '0chill_nope_from_above',
    set = "Spectral",
    hidden = true,
    soul_set = "Combo",
    atlas = '0chill_spectral_atlas',
    cost = 8,
    pos = { x = 2, y = 0},
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "universal",
            sequence = 0,
            ----------------------
        },
        extra = {
            combo_size = 100 --Needed to say how big it is
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
        return { vars = { card.ability.extra.combo_size }}
    end,
    pos = { x = 0, y = 0 },
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
    select_card = "consumeables",
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = {"MarioFan597",
                "CapitalChirp"},
        art = "cmykl",
        code = "MarioFan597",
    },
}