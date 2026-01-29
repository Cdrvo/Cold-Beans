SMODS.Joker({
    key = "peashooter",
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            blind = 0.9
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={cae.blind}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.first_hand_drawn and not context.blueprint and G.GAME.blind and G.GAME.blind.chips then
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.3,
            func=function()
                G.GAME.blind.chips = G.GAME.blind.chips*cae.blind
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                NAMETEAM.msg(card, "X"..cae.blind)
                return true
            end
        }))
        end
    end
})

SMODS.Joker({
    key = "sunflower",
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 8,
            odds = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMDOS.get_probability_vars(card,1,cae.odds,"sunflower_seedssomething")
        return{
            vars={num,den,cae.dollars}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    calc_dollar_bonus = function(self,card)
        if SMODS.pseudorandom_probability(card,"sunflower_seedsomething",1,card.ability.extra.odds) then
            return card.ability.extra.dollars
        end
    end
})



SMODS.Joker({
    key = "sun_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            rounds = 0,
            rounds_max = 2,
            dollars = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars,cae.rounds_max,cae.rounds}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval and not context.blueprint then
            if cae.rounds<cae.rounds_max then
                cae.rounds = cae.rounds + 1
            else
                card:set_ability("j_cbean_sunnier_shroom")
            end
        end
    end,
    calc_dollar_bonus = function(self,card)
        return card.ability.extra.dollars
    end
})

SMODS.Joker({ -- literally copypaste :D
    key = "sunnier_shroom",
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 8,
            odds = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMDOS.get_probability_vars(card,1,cae.odds,"sunflower_seedssomething")
        return{
            vars={num,den,cae.dollars}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    calc_dollar_bonus = function(self,card)
        if SMODS.pseudorandom_probability(card,"sunflower_seedsomething",1,card.ability.extra.odds) then
            return card.ability.extra.dollars
        end
    end,
    in_pool = function(self)
        return false
    end
})



SMODS.Joker({
    key = "grave_buster",
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.25
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
        if context.selling_self then 
            local card = pseudorandom_element(G.jokers.cards,pseudoseed("gravebustingggg"))
            for k, v in pairs(SMODS.Stickers) do
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.1, -- holy crash material man
                    func = function()
                        if card.ability[v.key] then
                            card:remove_sticker(v.key, true)
                        end
                        return true
                    end
                }))
            end
        end
    end,
})


SMODS.Joker({
    key = "crater",
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rounds = 0,
            max_round = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.max_round, cae.rounds}}
    end,
    add_to_deck = function(self,card,from_debuff)
        card:add_sticker("eternal", true)
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval then
            if cae.rounds<cae.max_round-1 then
                cae.rounds=cae.rounds+1
            else
                SMODS.destroy_cards(card, true)
            end
        end
    end,
})

SMODS.Joker({
    key = "lava",
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rounds = 0,
            max_round = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.max_round, cae.rounds}}
    end,
    update = function(self,card)
        if card.added_to_deck then
            if card.edition then
                card:set_edition(nil, true, true)
            end
        end
    end,
    add_to_deck = function(self,card,from_debuff)
        card:add_sticker("eternal", true)
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval then
            if cae.rounds<cae.max_round-1 then
                cae.rounds=cae.rounds+1
            else
                SMODS.destroy_cards(card, true)
            end
        end
    end,
})



SMODS.Joker({
    key = "tangle_kelp",
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rounds,cae.max_rouds}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.destroy_card and context.cardarea == G.play and not context.blueprint and context.destroy_card == G.play.cards[1] then
                SMODS.debuff_card(card, true, "tangle_kelping_it")
                return{
                    remove = true,  
                }
            end
        end
})


SMODS.Joker({
    key = "jalepeno",
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            active = false
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            if not NAMETEAM.jal_sold then NAMETEAM.jal_sold = 0 end
            NAMETEAM.jal_sold = NAMETEAM.jal_sold + 1
        end
    end
})

SMODS.Joker({
    key = "cabbage_pult",
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 15
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and context.other_card == NAMETEAM.find_highest(context.scoring_hand) then
            return{
                mult = cae.mult
            }
        end
    end
})

SMODS.Joker({
    key = "marigold",
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 2,
            dollars2 = 4,
            dollars3 = 8
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={cae.dollars,cae.dollars2,cae.dollars3}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        local num = pseudorandom_element({cae.dollars,cae.dollars2,cae.dollars3},"marry_me_gold_seed")
        return num
    end
})


