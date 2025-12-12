local buyspace = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.ability.consumeable and SMODS.find_card("c_cbean_sdown_nyx") then return true end
    return buyspace(card)
end

--0 Drivers of the Chill Vacation
--Hides and reveals House Rules hands when House Rules is picked up or sold

--Makes the HR hand enabled without being played. Used to make planet show up
local show_default_house_hands = SMODS.is_poker_hand_visible
function SMODS.is_poker_hand_visible(handname)
    if     
        ((
            handname == 'cbean_0chill_house_rules'
        ) 
        and (#SMODS.find_card('j_cbean_0chill_house_rules') > 0))
    then 
        return true 
    end
    return show_default_house_hands(handname)
end


--Reveals all HR hands when seleceted
local show_house_hands = SMODS.is_poker_hand_visible
function SMODS.is_poker_hand_visible(handname)
    if G.jokers then
        if G.jokers.highlighted[1] then
            if  
                ((#SMODS.find_card('j_cbean_0chill_house_rules') > 0)
                and (G.jokers.highlighted[1].config.center.key == 'j_cbean_0chill_house_rules')
                and
                (
                    handname == 'cbean_0chill_fibonacci' or 
                    handname == 'cbean_0chill_fibonacci_flush' or
                    handname == 'cbean_0chill_deer_in_headlights' or
                    handname == 'cbean_0chill_proceed'
                ))
                
            then 
                return true 
            end
        end
    end
    return show_house_hands(handname)
end

--Hides every HR hand when not in inventory
local show_house_hands = SMODS.is_poker_hand_visible
function SMODS.is_poker_hand_visible(handname)
    if  
        ((#SMODS.find_card('j_cbean_0chill_house_rules') < 1) and
        (
            handname == 'cbean_0chill_fibonacci' or 
            handname == 'cbean_0chill_fibonacci_flush' or
            handname == 'cbean_0chill_proceed' or
            handname == 'cbean_0chill_deer_in_headlights' or
            handname == 'cbean_0chill_house_rules'
        )) 
    then 
        return false
    end
    return show_house_hands(handname)
end


--Keeps combo cards from being sold when one is activated to prevent order mix up
local cant_sell_combo = Card.can_sell_card
function Card:can_sell_card(context)
    if G.GAME.cbean_combo_index then
        if self.ability.immutable then
            if (self.ability.immutable.sequence ~= 0) or (self.ability.immutable.sequence ~= #G.GAME.cbean_combo_index) then 
                return false 
            end
        end
    end
    return cant_sell_combo(self, context)
end

--Pissboys
--[Placeholder] allows over-discard on non-final hands
local over_discard = G.FUNCS.can_discard
G.FUNCS.can_discard = function(e)
    over_discard(e)
    if next(SMODS.find_card("j_cbean_pboys_placeholder")) and G.GAME.current_round.discards_left <= 0 and G.GAME.current_round.hands_left > 1
    and #G.hand.highlighted > 0 and #G.hand.highlighted <= math.max(G.GAME.starting_params.discard_limit, 0) then
        e.config.colour = G.C.RED
        e.config.button = 'discard_cards_from_highlighted'
    end
end

--Yeah! Mostly artists
--Disallows cheatery with certern Keys
local is_eternal_ref = SMODS.is_eternal
function SMODS.is_eternal(card, trigger)
    if (card.ability and card.ability.yma_ghost_temporary) or (G.STATE == G.STATES.SELECTING_HAND and card.config.center.key == 'c_cbean_yma_hercules') then
        return true
    end
    return is_eternal_ref(card, trigger)
end

--No using consumeables in Dreamland
local yma_can_use_consumeable_ref = Card.can_use_consumeable
function Card:can_use_consumeable(any_state, skip_check)
    if G.STATE == G.STATES.DREAMLAND then
        return false
    end
    return yma_can_use_consumeable_ref(self, any_state, skip_check)
end

--Automatically saves G.GAME.blind.original_chips when blind is loaded
local yma_blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    local ret = yma_blind_set_blind_ref(self, blind, reset, silent)
    if not reset then
        self.original_chips = self.chips
    end
    return ret
end

--Handle original chips when game is saved and reloaded
local yma_blind_save_ref = Blind.save
function Blind:save()
    local blindTable = yma_blind_save_ref(self)
    blindTable.original_chips = self.original_chips
    return blindTable
end
local yma_blind_load_ref = Blind.load
function Blind:load(blindTable)
    local ret = yma_blind_load_ref(self, blindTable)
    self.original_chips = blindTable.original_chips
    return blindTable
end

--All cards selectable with Engima Key
local yma_card_select_area_ref = SMODS.card_select_area
function SMODS.card_select_area(card, pack)
    if card.ability and card.ability.consumeable and #SMODS.find_card("c_cbean_yma_enigma") >= 1 then 
        return "consumeables" 
    end
    return yma_card_select_area_ref(card, pack)
end

local yma_selectable_from_pack_ref = Card.selectable_from_pack
function Card.selectable_from_pack(card, pack)
    if card.ability and card.ability.consumeable and #SMODS.find_card("c_cbean_yma_enigma") >= 1 then 
        return "consumeables" 
    end
    return yma_selectable_from_pack_ref(card, pack)
end

--If card was sold
local sell_card_ref = Card.sell_card
function Card:sell_card()
  local ref = sell_card_ref(self)
  if self.ability then
    self.ability.yma_sold_self = true
  end
  return ref
end

--Giant, Timeshift and Shadow Key code
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if self.ability and self.ability.yma_temp_key then
    local key = self.ability.yma_temp_key
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.0,
        func = (function()
            local card = create_card(self.ability.yma_temp_set,self.area, nil, nil, nil, nil, key, 'yma_giant')
            card_eval_status_text(card, "extra", nil, nil, nil, {message = localize("k_reset"), colour = G.C.FILTER})
            for k, v in pairs(self.ability.yma_temp_ability_table) do
                card.ability[k] = v
            end
            card:add_to_deck()
            self.area:emplace(card)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function() 
                    play_sound('tarot2', 1, 0.6)
                    card:juice_up(0.3, 0.3)
                    SMODS.calculate_context({yma = {after_reroll = true, card = card, old_card = self}})
                    return true 
                end 
            }))
            return true
        end)
    }))
    return
  end
  if G.consumeables and self.ability.set == 'Combo' then
    local has_shadow_key = #SMODS.find_card("c_cbean_yma_shadow")
    if has_shadow_key >= 1 and self.ability.yma_cant_be_copied == nil and self.ability.yma_sold_self == nil then
        SMODS.calculate_context({yma = {shadow_trigged = true, decrease = true}})
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
            local card = copy_card(self, nil, nil, nil, false)
            card.ability.yma_cant_be_copied = true
            UnselectCombo(card)
            card:start_materialize()
            card:add_to_deck()
            G.consumeables:emplace(card)
            return true end }))
    end
  end
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