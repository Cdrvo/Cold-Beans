YMA = YMA or {

}

function YMA_reroll_card(card, key, set, append, temp_key, ability, context)
    context = context or 'end_of_round'
    append = append or 'yma_reroll_card'
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

    
    local replacement_key = key or pseudorandom_element(replacement_pool, pseudoseed(append..'_replacement'))

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
            SMODS.calculate_context({yma = {after_reroll = true, card = victim_joker, old_card = temp_card}})
            return true 
        end 
    }))
    delay(0.5)
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
    local chip_mod -- iterate over ~120 ticks
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

SMODS.Atlas({
    key = "yea_art_key_atlas",
    path = "5_Yeah!MostlyArtists/key_consumables.png",
    px = 71,
    py = 95,
})

SMODS.ConsumableType {
    key = "yma_keys",
    collection_rows = { 5, 6 },
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
