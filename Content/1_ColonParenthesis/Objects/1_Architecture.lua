function Colonparen.Architecture(config)
    config = config or {}
    config.set = config.set or "colon_Architecture"
    config.config = config.config or {}
    config.config.colon_Architecture = true
    config.config.colonparen_state = 0;
    if not config.atlas then
        config.prefix_config = config.prefix_config or {}
        if config.prefix_config.atlas == nil then
            config.prefix_config.atlas = false
        end
        config.atlas = "cbean_colon_Architecture"
    end
    config.pos = config.pos or config.base_pos or config.progress_pos or config.done_pos;
    local old_loc_vars = config.loc_vars or function ()end;
    function config.loc_vars(self, info_queue, card)
        local ret = old_loc_vars(self, info_queue, card) or {}
        local greek = Colonparen.GreekBlinds[self.greek_blind]
        if not greek then return ret end;
        if card.ability.colonparen_queued then
            G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {}
            local name = localize{type = 'name_text', key = self.key, set = self.set}
            local greekname = localiz{type = 'raw_descriptions', key = greek.lowercase.key, set = 'Blind', vars = {}}
            if G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] == card.ID then
                return {
                    key = "c_cbean_architecture_complete",
                    vars = {
                        name,
                        greekname
                    }
                }
            else
                for i, ID in ipairs(G.GAME.cbean_colonparen_queue) do
                    if ID == self.ID then
                        local amount_away = #G.GAME.cbean_colonparen_queue - i + 1;
                        return {
                            key = "c_cbean_architecture_queued",
                            vars = {
                                name,
                                greekname,
                                number_format(amount_away)
                            }
                        }
                    end
                end
                return {
                    key = "c_cbean_architecture_BUGBUG"
                }
            end
        end

        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        
        local blind_choiceA = greek.lowercase;
        local targetA = {type = 'raw_descriptions', key = blind_choiceA.key, set = 'Blind', vars = {}}
        if blind_choiceA.name == 'The Ox' then
            targetA.vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
        end
        if blind_choiceA.loc_vars and _G['type'](blind_choiceA.loc_vars) == 'function' then
            local res = blind_choiceA:loc_vars({
                colon_Architecture = true
            }) or {}
            targetA.vars = res.vars or targetA.vars
            targetA.key = res.key or targetA.key
        end
        local loc_targetA = localize(targetA)
        local text_tableA = loc_targetA
        local blind_desc_nodesA = {}
        for k, v in ipairs(text_tableA) do
            blind_desc_nodesA[#blind_desc_nodesA+1] = {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
                {n=G.UIT.T, config={text = v or '-', scale = 0.32, colour = G.C.WHITE, shadow = true}}
            }}
        end

        local blind_choiceB = greek.uppercase;
        local targetB = {type = 'raw_descriptions', key = blind_choiceB.key, set = 'Blind', vars = {}}
        if blind_choiceB.name == 'The Ox' then
            targetB.vars = {localize(G.GAME.current_round.most_played_poker_hand, 'poker_hands')}
        end
        if blind_choiceB.loc_vars and _G['type'](blind_choiceB.loc_vars) == 'function' then
            local res = blind_choiceB:loc_vars({
                colon_Architecture = true
            }) or {}
            targetB.vars = res.vars or targetB.vars
            targetB.key = res.key or targetB.key
        end
        local loc_targetB = localize(targetB)
        local text_tableB = loc_targetB
        local blind_desc_nodesB = {}
        for k, v in ipairs(text_tableB) do
            blind_desc_nodesB[#blind_desc_nodesB+1] = {n=G.UIT.R, config={align = "cm", maxw = 2.8}, nodes={
                {n=G.UIT.T, config={text = v or '-', scale = 0.32, colour = G.C.WHITE, shadow = true}}
            }}
        end

        local blind_col = blind_choiceA.boss_colour
        local loc_name = localize{type = 'name_text', key = blind_choiceA.key, set = 'Blind'}
        ret.main_end = ret.main_end or {}
        ret.main_end[#ret.main_end+1] = {n=G.UIT.R, config={align = "cm"}, nodes={  
            {n=G.UIT.R, config={align = "cm",minh = 0.1}, nodes={}},
            {n=G.UIT.R, config={align = "cm", colour = mix_colours(G.C.BLACK, G.C.L_BLACK, 0.5), r = 0.1, outline = 1, outline_colour = G.C.L_BLACK, padding = 0.05}, nodes={  
                {n=G.UIT.R, config={id = 'blind_name',align = "cm", padding = 0.07}, nodes={
                    {n=G.UIT.R, config={align = "cm", r = 0.1, outline = 1, outline_colour = blind_col, colour = darken(blind_col, 0.3), minw = 5.8, emboss = 0.1, padding = 0.07, line_emboss = 1}, nodes={
                        {n=G.UIT.O, config={object = DynaText({string = loc_name, colours = {disabled and G.C.UI.TEXT_INACTIVE or G.C.WHITE}, shadow = not disabled, float = not disabled, y_offset = -4, scale = 0.45, maxw =2.8})}},
                    }},
                }},
                {n=G.UIT.R, config={align = "cm", r = 0.1}, nodes={  
                    {n=G.UIT.C, config={align = "cm", padding = 0.05}, nodes={
                        {n=G.UIT.R, config={id = 'blind_desc', align = "cm", padding = 0.05}, nodes={
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                                {n=G.UIT.R, config={align = "cm", minh = 1.5}, nodes={
                                    {n=G.UIT.O, config={object = SMODS.create_sprite(0,0, 1.4, 1.4, SMODS.get_atlas(blind_choiceA.atlas) or  'blind_chips',   blind_choiceA.pos) }},
                                }},
                                text_tableA[1] and {n=G.UIT.R, config={align = "cm", minh = 0.7, padding = 0.05, minw = 2.9}, nodes = blind_desc_nodesA} or nil,
                            }},
                        }},
                    }}, 
                    {n=G.UIT.C, config={align = "cm", padding = 0.05}, nodes={
                        {n=G.UIT.R, config={id = 'blind_desc', align = "cm", padding = 0.05}, nodes={
                            {n=G.UIT.R, config={align = "cm"}, nodes={
                                {n=G.UIT.R, config={align = "cm", minh = 1.5}, nodes={
                                    {n=G.UIT.O, config={object = SMODS.create_sprite(0,0, 1.4, 1.4, SMODS.get_atlas(blind_choiceB.atlas) or  'blind_chips',   blind_choiceB.pos) }},
                                }},
                                text_tableB[1] and {n=G.UIT.R, config={align = "cm", minh = 0.7, padding = 0.05, minw = 2.9}, nodes = blind_desc_nodesB} or nil,
                            }},
                        }},
                    }},
                }}
            }}
        }}
        return ret
    end
    config.can_use = config.can_use or function (self, card, area, copier)
        return true
    end
    if not config.complete then
        config.complete = function (self)
            G.GAME.colonparen_next_architecture = self.greek_blind
        end
    end
    SMODS.Consumable(config)
