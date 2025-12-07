YMA = YMA or {

}

function YMA_reroll_card(card, key, set, append, temp_key, ability)
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

local is_eternal_ref = SMODS.is_eternal
function SMODS.is_eternal(card, trigger)
    if (card.ability and card.ability.yma_ghost_temporary) or (G.STATE == G.STATES.SELECTING_HAND and card.config.center.key == 'c_cbean_yma_hercules') then
        return true
    end
    return is_eternal_ref(card, trigger)
end

local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and self.ability.set == 'Joker' then
    local yma_can_add = true
    for k, v in pairs(G.GAME.cbean.destroyed_jokers) do
        if v == self.config.center.key then 
            yma_can_add = false
        end
    end
    if yma_can_add then
        G.GAME.cbean.destroyed_jokers[#G.GAME.cbean.destroyed_jokers+1] = self.config.center.key
    end
    local has_timeshift_key = #SMODS.find_card("c_cbean_yma_timeshift")
    if has_timeshift_key >= 1 and self.ability.yma_sold_self == nil and (#G.jokers.cards <= G.jokers.config.card_limit or (self.edition ~= nil and self.edition.negative)) then
        SMODS.calculate_context({yma = {timeshift_trigged = true, decrease = true}})
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
            local card = copy_card(self, nil, nil, nil, false)
            card:start_materialize()
            card:add_to_deck()
            G.jokers:emplace(card)
            return true end }))
    end
  end
  return ref
end

-- Remove use Buttons from key cards
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local sell = G_UIDEF_use_and_sell_buttons_ref(card)
    if card.ability and card.ability.consumeable and card.ability.set == "yma_keys" then
        sell = {n=G.UIT.C, config={align = "cr"}, nodes={
          {n=G.UIT.C, config={ref_table = card, align = "cr",padding = 0.1, r=0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card'}, nodes={
            {n=G.UIT.B, config = {w=0.1,h=0.6}},
            {n=G.UIT.C, config={align = "tm"}, nodes={
              {n=G.UIT.R, config={align = "cm", maxw = 1.25}, nodes={
                {n=G.UIT.T, config={text = localize('b_sell'),colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true}}
              }},
              {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.T, config={text = localize('$'),colour = G.C.WHITE, scale = 0.4, shadow = true}},
                {n=G.UIT.T, config={ref_table = card, ref_value = 'sell_cost_label',colour = G.C.WHITE, scale = 0.55, shadow = true}}
              }}
            }}
          }},
        }}
    end
    return sell
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
