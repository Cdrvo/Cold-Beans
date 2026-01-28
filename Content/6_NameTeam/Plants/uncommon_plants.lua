
SMODS.Joker({
    key = "doom_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            blind = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            SMODS.add_card{key="j_cbean_crater",area=G.jokers}
            if not NAMETEAM.reduce then NAMETEAM.reduce = 0 end
            if G.GAME.blind and G.GAME.blind.in_blind then
                NAMETEAM.reduce = NAMETEAM.reduce + 2
                if G.GAME.blind.boss then
                    G.GAME.blind.chips = G.GAME.blind.chips/cae.blind
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                else
                    G.GAME.blind.chips = 0
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                end
                NAMETEAM.msg(card, "Doom!")
            else
                NAMETEAM.reduce = NAMETEAM.reduce + 3
            end
        end
    end,
})

SMODS.Joker({
    key = "wallnut",
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    update = function(self,card)
        local rr = nil
        if card and card.area and card.area.cards and card.added_to_deck then
            for i = 1, #card.area.cards do 
                if card.area.cards[i] == card then
                    rr = i
                end
            end
            if rr and card.area.cards[rr+1] then
                if card.area.cards[rr+1].debuff then card.area.cards[rr+1].debuff = nil end
            end
        end
    end
})

SMODS.Joker({
    key = "potatomine",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            rounds = 2,
            rounds_current = 0
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rounds,cae.rounds_current}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval and not context.blueprint then
            if cae.rounds_current < cae.rounds-1 then
                cae.rounds_current = cae.rounds_current + 1
            elseif cae.rounds_current<cae.rounds then
                cae.rounds_current = cae.rounds_current + 1
                local eval = function() return cae.rounds_current==0 end
                juice_card_until(card, eval, true)
            end
        end
        if context.selling_card and cae.rounds_current>=cae.rounds then
            NAMETEAM.msg(card, localize("k_cbean_halved"))
            G.GAME.blind.chips = (G.GAME.blind.chips)/(2)
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips) --iforgotmytalismancompatibiltiy
        end
    end,
})

SMODS.Joker({
    key = "snowpea",
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 4
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMDOS.get_probability_vars(card,1,cae.odds,"snowpea_seedssomething")
        return{
            vars={num,den,cae.odds}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.setting_blind and not context.blueprint and SMODS.pseudorandom_probability(card,"snowpea_seedssomething",1,cae.odds) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            delay(0.4)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                    return true
                end
            }))
            return nil, true
        end
    end,
})


SMODS.Joker({
    key = "chomper",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            rounds_current = 0,
            active = true,
            active_this_round = false
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rounds_current}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.destroy_card and context.cardarea == G.play and not context.blueprint and cae.active then
            if #context.scoring_hand==1 and #G.play.cards==1 then
                cae.active = false
                cae.active_this_round = true
                cae.rounds_current = 2
                return{
                    remove = true,
                    message = localize("k_cbean_chomp")
                }
            end
        end
        if context.end_of_round and not context.blueprint and not cae.active and context.main_eval then
            if cae.active_this_round then
                cae.active_this_round = false
            else
                if cae.rounds_current>1 then
                    cae.rounds_current = cae.rounds_current - 1
                else
                    cae.rounds_current = 0
                    cae.active = true
                end
            end
        end
    end,
})

SMODS.Joker({
    key = "repeater",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rounds_current}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.repetition and context.cardarea == G.play and G.GAME.current_round.hands_played == 0  then
            return {
                repetitions = cae.repetitions
            }
        end
    end,
})

SMODS.Joker({
    key = "puff_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and (G.jokers.cards[1] == card or G.jokers.cards[2] == card) then
            return{
                xmult = cae.xmult
            }
        end
    end,
})