end

local old_set_sprites = Card.set_sprites;
Card.set_sprites = function (self, ...)
    local done = old_set_sprites(self, ...)
    if self.ability and self.ability.colonparen_state then
        local state = self.ability.colonparen_state;
        print("DEEEEEEEEEBUG TOWN!!")
        if state == 2 then
            self.children.center:set_sprite_pos(self.config.center.done_pos or self.config.center.progress_pos or self.config.center.base_pos or self.config.center.pos)
        elseif state == 1 then
            self.children.center:set_sprite_pos(self.config.center.progress_pos or self.config.center.base_pos or self.config.center.pos)
        elseif state == 0 then
            self.children.center:set_sprite_pos(self.config.center.base_pos or self.config.center.pos)
        end
    end
    return done
end

ColdBeans.OnCalculate(function (mod, context)
    if context.ante_end then
        G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {}
        if #G.GAME.cbean_colonparen_queue > 0 then
            local ID = G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue];
            G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] = nil
            
            for i, card in ipairs(G.cbean_colon_arch.cards) do
                if card.ID == ID then
                    Colonparen.prescribe_blinds(card.config.center.greek_blind)
                    card:remove();
                end
            end
        end
    end
end)

function Card:start_arch()
    G.GAME.cbean_colon_started_arch = G.GAME.cbean_colon_started_arch or {}
    if self.ability.colon_Architecture then
        local center = self.config.center;
        if center.immediate_complete then
            self.ability.colonparen_state = 2;
            self.ability.colonparen_queued = true

            local card_to_save = copy_card(self)
            card_to_save.VT.x, card_to_save.VT.y = G.cbean_colon_arch.T.x, G.cbean_colon_arch.T.y
            G.cbean_colon_arch:emplace(card_to_save)
            G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {};
            G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue+1] = card_to_save.ID

            return self:complete_arch()
        end
        stop_use()
        if not self.config.center.discovered then
            discover_card(self.config.center)
        end
        G.STATE = G.STATES.SMODS_REDEEM_VOUCHER

        self.states.hover.can = false
        G.GAME.cbean_colon_started_arch[self.config.center_key] = true
        local top_dynatext = nil
        local bot_dynatext = nil
        
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                local redeem_text = localize('k_cbean_colon_started_ex');
                top_dynatext = DynaText({string = localize{type = 'name_text', set = self.config.center.set, key = self.config.center.key}, colours = {G.C.WHITE}, rotate = 1,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 0.6/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR})
                bot_dynatext = DynaText({string = redeem_text, colours = {G.C.WHITE}, rotate = 2,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 1.4/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR, pitch_shift = 0.25})
                self:juice_up(0.3, 0.5)
                play_sound('card1')
                play_sound('coin1')
                self.children.top_disp = UIBox{
                    definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                        {n=G.UIT.O, config={object = top_dynatext}}
                                    }},
                    config = {align="tm", offset = {x=0,y=0},parent = self}
                }
                self.children.bot_disp = UIBox{
                        definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                            {n=G.UIT.O, config={object = bot_dynatext}}
                                        }},
                        config = {align="bm", offset = {x=0,y=0},parent = self}
                    }
            return true end }))
        --G.GAME.current_round.voucher = nil
        if center.use then
            center:use(self, self.area)
        end

        local card_to_save = copy_card(self)
        card_to_save.VT.x, card_to_save.VT.y = G.cbean_colon_arch.T.x, G.cbean_colon_arch.T.y
        G.cbean_colon_arch:emplace(card_to_save)

        SMODS.calculate_context{
            cbean_colonparen_gain_arch = true
        }

        SMODS.enh_cache:clear()

        delay(0.6)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2.6, func = function()
            top_dynatext:pop_out(4)
            bot_dynatext:pop_out(4)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.5, func = function()
            self.children.top_disp:remove()
            self.children.top_disp = nil
            self.children.bot_disp:remove()
            self.children.bot_disp = nil
        return true end }))
    end
