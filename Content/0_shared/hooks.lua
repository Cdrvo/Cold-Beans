local buyspace = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.ability.consumeable and next(SMODS.find_card("c_cbean_sdown_nyx")) then return true end
    return buyspace(card)
end

--0 Drivers of the Chill Vacation
-- Hi yes HR hands now handle their own visibility; see their SMODS.PokerHand entries

--Keeps combo cards from being sold when one is activated to prevent order mix up
local cant_sell_combo = Card.can_sell_card
function Card:can_sell_card(context)
    if G.GAME.cbean_combo_index then
        if self.ability.immutable and self.ability.immutable.combo_type then
            if (self.ability.immutable.sequence ~= 0) or (self.ability.immutable.sequence ~= #G.GAME.cbean_combo_index) then 
                return false 
            end
        end
    end
    return cant_sell_combo(self, context)
end

--Prevents using combos outside of a blind since they wouldn't do anything anyways
local cant_use_combo = Card.can_use_consumeable
function Card:can_use_consumeable(context)
    if self.ability then
        if self.ability.set == 'Combo' or self.config.center.key == "c_cbean_0chill_nope_from_above" then
            if not G.GAME.blind.in_blind then
                return false
            end
        end
    end
    return cant_use_combo(self, context)
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

--One of Daily deck's effect: only allows modded jokers to appear
--(ignoring take_ownership on vanilla jokers, at least I think so)
--Also handle birthright effect for it, which disables vanilla consumables.
local add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
    local add, options = add_to_pool_ref(prototype_obj, args)
    if G.GAME.selected_back and G.GAME.selected_back.effect.center.key == "b_cbean_pboys_daily"
    and CBEAN_DATE_TABLE.wday == 5 then
        if prototype_obj.set == "Joker" or (#SMODS.find_card('ti_cbean_yma_tboi_birthright') > 0
        and (prototype_obj.set == "Tarot" or prototype_obj.set == "Planet" or prototype_obj.set == "Spectral")) then
            return prototype_obj.original_mod and add or false, options
        end
    end
    return add, options
end

--Hook to make sure daily deck in run setup overlay snaps to today's effect
local run_setup = G.UIDEF.run_setup
function G.UIDEF.run_setup(from_game_over)
    local ret = run_setup(from_game_over)
    G.run_setup_overlay = true
    return ret
end

-- Saved daily deck runs on previous days properly use their own back pos
local back_init = Back.init
function Back:init(selected_back)
    back_init(self, selected_back)
    if self == G.GAME.selected_back or (self == G.GAME.viewed_back and G.STATE == G.STATES.MENU) then
        if self.name == "b_cbean_pboys_daily" then
            local pos = (self.effect.center.unlocked and self.effect.center.pos) or {x = 4, y = 0}
            self.pos.x = (G.GAME.run_back_pos or {}).x or (G.SAVED_GAME or {BACK = {pos = {}}}).BACK.pos.x or pos.x
            self.pos.y = (G.GAME.run_back_pos or {}).y or (G.SAVED_GAME or {BACK = {pos = {}}}).BACK.pos.y or pos.y
        end
    end
end

local back_change_to = Back.change_to
function Back:change_to(new_back)
    back_change_to(self, new_back)
    if self == G.GAME.selected_back or (self == G.GAME.viewed_back and G.STATE == G.STATES.MENU) then
        if self.name == "b_cbean_pboys_daily" then
            local pos = (self.effect.center.unlocked and self.effect.center.pos) or {x = 4, y = 0}
            self.pos.x = (G.GAME.run_back_pos or {}).x or (G.SAVED_GAME or {BACK = {pos = {}}}).BACK.pos.x or pos.x
            self.pos.y = (G.GAME.run_back_pos or {}).y or (G.SAVED_GAME or {BACK = {pos = {}}}).BACK.pos.y or pos.y
        end
    end
end

--Steamer's effect: if Aura is duplicated, send custom context (Aura farming go brrrrrr)
local copy_card_ref = copy_card
function copy_card(other, new_card, card_scale, playing_card, strip_edition)
    local card = copy_card_ref(other, new_card, card_scale, playing_card, strip_edition)
    if card.config.center_key == "c_aura" then
        SMODS.calculate_context{cbean_streamer_hype = true}
    end
    return card
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
    yma_blind_load_ref(self, blindTable)
    self.original_chips = blindTable.original_chips
end

--All cards selectable with Engima Key
local yma_card_select_area_ref = SMODS.card_select_area
function SMODS.card_select_area(card, pack)
    if card.ability and card.ability.consumeable and #SMODS.find_card("c_cbean_yma_enigma") >= 1 then 
        return "consumeables" 
    end
    if G.GAME and G.GAME.used_vouchers['v_cbean_yma_grand_theft'] and card.ability.consumeable and card.area == G.pack_cards and G.pack_cards then
        return "consumeables" 
    end
    return yma_card_select_area_ref(card, pack)
end

local yma_selectable_from_pack_ref = Card.selectable_from_pack
function Card.selectable_from_pack(card, pack)
    if card.ability and card.ability.consumeable and #SMODS.find_card("c_cbean_yma_enigma") >= 1 then 
        return "consumeables" 
    end
    if G.GAME and G.GAME.used_vouchers['v_cbean_yma_grand_theft'] and card.ability.consumeable and card.area == G.pack_cards and G.pack_cards then
        local edition_card_limit = card.ability.card_limit
        local area = 'consumeables'
        if area and #G[area].cards < G[area].config.card_limit + edition_card_limit then
            return "consumeables" 
        end
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
    if self.ability.cbean_shield then
        self:remove_sticker("cbean_shield")
        play_sound("cbean_shielddefend", 1, 0.5)
        SMODS.calculate_effect({ message = "Shielded!"}, self)
        if self.config.center.consumeable and self.area == G.play then
            draw_card(G.play,G.consumeables, 1,'down', false, self)
        end
        return nil
    end
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

--Hook to prevent crash with loading The Sheet
local hud_blind = create_UIBox_HUD_blind
function create_UIBox_HUD_blind()
    Colonparen.blind_variables = (G.GAME.colon_blind_variables or {})[G.GAME.blind_on_deck or "Teeny"] or {}
    return hud_blind()
end

local igo = Game.init_game_object
function Game:init_game_object()
    local ret = igo(self)
    ret.current_round.gfs_card = {rank = "Ace"}
    return ret
end
