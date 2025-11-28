SMODS.Consumable {
    key = '0chill_wryyyyyy',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "taunt",
            sequence = 0,
            ---------------------- 
            max_rep = 40
        },
        extra = {
            odds = 8,
            redo = 1,
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "Wryyyyyy")
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
        return { vars = { num, denom} }
    end,
    pos = { x = 3, y = 1 },
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
        if context.repetition and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            local reapeat_check = SMODS.pseudorandom_probability(card, "IT WAS ME: DIO!", 1, card.ability.extra.odds, "Wryyyyyy")
            if reapeat_check then
                card.ability.extra.redo = card.ability.extra.redo + 1
            end
            if card.ability.extra.redo > 1 then
                return {
                    message = localize("k_again_ex"),
                    repetitions = math.min(card.ability.immutable.max_rep, card.ability.extra.redo - 1),
                }
            end
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
        idea = "MarioFan597",
        art = "cmykl",
        code = {"MarioFan597",
                "Inspector_B"
                },
    },
}