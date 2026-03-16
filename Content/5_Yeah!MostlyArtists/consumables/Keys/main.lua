YMA = YMA or {

}

function YMA_reroll_card(card, key, set, append, temp_key, ability, context, instant)
    context = context or 'end_of_round'
    append = append or 'yma_reroll_card'
    instant = instant or false
    local victim_joker = card
    local temp_table = {}
    for k, v in pairs(victim_joker.ability) do
        temp_table[k] = v
    end

    local temp_card = victim_joker
    local temp_set = victim_joker.config.center.set

    local victim_rarity = victim_joker.config.center.rarity or 1
    local is_legendary = victim_rarity == 4
    local victim_key = victim_joker.config.center.key


    local replacement_pool = {}
    for _, center_data in ipairs(G.P_CENTER_POOLS[set or temp_set]) do
        local current_rarity = center_data.rarity or 1
        if current_rarity == victim_rarity then
            if center_data.key ~= victim_key then
                if not center_data.demo and not center_data.wip and (center_data.unlocked or G.GAME.modifiers.all_jokers_unlocked or center_data.rarity == 4) then
                    local can_add = true
                    if center_data.in_pool and type(center_data.in_pool) == 'function' then
                        if not center_data:in_pool() then can_add = false end
                    end
                    if can_add then table.insert(replacement_pool, center_data.key) end
                end
            end
        end
    end


    if #replacement_pool == 0 and not key then
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'No replacement found!', colour = G.C.RED })
        return false
    end


    local replacement_key = key or pseudorandom_element(replacement_pool, pseudoseed(append .. '_replacement'))
    if instant then
        victim_joker:set_ability(G.P_CENTERS[replacement_key])
        victim_joker:set_cost()
        if ability then
            for k, v in pairs(ability) do
                victim_joker.ability[k] = v
            end
        else
            victim_joker.ability = victim_joker.ability or {}
        end
        victim_joker.ability.yma_temp_key = temp_key
        if temp_table.yma_temp_ability_table then
            temp_table.yma_temp_ability_table = nil
        end
        victim_joker.ability.yma_temp_ability_table = temp_table
        victim_joker.ability.yma_temp_set = temp_set
        victim_joker.ability.yma_context = context
        SMODS.calculate_context({ yma = { after_reroll = true, card = victim_joker, old_card = temp_card } })
    else
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                victim_joker:flip()
                play_sound('card1', 1)
                victim_joker:juice_up(0.5, 0.5)
                return true
            end
        }))
        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                victim_joker:set_ability(G.P_CENTERS[replacement_key])
                victim_joker:set_cost()
                if ability then
                    for k, v in pairs(ability) do
                        victim_joker.ability[k] = v
                    end
                else
                    victim_joker.ability = victim_joker.ability or {}
                end
                victim_joker.ability.yma_temp_key = temp_key
                if temp_table.yma_temp_ability_table then
                    temp_table.yma_temp_ability_table = nil
                end
                victim_joker.ability.yma_temp_ability_table = temp_table
                victim_joker.ability.yma_temp_set = temp_set
                victim_joker.ability.yma_context = context
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                victim_joker:flip()
                play_sound('tarot2', 1, 0.6)
                victim_joker:juice_up(0.3, 0.3)
                SMODS.calculate_context({ yma = { after_reroll = true, card = victim_joker, old_card = temp_card } })
                return true
            end
        }))
        delay(0.5)
    end
end