end

function Card:functional_complete_arch()
    G.GAME.cbean_colon_started_arch = G.GAME.cbean_colon_started_arch or {}
    if self.ability.colon_Architecture then
        stop_use()
        if not self.config.center.discovered then
            discover_card(self.config.center)
        end
        G.STATE = G.STATES.SMODS_REDEEM_VOUCHER

        self.states.hover.can = false
        G.GAME.cbean_colon_started_arch[self.config.center_key] = nil -- Nope!
        local top_dynatext = nil
        local bot_dynatext = nil
        local center = self.config.center;

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                local redeem_text = localize('k_cbean_colon_completed_ex');
                top_dynatext = DynaText({string = localize{type = 'name_text', set = self.config.center.set, key = self.config.center.key}, colours = {G.C.WHITE}, rotate = 1,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 0.6/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR})
                bot_dynatext = DynaText({string = redeem_text, colours = {G.C.WHITE}, rotate = 2,shadow = true, bump = true,float=true, scale = 0.9, pop_in = 1.4/G.SPEEDFACTOR, pop_in_rate = 1.5*G.SPEEDFACTOR, pitch_shift = 0.25})
                self:juice_up(0.3, 0.5)
                play_sound('card1')
                play_sound('coin1')
                self.children.top_disp = UIBox{
                    definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                        {n=G.UIT.O, config={object = top_dynatext}}
                                    }},
                    config = {align="tm", offset = {x=0,y=0},parent = self}
                }
                self.children.bot_disp = UIBox{
                        definition =    {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
                                            {n=G.UIT.O, config={object = bot_dynatext}}
                                        }},
                        config = {align="bm", offset = {x=0,y=0},parent = self}
                    }
            return true end }))
        --G.GAME.current_round.voucher = nil
        center:complete(self, self.area)
        delay(0.6)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2.6, func = function()
            top_dynatext:pop_out(4)
            bot_dynatext:pop_out(4)
            return true end }))
        
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.5, func = function()
            self.children.top_disp:remove()
            self.children.top_disp = nil
            self.children.bot_disp:remove()
            self.children.bot_disp = nil
        return true end }))

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 3, func = function()
            self:remove()
            return true end }))
        
    end
