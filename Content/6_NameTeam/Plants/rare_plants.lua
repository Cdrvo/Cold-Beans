SMODS.Joker({
    key = "tallnut",
    cost = 5,
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    update = function(self,card)
        if card and card.area and card.area.cards and card.added_to_deck then
            for k, v in pairs(card.area.cards) do
                if v.debuff then v.debuff = false end
            end
        end
    end
})

SMODS.Joker({
    key = "split_pea",
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2,
            mult = 25
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.mult}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            if card:closer_to() == "left" then
                return{
                    xmult = cae.xmult
                }
            else
                return{
                    mult = cae.mult
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "starfruit",
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 10,
            chips = 15,
            xmult = 1.5,
            dollars = 1,
            discards = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.mult,cae.xmult,cae.dollars,cae.discards}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.setting_blind then
            ease_discard(cae.discards)
        end
        if context.joker_main then
            return{
                xmult = cae.xmult,
                chips = cae.chips,
                mult = cae.mult
            }
        end
    end,
    calc_dollar_bonus = function(self,card)
        return card.ability.extra.dollars
    end
})

SMODS.Joker({
    key = "garlic",
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
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
                xmult = cae.xmult,
            }
        end
        if context.cbean_first and context.cardarea == G.jokers and G.jokers.cards and #G.jokers.cards>0 then
            local j1_pos_old = -1
            local j1_pos_new = -1

            local j2_pos_old = -1
            local j2_pos_new = -1

            local joker1, joker2 = pseudorandom_element(G.jokers.cards,pseudoseed("AE")), pseudorandom_element(G.jokers.cards,pseudoseed("AE"))

            for k, v in pairs(G.jokers.cards) do
                if v == joker1 then
                    j1_pos_old = k
                end
                if v == joker2 then
                    j2_pos_old = k
                end
            end

            j1_pos_new = math.random(1, #G.jokers.cards)
            j2_pos_new = math.random(1, #G.jokers.cards)

            while j1_pos_old == j1_pos_new do
                j1_pos_new = math.random(1, #G.jokers.cards)
            end
            while j2_pos_old == j2_pos_new do
                j2_pos_new = math.random(1, #G.jokers.cards)
            end
            while j2_pos_new == j1_pos_new do
                j2_pos_new = math.random(1, #G.jokers.cards)
            end
            G.E_MANAGER:add_event(Event({ 
                trigger = "before",
                blockable = "false",
                func = function() 
                    table.insert(G.jokers.cards, j1_pos_new, table.remove(G.jokers.cards,j1_pos_old))
                    play_sound('cardSlide1', 0.85)
                    table.insert(G.jokers.cards, j2_pos_new, table.remove(G.jokers.cards,j2_pos_old))
                    play_sound('cardSlide1', 0.85)
                    return true
                end 
            })) 
            
        end
    end,
})

SMODS.Joker({
    key = "umbrella_leaf",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
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
                if card.area.cards[rr+1].facing and card.area.cards[rr+1].facing == "back" then card.area.cards[rr+1]:flip() end
            end
            if rr and card.area.cards[rr-1] then
                if card.area.cards[rr-1].debuff then card.area.cards[rr-1].debuff = nil end
                if card.area.cards[rr-1].facing and card.area.cards[rr-1].facing == "back" then card.area.cards[rr-1]:flip() end
            end
        end
    end
})

SMODS.Joker({
    key = "gatling_pea",
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.repetitions}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.repetition and context.cardarea == G.play then
        local coc = context.other_card
        local csh = context.scoring_hand
            if (csh[1] and coc == csh[1]) or (csh[1+1] and coc == csh[2]) or (csh[1+1+1] and coc == csh[3]) or (csh[1+1+1+1] and coc == csh[4]) then 
                return {
                    repetitions = cae.repetitions
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "golden_magnet",
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
            xmult = 1,
            xmult_gain = 0.1,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.xmult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
        if context.cbean_cashout and NAMETEAM.goldenmagnet_number then
            cae.xmult = cae.xmult + (cae.xmult_gain*NAMETEAM.goldenmagnet_number)
            NAMETEAM.msg(card, localize("k_upgrade_ex"), "mult")
        end
    end,
})

SMODS.Joker({
    key = "winter_melon",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 2,
            xmult_gain = 0.5,
            adj_xmult = 1.5,
            adj_xmult_default = 1.5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.adj_xmult_default,cae.xmult_gain,cae.adj_xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then

            if card:on_the("left") then
                SMODS.calculate_effect({xmult=cae.adj_xmult}, card:on_the("left"))
            end
            if card:on_the("right") then
                SMODS.calculate_effect({xmult=cae.adj_xmult}, card:on_the("right"))
            end
            SMODS.calculate_context({im_bored_cbean = true})
            return{
                xmult = cae.xmult
            }
        end
        if context.im_bored_cbean and not context.blueprint then
            SMODS.scale_card(card,{
                ref_table = cae,
                ref_value = "adj_xmult",
                scalar_value = "xmult_gain"
            })
        end
    end,
    update = function(self,card)
        if card.added_to_deck then
            for k, v in pairs(G.jokers.cards) do
                if v.debuffed_by_melon and v ~= card:on_the("right") and v ~= card:on_the("left") then
                    SMODS.debuff_card(v, false, "winter_meloning")
                    v.debuffed_by_melon = nil
                end
            end
            if card:on_the("right") and not card:on_the("right").debuff then
                SMODS.debuff_card(card:on_the("right"), true, "winter_meloning")
                card:on_the("right").debuffed_by_melon = true
            end
            if card:on_the("left") and not card:on_the("left").debuff then
               SMODS.debuff_card(card:on_the("left"), true, "winter_meloning")
               card:on_the("left").debuffed_by_melon = true
            end
        end
    end
})

SMODS.Joker({
    key = "spikerock",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 3
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
                    xmult = cae.xmult,
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
    key = "imitater",
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    add_to_deck = function(self,card,from_debuff)
    if G.GAME.last_bought_joker then
            G.E_MANAGER:add_event(Event({
                trigger = "immediate",
                delay = 0.1,
                func = function()
                    card:flip()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 1,
                func = function()
                    card:juice_up()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 1.2,
                func = function()
                    card:set_ability(G.GAME.last_bought_joker_key)
                    card:flip()
                    return true
                end
            }))
        end
    end,
    in_pool = function(self)
        return (G.GAME.last_bought_joker_key~=nil)
    end
})

SMODS.Joker({
    key = "chard_guard",
    cost = 4,
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
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, "debuff_by_chard_guard")
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
                        local c = context.scoring_hand 
                        if v == c[1] or v == c[2] or v == c[3] then
                            SMODS.debuff_card(v, true, "debuff_by_chard_guard")
                        end
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_by_chard_guard")
            end
        end
    end,
})


SMODS.Joker({
    key = "red_stinger",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 3.5,
            xmult_lose = 0.5,
            rr = nil,
            on_the_left = 0
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        if card.added_to_deck then
            cae.on_the_left = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    cae.rr = i
                end
            end

            for i = 1, #G.jokers.cards do
               if i < cae.rr then
                    cae.on_the_left = cae.on_the_left + 1
               end
            end
        end
        return{
            vars={cae.xmult,cae.xmult_lose,(cae.xmult-(cae.xmult_lose*cae.on_the_left))}
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
                xmult = cae.xmult-(cae.on_the_left*cae.xmult_lose)
            }
        end
    end,
})


SMODS.Joker({ 
    key = "shrinking_violet",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            rep = 3
        }
    },
    add_to_deck = function(self,card,from_debuff)
        for k, v in pairs(SMDOS.ConsumableTypes) do
            if G.P_CENTER_POOLS[k] then
                for _, _card in pairs(G.P_CENTER_POOLS[k]) do
                    if _card and _card.config.max_highlighted and not _card.cbean_shrunk_by_violet then
                        _card.config.max_highlighted = _card.config.max_highlighted * 2
                        _card.cbean_shrunk_by_violet = true
                    elseif _card and _card.config and _card.config.extra and type(_card.config.extra) == "table" and _card.config.extra.max_highlighted then
                        _card.config.extra.max_highlighted = _card.config.extra.max_highlighted * 2
                        _card.cbean_shrunk_by_violet = true
                    end
                end
            end
        end
    end,
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(SMDOS.ConsumableTypes) do
            if G.P_CENTER_POOLS[k] then
                for _, _card in pairs(G.P_CENTER_POOLS[k]) do
                    if _card and _card.config.max_highlighted and _card.cbean_shrunk_by_violet then
                        _card.cbean_shrunk_by_violet = nil
                        _card.config.max_highlighted = _card.config.max_highlighted / 2

                    elseif _card and _card.config and _card.config.extra and type(_card.config.extra) == "table" and _card.config.extra.max_highlighted and _card.cbean_shrunk_by_violet then
                        _card.cbean_shrunk_by_violet = nil
                        _card.config.extra.max_highlighted = _card.config.extra.max_highlighted / 2
                    end
                end
            end
        end
    end
})

SMODS.Joker({
    key = "cauli_power",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 2,
            stored_chips = 0
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMODS.get_probability_vars(card, 1, cae.odds, "cauli_powering")
        return{
            vars={num,den,cae.stored_chips}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval and G.GAME.current_round.hands_played == 1 then
            cae.stored_chips = G.GAME.blind.chips
            NAMETEAM.msg(card, "=" .. cae.stored_chips)
        end
        if context.first_hand_drawn and cae.stored_chips>0 and SMODS.pseudorandom_probability(card, "cauli_powering", 1, cae.odds) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    G.GAME.blind.chips = G.GAME.blind.chips - cae.stored_chips
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    NAMETEAM.msg(card, "-" .. cae.stored_chips)
                    cae.stored_chips = 0
                    return true
                end
            }))
        end
    end,
})


