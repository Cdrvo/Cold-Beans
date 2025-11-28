SMODS.Consumable {
    key = '0chill_crouching_launch',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "starter",
            sequence = 0
            ----------------------
        },
        extra = {
            chips = 10,
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
        return { vars = { card.ability.extra.chips } }
    end,
    pos = { x = 9, y = 1 },
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
    calculate = function(self, card, context) 
        --Taken from vanilla remade
        if context.individual and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            if context.other_card == context.scoring_hand[1] then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +
                    card.ability.extra.chips
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
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
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "cmykl", 
        art = "cmykl", 
        code = {"MarioFan597",
                "Inspector_B"
                },
    },
}