SMODS.Consumable {
    key = 'wgrop_gaster_blaster',
    set = 'Combo',
    atlas = 'wgrop_combo_atlas',
    cost = 5,
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "gaster_blaster",
            sequence = 0,
            ----------------------
        },
        extra = {multbase = 2, lowest = math.huge},
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        if G.GAME.cbean_combo_index then
        return { vars = { ( card.ability.extra.multbase * (1 + (#G.GAME.cbean_combo_index)/10 ))}}
        else
            return { vars = { card.ability.extra.multbase}}
        end
    end,
    pos = { x = 0, y = 0 },
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
        if context.before and context.scoring_hand ~= nil and card.ability.immutable.sequence > 0 then
            local playedcards = SMODS.shallow_copy(context.scoring_hand)
            local aughandtable = {}
            for i, v in ipairs(playedcards) do
                local crank = v:get_id()
                local csuit = v.base.suit
                local cpos = i 
                table.insert(aughandtable, { rank = crank, suit = csuit, pos = cpos})
            end
            for i, v in ipairs(aughandtable) do
                if v.rank < card.ability.extra.lowest then
                    card.ability.extra.lowest = v.rank
                    lowestpos = v.pos
                end
            end
            card_eval_status_text(context.scoring_hand[lowestpos], 'extra', nil, nil, nil, {message =('Boned!'), colour = HEX('51EFF6')})
            G.E_MANAGER:add_event(Event({  
                trigger = 'after',
                delay = 0.3,
                func = function()
                    context.scoring_hand[lowestpos]:juice_up()
                    card:juice_up()
                    play_sound('tarot1')
                    SMODS.modify_rank(context.scoring_hand[lowestpos], 14-card.ability.extra.lowest)
                    return true
                end    
            }))
        end
        if context.individual and context.cardarea == G.play and card.ability.immutable.sequence > 0 then
            return {
                mult = ((card.ability.extra.multbase * (1 + (#G.GAME.cbean_combo_index - 1)/10 )) * (14 - card.ability.extra.lowest))
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
    },
}