SMODS.Consumable {
    key = '0chill_low_short',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "series",
            sequence = 0,
            ----------------------
        },
        extra = {
            xmult = 2
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmult}, }
    end,
    pos = { x = 1, y = 1 },
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
        if context.individual and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            local highest = 0
            for _,v in ipairs(context.scoring_hand)do
                highest = math.max(highest, v:get_id())
            end
            if context.other_card:get_id()==highest then
                return {
                    xmult = (card.ability.extra.xmult * (1 + (card.ability.immutable.sequence - 1)/10 ))
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