SMODS.Joker({
    key = "kernel_pult",
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            odds = 4,
            mult = 5
        }
    },
    loc_vars = function(self,info_queue,card)
            local cae = card.ability.extra
        local num,den = SMDOS.get_probability_vars(card,1,cae.odds,"sunflower_seedssomething")
        return{
            vars={num,den,cae.mult}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    remove_from_deck = function(self,card,from_debuff)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, "debuff_by_kernel")
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
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
                        if SMODS.pseudorandom_probability(card, "kernel_seedasdasd", 1 , cae.odds) then
                            SMODS.debuff_card(v, true, "debuff_by_kernel")
                        end
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_by_kernel")
            end
        end
    end,
})

SMODS.Joker({
    key = "hypno_shroom",
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 3,
            mult_gain = 1
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
        if context.individual and context.cardarea == G.play then
            return{
                mult = cae.mult
            }
        end
         if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered then
                SMODS.scale_card(card,{
                    ref_table = cae,
                    ref_value = "mult",
                    scalar_value = "mult_gain"
                })
            end
        end
    end,
})


SMODS.Joker({
    key = "ice_lettuce",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rounds = 1
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
    key = "snap_dragon",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            SMODS.calculate_effect({mult=cae.mult},context.other_card)
            if context.other_card:on_the("left") then
                SMODS.calculate_effect({mult=cae.mult},context.other_card:on_the("left"))
            end
            if context.other_card:on_the("right") then
                SMODS.calculate_effect({mult=cae.mult},context.other_card:on_the("right"))
            end
        end
    end,
})

SMODS.Joker({
    key = "spring_bean",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = false,
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
    end,
})

SMODS.Joker({
    key = "pea_pod",
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
            mult = 0,
            mult_gain = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult,cae.mult_gain}}
    end,
    add_to_deck = function(self,card,context)
        SMODS.calculate_context({pea_pod_added = true, card = card})
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.pea_pod_added and context.card ~= card and not context.blueprint then
            SMODS.destroy_cards(context.card)
            SMODS.scale_card(card, {
                ref_table = cae,
                ref_value = "mult",
                scalar_value = "mult_gain"
            })
        end

        if context.joker_main then
            return{
                mult = cae.mult
            }
        end
    end,
    in_pool = function(self,card)
        return true, {allow_duplicates = true}
    end
})

SMODS.Joker({
    key = "robotga",
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
            chips = 40
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            return{
                chips = cae.chips
            }     
        end
    end,
})



SMODS.Joker({
    key = "bean",
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
            chips = 40
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.GAME.current_round.hands_played==0 and not G.GAME.blind.disabled then
            G.GAME.blind.disabled = false
            NAMETEAM.first_hand_disable = true
        end
    end,
})

SMODS.Joker({
    key = "gold_leaf",
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
            dollars = 2
        }
    },
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
    end
})

SMODS.Joker({ 
    key = "moonflower",
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
            dollars = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={ cae.dollars, ((cae.dollars +  ((G.jokers and NAMETEAM.pool_in("cbean_shadow", (G.jokers.cards or "")) ) or 0)))  }}
    end,
    calc_dollar_bonus = function(self,card)
        local cae = card.ability.extra
        return cae.dollars + (NAMETEAM.pool_in("cbean_shadow", G.jokers.cards))
    end
})

SMODS.Joker({ 
    key = "shadow_shroom",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    pools = {
        cbean_shadow = true
    },
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            perc = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={ cae.perc }}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.GAME.blind.in_blind then
            for i = 1, G.GAME.current_round.hands_left do
                G.GAME.blind.chips = G.GAME.blind.chips - NAMETEAM.perc(G.GAME.blind.chips, cae.perc)
            end
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end
})

SMODS.Joker({ 
    key = "grimrose",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    pools = {
        cbean_shadow = true
    },
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={ cae.xmult }}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            NAMETEAM.grimrose_number = NAMETEAM.grimrose_number or 0 
            NAMETEAM.grimrose_number =  NAMETEAM.grimrose_number + 1
        end
    end
})

SMODS.Joker({ 
    key = "homing_thistle",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and context.scoring_hand and context.other_card == context.scoring_hand[1] then
            return{
                chips = cae.chips
            }
        end
    end
})

SMODS.Joker({ 
    key = "ghost_pepper",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            chips = 15,
            rounds = 5,
            rounds_max = 5
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.rounds,cae.rounds_max}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            return{
                chips = cae.chips
            }
        end
        if context.end_of_round and context.main_eval then
            if cae.rounds > 1 then
                cae.rounds = cae.rounds-1
                NAMETEAM.msg(card, "-1")
            else
                SMDOS.destroy_cards(card)
                NAMETEAM.msg(card, localize("k_eaten_ex"))
            end
        end
    end
})