function yma_get_keys_of_type(type)
    local center_key_table = {}
    for k, v in pairs(G.P_CENTER_POOLS['yma_keys']) do
        if v.config.extra.usage_type == type then
            center_key_table[#center_key_table + 1] = v.key
        end
    end
    return center_key_table
end

function yma_retrieve_joker_text(joker, descip, name)
    local function get_text(main)
        local text = ""
        if type(main) == "string" then
            text = text .. main
            return text
        end
        for i = 1, #main do
            if type(main[i]) == "string" then
                text = text .. main[i]
            elseif main[i].config and main[i].config.text and type(main[i].config.text) == "string" then
                text = text .. main[i].config.text

                -- Parses any Dynatext objects
            elseif main[i].config and main[i].config.object and main[i].config.object.config and type(main[i].config.object.config) == "table" and main[i].config.object.config.string then
                local options = main[i].config.object.config.string
                local random_element = main[i].config.object.config.random_element
                local chosen_option = nil
                if random_element then
                    chosen_option = options[pseudorandom('aij_retrieve_joker_text', 1, #options)]
                else
                    chosen_option = options[math.floor((G.TIMERS.REAL or pseudorandom('aij_retrieve_joker_text', 1, 60)) * love.timer.getFPS() % #options) + 1]
                end
                if type(chosen_option) == "table" then
                    text = text .. chosen_option.string or get_text(chosen_option)
                else
                    text = text .. chosen_option
                end
            elseif type(main[i]) == "table" then
                -- Parses any text in XMult/XChip/similar blocks
                if main[i].nodes and type(main[i].nodes) == "table" then
                    text = text .. " "
                    text = text .. get_text(main[i].nodes)
                else
                    text = text .. " "
                    text = text .. get_text(main[i])
                end
            end
        end
        return text
    end
    local text = ""
    if name and descip and G.localization.descriptions['Joker'][joker.key or joker] then
        local main = G.localization.descriptions['Joker'][joker.key or joker].name
        text = text .. get_text(main)
        if text and type(text) == 'string' then text = string.gsub(text, "{.-}", "") end
    elseif descip and G.localization.descriptions['Joker'][joker.key or joker] then
        local main = G.localization.descriptions['Joker'][joker.key or joker].text
        text = text .. get_text(main)
        if text and type(text) == 'string' then text = string.gsub(text, "{.-}", "") end
    else
        if joker.generate_UIBox_ability_table then
            if not joker.ability_UIBox_table then -- Removing this check causes memory leaks
                joker.ability_UIBox_table = joker:generate_UIBox_ability_table()
            end
            local main = joker.ability_UIBox_table.main
            text = text .. get_text(main)
            local multi_box = joker.ability_UIBox_table.multi_box
            if multi_box then
                text = text .. " "
                text = text .. get_text(multi_box)
            end
        end
    end
    return text
end

function yma_hell_upgrade_card(card)
    local upgrades_weight = { ['perma_bonus'] = { weight = 10, amt = 3 }, ['perma_mult'] = { weight = 4, amt = 1 }, ['perma_h_chips'] = { weight = 7, amt = 3 }, ['perma_h_mult'] = { weight = 3.8, amt = 2 }, ['perma_p_dollars'] = { weight = 2, amt = 1 }, ['perma_h_dollars'] = { weight = 3.6, amt = 1 }, ['perma_x_chips'] = { weight = 3.6, amt = 0.1 }, ['perma_x_mult'] = { weight = 2.2, amt = 0.1 }, ['perma_h_x_chips'] = { weight = 2.2, amt = 0.1 }, ['perma_h_x_mult'] = { weight = 1, amt = 0.1 }, ['perma_repetitions'] = { weight = 0.1, amt = 1 } }
    local total_rate = 0
    for k, v in pairs(upgrades_weight) do
        total_rate = total_rate + v.weight
    end
    local polled_rate = pseudorandom(pseudoseed('huc' .. G.GAME.round_resets.ante)) * total_rate
    local check_rate = 0

    local rates = {}
    for k, v in pairs(upgrades_weight) do
        rates[#rates + 1] = { type = k, val = v.weight, amt = v.amt * 5 }
    end
    for _, v in ipairs(rates) do
        if polled_rate > check_rate and polled_rate <= check_rate + v.val then
            local key = v.type
            card.ability[key] = card.ability[key] or 0
            card.ability[key] = card.ability[key] + v.amt
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex') })
            return
        end
        check_rate = check_rate + v.val
    end
end

function yma_improveable_consumable(card)
    if card.config.center.set == 'sdown_blessing' or card.config.center.set == 'yma_keys' then
        if not card.ability.yma_failed_pray then
            return true, card.config.center.set
        end
    elseif (card.config.center.key == "c_cbean_jbill_blessing") or (card.config.center.key == "c_cbean_jbill_key") then
        if not card.ability.yma_failed_pray then
            return true, card.config.center.corresponding_set
        end
    end

    return false, card.config.center.set
end

function yma_state_function_events(e)
    if G.STATE == G.STATES.GRAVEYARD then
        e.config.colour = G.C.RED
        e.config.button = 'hide_yma_graveyard'
        return true
    elseif G.STATE == G.STATES.HELL then
        e.config.colour = G.C.RED
        e.config.button = 'hide_yma_hell'
        return true
    elseif G.STATE == G.STATES.DREAMLAND then
        e.config.colour = G.C.RED
        e.config.button = 'hide_yma_dreamland'
        return true
    elseif G.STATE == G.STATES.TBOI_CHEST then
        e.config.colour = G.C.RED
        e.config.button = 'hide_yma_tboi_chest'
        return true
    elseif G.STATE == G.STATES.CASINO then
        e.config.colour = G.C.RED
        e.config.button = 'hide_yma_casino'
        return true
    end
    return false
end

function yma_can_access_location(location)
    if location == 'forgery' and (next(SMODS.find_card("c_cbean_yma_small_world")) or next(SMODS.find_card("c_cbean_yma_anywhere")) or G.GAME.yma_everywhere_open) and (not G.GAME.yma_forge_closed) then
        return true
    end
    if location == 'balley' and G.GAME.BALLEY_WINS and G.GAME.BALLEY_WINS < 3 then
        return true
    end
    if location == 'graveyard' and (next(SMODS.find_card("c_cbean_yma_moon")) or next(SMODS.find_card("c_cbean_yma_anywhere")) or G.GAME.yma_everywhere_open) and G.GAME.cbean and #G.GAME.cbean.destroyed_jokers > 0 then
        return true
    end
    if location == 'hell' and (next(SMODS.find_card("c_cbean_yma_key_to_hell")) or next(SMODS.find_card("c_cbean_yma_anywhere")) or G.GAME.yma_everywhere_open) then
        return true
    end
    if location == 'dreamland' and (next(SMODS.find_card("c_cbean_yma_reali")) or next(SMODS.find_card("c_cbean_yma_anywhere")) or G.GAME.yma_everywhere_open) then
        return true
    end
    if location == 'tboi_chest' and  ((G.GAME.tboi_chest_card_amt and G.GAME.tboi_chest_card_amt > 0) or (not(G.GAME.tboi_chest_selected_item)) and (G.GAME.tboi_chest_cards)) then
        return true
    end
    if location == 'casino' then
        return true
    end
    if location == "stationery" and G.GAME.nteam_sticker_obtained then
        return true
    end
end

function yma_calculate_casino(score)
    if score['Diamond'] == 2 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Diamonds") then
                v.ability.perma_p_dollars = v.ability.perma_p_dollars or 0
                v.ability.perma_p_dollars = v.ability.perma_p_dollars + 1
            end
        end
    elseif score['Diamond'] == 3 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Diamonds") then
                v.ability.perma_repetitions = v.ability.perma_repetitions or 0
                v.ability.perma_repetitions = v.ability.perma_repetitions + 3
            end
        end
    end

    if score['Club'] == 2 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Clubs") then
                v.ability.perma_mult = v.ability.perma_mult or 0
                v.ability.perma_mult = v.ability.perma_mult + 7
            end
        end
    elseif score['Club'] == 3 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Clubs") then
                v.ability.perma_repetitions = v.ability.perma_repetitions or 0
                v.ability.perma_repetitions = v.ability.perma_repetitions + 3
            end
        end
    end

    if score['Spade'] == 2 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Spades") then
                v.ability.perma_bonus = v.ability.perma_bonus or 0
                v.ability.perma_bonus = v.ability.perma_bonus + 50
            end
        end
    elseif score['Spade'] == 3 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Spades") then
                v.ability.perma_repetitions = v.ability.perma_repetitions or 0
                v.ability.perma_repetitions = v.ability.perma_repetitions + 3
            end
        end
    end

    if score['Heart'] == 2 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Hearts") then
                v.ability.perma_x_mult = v.ability.perma_x_mult or 0
                v.ability.perma_x_mult = v.ability.perma_x_mult + 0.25
            end
        end
    elseif score['Heart'] == 3 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and v:is_suit("Hearts") then
                v.ability.perma_repetitions = v.ability.perma_repetitions or 0
                v.ability.perma_repetitions = v.ability.perma_repetitions + 3
            end
        end
    end

    if score['Joker'] == 2 then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local cardd = create_card('Joker', G.jokers, nil, 0.99, nil, nil, nil, 'yma_two_joker_casino')
                cardd:set_edition({ negative = true })
                cardd:add_to_deck()
                G.jokers:emplace(cardd)
                return true
            end)
        }))
    elseif score['Joker'] == 3 then
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                local cardd = create_card('Joker', G.jokers, true, nil, nil, nil, nil, 'yma_three_joker_casino')
                cardd:add_to_deck()
                G.jokers:emplace(cardd)
                return true
            end)
        }))
    end

    if score['Banana'] == 2 then
        for i = 1, 2 do
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local cardd = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_gros_michel', 'yma_two_banana_casino')
                    cardd:set_edition({ negative = true })
                    cardd:add_to_deck()
                    G.jokers:emplace(cardd)
                    return true
                end)
            }))
        end
    elseif score['Banana'] == 3 then
        for i = 1, 3 do
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local cardd = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_cavendish', 'yma_three_banana_casino')
                    cardd:set_edition({ negative = true })
                    cardd:add_to_deck()
                    G.jokers:emplace(cardd)
                    return true
                end)
            }))
        end
    end

    if score['Cold Bean'] == 2 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') and SMODS.pseudorandom_probability(v, 'yma_three_beans_casino' .. G.SEED, 1, 6, nil, true) then
                for _k, _v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                    if _v.key == 'm_cbean_jbill_bean' then
                        v:set_ability(_v)
                    end
                end
                v:set_edition({ cbean_sd_frozen = true })
            end
        end
    elseif score['Cold Bean'] == 3 then
        for k, v in pairs(G.I.CARD) do
            if v.ability and (v.ability.set == 'Default' or v.ability.set == 'Enhanced') then
                for _k, _v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                    if _v.key == 'm_cbean_jbill_bean' then
                        v:set_ability(_v)
                    end
                end
                v:set_edition({ cbean_sd_frozen = true })
                v.ability.perma_h_chips = v.ability.perma_h_chips or 0
                v.ability.perma_h_chips = v.ability.perma_h_chips + 50
            end
        end
    end
