YMA = YMA or {

}

function YMA_reroll_card(card, key, set, append, temp_key, _card)
    local victim_joker = card
      
    local victim_rarity = victim_joker.config.center.rarity or 1
    local is_legendary = victim_rarity == 4
    local victim_key = victim_joker.config.center.key

    
    local replacement_pool = {}
    for _, center_data in ipairs(G.P_CENTER_POOLS[set or card.config.center.set]) do
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
            return true 
        end 
    }))
    delay(0.5)
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
