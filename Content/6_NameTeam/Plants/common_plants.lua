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
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            return{
                mult = cae.mult
            }
        end
        if context.final_scoring_step and context.cardarea == G.play then
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