
SMODS.Joker({
    key = "doom_shroom",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 4
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMODS.get_probability_vars(card,1,cae.odds,"snowpea_seedssomething")
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.repetitions}}
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
                xmult = cae.xmult,
                message_card = context.other_joker
            }
        end
    end,
})

SMODS.Joker({
    key = "scaredy_shroom",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 20,
            rounds = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult,cae.rounds}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            NAMETEAM.no_progress = NAMETEAM.no_progress + cae.rounds
        end
    end,
})

SMODS.Joker({
    key = "squash",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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



SMODS.Joker({
    key = "plantern",
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
		 if G.next_fivcards_cbean then
			G.next_fivcards_cbean:remove()
			G.next_fivcards_cbean = nil
		 end

		G.next_fivcards_cbean = CardArea(
			G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2,
			G.ROOM.T.h,
			G.CARD_W * 2,
			G.CARD_H * 1.1,
			{ card_limit = 5, type = "joker", highlight_limit = 0,no_card_count = true}
		)
	
		local cae = card.ability.extra
        local carea = nil
        if G.deck and G.deck.cards then
            carea = G.deck.cards
        end
		
        if carea then
            local card_1,card_2,card_3,card_4,card_5 = carea[#carea] and copy_card(carea[#carea]), carea[#carea-1] and copy_card(carea[#carea-1]), carea[#carea-2] and copy_card(carea[#carea-2]), carea[#carea-3] and copy_card(carea[#carea-3]), carea[#carea-4] and copy_card(carea[#carea-4]) 
            
            if card_1 then
            G.next_fivcards_cbean:emplace(card_1)
            end
            if card_2 then
            G.next_fivcards_cbean:emplace(card_2)
            end
            if card_3 then
            G.next_fivcards_cbean:emplace(card_3)
            end
            if card_4 then
            G.next_fivcards_cbean:emplace(card_4)
            end
            if card_5 then
            G.next_fivcards_cbean:emplace(card_5)
            end
        end
        
		return{
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", padding = 0.02 },
					nodes = {
						{ n = G.UIT.O, config = { object = G.next_fivcards_cbean } },
					},
				},
			},
			vars={cae.cj1,cae.cj2, cae.c1, cae.c2}
		}
	end,
    update = function(self,card)
        if card.added_to_deck then
            local areas = {
            }
            for k, v in pairs(SMODS.get_card_areas("jokers")) do
                areas[#areas+1] = v
            end

            areas[#areas+1] = G.hand

            for k, v in pairs(areas) do
               for _, _card in pairs(v.cards) do
                    if _card.facing and _card.facing == "back" then
                        _card:flip()
                    end
               end
            end
        end
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
})


SMODS.Joker({
    key = "coffee_bean",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rep1 = 1,
            rep2 = 2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rep1,cae.rep2}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.retrigger_joker_check and not context.retrigger_joker and card:on_the("right") and context.other_card == card:on_the("right") then
            if string.find(card:on_the("right").config.center.key, "shroom") then
                return{
                    message = localize("k_again_ex"),
                    repetitions = cae.rep2,
                    card = card,
                }
            else
                return{
                    message = localize("k_again_ex"),
                    repetitions = cae.rep1,
                    card = card,
                }
            end
        end 
    end
})

SMODS.Joker({
    key = "cactus",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.xmult_gain}}
    end,
    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.after and NAMETEAM.cactus_number and not context.blueprint then
            for i = 1, NAMETEAM.cactus_number do
                NAMETEAM.cactus_number = NAMETEAM.cactus_number- 1
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
    key = "melon_pult",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2,
            mult = 10,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and not context.blueprint then
            local rr = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    rr = i
                end
            end

            if G.jokers.cards[rr+1] then
                G.jokers.cards[rr+1].ability.cbean_melon = true
            end
            if G.jokers.cards[rr-1] then
                G.jokers.cards[rr-1].ability.cbean_melon = true
            end
        end

        if context.other_joker and context.other_joker.ability.cbean_melon then
            context.other_joker.ability.cbean_melon  = false
            return{
                mult = cae.mult,
                message_card = context.other_joker
            }
        end

        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
    key = "twin_sunflower",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 8
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                dollars = cae.dollars
            }
        end
    end,
})

SMODS.Joker({
    key = "gloom_shroom",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmukt = 1.5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmukt}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.post_trigger and not context.blueprint and (context.other_context.joker_main or context.other_context.individual or NAMETEAM.during_scoring) then
            if (card:on_the("right") and context.other_card == card:on_the("right")) or (card:on_the("left") and context.other_card == card:on_the("left")) then
                -- print("KILL YOURSELF")
                context.other_card.ability.gloomy_shroomy = true
            end
        end
        if context.other_joker and context.other_joker.ability.gloomy_shroomy then
            context.other_joker.ability.gloomy_shroomy  = false
            return{
                xmult = cae.xmukt,
                message_card = context.other_joker
            }
        end
    end,
})

