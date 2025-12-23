SMODS.Consumable {
    key = 'wgrop_let_the_people_rejoice',
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
        extra = {scaletresh = 100, xms = 0.2, xcs = 0.3, mxmax = 30, cxmax = 60},
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        if G.GAME.cbean_combo_index then
            return { vars = { (card.ability.extra.scaletresh/(1 + (#G.GAME.cbean_combo_index)/10 )), (card.ability.extra.xms*(1 + (#G.GAME.cbean_combo_index)/15 )), (card.ability.extra.xcs*(1 + (#G.GAME.cbean_combo_index)/10 )),
            (card.ability.extra.mxmax*(1 + (#G.GAME.cbean_combo_index)/8)), (card.ability.extra.cxmax*(1 + (#G.GAME.cbean_combo_index)/7)), #G.GAME.cbean_combo_index
            }}
        else
            return { vars = { card.ability.extra.scaletresh, card.ability.extra.xms, card.ability.extra.xcs, card.ability.extra.mxmax, card.ability.extra.cxmax}}
        end
    end,
    pos = { x = 1, y = 0 },
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
        if context.final_scoring_step and context.scoring_hand ~= nil and card.ability.immutable.sequence > 0 then 
            if mult then
                local scorexmult = 1
                local scorexchips = 1
                if G.GAME.cbean_combo_index then
                    if mult-hand_chips > 0 then
                        scorexmult =  1+(((mult-hand_chips)/(card.ability.extra.scaletresh/(1 + (#G.GAME.cbean_combo_index)/10 )))*((card.ability.extra.xms*(1 + (#G.GAME.cbean_combo_index)/15 ))))
                        scorexchips =  1+(((mult-hand_chips)/(card.ability.extra.scaletresh/(1 + (#G.GAME.cbean_combo_index)/10 )))*((card.ability.extra.xcs*(1 + (#G.GAME.cbean_combo_index)/10 ))))
                        if scorexmult > (card.ability.extra.mxmax*(1 + (#G.GAME.cbean_combo_index - 1)/8)) then
                            scorexmult = (card.ability.extra.mxmax*(1 + (#G.GAME.cbean_combo_index - 1)/8))
                        end
                        if scorexchips > (card.ability.extra.cxmax*(1 + (#G.GAME.cbean_combo_index)/7)) then
                            scorexchips = (card.ability.extra.cxmax*(1 + (#G.GAME.cbean_combo_index)/7))
                        end
                    end
                else
                    scorexmult = 1+(((mult-hand_chips)/card.ability.extra.scaletresh)*card.ability.extra.xms)
                    scorexchips = 1+(((mult-hand_chips)/card.ability.extra.scaletresh)*card.ability.extra.xms)
                    if scorexmult > card.ability.extra.mxmax then
                        scorexmult = card.ability.extra.mxmax
                    end
                    if scorexchips > card.ability.extra.cxmax then
                        scorexchips = card.ability.extra.cxmax
                    end
                end
                if scorexmult > 1 and scorexchips > 1 then
                    return {
                        xmult = scorexmult,
                        xchips = scorexchips
                    }
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
        team = { "wgrop" },
        idea = "Tje.tsu",
        art = "Tje.tsu",
        code = "Tje.tsu",
    },
}