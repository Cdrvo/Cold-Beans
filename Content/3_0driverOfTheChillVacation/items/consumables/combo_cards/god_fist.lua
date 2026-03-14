SMODS.Consumable {
    key = '0chill_god_fist',
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
            x_value_max = 1.5,
            odds = 2,
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "God Fist")
        return { vars = {card.ability.extra.x_value_max, num, denom}, }
    end,
    pos = { x = 2, y = 0 },
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
        if context.joker_main and card.ability.immutable.sequence > 0 then
            local reapeat_check = SMODS.pseudorandom_probability(card, "IGN rates it 3/10", 1, card.ability.extra.odds, "God Fist")
            if repeat_check then
                return{
                    x_mult = card.ability.extra.x_value_max
                }
            else
                return{
                    x_chips = card.ability.extra.x_value_max
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