SMODS.Joker({
    key = "cattail",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmukt = 1,
            xmult_gain = 0.75,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmukt,cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmukt
            }
        end
        if context.after and NAMETEAM.cattail_number then
            for i = 1, NAMETEAM.cattail_number do
                NAMETEAM.cattail_number = NAMETEAM.cattail_number - 1
                SMODS.scale_card(card,{
                    ref_table = cae,
                    ref_value = "xmukt",
                    scalar_value = "xmult_gain"
                })
            end
        end
    end,
})

SMODS.Joker({
    key = "cob_cannon",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            stored_chips = 0,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.stored_chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.post_trigger and context.other_ret then
            if G.GAME.current_round.hands_left >0 then
                if context.other_ret then
                    for k, v in pairs(context.other_ret) do
                        if type(v) == "table" then
                            for k, v in pairs(v) do
                                local a = string.upper(tostring(k))
                                if string.find(a,"CHIPS") or string.find(a,"CHIPS_MOD") or string.find(a,"CHIP_MOD") then -- i had this ready so i coyp pasted 
                                    cae.stored_chips = cae.stored_chips + v
                                    NAMETEAM.msg(card, "Stored: +" .. cae.stored_chips)
                                end
                            end
                        end
                    end
                end
            else 
                -- 
            end
        end
        if context.joker_main and not context.blueprint and G.GAME.current_round.hands_left <= 0 and cae.stored_chips > 0 then
            return{
                chips = cae.stored_chips
            }
        end
        if context.end_of_round and context.main_eval then
            cae.stored_chips = 0
            NAMETEAM.msg(card, localize("k_reset"))
        end
    end,
})

SMODS.Joker({
    key = "bloomerang",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            repetitions = 0,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.stored_chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] and #context.scoring_hand>=2 then
            SMODS.score_card(context.scoring_hand[1], context)
        end
    end,
})


SMODS.Joker({
    key = "coconut_cannon",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            rep2 = 1,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.stored_chips}}
    end,
    calculate = function(self,card,context)
	local cae = card.ability.extra
	if context.retrigger_joker_check and not context.retrigger_joker and G.GAME.current_round.hands_left==0 then
		if
			(card:on_the("right") and context.other_card == card:on_the("right"))
			or (card:on_the("left") and context.other_card == card:on_the("left"))
		then
			return {
				message = localize("k_again_ex"),
				repetitions = cae.rep2,
				card = card,
			}
		end
	end
    end,
})


SMODS.Joker({ --ehehehehehehe
    key = "bonk_choy",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 1.5,
            lowest_card = nil,
            lowest_id = nil
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
	local cae = card.ability.extra
        if context.before then
            local cards = {
            
            }
            for k, v in pairs(G.hand.cards) do
                cards[#cards+1] = v
            end
            for k, v in pairs(G.play.cards) do
                cards[#cards+1] = v
            end

            cae.lowest_card = NAMETEAM.find_lowest(cards)
            cae.lowest_id = NAMETEAM.find_lowest(cards).base.id
        end
        if context.initial_scoring_step then
            local its_in_play = false
           
            for k, v in pairs(context.scoring_hand) do
                if v == cae.lowest_card then
                    its_in_play = true
                    if v:on_the("right") then
                        v:on_the("right").crv_adjlowest = true
                    end
                    if v:on_the("left") then
                        v:on_the("left").crv_adjlowest = true
                    end
                end
            end

            if not its_in_play then
                
                for k, v in pairs(context.scoring_hand) do
                    if v.base.id == cae.lowest_id and not its_in_play then
                        if v:on_the("right") then
                            v:on_the("right").crv_adjlowest = true
                        end
                        if v:on_the("left") then
                            v:on_the("left").crv_adjlowest = true
                        end
                       
                        its_in_play = true
                    end
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if (context.other_card.crv_adjlowest) then
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.after then
            for k, v in pairs(G.playing_cards) do
                if v.crv_adjlowest then
                    v.crv_adjlowest = nil
                end
            end
        end
    end,
})

SMODS.Joker({
    key = "electric_reed",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            electric_reeded_num = 2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.electric_reeded_num}}
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
                    G.jokers.cards[i].ability.electric_reeded = true
                    if not G.jokers.cards[i].ability.extra then G.jokers.cards[i].ability.extra = {} end

                    G.jokers.cards[i].ability.extra.electric_reeded_num = NAMETEAM.perc(G.jokers.cards[i]:on_the("left").ability.extra.electric_reeded_num, 75)

               end
            end
        end

        if context.joker_main then
            return{
                xmult = cae.electric_reeded_num
            }
        end
        if context.other_joker and context.other_joker.ability.electric_reeded then
            context.other_joker.ability.electric_reeded  = false
            return{
                xmult = context.other_joker.ability.extra.electric_reeded_num,
                message_card = context.other_joker
            }
        end
    end,
})