end

function yma_add_tag(tag, event, silent)
    local func = function()
        add_tag(type(tag) == 'string' and Tag(tag) or tag)
        if not silent then
            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
        end
        return true
    end

    if event then
        G.E_MANAGER:add_event(Event {
            func = func
        })
    else
        func()
    end
end

function yma_poll_tag(seed, options)
    local pool = options or get_current_pool('Tag')
    local tag_key = pseudorandom_element(pool, pseudoseed(seed))

    while tag_key == 'UNAVAILABLE' do
        tag_key = pseudorandom_element(pool, pseudoseed(seed))
    end

    local tag = Tag(tag_key)

    if tag_key == "tag_orbital" then
        local available_hands = {}

        for _, k in ipairs(G.handlist) do
            local hand = G.GAME.hands[k]
            if hand.visible then
                available_hands[#available_hands + 1] = k
            end
        end

        tag.ability.orbital_hand = pseudorandom_element(available_hands, pseudoseed(seed .. '_orbital'))
    end

    return tag
end

function yam_ease_blind_requirement(mod_mult, mod_add)
    local original_chips = G.GAME.blind.original_chips > 0 and G.GAME.blind.original_chips or G.GAME.blind.chips

    mod_mult = mod_mult ~= nil and mod_mult or 0
    mod_add = mod_add ~= nil and mod_add or 0
    local current_mult = G.GAME.blind.chips / (original_chips / G.GAME.blind.mult) -- Takes into account previous ease_blind_requirement calls
    local final_chips = (original_chips / G.GAME.blind.mult) * (current_mult + mod_mult) + mod_add
    local chip_mod                                                                 -- iterate over ~120 ticks
    if type(G.GAME.blind.chips) ~= 'table' then
        chip_mod = math.ceil(math.abs(final_chips - G.GAME.blind.chips) / 120)
    else
        chip_mod = ((final_chips - G.GAME.blind.chips):abs() / 120):ceil()
    end
    local step = 0
    if G.GAME.blind.chips < final_chips then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = true,
            func = function()
                G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
                if G.GAME.blind.chips < final_chips then
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    if step % 5 == 0 then
                        play_sound('chips1', 0.8 + (step * 0.005))
                    end
                    step = step + 1
                else
                    G.GAME.blind.chips = final_chips
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.GAME.blind:wiggle()
                    return true
                end
            end
        }))
    else
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blocking = true,
            func = function()
                G.GAME.blind.chips = G.GAME.blind.chips - G.SETTINGS.GAMESPEED * chip_mod
                if G.GAME.blind.chips > final_chips then
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    if step % 5 == 0 then
                        play_sound('chips1', 0.8 + (step * 0.005))
                    end
                    step = step - 1
                else
                    G.GAME.blind.chips = final_chips
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    G.GAME.blind:wiggle()
                    return true
                end
            end
        }))
    end
