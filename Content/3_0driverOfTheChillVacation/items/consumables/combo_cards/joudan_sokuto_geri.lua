SMODS.Consumable {
    key = '0chill_joudan_sokuto_geri',
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
            xmult = 1.5,
            xmult_gain = 0.25
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.xmult, card.ability.extra.xmult_gain}, }
    end,
    pos = { x = 8, y = 0 },
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
        if context.individual and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            local lowest = 50
            for _,v in ipairs(context.scoring_hand) do
                lowest = math.min(lowest, v:get_id())
            end
            if context.other_card:get_id()==lowest then
                return {
                    xmult = (card.ability.extra.xmult + (#context.scoring_hand * card.ability.extra.xmult_gain))
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
        idea = "CapitalChirp", 
        art = "cmykl", 
        code = "MarioFan597",
    },
}