end

G.UIDEF.cbean_colon_started_arch = function ()  
    if #G.cbean_colon_arch.cards == 0 then
        return {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = DynaText({string = {localize('ph_no_colon_architecture')}, colours = {G.C.UI.TEXT_LIGHT}, bump = true, scale = 0.6})}}
        }}
    end
    local silent = false;
    local cardarea = CardArea(
      G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      (3)*G.CARD_W,
      (1.07)*G.CARD_H, 
      {card_limit = 2, type = 'joker', highlight_limit = 0})
    for i = 1, #G.cbean_colon_arch.cards do
        local card = G.cbean_colon_arch.cards[i]
        local copy = copy_card(card)
        copy.T.x = card.T.x + card.T.w/2
        copy.T.y = card.T.y
        copy:set_sprites(copy.config.center)

        copy:hard_set_T()
        copy:start_materialize(nil, silent)
        silent = true
        copy:add_to_deck()
        cardarea:emplace(copy)
    end

  local t = {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
    {n=G.UIT.R, config={align = "cm"}, nodes={
      {n=G.UIT.O, config={object = DynaText({string = {localize('ph_colon_architecture_started')}, colours = {G.C.UI.TEXT_LIGHT}, bump = true, scale = 0.6})}}
    }},
    {n=G.UIT.R, config={align = "cm", minh = 0.5}, nodes={
    }},
    {n=G.UIT.R, config={align = "cm", colour = G.C.BLACK, r = 1, padding = 0.15, emboss = 0.05}, nodes={
      {n=G.UIT.R, config={align = "cm"}, nodes={
        {n=G.UIT.O, config={object = cardarea}}
      }},
    }}
  }} 
  
  return t
end

