
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

SMODS.Joker({
    key = "fume_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.25,
            pos = nil,
            tab = {}
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and not context.blueprint then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    cae.rr = i
                end
            end

            for i = 1, #G.jokers.cards do
               if i > cae.rr then
                    G.jokers.cards[i].ability.fume_shroomed_cbean = true
               end
            end
        end

        if context.other_joker and context.other_joker.ability.fume_shroomed_cbean then
            context.other_joker.ability.fume_shroomed_cbean  = false
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
    key = "scaredy_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and (G.jokers.cards[1] == card or G.jokers.cards[2] == card) then
            return{
                mult = cae.mult
            }
        end
    end,
})


SMODS.Joker({
    key = "ice_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            NAMETEAM.no_progress = true
        end
    end,
})

SMODS.Joker({
    key = "squash",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            if G.GAME.blind then
                if G.GAME.blind.boss then
                    NAMETEAM.msg(card, localize("k_cbean_halved"))
                    G.GAME.blind.chips = (G.GAME.blind.chips)/(2)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips) --iforgotmytalismancompatibiltiy
                else
                NAMETEAM.defeat()
                end
            end
        end
    end,
})

SMODS.Joker({
    key = "threepeater",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.5,
            chips = 30,
            dollars = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.xmult,cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult,
                chips = cae.chips
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        local cae = card.ability.extra
        return cae.dollars
    end
})

SMODS.Joker({
    key = "spikeweed",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2.5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult,
            }
        end
        if context.individual and not context.blueprint and context.cardarea == G.play then
			if ((not context.other_card.ability.perma_bonus) or ((-(context.other_card.ability.perma_bonus)))<context.other_card.base.id) then
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus - 1

                if -(context.other_card.base.id)>= -(context.other_card.ability.perma_bonus) then
                    context.other_card.ability.cbean_marked = true
                end
				return {
					message = "Downgrade!",
					colour = G.C.MULT,
					message_card = context.other_card,
				}
            end
		end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card.ability.cbean_marked then
            return{
                remove = true
            }
        end
    end,
})

SMODS.Joker({
    key = "sea_shroom",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.75
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and G.jokers.cards[1] == card then
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
    key = "blover",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.05
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.after and NAMETEAM.blover_number and not context.blueprint then
            for i = 1, NAMETEAM.blover_number do
                SMODS.scale_card(card, {
					ref_table = cae,
					ref_value = "xmult",
					scalar_value = "xmult_gain",
				})
            end
        end
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
})



SMODS.Joker({
    key = "pumpkin",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            uses_def = 3,
            uses = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.uses_def,cae.uses}}
    end,
    update = function(self,card,context)
        local cae = card.ability.extra
        if card.added_to_deck then
            local rr = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then rr = i end
            end

            if rr and G.jokers.cards[rr-1] then
                local acard = G.jokers.cards[rr-1]

                if acard.facing and acard.facing == "back" then
                    acard:flip()
                    cae.uses = cae.uses - 1
                    NAMETEAM.msg(card, "-1")
                end

                if acard.debuff then 
                    acard.debuff = false
                    cae.uses = cae.uses - 1
                    NAMETEAM.msg(card, "-1")
                end
            end
        end
        if cae.uses <= 0 and not card.cbean_des then
            card.cbean_des = true
            SMODS.destroy_cards(card, true)
        end
    end
})

SMODS.Joker({
    key = "magnet_shroom",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.3,
            dollars = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.xmult_gain,cae.dollars}}
    end,
    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.before and not context.blueprint then
            local enhanced = {}
            for _, v in ipairs(context.scoring_hand) do
                if v.config.center_key == "m_steel" or v.config.center_key == "m_gold" then
                    enhanced[#enhanced + 1] = v
                    v.vampired = true
                    v:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            v.vampired = nil
                            return true
                        end
                    }))
                end
            end

            if #enhanced > 0 then
                for i = 1, #enhanced do
                    SMODS.scale_card(card,{
                        ref_table = cae,
                        ref_value = "xmult",
                        scalar_value = "xmult_gain"
                    })
                end 
            end
        end
        if context.joker_main then
            return {
                xmult = cae.xmult
            }
        end
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars
    end
})


SMODS.Joker({
    key = "flower_pot",
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 3,
            trigger = false
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.initial_scoring_step then
            local suits, suits_num, smods_suits = {},0,0
            for k, v in pairs(SMODS.Suits) do
                smods_suits = smods_suits + 1
            end

            for k, v in pairs(context.scoring_hand) do
                if not suits[v.base.suit] then
                    suits[v.base.suit] = true
                    suits_num = suits_num + 1
                end
            end

            if suits_num == smods_suits then
                cae.trigger = true
            end

        end
        if context.joker_main and cae.trigger then
            return {
                xmult = cae.xmult
            }
        end

        if context.after then
            cae.trigger = false
        end
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars
    end
})