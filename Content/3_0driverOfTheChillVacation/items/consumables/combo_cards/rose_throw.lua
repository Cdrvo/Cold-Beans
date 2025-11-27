SMODS.Consumable {
    key = '0chill_rose_throw',
    set = 'Combo', --Had to leave out team name since the 0 caused issues
    atlas = '0chill_combo_atlas',
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "taunt",
            sequence = 0
            ----------------------
        },
        extra = {
            lower = 2
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
        return { vars = { card.ability.extra.lower} }
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
    calculate = function(self, card, context)
        if context.joker_main and card.ability.immutable.sequence > 0 then
           card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("cbean_0chill_blind_weakend"), colour = G.C.DARK_EDITION});
           G.GAME.blind.chips = G.GAME.blind.chips * (1 - ((card.ability.extra.lower + (card.ability.immutable.sequence-1))/100))
           G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)  
        end
        if context.after and card.ability.immutable.sequence > 0 then
            SMODS.destroy_cards(card, nil, nil, true)
            G.GAME.cbean_combos_used = G.GAME.cbean_combos_used + 1
        end
    end,                       
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    
    remove_from_deck = function(self, card, from_debuff) 
        UnselectCombo(card)
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