SMODS.Consumable {
    key = '0chill_tatsumaki',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "finisher",
            sequence = 0,
            ----------------------
            max_retriggers = 40
        },
        extra = {
            retriggers = 3
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { (math.min(card.ability.extra.retriggers, card.ability.immutable.max_retriggers ))}, }
    end,
    pos = { x = 4, y = 0 },
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
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            return {
                repetitions = math.min(math.random(card.ability.extra.retriggers), card.ability.immutable.max_retriggers)
            }
        end
        if context.after and card.ability.immutable.sequence > 0 then
            SMODS.destroy_cards(card, nil, nil, true)
        end
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
        idea = "CapitalChirp", 
        art = "cmykl", 
        code = {"MarioFan597",
                "Inspector_B"
                },
    },
}