SMODS.Joker({
    key = "hot_potato",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            cards = {},
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult,cae.mult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and #G.jokers.highlighted>1 then
            local cards = {}
            for k, v in pairs(G.jokers.highlighted) do
                if v ~= card then
                    cards[#cards+1] = v
                end
            end
            if #cards>0 then
                if #cards<3 then
                    for k, v in pairs(cards) do
                        v.debuff = false
                    end
                else
                    local card1 = pseudorandom_element(cards,pseudoseed("hottestpotatoaroundhere"))
                    for i = 1, #cards do
                        if cards[i] == card1 then
                            table.remove(cards, i)
                        end
                    end
                    local card2 = pseudorandom_element(cards,pseudoseed("hottestpotatoaroundhere"))

                    card1.debuff = false
                    card2.debuff = false
                end
            end
        end
    end,
})



SMODS.Joker({
    key = "stunion",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 2.25
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.xmult}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, "debuff_by_stunion")
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
        if context.final_scoring_step then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    for k, v in pairs(context.scoring_hand) do
                        SMODS.debuff_card(v, true, "debuff_by_stunion")
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_by_stunion")
            end
        end
    end,
})

SMODS.Joker({
    key = "pepper_pult",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 0,
            mult_gain = 5
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.mult,cae.mult_gain}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
        if context.before and not context.blueprint then
            for k, v in pairs(context.scoring_hand) do
                if v.debuff then
                    v:juice_up()
                    v.debuff = false
                    NAMETEAM.msg(v, "Undebuffed!")
                    SMODS.scale_card(card,{
                        ref_table = cae,
                        ref_value = "mult",
                        scalar_value = "mult_gain",
                        scaling_message = {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.MULT,
                        }
                    })
                end
            end
        end
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
    end,
})

SMODS.Joker({
    key = "AKKE",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 8
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.post_trigger and not context.blueprint and (context.other_context.joker_main or context.other_context.individual or NAMETEAM.during_scoring) then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    cae.rr = i
                end
            end

            for i = 1, #G.jokers.cards do
               if i > cae.rr and context.other_card == G.jokers.cards[i] then
                    G.jokers.cards[i].ability.AKKEd_cbean = true
               end
            end
        end
        if context.other_joker and context.other_joker.ability.AKKEd_cbean then
            context.other_joker.ability.AKKEd_cbean  = false
            return{
                mult = cae.mult,
                message_card = context.other_joker
            }
        end
    end,
})


SMODS.Joker({
    key = "endurian",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 40,
            mult_lose = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult,cae.mult_lose}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
        if context.cbean_destroyed and context.cbean_destroyed_card.ability.set == "Joker" then
            SMODS.scale_card(card,{
                ref_table = cae,
                ref_value = "mult",
                scalar_value = "mult_lose",
                operation = "-",
                scaling_message = {
                    message = "Downgrade!",
                    colour = G.C.MULT,
                }
            })
        end
    end,
})


SMODS.Joker({
    key = "stallia",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 30
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.mult}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, "debuff_by_stallia")
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
        if context.final_scoring_step then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    for k, v in pairs(context.scoring_hand) do
                        local c = context.scoring_hand 
                        if v == c[1] or v == c[2] or v == c[3] then
                            SMODS.debuff_card(v, true, "debuff_by_stallia")
                        end
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_by_stallia")
            end
        end
    end,
})


SMODS.Joker({
    key = "laser_bean",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 2
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.mult}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            return{
                mult = cae.mult*NAMETEAM.all_on(context.other_card, G.play.cards)
            }
        end
    end,
})

SMODS.Joker({
    key = "citron",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            chips = 150
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.chips}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return{
                chips = cae.chips
            }
        end
    end,
})

SMODS.Joker({
    key = "infinut",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 40,
            mult_lose = 10
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.mult,cae.mult_lose}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            SMODS.calculate_effect({mult = cae.mult}, card)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    if cae.mult ~= 0 then
                        cae.mult = cae.mult - cae.mult_lose
                        NAMETEAM.msg(card, "-" .. cae.mult_lose)
                    else
                        cae.mult = 40
                        NAMETEAM.msg(card, localize("k_reset"))
                    end
                    return true
                end
            }))
        end
    end,
})


