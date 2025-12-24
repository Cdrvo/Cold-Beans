SMODS.Consumable {
    key = 'wgrop_party_poppers',
    set = 'Combo',
    atlas = 'wgrop_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "special",
            sequence = 0,
            ----------------------
        },
        extra = {chips = 30, mult = 8, dmin = 2, dmax = 5},
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        if G.GAME.cbean_combo_index then
            return { vars = { card.ability.extra.chips * (1+((#G.GAME.cbean_combo_index)/5)),
            card.ability.extra.mult * (1+((#G.GAME.cbean_combo_index)/10)),
            math.floor(card.ability.extra.dmin * (1+((#G.GAME.cbean_combo_index)/12))) ,
            math.floor(card.ability.extra.dmax * (1+((#G.GAME.cbean_combo_index)/12)))}}
        else
            return { vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.dmin, card.ability.extra.dmax}}
        end
    end,
    pos = { x = 2, y = 0 },
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
        local nchips = card.ability.extra.chips
        local nmult = card.ability.extra.mult
        local ndmin = card.ability.extra.dmin
        local ndmax = card.ability.extra.dmax
        if context.individual and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            if G.GAME.cbean_combo_index then
                nchips = card.ability.extra.chips * (1+((#G.GAME.cbean_combo_index)/5))
                nmult = card.ability.extra.mult * (1+((#G.GAME.cbean_combo_index)/10))
                ndmin = math.floor(card.ability.extra.dmin * (1+((#G.GAME.cbean_combo_index)/12))) 
                ndmax = math.floor(card.ability.extra.dmax * (1+((#G.GAME.cbean_combo_index)/12)))
            end
            local poppertable = {
                nchips,
                nmult,
                ndmin
            }
            local effect = pseudorandom_element(poppertable, "tje")
            if effect == nchips then
                return {
                    chips = nchips
                }
            elseif effect == nmult then
                return {
                    mult = nmult
                }
            elseif effect == ndmin then
                local dollargiven =  math.floor(ndmin + pseudorandom('tje') * (ndmax - ndmin))
                ease_dollars(dollargiven)
                card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = localize('$')..dollargiven, colour = G.C.MONEY})

            else
                card_eval_status_text(context.other_card, 'extra', nil, nil, nil, {message = "Empty!", colour = G.C.RED})
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
        team = { "wgrop" },
        idea = "Tje.tsu",
        art = "Tje.tsu",
        code = "Tje.tsu",
    }
}