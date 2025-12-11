--Combo cards
--Neutral Special
SMODS.Consumable {
    key = 'yma_neutral_special',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "series",
            sequence = 0,
            ----------------------
        },
        extra = {
            retrigger = 1
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult} }
    end,
    pos = { x = 1, y = 2 },
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
    calculate = function(self, card, context) --Modifed from cryptid's assemble
        local next_card = nil
        if G.consumeables then
            for k, v in ipairs(G.consumeables.cards) do
                if v == card then
                    next_card = G.consumeables.cards[k+1]
                end
            end
        end
        if (context.repetition_only or (context.retrigger_joker_check)) and next_card and context.other_card == next_card and card.ability.immutable.sequence > 0 then
            return {
                repetitions = card.ability.extra.retrigger,
                card = context.other_card,
                message = localize('k_again_ex')
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
                "The Chill Vacation/",
                "Yeah! Mostly Artists"
                },
        idea = "RattlingSnow353", 
        art = "cmykl", 
        code = "RattlingSnow353",
    },
}
--Astral Projection
SMODS.Consumable {
    key = 'yma_astral_projection',
    set = 'Combo',
    atlas = 'yma_art_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "astral_projection",
            sequence = 0,
            ----------------------
        },
        extra = {},
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult} }
    end,
    pos = { x = 0, y = 0 },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier) 

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
        if context.before and card.ability.immutable.sequence > 0 then
            for k, v in ipairs(G.consumeables.cards) do
                if v == card then
                    UnselectCombo(G.consumeables.cards[k-1])
                end
            end
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
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
}
--Za Warudo
--SMODS.Consumable {
--    key = 'yma_za_warudo',
--    set = 'Combo',
--    atlas = 'yma_art_combo_atlas',
--    cost = 5,
--    config = { 
--         immutable = {
--            ---------------------- What every combo card needs
--            combo_type = "ultimate",
--            sequence = 0,
--            ----------------------
--        },
--        extra = {
--            blind_req_decrease = 30,
--        },
--        extra_slots_used = -0.75
--    },
--    loc_vars = function(self, info_queue, card)
--        return { vars = { card.ability.extra.chips, card.ability.extra.mult} }
--    end,
--    pos = { x = 1, y = 0 },
--    can_use = function(self, card)
--        return true
--    end,
--    use = function(self, card, area, copier) 
--
--        if G.GAME.blind.in_blind and CanCombo(card) --Selecting Card
--        then
--            SelectCombo(card)
--        elseif G.GAME.blind.in_blind and CanUncombo(card) then --Deselecting Card
--            UnselectCombo(card)
--        else
--            return nil
--        end              
--    end,                                 
--    keep_on_use = function(self, card) --Needed for every combo card
--        return true
--    end,
--    calculate = function(self, card, context) 
--        if context.before and card.ability.immutable.sequence > 0 then
--            SMODS.smart_level_up_hand(context.blueprint_card or card, context.scoring_name, nil, #G.GAME.cbean_combo_index)
--        end
--        if context.after and card.ability.immutable.sequence > 0 then
--            SMODS.destroy_cards(card, nil, nil, true)
--        end
--    end,
--    remove_from_deck = function(self, card, from_debuff)
--        if CanUncombo(card) and card.ability.immutable.sequence > 0 then 
--            UnselectCombo(card)
--        end
--    end,
--    beans_credits = {
--        team = { "Yeah! Mostly Artists" },
--        idea = "RattlingSnow353",
--        art = "RattlingSnow353",
--        code = "RattlingSnow353",
--    },
--}
