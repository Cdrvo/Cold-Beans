--Greek blinds that weren't coded cause i still had more time
function yma_redeem_voucher(tier, upgrade)
    local _pool, _ = get_current_pool('Voucher', nil, nil, nil)

    -- Check if there are any base vouchers that haven't already been redeemed
    local _bases = 0
    for i = 1, #_pool do
    if _pool[i] ~= 'UNAVAILABLE' and (not G.P_CENTERS[_pool[i]].requires or tier ~= 1) then
        _bases = _bases + 1
    end
    end
    if _bases > 0 then
    local _pool_key = 'Voucher_fromtag'
    local _voucher_key = pseudorandom_element(_pool, pseudoseed(_pool_key))
    local iv = 1
    while _voucher_key == 'UNAVAILABLE' or (G.P_CENTERS[_voucher_key].requires and tier == 1) do
        iv = iv + 1
        _voucher_key = pseudorandom_element(_pool, pseudoseed(_pool_key .. '_resample' .. iv))
    end

    local vouchers_to_create = { _voucher_key }
    if upgrade and tier == 1 then
        for _, v in ipairs(G.P_CENTER_POOLS["Voucher"]) do
            if v.requires and type(v.requires) == "table" then
            for _, requirement in ipairs(v.requires) do
                if requirement == _voucher_key then
                table.insert(vouchers_to_create, v.key)
                break
                end
            end
            end
        end
    end

    local cards_to_redeem = {}
    for _, key in ipairs(vouchers_to_create) do
        local voucher_card = create_card('Voucher', G.hand, nil, nil, nil, nil, key, 'yma_voucher')
        G.hand:emplace(voucher_card)
        voucher_card.cost = 0
        table.insert(cards_to_redeem, voucher_card)
    end
    local prev_state = G.STATE
    delay(0.2)
    for _, voucher_card in ipairs(cards_to_redeem) do
        G.STATE = prev_state
        G.FUNCS.use_card({ config = { ref_table = voucher_card } })
        delay(0.6)
    end
    end
    G.E_MANAGER:add_event(Event({
    func = function()
        for i = 1, #G.GAME.tags do
        if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then
            break
        end
        end
        return true
    end
    }))
end

Colonparen.GreekBlind{
    key = "colon_alpha",
    name = "Alpha",
    mult = 1,
    boss_colour = HEX("de6c6c"),
    pos = { x = 0, y = 0 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.mod_probability and context.trigger_obj and 
                context.trigger_obj.config and context.trigger_obj.config.center and SMODS.has_enhancement(context.trigger_obj, "m_lucky") then
                return {
                    numerator = context.numerator *3,
                    denominator = context.denominator 
                }
            end
        end
    },
    upper = {
        config = {
            lucky_trigger = 'lucky_mult',
        },
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.individual and context.cardarea == G.play and not context.end_of_round then
                local table = {'lucky_mult', 'lucky_money'}
                self.config.lucky_trigger = pseudorandom_element(table, pseudoseed('yma_alpha_blind'))
            end
            if context.mod_probability and context.trigger_obj and 
                context.trigger_obj.config and context.trigger_obj.config.center and SMODS.has_enhancement(context.trigger_obj, "m_lucky") then
                local trigger = context.identifier == self.config.lucky_trigger and context.denominator or 1
                return {
                    numerator = context.numerator * trigger,
                    denominator = context.denominator 
                }
            end
        end
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_theta",
    name = "Theta",
    mult = 1,
    boss_colour = HEX("76de6c"),
    pos = { x = 0, y = 7 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            --I changed it to per 1x instead of per 0.1X (since 0.1x is guaranteed $100 minimum) - RattlingSnow353
            if context.end_of_round and not context.blueprint and context.main_eval then
                local val = get_blind_amount(G.GAME.round_resets.ante)*1*G.GAME.starting_params.ante_scaling
                local total = math.floor(G.GAME.chips/val)
                if total >= 1 then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function() 
                            ease_dollars(total*10)
                            return true 
                        end 
                    }))
                end
            end
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
        calculate = function(self, blind, context)
            if context.end_of_round and not context.blueprint and context.main_eval then
                local val = get_blind_amount(G.GAME.round_resets.ante)*10*G.GAME.starting_params.ante_scaling
                local total = math.floor(G.GAME.chips/val)
                if total >= 1 then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function() 
                            ease_ante(-total)
                            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-total
                            return true 
                        end 
                    }))
                end
            end
        end
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_iota",
    name = "Iota",
    mult = 1,
    boss_colour = HEX("6cde80"),
    pos = { x = 0, y = 8 },
    lower = {
        set_blind = function(self, card, from_blind)
            yma_redeem_voucher()
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('Joker',G.jokers, nil, nil, nil, nil, nil, 'colon_iota')
                        cardd:add_to_deck()
                        G.jokers:emplace(cardd)
                        G.GAME.joker_buffer = 0
                        return true
                    end)
                }))
            end
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('Consumeables',G.consumeables, nil, nil, nil, nil, nil, 'colon_iota')
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
            end
        end,
        calculate = function(self, blind, context)
        end
    },
    upper = {
        set_blind = function(self, card, from_blind)
            for i = 1,2 do
                yma_redeem_voucher()
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('Joker',G.jokers, nil, nil, nil, nil, nil, 'colon_iota')
                        cardd:set_edition({ negative = true })
                        cardd:add_to_deck()
                        G.jokers:emplace(cardd)
                        return true
                    end)
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('Consumeables',G.consumeables, nil, nil, nil, nil, nil, 'colon_iota')
                        cardd:set_edition({ negative = true })
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                        return true
                    end)
                }))
            end
    end,
        calculate = function(self, blind, context)
        end
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_lambda",
    name = "Lambda",
    mult = 1,
    boss_colour = HEX("6cdea3"),
    pos = { x = 0, y = 10 },
    lower = {
        set_blind = function(self, card, from_blind)
            yma_redeem_voucher(1)
            yma_redeem_voucher(1)
        end,
    },
    upper = {
        set_blind = function(self, card, from_blind)
            yma_redeem_voucher(1, true)
            yma_redeem_voucher(1, true)
        end,
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_mu",
    name = "Mu",
    mult = 1,
    boss_colour = HEX("6cdec6"),
    pos = { x = 0, y = 11 },
    lower = {
        set_blind = function(self, card, from_blind)
        end,
    },
    upper = {
        set_blind = function(self, card, from_blind)
        end,
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_omicron",
    name = "Omicron",
    mult = 1,
    boss_colour = HEX("6cbfde"),
    pos = { x = 0, y = 14 },
    lower = {
    },
    upper = {
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_pi",
    name = "Pi",
    mult = 1,
    boss_colour = HEX("6cabde"),
    pos = { x = 0, y = 15 },
    lower = {
    },
    upper = {
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}

Colonparen.GreekBlind{
    key = "colon_rho",
    name = "Rho",
    mult = 1,
    boss_colour = HEX("6c97de"),
    pos = { x = 0, y = 16 },
    lower = {
    },
    upper = {
    },
    beans_credits = {
        team = ":( / Yeah! Mostly Artists",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "RattlingSnow353",
    }
}