end

--Removes use buttons off of the keys and their spectral
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local abc = G_UIDEF_use_and_sell_buttons_ref(card)
    local sell, use = nil, nil
    if (card.area == G.consumeables and (card.ability.set == "yma_keys" or card.config.center.key == "c_cbean_yma_omega")) then 
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = { --Default Sell Button
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "sell_card",
                        func = "can_sell_card",
                        handy_insta_action = "sell",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_sell"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card,
                                                ref_value = "sell_cost_label",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { padding = 0.1, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            sell,
                        } 
                    },
                    },
                },
            },
        }
    end
    return abc
end


G.FUNCS.cbean_pre_use = function(e)
    local card = e.config.ref_table
    card.ability.cbean_dont_select = true
	G.FUNCS.use_card(e)
end

G.FUNCS.cbean_can_use_consumeable = function(e)
	if e.config.ref_table:can_use_consumeable() then
		e.config.colour = G.C.RED
		e.config.button = "cbean_pre_use"
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

local G_UIDEF_use_and_sell_buttons_ref2 = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	local abc = G_UIDEF_use_and_sell_buttons_ref2(card)
	if
		card.ability
		and card.ability.consumeable
		and G.pack_cards
		and card.area == G.pack_cards
		and (G.GAME.used_vouchers["v_cbean_yma_grand_theft"]
        or card.config.center.set == "Consumables2")
	then
		return {
			n = G.UIT.ROOT,
			config = { padding = 0, colour = G.C.CLEAR },
			nodes = {
				{
					n = G.UIT.C,
					config = {
						ref_table = card,
						align = "bm",
						padding = 0.1,
						r = 0.08,
						minw = 0.5,
						hover = true,
						shadow = true,
						colour = G.C.UI.BACKGROUND_INACTIVE,
						one_press = true,
						button = "cbean_pre_use",
						func = "cbean_can_use_consumeable",
					},
					nodes = {
						--{n=G.UIT.B, config = {w=0.1,h=0.6}},
						{
							n = G.UIT.C,
							config = { align = "bm" },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "bm", maxw = 0.75 },
									nodes = {
										{
											n = G.UIT.T,
											config = {
												text = localize("b_use"),
												colour = G.C.UI.TEXT_LIGHT,
												scale = 0.35,
												shadow = true,
											},
										},
									},
								},
							},
						},
					},
				},
				{
					n = G.UIT.C,
					config = {
						ref_table = card,
						r = 0.08,
						padding = 0.1,
						align = "bm",
						minw = 0.25 * card.T.w - 0.15,
						maxw = 0.5 * card.T.w - 0.15,
						minh = 0.3 * card.T.h,
						hover = true,
						shadow = true,
						colour = G.C.UI.BACKGROUND_INACTIVE,
						one_press = true,
						button = "use_card",
						func = "can_select_from_booster",
					},
					nodes = {
						{
							n = G.UIT.T,
							config = {
								text = localize("b_select"),
								colour = G.C.UI.TEXT_LIGHT,
								scale = 0.35,
								shadow = true,
							},
						},
					},
				},
			},
		}
	end
	return abc