SMODS.Joker({
    key = "zoybean_pod",
    cost = 3,
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
            round_timer = 4,
            rounds_max = 4,
        }
    },
    loc_vars = function(self,info_queue,card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_basic_z
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_melon_z
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_carrot_z
        local cae = card.ability.extra
        return{
            vars={cae.round_timer,cae.rounds_max}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.setting_blind and not context.blueprint then
            if cae.round_timer>1 then
                cae.round_timer = cae.round_timer - 1
            else
                cae.round_timer = 4
                local acard = SMODS.add_card{
                    key = pseudorandom_element({"j_cbean_basic_z","j_cbean_carrot_z","j_cbean_melon_z"})
                }
                acard:set_edition("e_negative")
            end
        end
    end,
})

SMODS.Joker({
    key = "dazey_chain",
    cost = 3,
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
            chips = 40,
            mult = 20,
            xmult = 3,
            stage = 1,
            rounds = 2,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local key = self.key
        return{
            vars={cae.chips,cae.mult,cae.xmult,cae.rounds,cae.stage},
            key=key
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
            if cae.stage == 1 then
                return{
                    chips = cae.chips
                }
            elseif cae.stage == 2 then
                return{
                    mult = cae.mult
                }
            elseif cae.stage == 3 then
                return{
                    xmult = cae.xmult
                }
            end
        end
        if context.end_of_round and context.main_eval then
            if cae.rounds > 1 and cae.stage ~= "Last Stage" then
                cae.rounds = cae.rounds - 1
                NAMETEAM.msg(card, "-1")
            else
                if cae.stage == 1 then
                    cae.rounds = 3
                    cae.stage = 2
                    NAMETEAM.msg(card, "Stage 2!")
                elseif cae.stage == 2 then
                    cae.rounds = "Last Stage"
                    cae.stage = 3
                    NAMETEAM.msg(card, "Stage 3!")
                end
            end
        end
    end,
})


SMODS.Joker({
    key = "pokra",
    cost = 3,
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
            trigs = 0,
            needed_trigs = 3,
            xmult = 1.25
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={cae.xmult,cae.trigs,cae.needed_trigs}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual then
            if cae.trigs < cae.needed_trigs then
                cae.triggered = true
                if context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
                    return{
                        xmult = cae.xmult
                    }
                end
            else
                cae.mega_triggered = true
                if context.cardarea == G.play or context.cardarea == "unscored" then
                    return{
                        xmult = cae.xmult
                    }
                end
            end
        end
        if context.after then
            if cae.mega_triggered then
                 cae.trigs = 0
                 cae.mega_triggered = false
            elseif cae.triggered then
                cae.triggered = false
                cae.trigs = cae.trigs + 1
            end
        end
    end,
})

SMODS.Joker({
    key = "imp_pear",
    cost = 3,
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={((get_blind_amount(G.GAME.round_resets.blind_ante)*Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices["Big"]).mult*G.GAME.starting_params.ante_scaling))or 0}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            G.GAME.blind.chips = G.GAME.blind.chips - ((get_blind_amount(G.GAME.round_resets.blind_ante)*Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices["Big"]).mult*G.GAME.starting_params.ante_scaling))or 0
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            NAMETEAM.msg(card, "Reduced!")
        end
    end,
})

SMODS.Joker({
    key = "ultomato",
    cost = 3,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2.5
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
    add_to_deck = function(self,card,context)
        G.P_CENTERS[card.config.center.key].config.extra.xmult = G.P_CENTERS[card.config.center.key].config.extra.xmult + 1
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
    end,
    in_pool = function(self,card)
        return true, {allow_duplicates = true}
    end
})

SMODS.Joker({
    key = "murkadamia",
    cost = 3,
    rarity = 3,
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
        if context.individual and context.cardarea == G.play then
            SMODS.scale_card(card, {
                ref_table = cae,
                ref_value = "mult",
                scalar_value = "mult_gain"
            })
        end
    end,
})