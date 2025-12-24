SMODS.Consumable {
    key = 'wgrop_blue_rose_closer',
    set = 'Combo',
    atlas = 'wgrop_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "ultimate",
            sequence = 0,
            ----------------------
        },
        extra = {retrigger = 1, xchips = 2},
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        if G.GAME.cbean_combo_index then
            return { vars = { math.floor(card.ability.extra.retrigger * (1+((#G.GAME.cbean_combo_index)/15))),
            card.ability.extra.xchips * (1+((#G.GAME.cbean_combo_index)/7))}}
        else
            return { vars = {card.ability.extra.retrigger, card.ability.extra.xchips}}
        end
    end,
    pos = { x = 3, y = 0 },
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
        if context.individual and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            return {
                xchips = card.ability.extra.xchips * (1+((#G.GAME.cbean_combo_index)/7)),
                card = context.other_card
            }
        end
        if context.repetition and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            return {
                repetitions = math.floor(card.ability.extra.retrigger * (1+((#G.GAME.cbean_combo_index)/15))),
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
        team = { "wgrop" },
        idea = "Tje.tsu",
        art = "Tje.tsu",
        code = "Tje.tsu",
    }
}