end

SMODS.Atlas({
    key = "yea_art_key_atlas",
    path = "5_Yeah!MostlyArtists/key_consumables.png",
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = "yma_art_combo_atlas",
    path = "5_Yeah!MostlyArtists/combo_atlas.png",
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = "yma_key_packs_atlas",
    path = "5_Yeah!MostlyArtists/keys_packs.png",
    px = 71,
    py = 95,
})

SMODS.Atlas {
    key = "yma_hell_sign",
    path = "5_Yeah!MostlyArtists/hell_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Atlas {
    key = "yma_forgery_sign",
    path = "5_Yeah!MostlyArtists/forgery_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Atlas {
    key = "yma_dreamland_sign",
    path = "5_Yeah!MostlyArtists/dreamland_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas {
    key = "yma_graveyard_sign",
    path = "5_Yeah!MostlyArtists/graveyard_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas {
    key = "yma_locked_sign",
    path = "5_Yeah!MostlyArtists/locked_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas {
    key = "yma_chest_sign",
    path = "5_Yeah!MostlyArtists/chest_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas {
    key = "yma_casino_sign",
    path = "5_Yeah!MostlyArtists/casino_sign.png",
    px = 113, py = 57,
    frames = 4, atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Atlas({
    key = "yma_casino_slots",
    path = "5_Yeah!MostlyArtists/slots_symbols.png",
    px = 34,
    py = 34,
})
SMODS.Atlas({
    key = "yma_casino_slot_machine",
    path = "5_Yeah!MostlyArtists/casino_slot_machine.png",
    px = 202,
    py = 160,
})


SMODS.ConsumableType {
    key = "yma_keys",
    collection_rows = { 6, 5, 6 },
    primary_colour = HEX("9e8662"),
    secondary_colour = HEX("9e8662"),
    default = 'c_aij_algol',
    no_buy_and_use = true,
    shop_rate = 0
}

SMODS.UndiscoveredSprite({
    key = 'yma_keys',
    atlas = "yea_art_key_atlas",
    pos = { x = 2, y = 4 },
    no_overlay = true
})