SMODS.Joker({
    key = "tile_turnip",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            rep = 1,
            go = false
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.rep}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.post_trigger and not context.blueprint and (context.other_context.joker_main or context.other_context.individual or NAMETEAM.during_scoring) then
            if card:on_the("left") and context.other_card == card:on_the("left") then cae.go = true end
        end
        if context.retrigger_joker_check and not context.blueprint and cae.go and card:on_the("right") and context.other_card == card:on_the("right") then
            if card:on_the("right") and context.other_card == card:on_the("right") and cae.go == true then 
                return{
                    repetitions = cae.rep
                }
            end
        end
        if context.after then
            cae.go = false
        end
    end,
})

SMODS.Joker({
    key = "EM_peach",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 2.5,
            stop = false
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={2.5}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card)
    end,
    remove_from_deck = function(self,card,from_debuff) 
        local cae = card.ability.extra
        cae.stop = true
        for k, v in pairs(G.playing_cards) do
            if v.debuff then
                SMODS.debuff_card(v, false, "EM_peaching_it")
            end
        end
    end,
    update = function(self,card)
        local cae = card.ability.extra
        if card.added_to_deck then
            for k, v in pairs(G.playing_cards) do
                if not v.debuff and not cae.stop then
                    SMODS.debuff_card(v, true, "EM_peaching_it")
                end
            end
        end
    end
})

SMODS.Joker({
    key = "sun_bean",
    cost = 15,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    always_buyable = true,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 6
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            NAMETEAM.sunbean_bonus = NAMETEAM.sunbean_bonus or 0
            if not NAMETEAM.sunbean_tagged then
                NAMETEAM.sunbean_tagged = true
                add_tag(Tag("tag_cbean_sunbean"))
					play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
					play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
            end
            if G.GAME.blind:get_type() == "Teeny" then
                NAMETEAM.sunbean_bonus = NAMETEAM.sunbean_bonus + cae.dollars/2
            elseif  G.GAME.blind:get_type() == "Small" then
                NAMETEAM.sunbean_bonus = NAMETEAM.sunbean_bonus + cae.dollars
            elseif G.GAME.blind:get_type() == "Big" then
                NAMETEAM.sunbean_bonus = NAMETEAM.sunbean_bonus + cae.dollars*2
            elseif G.GAME.blind:get_type() == "Boss" then
                NAMETEAM.sunbean_bonus = NAMETEAM.sunbean_bonus + cae.dollars*3
            elseif G.GAME.blind:get_type() == "CEO" then
                NAMETEAM.sunbean_bonus = NAMETEAM.sunbean_bonus + cae.dollars*4
            end
        end
    end,
})


SMODS.Joker({
    key = "magnifying_grass",
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    always_buyable = true,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 4,
            xmult = 1,
            xmult_gain = 0.5,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars,cae.xmult,cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
        if context.cbean_clicked and context.card == card then
            ease_dollars(-cae.dollars)
            SMODS.scale_card(card, {
                ref_table = cae,
                ref_value = "xmult",
                scalar_value = "xmult_gain"
            })
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            cae.xmult = 1
            return{message=localize("k_reset")}
        end
    end,
})

SMODS.Joker({
    key = "phat_beet",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    always_buyable = true,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
        if context.individual and context.cardarea == G.play then
            return{
                mult = cae.mult
            }
        end

        if context.post_trigger and not context.blueprint and (context.other_context.joker_main or context.other_context.individual or NAMETEAM.during_scoring) then
            if (card:on_the("right") and context.other_card == card:on_the("right")) or (card:on_the("left") and context.other_card == card:on_the("left")) then
                context.other_card.ability.phat_beeted = true
            end
        end
        if context.other_joker and context.other_joker.ability.phat_beeted then
            context.other_joker.ability.phat_beeted  = false
            return{
                mult = cae.mult,
                message_card = context.other_joker
            }
        end
    end,
})

SMODS.Joker({
    key = "intensive_carrot",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    always_buyable = true,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.GAME.NAMETEAM_last_sold_jokers and #G.GAME.NAMETEAM_last_sold_jokers>0 then
            local acard = SMODS.add_card({
                key = pseudorandom_element(G.GAME.NAMETEAM_last_sold_jokers),
                area = G.jokers
            })
            if card.edition and card.edition.negative then
                acard:set_edition("e_negative")
            end
        elseif context.selling_self then
            NAMETEAM.msg(card, localize("k_nope_ex"))
        end
    end,
})

SMODS.Joker({
    key = "thyme_warp",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    always_buyable = true,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.blind_select then
            NAMETEAM.goback()
        end
    end,
})



--Celery stalker