function Card:complete_arch()
    if not (self.ability and self.ability.colon_Architecture) then
        return false
    end
        local card = copy_card(self)
        G.TAROT_INTERRUPT = G.STATE
    if card.ability.set == 'Booster' then G.GAME.PACK_INTERRUPT = G.STATE end 
    G.STATE = (G.STATE == G.STATES.TAROT_PACK and G.STATES.TAROT_PACK) or
      (G.STATE == G.STATES.PLANET_PACK and G.STATES.PLANET_PACK) or
      (G.STATE == G.STATES.SPECTRAL_PACK and G.STATES.SPECTRAL_PACK) or
      (G.STATE == G.STATES.STANDARD_PACK and G.STATES.STANDARD_PACK) or
      (G.STATE == G.STATES.SMODS_BOOSTER_OPENED and G.STATES.SMODS_BOOSTER_OPENED) or
      (G.STATE == G.STATES.BUFFOON_PACK and G.STATES.BUFFOON_PACK) or
      G.STATES.PLAY_TAROT
      
    G.CONTROLLER.locks.use = true
    local nc
    if G.booster_pack and not G.booster_pack.alignment.offset.py and ((not select_to and card.ability.consumeable) or not (G.GAME.pack_choices and G.GAME.pack_choices > 1)) then
    
      G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
      G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.shop and not G.shop.alignment.offset.py then
      G.shop.alignment.offset.py = G.shop.alignment.offset.y
      G.shop.alignment.offset.y = G.ROOM.T.y + 29
    end
    if G.blind_select and not G.blind_select.alignment.offset.py then
      G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
      G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
    end
    if G.round_eval and not G.round_eval.alignment.offset.py then
      G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
      G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
    end

    if card.children.use_button then card.children.use_button:remove(); card.children.use_button = nil end
    if card.children.sell_button then card.children.sell_button:remove(); card.children.sell_button = nil end
    if card.children.price then card.children.price:remove(); card.children.price = nil end

    if not card.from_area then card.from_area = card.area end
    if card.area and (not nc or card.area == G.pack_cards) then card.area:remove_card(card) end
    
        delay(0.1)
        draw_card(G.hand, G.play, 1, 'up', true, card, nil, true) 
        G.GAME.round_scores.cards_purchased.amt = G.GAME.round_scores.cards_purchased.amt + 1
        card:functional_complete_arch()
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.2,
        func = function()
            if not dont_dissolve then card:start_dissolve() end
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,
            func = function()
                G.STATE = prev_state
                G.TAROT_INTERRUPT=nil
                G.CONTROLLER.locks.use = false

                if (prev_state == G.STATES.TAROT_PACK or prev_state == G.STATES.PLANET_PACK or
                  prev_state == G.STATES.SPECTRAL_PACK or prev_state == G.STATES.STANDARD_PACK or
                  prev_state == G.STATES.SMODS_BOOSTER_OPENED or
                  prev_state == G.STATES.BUFFOON_PACK) and G.booster_pack then
                  if nc and area == G.pack_cards and not select_to then G.pack_cards:remove_card(card); G.consumeables:emplace(card) end
                  if area ~= G.pack_cards then
                    G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                    G.booster_pack.alignment.offset.py = nil
                  elseif G.GAME.pack_choices and G.GAME.pack_choices > 1 then
                    if G.booster_pack.alignment.offset.py then 
                      G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                      G.booster_pack.alignment.offset.py = nil
                    end
                    G.GAME.pack_choices = G.GAME.pack_choices - 1
                  else
                      G.CONTROLLER.interrupt.focus = true
                      if prev_state == G.STATES.SMODS_BOOSTER_OPENED and booster_obj.name:find('Arcana') then inc_career_stat('c_tarot_reading_used', 1) end
                      if prev_state == G.STATES.SMODS_BOOSTER_OPENED and booster_obj.name:find('Celestial') then inc_career_stat('c_planetarium_used', 1) end
                      G.FUNCS.end_consumeable(nil, delay_fac)
                  end
                else
                  if G.shop then 
                    G.shop.alignment.offset.y = G.shop.alignment.offset.py
                    G.shop.alignment.offset.py = nil
                  end
                  if G.blind_select then
                    G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
                    G.blind_select.alignment.offset.py = nil
                  end
                  if G.round_eval then
                    G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
                    G.round_eval.alignment.offset.py = nil
                  end
                  if nc and not area then G.consumeables:emplace(card) end
                  if area and area.cards[1] then 
                    G.E_MANAGER:add_event(Event({func = function()
                      G.E_MANAGER:add_event(Event({func = function()
                        G.CONTROLLER.interrupt.focus = nil
                        if card.ability.set == 'Voucher' then 
                          if G.shop then
                          G.CONTROLLER:snap_to({node = G.shop:get_UIE_by_ID('next_round_button')})
                          end
                        elseif area then
                          G.CONTROLLER:recall_cardarea_focus(area)
                        end
                      return true end }))
                    return true end }))
                  end
                end
            return true
          end}))
        return true
      end}))
end

local old_get_card_areas = SMODS.get_card_areas;
function SMODS.get_card_areas(_type, _context)
    local list = old_get_card_areas(_type, _context)
    if _type == 'jokers' then
        list[#list+1] = G.cbean_colon_arch
    end
    return list
end

local old_calc = Card.calculate_joker
function Card:calculate_joker(...)
    if self.ability and self.ability.colonparen_queued then
        return
    end
    return old_calc(self, ...)
end
SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'colonparen_complete'
SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'colonparen_in_progress'
SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'colonparen_base'
local calculate_individual_effect = SMODS.calculate_individual_effect;
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    if scored_card.area == G.cbean_colon_arch then
        if (key == 'colonparen_complete') and (scored_card.ability and scored_card.ability.colon_Architecture) then
            G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
                local center = scored_card.config.center;
                scored_card.ability.colonparen_state = 2;
                scored_card:set_sprites(center)
                delay(0.1)
                draw_card(G.hand, G.play, 1, 'up', true, card, nil, true) 
                G.GAME.round_scores.cards_purchased.amt = G.GAME.round_scores.cards_purchased.amt + 1
                scored_card:complete_arch()
                G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {}
                G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue+1] = scored_card.ID
                return true
            end}))
        elseif key == 'colonparen_in_progress' then
            scored_card.ability.colonparen_state = 1;
            scored_card:set_sprites(center)
        elseif key == 'colonparen_base' then
            scored_card.ability.colonparen_state = 0;
            scored_card:set_sprites(center)
        end
    end
	return calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end