SMODS.Joker({ 
    key = "sap_fling",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
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
    end
})

SMODS.Joker({ 
    key = "fire_peashooter",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rep = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.rep}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.repetition and context.cardarea == G.play and context.scoring_hand and context.other_card == context.scoring_hand[1] then
            context.other_card.cbean_burnt = true
            return {
                repetitions = cae.rep
            }
        end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card.cbean_burnt then
            NAMETEAM.msg(context.destroy_card, "Burnt!")
            return{
                remove = true
            }
        end
    end
})

SMODS.Joker({ 
    key = "toad_stool",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            dollars = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.destroy_card and context.cardarea == G.play and #context.scoring_hand == 1 and #G.play.cards == 1 then
            return{
                message = "Destroyed!",
                dollars = cae.dollars,
                message_card = context.desdtroy_card,
                remove = true,
            }
        end
    end
})


SMODS.Joker({ 
    key = "straw_burst",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            hands = 0,
            chips = 100
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.hands,cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main and cae.hands >= 2 then
            cae.trigger = true
            cae.hands = 0
            return{
                chips = cae.chips
            }
        end
        if context.after and cae.hands <= 1 and not context.blueprint then
            if not cae.trigger then
                cae.hands = cae.hands+1
                NAMETEAM.msg(card, "+1")
            else
                cae.trigger=false
            end
        end
    end
})

SMODS.Joker({ 
    key = "gold_bloom",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
                dollars = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and #G.jokers.cards>0 then
            ease_dollars(cae.dollars*#G.jokers.cards)
        end
    end
})

SMODS.Joker({ 
    key = "apple_mortar",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
                mult = 10,
                odds = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMODS.get_probability_vars(card, 1, cae.odds, "apple_mortaring_int")
        return{vars={cae.mult,num,den}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            local c = context.scoring_hand
            for k, v in pairs(c) do
                if v == c[#c] or v == c[#c-1] or v == c[#c-2] then
                    if SMODS.pseudorandom_probability(card, "apple_mortaring_int", 1, cae.odds) then
                        v.marked_by_mortar = true
                    else
                        v.marked_for_apple_mortar = true
                    end
                end 
            end
        end
        if context.individual and context.cardarea == G.play and context.other_card.marked_for_apple_mortar then
            return{
                mult = cae.mult
            }
        end
        if context.after then
            for k, v in pairs(G.playing_cards) do
                if v.marked_by_mortar then
                    v.marked_by_mortar = nil
                end
                if v.marked_for_apple_mortar then
                    v.marked_for_apple_mortar = nil
                end
            end
        end
    end
})

SMODS.Joker({ 
    key = "witch_hazel",
    cost = 2,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            tcard = nil,
            rcard = nil
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and #context.scoring_hand>2 then
            local tab = {}
            for k, v in pairs(context.scoring_hand) do
                tab[#tab+1] = v
            end
            cae.tcard = pseudorandom_element(tab,pseudoseed("witch_hazel"))
            for i = 1, #tab do
                if cae.tcard == tab[i] then
                    table.remove(tab, i)
                end
            end
            cae.rcard = pseudorandom_element(tab,pseudoseed("witch_hazel"))
        end
        if context.final_scoring_step and cae.tcard and cae.rcard then
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0,
                func = function()
                    cae.tcard:flip()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.3,
                func = function()
                    copy_card(cae.rcard, cae.tcard)
                    cae.tcard:juice_up()
                    cae.rcard:juice_up()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.5,
                func = function()
                    cae.tcard:flip()
                    cae.tcard = nil
                    cae.rcard = nil
                    return true
                end
            }))
        end
    end
})

SMODS.Joker({
    key = "parsnip",
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    config = { 
        extra = {
            chip_gain = 10,
            chip_destroy = 20,
            odds = 8,
            dest = false,
            fuck_you = false
        } 
    },
    loc_vars = function(self, info_queue, card)
        local cae = card.ability.extra
        local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "parsnipping")
        return { vars = { cae.chip_gain, num, den, cae.chip_destroy } }
    end,
    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.before and not context.blueprint then
            if SMODS.pseudorandom_probability(card, "parsnipping", 1, cae.odds) then
                cae.fuck_you = true
            end
        end
        if context.individual and context.cardarea == G.play then
            local c, gp = context.other_card, context.scoring_hand
                if cae.fuck_you then
                    cae.dest = true
                    if c ~= gp[1] then
                        c.ability.perma_bonus = (c.ability.perma_bonus or 0) + cae.chip_destroy
                        return {
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS
                        }
                    end
                else
                    if c == gp[1] then
                    c.ability.perma_bonus = (c.ability.perma_bonus or 0) + cae.chip_gain
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS
                    }
                end
            end
        end
        if context.after and not context.blueprint and cae.dest then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    SMODS.destroy_cards(card)
                    return true
                end
            }))
        end
    end
})

