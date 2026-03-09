SMODS.Consumable {
    key = '0chill_torou_zan',
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
            blind = 25,
            xmult = 3
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.blind} }
    end,
    pos = { x = 6, y = 1 },
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
    calculate = function(self, card, context)
        if context.before and card.ability.immutable.sequence > 0 then
           card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("cbean_0chill_blind_weakend"), colour = G.C.DARK_EDITION});
           G.GAME.blind.chips = G.GAME.blind.chips * (1 + (card.ability.extra.blind / 100))
           G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)  
        end
        if context.joker_main and card.ability.immutable.sequence > 0 then
            return {
                x_mult = card.ability.extra.xmult
            }
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