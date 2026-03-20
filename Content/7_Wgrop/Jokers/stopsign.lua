SMODS.Joker{
    key = 'wgrop_stop_sign',
    atlas = 'wgrop_joker_atlas',
    rarity = 3,
    cost = 12,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 3},
    config = {
        extra = {
            percentage = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage/2,
                card.ability.extra.incper
            }
        }
    end,
    calculate = function(self, card, context) --for the future
    if context.after then
            G.GAME.wgrop_stopsign_blindwasskipped = false
            card.ability.extra.percentage = 0
            G.GAME.wgrop_stopsign_blindwillbeskipped = false
            if G.GAME.current_round.hands_played == 0 and SMODS.calculate_round_score() then
                if SMODS.calculate_round_score() > G.GAME.blind.chips then
                    card.ability.extra.percentage = SMODS.calculate_round_score()/(G.GAME.blind.chips/100)
                    return {
                        message = "STOP!",
                        colour = G.C.RED
                    }
                end
                if card.ability.extra.percentage >= 500 then
                    G.GAME.wgrop_stopsign_blindshopskipped = true
                    G.GAME.wgrop_stopsign_blindwillbeskipped = true
                elseif card.ability.extra.percentage >= 100 then
                    G.GAME.wgrop_stopsign_blindwillbeskipped = true
                    G.GAME.wgrop_stopsign_blindshopskipped = false
                elseif card.ability.extra.percentage < 100 then
                    G.GAME.wgrop_stopsign_blindwillbeskipped = false
                    G.GAME.wgrop_stopsign_blindshopskipped = false
                end
            else 
                card.ability.extra.percentage = 0
            end
        end
        if context.first_hand_drawn and card.ability.extra.percentage ~= 0 then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "GO!", colour = G.C.GREEN})        
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        G.GAME.chips =  (G.GAME.blind.chips/100)*(card.ability.extra.percentage/2)
                        card.ability.extra.percentage = 0
                        if G.GAME.chips >= G.GAME.blind.chips then
                            G.STATE = G.STATES.HAND_PLAYED
                            G.STATE_COMPLETE = true
                            end_round()
                            --G.FUNCS.draw_from_hand_to_deck()
                            return {
                            }
                        end
                        
                        --G.FUNCS.draw_from_hand_to_discard() 
                    end
                }))
        end
        --[[if context.starting_shop then
               
        end]]
    end,

    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "AstraLuna",
    code = "Tje.tsu",
    }
}

