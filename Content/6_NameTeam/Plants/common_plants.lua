SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "peashooter",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 8, y = 0 },
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            blind = 0.9
        }
    },
    pools = {
        cbean_pea = true
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
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "sunflower",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 7, y = 0 },
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
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "sun_shroom",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 11, y = 2 },
    cost = 4,
    rarity = 1,
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
		art = "Doggfly",
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

SMODS.Joker({
	pvz_plant = true,
    key = "sunnier_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "grave_buster",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            local tab = {}
            for k, v in pairs(G.jokers.cards) do
                if v:cbean_has_sticker() and v ~= card then
                    tab[#tab+1] = v
                end
            end
            local _card = pseudorandom_element(tab, pseudoseed("GRAVEBUSINGIT"))
        if _card then
            for k, v in pairs(SMODS.Stickers) do
                if _card.ability[v.key] then
                    _card:remove_sticker(v.key, true)
                 end
            end
        end
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "crater",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "lava",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "tangle_kelp",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 6, y = 2 },
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "jalepeno",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 7, y = 4 },
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
		art = "Doggfly",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            if not G.GAME.NAMETEAM.jal_sold then G.GAME.NAMETEAM.jal_sold = 0 end
            G.GAME.NAMETEAM.jal_sold = G.GAME.NAMETEAM.jal_sold + 1
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cabbage_pult",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 4, y = 0 },
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
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "marigold",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "kernel_pult",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 4, y = 1 },
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
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "hypno_shroom",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "ice_lettuce",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        return{vars={cae.rounds}}
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
    key = "snap_dragon",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 3, y = 1 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "spring_bean",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 1, y = 1 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
	pvz_plant = true,
    key = "pea_pod",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 5, y = 4 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 0,
            mult_gain = 5
        }
    },
    pools = {
        cbean_pea = true
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
        return NAMETEAM.plant_in_pool, {allow_duplicates = true}
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "robotga",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 0, y = 4 },
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "bean",
    cost = 3,
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 0, y = 0 },
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
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
        if context.selling_self and G.GAME.blind and G.GAME.blind.in_blind and not G.GAME.blind.disabled then
            G.GAME.blind:disable()
            G.GAME.NAMETEAM.cards_no_score = true
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "gold_leaf",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "moonflower",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "shadow_shroom",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "grimrose",
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
            G.GAME.NAMETEAM.grimrose_number = G.GAME.NAMETEAM.grimrose_number or 0 
            G.GAME.NAMETEAM.grimrose_number =  G.GAME.NAMETEAM.grimrose_number + 1
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "homing_thistle",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "ghost_pepper",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "sap_fling",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "fire_peashooter",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
	},
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            rep = 3
        }
    },
    pools = {
        cbean_pea = true
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "toad_stool",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 10, y = 1 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "straw_burst",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "gold_bloom",
    atlas = 'NAMETEAM_PlantJokers',
    pos = { x = 4, y = 2 },
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "apple_mortar",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "witch_hazel",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "parsnip",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "electric_peashooter",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 4,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Doggfly",
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
    pools = {
        cbean_pea = true,
        cbean_electric = true
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "holly_projectile",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 1,
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "sling_pea",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    rarity = 1,
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
    pools = {
        cbean_pea = true
    },
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "basic_z",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "carrot_z",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "dartichoke",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "tumbleweed",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "gumnut",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            G.GAME.NAMETEAM.no_progress = G.GAME.NAMETEAM.no_progress + cae.rounds
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    key = "tofu_turkey",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
    end,
    in_pool = function(self,card)
        return false
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "stickybomb_rice",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "hocus_crocus",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            mult_gain = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult_gain}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[1] then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
				context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + cae.mult_gain
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
    key = "headbutter_lettuce",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            chips = 55
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            if NAMETEAM.index(card, G.jokers.cards) == NAMETEAM.index(context.other_card, G.play.cards) then
                return{
                    chips = cae.chips
                }
            end 
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "solar_sage",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            G.GAME.NAMETEAM.gold_rush = G.GAME.NAMETEAM.gold_rush or 0
            G.GAME.NAMETEAM.gold_rush = G.GAME.NAMETEAM.gold_rush  + 1
        end
    end,
})


SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "teleporto_mine",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self and G.blind_select and (Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices["Boss"]).key) ~= "bl_cbean_blank" then
            G.GAME.NAMETEAM.stored_boss = Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices["Boss"]).key
            NAMETEAM.set_blind("bl_cbean_blank")
        end
    end,
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "buttercup",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 2,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            mult = 15
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
            SMODS.debuff_card(v, false, "debuff_by_buttercup")
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            local c = context.other_card 
            if c == context.scoring_hand[1] then
                return{
                    mult = cae.mult
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
                        if v == c[1] then
                            SMODS.debuff_card(v, true, "debuff_by_buttercup")
                        end
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_by_buttercup")
            end
        end
    end,
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "vamporcini",
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
            mult = 30
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            SMODS.debuff_card(card, true, "self_debuf_vamp_oh_no")
            return{
                mult = cae.mult
            }
        end
    end,
})


SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "bun_chi",
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
            chips = 30,
            hands = 5,
            mult = 40,
            hands_max = 5,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.mult,cae.hands,cae.hands_max}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            if cae.hands > 1 then
                cae.hands = cae.hands - 1
                return{
                    chips = cae.chips
                }
            else
                cae.hands = cae.hands_max
                return{
                    mult = cae.mult
                }
            end
        end
    end
    
})


SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "boomberry",
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
            chips = 40
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] then
            return{
                chips = ((cae.chips/4)+(cae.chips/4)+(cae.chips/4)+(cae.chips/4))
            }
        end
    end
})


SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "sea_flora",
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
            chips = 15
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,(cae.chips*(G.jokers and NAMETEAM.all_on(card, G.jokers.cards, "left") or 1))}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                chips = cae.chips*NAMETEAM.all_on(card, G.jokers.cards, "left")
            }
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "sundew_tangler",
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
            dollars = 3,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            return{
                dollars = cae.dollars
            }
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "bean_sprout",
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
            xmult = 1.2,
            exxmult = 1.4
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.exxmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult
            }
        end
        if context.individual and context.cardarea == G.play and context.other_card == NAMETEAM.find_highest(G.play.cards) then
            return{
                xmult = cae.exxmult,
                card = card,
                message_card = card
            }
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "electric_peel",
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
            chips = 40,
            chips2 = 15
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.chips2}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            cae._card = pseudorandom_element(context.scoring_hand, pseudoseed("seeds_can_eat_my_ass"))
        end
        if context.individual and context.cardarea == G.play then
            local c = context.other_card
            if c == cae._card then
                return{
                    chips = cae.chips
                }
            else
                return{
                    chips = cae.chips2
                }
            end
        end
        if context.after then
            cae._card = nil
        end
    end
})

SMODS.Joker({
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "blast_spinner",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            xmult = 2
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
            SMODS.debuff_card(v, false, "debuff_byblast_spinner")
        end
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            cae._card = pseudorandom_element(context.scoring_hand,pseudoseed("blast_spinner"))
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card == cae._card then
                return{
                    xmult = cae.xmult
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
                        if v == cae._card then
                            SMODS.debuff_card(v, true, "debuff_byblast_spinner")
                        end
                    end
                    return true
                end
            }))
        end
        if context.ante_change and context.ante_end and not context.blueprint then
            for k, v in pairs(G.playing_cards) do
                SMODS.debuff_card(v, false, "debuff_byblast_spinner")
            end
        end
    end,
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "frost_bonnet",
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
            chips = 100,
            mult = 20
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            if G.GAME.current_round.hands_left > G.GAME.current_round.discards_left then
                return{
                    chips = cae.chips
                }
            else
                return{
                    mult = cae.mult
                }
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "znake_lilly",
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
        if context.final_scoring_step then
            local acard = pseudorandom_element(context.scoring_hand)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.01,
                func = function()
                    acard:juice_up()
                    acard:set_ability(pseudorandom_element({"m_cbean_basic_zomboid","m_cbean_carrot_zomboid","m_cbean_melon_zomboid"},pseudoseed("znake_lilly")))
                    return true
                end
            }))
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "corn_fetti_popper",
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
            mult = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[1] then
                return{
                    mult = cae.mult*NAMETEAM.all_on(card, context.scoring_hand, "right")
                }
            end
        end
    end
})

SMODS.Joker({
    atlas = 'NAMETEAM_PlantPlaceholder',
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool, 
    key = "seashooter",
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
            chips = 50
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id()%2 == 1 then
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
    key = "sourshot",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            dollars= 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.individual and not context.blueprint and context.cardarea == G.play then
			if ((not context.other_card.ability.perma_bonus) or ((-(context.other_card.ability.perma_bonus)))<context.other_card.base.id) then
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus - 1

                if (context.other_card.base.id) == -(context.other_card.ability.perma_bonus) then
                    context.other_card.ability.cbean_marked = true
                end
				return {
                    dollars = cae.dollars,
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
    key = "security_gourds",
    atlas = 'NAMETEAM_PlantPlaceholder',
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
            hands = 2,
            discards = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.hands,cae.discards}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.before then
            if G.GAME.current_round.hands_left == 0 then
                ease_hands_played(cae.hands)
                ease_discard(cae.discards)
                SMODS.destroy_cards(card)
            end
        end
    end,
})
