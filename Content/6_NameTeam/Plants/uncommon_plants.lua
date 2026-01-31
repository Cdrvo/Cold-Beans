
SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "doom_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_crater
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            SMODS.add_card{key="j_cbean_crater",area=G.jokers}
            if not G.GAME.NAMETEAM.reduce then G.GAME.NAMETEAM.reduce = 0 end
            if G.GAME.blind and G.GAME.blind.in_blind then
                G.GAME.NAMETEAM.reduce = G.GAME.NAMETEAM.reduce + 2
                if G.GAME.blind.boss then
                    G.GAME.blind.chips = G.GAME.blind.chips/cae.blind
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                else
                    G.GAME.blind.chips = 0
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                end
                NAMETEAM.msg(card, "Doom!")
            else
                G.GAME.NAMETEAM.reduce = G.GAME.NAMETEAM.reduce + 3
            end
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "wallnut",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 6, y = 0 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "potatomine",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 5, y = 0 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "snowpea",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 7, y = 1 },
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 4
        }
    },
    pools = {
        cbean_pea = true
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "chomper",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 9, y = 1 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "repeater",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 3, y = 0 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 1
        }
    },
    pools = {
        cbean_pea = true
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "puff_shroom",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 0, y = 3 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "fume_shroom",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 1, y = 3 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
               if i > cae.rr and (string.find(G.jokers.cards[i].config.center.key, "shroom") or card.ability.cbean_shroom) then
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "scaredy_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "ice_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            G.GAME.NAMETEAM.no_progress = G.GAME.NAMETEAM.no_progress + cae.rounds
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "squash",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 6, y = 4 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "threepeater",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 11, y = 0 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
    pools = {
        cbean_pea = true
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "spikeweed",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 2, y = 1 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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

                if (context.other_card.base.id) == -(context.other_card.ability.perma_bonus) then
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "iceweed",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 0.2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and not context.blueprint and context.cardarea == G.play then
			if ((not context.other_card.ability.perma_bonus) or ((-(context.other_card.ability.perma_bonus)))<context.other_card.base.id) then
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus - 1

                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 1
				context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + cae.xmult

                if (context.other_card.base.id) == -(context.other_card.ability.perma_bonus) then
                    context.other_card.ability.cbean_marked = true
                end
				return {
					message = "Downgrade! + Upgrade!",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "sea_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "blover",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 10, y = 3 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
        if context.after and G.GAME.NAMETEAM.blover_number and not context.blueprint then
            for i = 1, G.GAME.NAMETEAM.blover_number do
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "pumpkin",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "magnet_shroom",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 2, y = 3 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "flower_pot",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "plantern",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "coffee_bean",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            if (string.find(card:on_the("right").config.center.key, "shroom") or card:on_the("right").ability.cbean_shroom) then
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cactus",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 11, y = 1 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
        if context.after and G.GAME.NAMETEAM.cactus_number and not context.blueprint then
            for i = 1, G.GAME.NAMETEAM.cactus_number do
                G.GAME.NAMETEAM.cactus_number = G.GAME.NAMETEAM.cactus_number- 1
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "melon_pult",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "twin_sunflower",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 5, y = 1 },
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
	},
    rarity = 2,
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "gloom_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cattail",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        if context.after and G.GAME.NAMETEAM.cattail_number then
            for i = 1, G.GAME.NAMETEAM.cattail_number do
                G.GAME.NAMETEAM.cattail_number = G.GAME.NAMETEAM.cattail_number - 1
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cob_cannon",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "bloomerang",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 2, y = 0 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "coconut_cannon",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 0, y = 1 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, --ehehehehehehe
    key = "bonk_choy",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 6, y = 1 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "electric_reed",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
    pools = {
        cbean_electric = true
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "hot_potato",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 4, y = 4 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "stunion",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 1, y = 4 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "pepper_pult",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 3, y = 4 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "AKKE",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 8, y = 4 },
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "endurian",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "stallia",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "laser_bean",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 11, y = 3 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "citron",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 8, y = 3 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "infinut",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 7, y = 3 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "tile_turnip",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 5, y = 3 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "EM_peach",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 9, y = 3 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "sun_bean",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 3, y = 3 },
    cost = 15,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
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
            G.GAME.NAMETEAM.sunbean_bonus = G.GAME.NAMETEAM.sunbean_bonus or 0
            if not G.GAME.NAMETEAM.sunbean_tagged then
                G.GAME.NAMETEAM.sunbean_tagged = true
                add_tag(Tag("tag_cbean_sunbean"))
					play_sound("generic1", 0.9 + math.random() * 0.1, 0.8)
					play_sound("holo1", 1.2 + math.random() * 0.1, 0.4)
            end
            if G.GAME.blind:get_type() == "Teeny" then
                G.GAME.NAMETEAM.sunbean_bonus = G.GAME.NAMETEAM.sunbean_bonus + cae.dollars/2
            elseif  G.GAME.blind:get_type() == "Small" then
                G.GAME.NAMETEAM.sunbean_bonus = G.GAME.NAMETEAM.sunbean_bonus + cae.dollars
            elseif G.GAME.blind:get_type() == "Big" then
                G.GAME.NAMETEAM.sunbean_bonus = G.GAME.NAMETEAM.sunbean_bonus + cae.dollars*2
            elseif G.GAME.blind:get_type() == "Boss" then
                G.GAME.NAMETEAM.sunbean_bonus = G.GAME.NAMETEAM.sunbean_bonus + cae.dollars*3
            elseif G.GAME.blind:get_type() == "CEO" then
                G.GAME.NAMETEAM.sunbean_bonus = G.GAME.NAMETEAM.sunbean_bonus + cae.dollars*4
            end
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "magnifying_grass",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 6, y = 3 },
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "phat_beet",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "intensive_carrot",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "thyme_warp",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.blind_select then
            NAMETEAM.goback()
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, -- don't do this
    key = "celery_stalker",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={}}
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "primal_peashooter",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 2
        }
    },
    pools = {
        cbean_pea = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    if context.cbean_first and context.cardarea == G.jokers and G.jokers.cards and #G.jokers.cards>1 then
            local old_pos = -1
            local new_pos = -1
            local _card = NAMETEAM.random_joker(G.jokers.cards, card)
            for k, v in ipairs(G.jokers.cards) do
                if v == _card then
                    old_pos = k
                end
            end
            new_pos = math.random(1, #G.jokers.cards)
            while old_pos == new_pos do
                new_pos = math.random(1, #G.jokers.cards)
            end
            G.E_MANAGER:add_event(Event({ 
                trigger = "before",
                blockable = "false",
                func = function() 
                    table.insert(G.jokers.cards, new_pos, table.remove(G.jokers.cards,old_pos))
                    play_sound('cardSlide1', 0.85)
                    return true
                end 
            })) 
        end
    end
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "primal_sunflower",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            dollars = 10
        }
    },
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars
    end,
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "primal_wallnut",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            rounds = 3,
            rounds_max = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rounds_max, cae.rounds}}
    end,
    update = function(self,card)
        local cae = card.ability.extra
        if card.added_to_deck then
            for k, v in pairs(G.playing_cards) do
                if v.debuff and cae.rounds > 0 then v.debuff = false cae.rounds = cae.rounds - 1
                    NAMETEAM.msg(card, "-1")
                end
            end
            if cae.rounds <= 0 then
                SMODS.destroy_cards(card)
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "primal_potato",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 2
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
                xmult = cae.xmult
            }
        end
        if context.selling_self and not context.blueprint and G.hand and G.hand.cards then
            SMODS.destroy_cards(G.hand.cards)
        end
    end
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "perfume_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            perc = 0,
            perc_gain = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.perc,cae.perc_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered then
                SMODS.scale_card(card,{
                    ref_table = cae,
                    ref_value = "perc",
                    scalar_value = "perc_gain"
                })
            end
        end
        if context.first_hand_drawn and cae.perc>0 then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    G.GAME.blind.chips = G.GAME.blind.chips - NAMETEAM.perc(G.GAME.blind.chips, cae.perc)
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    NAMETEAM.msg(card, "Reduced!")
                    cae.perc = 0
                    return true
                end
            }))
        end
    end
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "guacodile",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 8, y = 2 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult, ((get_blind_amount(G.GAME.round_resets.blind_ante)*Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices["Small"]).mult*G.GAME.starting_params.ante_scaling)/2) or 0}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                mult = cae.xmult
            }
        end
        if context.selling_self and G.GAME.blind and G.GAME.blind.in_blind then
            local blind_amt = (get_blind_amount(G.GAME.round_resets.blind_ante)*Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices["Small"]).mult*G.GAME.starting_params.ante_scaling)/2
            G.GAME.blind.chips = G.GAME.blind.chips-blind_amt
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            NAMETEAM.msg(card, "-" .. blind_amt)
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "bowling_bulb",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 7, y = 2 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.5,
            mult = 8,
            chips = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult, cae.mult,cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            local gp,c = context.scoring_hand, context.other_card
            if c == gp[1] and gp[1] then
                return{
                    xmult = cae.xmult
                }
            end
            if c == gp[2] and gp[1+1] then
                return{
                    mult = cae.mult
                }
            end
            if c == gp[3] and gp[1+1+1] then
                return{
                    chips = cae.chips
                }
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "banana_launcher",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 9, y = 2 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2.5,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            local gp,c = context.scoring_hand, context.other_card
            if c == gp[1] and gp[1] and not c.debuff then
                c.marked_for_debuff = true
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.final_scoring_step then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.03,
                func = function()
                    for k, v in pairs(G.play.cards) do
                        if v.marked_for_debuff then
                            v.marked_for_debuff = false
                            v.cbean_banana_timer = 3
                            SMODS.debuff_card(v, true, "debuffed_by_banana_launcher")
                        end
                    end
                    return true
                end
            }))
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "dusk_lobber",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    pools = {
        cbean_shadow = true
    },
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.5,
            card = nil
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={ cae.xmult }}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            cae.card = pseudorandom_element(context.scoring_hand,pseudoseed("DUSKYLOBY"))
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card == cae.card then
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.after then
            cae.card = nil
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "nightshade",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            mult = 0
        }
    },
    pools = {
        cbean_shadow = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.destroy_card and context.cardarea == G.play and context.scoring_hand[1] and context.destroy_card == context.scoring_hand[1] and not context.blueprint then
            cae.mult = cae.mult + context.destroy_card.base.id/2
            NAMETEAM.msg(card, "+" .. context.destroy_card.base.id/2)
            return{
                remove = true
            }
        end
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "sweet_potato",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 2
        }
    },
    pools = {
        cbean_shadow = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = 2
            }
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "lava_guava",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            rep = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_lava
        local cae = card.ability.extra
        return{vars={cae.rep}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.GAME.blind and G.GAME.blind.in_blind then
            NAMETEAM.defeat()
            SMODS.add_card{
                key = "j_cbean_lava",
                area = G.jokers
            }
            -- card:add_sticker("eternal", true)
        end
    end
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "electric_currant",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            mult = 10
        }
    },
    pools = {
        cbean_electric = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            local c,gp = context.other_card, context.scoring_hand
            if c ~= gp[1] and c ~= gp[#gp] then
                return{
                    mult = cae.mult
                }
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "kiwibeast",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            hands = 3,
            xmult = 1,
            xmult_gain = 0.5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.hands,cae.xmult_gain,cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.after and not context.blueprint and not context.repetition and not context.end_of_round then
            if cae.hands>1 then
                cae.hands = cae.hands - 1
                NAMETEAM.msg(card, "-1")
            else
                cae.hands = 3
                SMODS.scale_card(card, {
                    ref_table = cae,
                    ref_value = "xmult",
                    scalar_value = "xmult_gain"
                })
            end
        end

        if context.end_of_round and context.main_eval then
            NAMETEAM.msg(card, localize("k_reset"))
        end
        
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "power_lily",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 8, y = 1 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.hands,cae.xmult_gain,cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            if card:on_the("right") then
                card:on_the("right").cbean_lily_power = 2
                NAMETEAM.values("*", card:on_the("right"), 2)
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "electric_blueberry",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 0, y = 2 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            rep = 3,
            _card = nil
        }
    },
    pools = {
        cbean_electric = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rep}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and not context.blueprint then
            cae._card = pseudorandom_element(context.scoring_hand, pseudoseed("elec_ber"))
        end
        if context.repetition and context.cardarea == G.play and context.other_card == cae._card then
            return{
                repetitions = cae.rep
            }
        end
        if context.after then
            cae._card = nil
        end
    end
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "jack_o_lantern",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 1, y = 2 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            hands_left = 2,
            xmult = 1.5,
            odds = 2,
            debuff_hands = 2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "jacking_my_lantern_till_it_o")
        return{vars={cae.hands_left,cae.xmult,num,den,cae.debuff_hands}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and cae.hands_left>0 then
            if SMODS.pseudorandom_probability(card, "jacking_my_lantern_till_it_o", 1 , cae.odds) then
                context.other_card.marked_by_jack = true
            end
            return{
                xmult = cae.xmult
            }
        end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card.marked_by_jack then
            return{
                remove = true
            }
        end
        if context.after and not context.blueprint then
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.1,
            func = function()
                if cae.hands_left>1 then
                    cae.hands_left = cae.hands_left - 1
                    NAMETEAM.msg(card, "-1")
                else
                    cae.hands_left = 0
                    NAMETEAM.msg(card, "Debuff!")
                    SMODS.debuff_card(card, true, "jack_lantern_debuff")
                end
                return true
            end
        }))
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "grapeshot",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 2, y = 2 },
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            destroys = 5
        }
    },
    add_to_deck = function(self,card,from_debuff)
        card.ability.extra_value = card.cost
        card:set_cost()
    end,
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "jacking_my_lantern_till_it_o")
        return{vars={cae.destroys}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.hand and G.hand.cards and #G.hand.cards>0 then
            local shuffle_tab = {}
            for k, v in pairs(G.hand.cards) do
                shuffle_tab[#shuffle_tab+1] = v
            end
            shuffle_tab = NAMETEAM.shuffle(shuffle_tab,"aeaeaeaeaeaeae")
            for i = 1, cae.destroys do
                if #G.hand.cards>0 and shuffle_tab[i] then
                    SMODS.destroy_cards(shuffle_tab[i])
                end
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cold_snapdragon",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xchips = 2
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        return{
            vars={cae.xchips}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, "debuff_by_cold_snapdragon")
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            local c, gp = context.other_card, context.scoring_hand
            if c == gp[1] or c == gp[1+1] or c == gp[1+1+1] then
                return{
                    xchips = cae.xchips
                }
            end
        end
        if context.final_scoring_step then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    for k, v in pairs(context.scoring_hand) do
                        local c = context.scoring_hand 
                        if v == c[1] or v == c[2] or v == c[3] then
                            SMODS.debuff_card(v, true, "debuff_by_cold_snapdragon")
                        end
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_by_cold_snapdragon")
            end
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "escape_root",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
    blueprint_compat = true,
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
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
        if context.cbean_first and context.cardarea == G.jokers and G.jokers.cards and #G.jokers.cards>1 and not context.blueprint then
            local old_pos = -1
            local new_pos = -1
            for k, v in ipairs(G.jokers.cards) do
                if v == card then
                    old_pos = k
                end
            end
            new_pos = math.random(1, #G.jokers.cards)
            while old_pos == new_pos do
                new_pos = math.random(1, #G.jokers.cards)
            end
            G.E_MANAGER:add_event(Event({ 
                trigger = "before",
                blockable = "false",
                func = function() 
                    table.insert(G.jokers.cards, new_pos, table.remove(G.jokers.cards,old_pos))
                    play_sound('cardSlide1', 0.85)
                    return true
                end 
            })) 
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "wasabi_whip",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 1.75,
            odds = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMODS.get_probability_vars(card, 1, cae.odds, "wasabi_whippig_it")
        return{
            vars={cae.xmult,num,den}
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
            local c, gp = context.other_card, context.scoring_hand
            if c == gp[1] or c == gp[#gp] then
                if SMODS.pseudorandom_probability(card, "wasabi_whipping_it", 1, cae.odds) then
                    context.other_card.marked_by_wasabi = true
                end
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card.marked_by_wasabi then
            return{
                remove = true
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "missle_toe",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 3
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
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            local small,small_card = 1,nil
            for k, v in pairs(context.scoring_hand) do
                if v and v.highlight_order_cbean then
                    if v.highlight_order_cbean > small then
                        small = v.highlight_order_cbean
                        small_card = v
                    end
                end
            end
            if small_card then cae.small_card = small_card end
            for k, v in pairs(context.scoring_hand) do
                if v ~= small_card then
                    v.mark_for_no_score = true
                end
            end
        end
        if context.individual and context.cardarea == G.play and cae.small_card and context.other_card == cae.small_card then
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "boom_ballon_flower",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={cae.xmult,cae.xmult_gain}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            local small,small_card = 14,nil
            for k, v in pairs(context.scoring_hand) do
                if v and v.highlight_order_cbean then
                    if v.highlight_order_cbean < small then
                        small = v.highlight_order_cbean
                        small_card = v
                    end
                end
            end

            for k, v in pairs(context.scoring_hand) do
                if small_card == v then
                    if v.seal then
                        v:set_seal(nil)
                        SMODS.scale_card(card, {
                            ref_table = cae,
                            ref_value = "xmult",
                            scalar_value = "xmult_gain"
                        })
                    end
                    if v.edition then
                        v:set_edition(nil)
                        SMODS.scale_card(card, {
                            ref_table = cae,
                            ref_value = "xmult",
                            scalar_value = "xmult_gain"
                        })
                    end
                    if v.ability.set == "Enhanced" then
                        v:set_ability("c_base")
                        SMODS.scale_card(card, {
                            ref_table = cae,
                            ref_value = "xmult",
                            scalar_value = "xmult_gain"
                        })
                    end
                end
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "holly_barrier",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            hands_left = 5,
            hands_max = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_holly_projectile
        local cae = card.ability.extra
        return{
            vars={cae.hands_max,cae.hands_left}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.cbean_first and not context.blueprint and cae.hands_left>0 then
            cae.hands_left = cae.hands_left - 1
            local acard = SMODS.add_card{
                key = "j_cbean_holly_projectile"
            }
            acard.cbean_type = pseudorandom_element({"mult","chips","dollars"})
            card.ability.type = acard.cbean_type
            acard:set_edition("e_negative")
            if cae.hands_left == 0 then
                SMODS.destroy_cards(card)
            end
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "melon_z",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 0,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.5
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
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "electrici-tea",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 0,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
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
    pools = {
        cbean_electric = true
    },
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            NAMETEAM.defeat()
            if card:on_the("right") then
                SMODS.debuff_card(card:on_the("right"), true, "elecelec")
                card:on_the("right").newly_debuffed = true
                card:on_the("right").was_debuffed_by_elec = true
            end
            if card:on_the("left") then
                SMODS.debuff_card(card:on_the("left"), true, "elecelec")
                card:on_the("left").newly_debuffed = true
                card:on_the("left").was_debuffed_by_elec = true
            end
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "blastberry_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            mult = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
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
                    G.jokers.cards[i].ability.BLASTED_CBEAN = true
               end
            end
        end
        if context.other_joker and context.other_joker.ability.BLASTED_CBEAN then
            context.other_joker.ability.BLASTED_CBEAN  = false
            return{
                mult = cae.mult,
                message_card = context.other_joker
            }
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "pyre_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            chips = 10
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
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
                    G.jokers.cards[i].ability.PYRED_BEAN = true
               end
            end
        end
        if context.other_joker and context.other_joker.ability.PYRED_BEAN then
            context.other_joker.ability.PYRED_BEAN  = false
            return{
                chips = cae.chips,
                message_card = context.other_joker
            }
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "shine_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            dollars = 4
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars,cae.dollars + (card.area and NAMETEAM.all_on(card,card.area.cards, "right")) or 0 }}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars + NAMETEAM.all_on(card,card.area.cards, "right")
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "explode_o_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            xmult = 1.5,
            rounds = 3,
            rounds_max = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.rounds_max,cae.rounds}}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
        if context.end_of_round and not context.blueprint and context.main_eval then
            if cae.rounds>1 then
                cae.rounds = cae.rounds -1
                NAMETEAM.msg(card, "-1")
            else
                cae.rounds = 0
                SMODS.destroy_cards(card)
            end
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "gloom_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            chips = 15
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,  cae.chips+(G.jokers and NAMETEAM.pool_in("cbean_shadow",G.jokers.cards) or 0 )   }}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                chips = cae.chips+(G.jokers and NAMETEAM.pool_in("cbean_shadow",G.jokers.cards) or 0 )
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "pea_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            value = 1.2,
            key = nil
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.value}}
    end,
    add_to_deck = function(self,card,from_debuff)
        local cae = card.ability.extra
        if not cae.key then cae.key = pseudorandom("ae")*pseudorandom("bc") end
    end,
    remove_from_deck = function(self,card,from_debuff)
        local cae = card.ability.extra
        for k, v in pairs(G.jokers.cards) do
                if v.ability["pead_" .. cae.key] then
                    v.ability["pead_" .. cae.key] = nil
                    NAMETEAM.values("/",v,cae.value,true)
                end 
            end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    update = function(self,card)
        local cae = card.ability.extra
        if card.added_to_deck then
            for k, v in pairs(G.jokers.cards) do
                if v.config.center.pools and v.config.center.pools.cbean_pea and not v.ability["pead_" .. cae.key] and v.config.center.key ~= "j_cbean_pea_vine" then
                    v.ability["pead_" .. cae.key] = true
                    NAMETEAM.values("*",v,cae.value,true)
                end 
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "power_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            value = 1.2,
            key = nil
        }
    },
    pools = {
        cbean_electric = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.value}}
    end,
    add_to_deck = function(self,card,from_debuff)
        local cae = card.ability.extra
        if not cae.key then cae.key = pseudorandom("ae")*pseudorandom("bc") end
    end,
    remove_from_deck = function(self,card,from_debuff)
        local cae = card.ability.extra
        for k, v in pairs(G.jokers.cards) do
                if v.ability["powed_" .. cae.key] then
                    v.ability["powed_" .. cae.key] = nil
                    NAMETEAM.values("/",v,cae.value,true)
                end 
            end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    update = function(self,card)
        local cae = card.ability.extra
        if card.added_to_deck then
            for k, v in pairs(G.jokers.cards) do
                if v.config.center.pools and v.config.center.pools.cbean_electric and not v.ability["powed_" .. cae.key] and v.config.center.key ~= "j_cbean_power_vine" then
                    v.ability["powed_" .. cae.key] = true
                    NAMETEAM.values("*",v,cae.value,true)
                end 
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "power_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            value = 1.2,
            key = nil
        }
    },
    pools = {
        cbean_electric = true
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.value}}
    end,
    add_to_deck = function(self,card,from_debuff)
        local cae = card.ability.extra
        if not cae.key then cae.key = pseudorandom("ae")*pseudorandom("bc") end
    end,
    remove_from_deck = function(self,card,from_debuff)
        local cae = card.ability.extra
        for k, v in pairs(G.jokers.cards) do
                if v.ability["powed_" .. cae.key] then
                    v.ability["powed_" .. cae.key] = nil
                    NAMETEAM.values("/",v,cae.value,true)
                end 
            end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    update = function(self,card)
        local cae = card.ability.extra
        if card.added_to_deck then
            for k, v in pairs(G.jokers.cards) do
                if v.config.center.pools and v.config.center.pools.cbean_electric and not v.ability["powed_" .. cae.key] and v.config.center.key ~= "j_cbean_power_vine" then
                    v.ability["powed_" .. cae.key] = true
                    NAMETEAM.values("*",v,cae.value,true)
                end 
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "aqua_vine",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
    blueprint_compat = false,
    always_buyable = true,
    config = {
        extra = {
            chips = 50,
            mult = 8,
            dollars = 3,
            xmult = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local vars, key = {}, self.key
        if card:on_the("right") and card.added_to_deck then
            local c = card:on_the("right").config.center.rarity
            if c == 1 then
                vars = {cae.chips}
                key = self.key .. "_common"
            elseif c == 2 then
                vars = {cae.mult}
                key = self.key .. "_uncommon"
            elseif c == 3 then
                vars = {cae.dollars}
                key = self.key .. "_rare"
            elseif c == 4 then
                vars = {cae.xmult}
                key = self.key .. "_legendary"
            end
        end
        return{vars=vars,key=key}
    end,
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and card:on_the("right") then
        local c = card:on_the("right").config.center.rarity
            if c == 1 then
                return{
                    chips = cae.chips
                }
            elseif c == 2 then
                return{
                    mult = cae.mult
                }
            elseif c == 4 then
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.individual and context.cardarea == G.play then
            if card:on_the("right") and card:on_the("right").config.center.rarity == 3 then
                return{
                    dollars = cae.dollars
                }
            end
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "ice_bloom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 1.75,
            odds = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "ice_seed")
        return{vars={cae.xmult,num,den}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, "ice_seed", 1, cae.odds) then
                context.other_card.marked_by_ice = true
            end
            return{
                xmult = cae.xmult
            }
        end
        if context.final_scoring_step then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    for k, v in pairs(G.play.cards) do
                        if v.marked_by_ice then
                            SMODS.debuff_card(v, true, "icey_never_openy")
                            NAMETEAM.msg(v, "Debuffed!")
                        end
                    end
                    return true
                end
            }))
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "puffball",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 2,
            odds = 4,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "puffball")
        return{vars={cae.xmult,num,den}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            local c, gp = context.other_card,context.scoring_hand
            if c ~= gp[1] and c ~= gp[#gp] then
                if SMODS.pseudorandom_probability(card, "puffy_seed", 1, cae.odds) then
                    c.mark_by_puffy = true
                end
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card.mar_by_puffy then
            return{
                remove = true
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "olive_pit",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_card and context.card ~= card then
            local a = context.card.sell_cost
            cae.xmult = cae.xmult + a/20
            NAMETEAM.msg(card, localize("k_upgrade_ex"))
        end
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "boingsetta",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult_gain = 0.1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
       if context.individual then
			if context.cardarea == G.play then
				context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 1
				context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + cae.xmult_gain
				return {
					message = localize("k_upgrade_ex"),
					colour = G.C.MULT,
					message_card = context.other_card,
				}
			end
		end
    end,
})

SMODS.Joker({
    pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "inferno",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 1.2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
        local acard = context.other_card
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.1,
            func = function()
                acard:juice_up()
                SMODS.modify_rank(acard, -1)
                SMODS.calculate_effect({xmult = cae.xmult},acard)
            end
        }))
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "noctairne",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            if G.GAME.blind and G.GAME.blind.in_blind then
                G.GAME.blind.chips = G.GAME.blind.chips/2
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                for k, v in pairs(G.playing_cards) do
                    v.mark_for_perma_no_score = true
                    v.ability.marked_by_noctairne = true
                end
            end
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "health_seeker",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            local prev_scaling = G.GAME.starting_params.ante_scaling
            G.GAME.starting_params.ante_scaling =  G.GAME.starting_params.ante_scaling / 2
            local current_scaling = prev_scaling - G.GAME.starting_params.ante_scaling
            G.GAME.NAMETEAM.healthy_ante = current_scaling
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "tiger_grass",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 1,
            xmult_gain = 0.2,
            on_cooldown = false
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.destroy_card and context.destroy_card == G.play.cards[1] and not cae.on_cooldown then
                SMODS.destroy_cards(context.destroy_card)
                SMODS.scale_card(card,{
                    ref_table = cae,
                    ref_value = "xmult",
                    scalar_value = "xmult_gain"
                })
                cae.on_cooldown = true
        elseif context.destroy_card and cae.on_cooldown then
            cae.on_cooldown = false
            NAMETEAM.msg(card, "Ready!")
        end
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "blockoli",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            rep2 = 1,
            go = false
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rep2}}
    end,
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.jokers.cards) do
            if v.ability.blockolied then
                v.ability.prevent_trigger = nil
            end
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            cae.go = true
            if card:on_the("right") and not card:on_the("right").ability.prevent_trigger then
                if pseudorandom("blockoli") < 1/3 then
                    card:on_the("right").ability.prevent_trigger = true
                    card:on_the("right").ability.blockolied = true
                else
                    card:on_the("right").ability.prevent_trigger = false
                    card:on_the("right").ability.blockolied = nil
                end
            end
            if card:on_the("left") and not card:on_the("left").ability.prevent_trigger then
                if pseudorandom("blockoli") < 1/3 then
                    card:on_the("left").ability.prevent_trigger = true
                    card:on_the("left").ability.blockolied = true
                else
                    card:on_the("left").ability.prevent_trigger = false
                    card:on_the("left").ability.blockolied = nil
                end
            end
        end
        if cae.go and context.retrigger_joker_check and not context.blueprint and cae.go and (card:on_the("left") and context.other_card == card:on_the("left") or card:on_the("right") and context.other_card == card:on_the("right")) then
                return{
                    repetitions = cae.rep2
                }
            end
        if context.after then
            cae.go = false
            if card:on_the("right") and card:on_the("right").ability.blockolied then
                card:on_the("right").ability.prevent_trigger = false
                card:on_the("right").ability.blockolied = nil
            end
            if card:on_the("left") and card:on_the("left").ability.blockolied then
                card:on_the("left").ability.prevent_trigger = false
                card:on_the("left").ability.blockolied = nil
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "bramble_bush",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 1.75,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.jokers.cards) do
           v.states.drag.can = true
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
    update = function(self,card,context)
        if card.added_to_deck then
            card.states.drag.can = false
            for k, v in pairs(G.jokers.cards) do
                v.ability.on_brambles_right = nil
                NAMETEAM.all_on(card, G.jokers.cards, "right","on_brambles_right")
                if v.ability.on_brambles_right then
                    v.states.drag.can = false
                elseif v ~= card then
                    v.states.drag.can = true
                end 
            end
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "levitater",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            odds = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "levitoatorrr")
        return{vars={cae.xmult,num,den}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            for k, v in pairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(card, "levitoatorrr", 1, cae.odds) then
                    v.mark_for_no_score = true
                    v.no_score_effect = {
                        effect = "xmult",
                        amount = cae.xmult
                    }
                end
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "meteor_flower",
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
            mult = 2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.final_scoring_step then
            local b = NAMETEAM.find_highest(G.play.cards)
            if b then
                if b:on_the("right") then
                    b:on_the("right").ability.perma_mult = b:on_the("right").ability.perma_mult or 0
				    b:on_the("right").ability.perma_mult = b:on_the("right").ability.perma_mult + cae.mult
                    NAMETEAM.msg(b:on_the("right"), localize("k_upgrade_ex"))
                end
                if b:on_the("left") then
                    b:on_the("left").ability.perma_mult = b:on_the("left").ability.perma_mult or 0
				    b:on_the("left").ability.perma_mult = b:on_the("left").ability.perma_mult + cae.mult
                    NAMETEAM.msg(b:on_the("left"), localize("k_upgrade_ex"))
                end
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    delay = 0,
                    func = function()
                        local a = NAMETEAM.find_highest(G.play.cards)
                        SMODS.destroy_cards(a)
                        return true
                    end
                }))
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "chilli_pepper",
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
            mult = 2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.GAME.blind.in_blind then
            G.GAME.blind.chips = G.GAME.blind.chips/2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            for k, v in pairs(G.hand.cards) do
                SMODS.debuff_card(v, true, "debuffed_by_chilli_pepper")
            end
        end
    end
})



SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "maybee",
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
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and G.GAME.current_round.hands_left == 0 then
            cae.cards = cae.cards or {}
            local tab = {}
            for k, v in pairs(context.scoring_hand) do
                tab[#tab+1] = v
            end
            tab = NAMETEAM.reverse_table(tab)
            tab = NAMETEAM.shuffle(tab, "maybee_you_will_work_questionmark")

            for i = 1, 2 do
                table.remove(tab, 1)
            end

            cae.cards = tab
        end

        if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
            for k, v in pairs(cae.cards) do
                if context.other_card == v then
                    return{
                        xmult = cae.xmult
                    }
                end
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "bamboo_spartan",
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
            chips = 0,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.pre_discard and G.GAME.current_round.discards_left == 1 then
            if G.GAME.current_round.hands_left == 1 then
                cae.double = true
            else
                cae.double = false
            end
            cae.trigger = true
        end
        if context.hand_drawn and cae.trigger and not context.blueprint then
            local sum = 0
            for k, v in pairs(G.hand.cards) do
                sum = sum + v:get_id()
            end
            if cae.double then
                sum = sum * 2
            end
            cae.chips = cae.chips + sum
            NAMETEAM.msg(card, localize("k_upgrade_ex"))
            cae.trigger = false
            cae.double = false
        end
        if context.joker_main then
            return{
                chips = cae.chips
            }
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "night_cap",
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
            xmult = 1,
            xmult_gain = 0.1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval then
            local to_scale = 0
            for k, v in pairs(G.jokers.cards) do
                if v ~= card then
                    if not (v.sell_cost <= 0) and ((not v.ability.extra_value) or ((v.ability.extra_value and (v.ability.extra_value+v.sell_cost >= 0)))) then
                        v.ability.extra_value = v.ability.extra_value or 0
                        v.ability.extra_value = v.ability.extra_value - 1
                        v:set_cost()
                        to_scale = to_scale + 1
                        NAMETEAM.msg(v, "-1 Value")
                    end
                end
            end
            for i = 1, to_scale do
                cae.xmult = cae.xmult + cae.xmult_gain
            end
            if to_scale > 0 then
                NAMETEAM.msg(card, localize("k_upgrade_ex"))
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "bud_uh_boom",
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
        if context.selling_self and G.GAME.blind and G.GAME.blind.in_blind then
            NAMETEAM.defeat()
            G.GAME.NAMETEAM.buduh_boomed = true 
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "guard_shroom",
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
            hands = 6,
            hands_max = 6
        }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_guardshroom"}
        local cae = card.ability.extra
        return{vars={cae.hands,cae.hands_max}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.after and not context.blueprint then
            if cae.hands>1 then
                cae.hands=cae.hands-1
            else
                cae.hands = cae.hands_max
                local tab = {}
                for k, v in pairs(G.jokers.cards) do
                    if not v.ability.cbean_guardshroom and v ~= card then
                        tab[#tab+1] = v
                    end
                end
                local acarad = pseudorandom_element(tab,pseudoseed("SEED"))
                acarad:juice_up()
                acarad:add_sticker("cbean_guardshroom", true)
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "mangofier",
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
            odd_xmult = 0.75,
            even_xmult = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.even_xmult,cae.odd_xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and (G.GAME.current_round.hands_left%2)==1 then
            return{
                xmult = cae.odd_xmult
            }
        elseif context.joker_main and (G.GAME.current_round.hands_left%2)==0 then
            return{
                xmult = cae.even_xmult
            }
        end
    end
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "blaze_leaf",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            xmult = 1.15,
            mult = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and not context.blueprint then
            NAMETEAM.all_on(card, G.jokers.cards, "left","blaze_leafed_rn_omg" )
            NAMETEAM.all_on(card, G.jokers.cards, "right","blaze_leafed_rn_not_omg" )
        end

        if context.other_joker then
            if context.other_joker.ability.blaze_leafed_rn_omg then
                context.other_joker.ability.blaze_leafed_rn_omg = false
                return{
                    xmult = cae.xmult,
                    message_card = context.other_joker
                }
            elseif context.other_joker.ability.blaze_leafed_rn_not_omg then
                context.other_joker.ability.blaze_leafed_rn_not_omg = false
                return{
                    mult = cae.mult,
                    message_card = context.other_joker
                }
            end
        end
    end,
})