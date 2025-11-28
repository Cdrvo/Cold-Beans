--[[  Basic Example
SMODS.Consumable {
    key = '0chill_punch',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "starter",
            sequence = 0
            ----------------------
        },
        extra = {
            mult = 10
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult} }
    end,
    pos = { x = 2, y = 0 },
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
        if context.joker_main and card.ability.immutable.sequence > 0 then
            return {
                mult = (card.ability.extra.mult * (1 + (card.ability.immutable.sequence - 1)/10 )) --Combo effects power
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
        idea = "MarioFan597", --TODO
        art = "cmykl",  --TODO
        code = {"MarioFan597",
                "Inspector_B"
                },
    },
}
]]