SMODS.Joker({
    key = "electric_peashooter",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 10,
            pos = nil,
            tab = {}
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
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
                    G.jokers.cards[i].ability.electrified = true
               end
            end
        end

        if context.other_joker and context.other_joker.ability.electrified then
            context.other_joker.ability.electrified  = false
            return{
                mult = cae.mult,
                message_card = context.other_joker
            }
        end
    end,
})


SMODS.Joker({
    key = "holly_projectile",
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 5,
            chips = 30,
            dollars = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        if not card.cbean_type then card.cbean_type = (cae.type or "unselected") end
        local key, vars = self.key, {}
        if card.cbean_type == "mult" then
            cae.type = "mult"
            vars = {cae.mult}
            key = self.key .. "_mult"
        elseif card.cbean_type == "chips" then
            cae.type = "chips"
            vars = {cae.chips}
            key = self.key .. "_chips"
        elseif card.cbean_type == "dollars" then
            cae.type = "dollars"
            vars = {cae.dollars}
            key = self.key .. "_dollars"
        else
            vars = {}
            key = self.key
        end
        return{vars=vars,key=key}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            if card.cbean_type == "mult" then
                return{
                    mult = cae.mult
                }
            elseif card.cbean_type == "chips" then
                return{
                    chips = cae.chips
                }
            end
        end
    end,
    calc_dollar_bonus = function(self,card)
        if card.cbean_type == "dollars" then
            return card.ability.extra.dollars
        end
    end
})

SMODS.Joker({
    key = "sling_pea",
    cost = 3,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 21,
            mult_lose = 3,
            no_lose = true
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars = {
                cae.mult, cae.mult_lose
            }
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and cae.mult>0 then
            if not cae.no_lose then
                cae.mult = cae.mult - cae.mult_lose
                NAMETEAM.msg(card, "-" .. cae.mult_lose)
            else
                cae.no_lose = false
            end
            return{
                mult = cae.mult
            }
        elseif context.individual and context.cardarea == G.play and cae.mult<=0 then
            SMODS.destroy_cards(card)
        end
        if context.after and cae.mult<=0 then
            SMODS.destroy_cards(card)
        end
    end,
})

SMODS.Joker({
    key = "basic_z",
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 6
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
                mult = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
    key = "carrot_z",
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 40
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
                chips = cae.xmult
            }
        end
    end,
})

SMODS.Joker({
    key = "dartichoke",
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            card = nil
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={}
        }
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before and context.scoring_hand then
            cae.card = NAMETEAM.find_highest(context.scoring_hand)
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card == cae.card then
                return{
                    chips = context.other_card.base.id
                }
            end
        end
    end,
})

SMODS.Joker({
    key = "tumbleweed",
    cost = 0,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rep = 2,
            odds = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMODS.get_probability_vars(card, 1,cae.odds,"tumbling")
        return{
            vars={cae.rep,num,den}
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
            for k, v in pairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(card, "tumbling", 1, cae.odds) then
                    v.mark_for_no_score = true
                end
            end
        end
        if context.repetition and context.cardarea == G.play then
            return{
                repetitions = cae.rep
            }
        end
    end,
})


SMODS.Joker({
    key = "gumnut",
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rounds = 1
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
    key = "tofu_turkey",
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    always_buyable = true,
    blueprint_compat = false,
    config = {
        extra = {
            chips = 20
        }
    },
    add_to_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    remove_from_deck = function(self,card,from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end,
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                chips = 20
            }
        end
    end,
    update = function(self,card)
        if card and card.edition and card.edition.negative then
            card:set_edition(nil, true, true)
        end
    end
})

SMODS.Joker({
    key = "stickybomb_rice",
    cost = 5,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 1,
    always_buyable = true,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 10
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            local aecard = pseudorandom_element(context.scoring_hand,pseudoseed("sticky_ricey_ahahjgasyhgda"))
            aecard.mark_for_no_score = true
            aecard.no_score_mult = cae.mult
        end
    end,
})