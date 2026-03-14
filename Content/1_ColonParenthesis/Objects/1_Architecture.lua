function Colonparen.Architecture(config)
    config = config or {}
    config.set = config.set or "colon_Architecture"
    if not config.config then
        config.config = {}
    end
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
        if (card.ability.colonparen_state == 2) and (not card:in_collection()) then
            G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {}
            local name = localize{type = 'name_text', key = self.key, set = self.set}
            local greekname = localize{type = 'name_text', key = greek.lowercase.key, set = 'Blind', vars = {}}
            if G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] == card.ability.colonparen_archid then
                ret = {
                    key = "c_cbean_architecture_complete",
                    vars = {
                        name,
                        greekname
                    }
                }
            else
                local any_done = false;
                for i, ID in ipairs(G.GAME.cbean_colonparen_queue) do
                    if ID == card.ability.colonparen_archid then
                        local amount_away = #G.GAME.cbean_colonparen_queue - i + 1;
                        ret = {
                            key = "c_cbean_architecture_queued",
                            vars = {
                                name,
                                greekname,
                                number_format(amount_away)
                            }
                        }
                        any_done = true
                        break
                    end
                end
                if not any_done then
                    ret = {
                        key = "c_cbean_architecture_complete",
                        vars = {
                            name,
                            greekname
                        }
                    }
                end
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
    if not config.spawn then
        config.spawn = function (self, card)
            Colonparen.spawnGreekBlind(card.config.center.greek_blind)
        end
    end
    local old_set_ability = config.set_ability or function () end
    config.set_ability = function(self, card, initial, delay_sprites)
        if self.config.colon_Architecture then
            local eval = self:evaluate_completion(card) or {}
            if type(eval) ~= 'table' then
                return old_set_ability(self, card, initial, delay_sprites)
            end
            if eval.colonparen_complete then
                card.ability.colonparen_state = 2;
            elseif eval.colonparen_in_progress then
                card.ability.colonparen_state = 1;
            elseif eval.colonparen_base then
                card.ability.colonparen_state = 0;
            end
            card:set_sprites()
        end
        old_set_ability(self, card, initial, delay_sprites)
    end
    SMODS.Consumable(config)
end

local old_set_sprites = Card.set_sprites;
Card.set_sprites = function (self, ...)
    local done = old_set_sprites(self, ...)
    if self.ability and self.ability.colonparen_state and self.config.center.discovered then
        local state = self.ability.colonparen_state;
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
    if context.playing_card_added or context.remove_playing_cards then
        SMODS.calculate_context{
            cbean_colonparen_modify_deck = true
        }
    elseif context.ante_change and context.ante_end then
        G.GAME.cbean_jbill_arch_nope = false;
        G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {}
        if #G.GAME.cbean_colonparen_queue > 0 then
            local ID = G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue];
            G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] = nil
            
            for i, card in ipairs(G.cbean_colon_arch.cards) do
                if card.ability.colonparen_archid == ID then
                    card.config.center:spawn(card);
                    G.cbean_colon_arch:remove_card(card)
                    card:remove();
                    break;
                end
            end
        end
    end
end)

function Card:start_arch()
    G.GAME.cbean_colon_started_arch = G.GAME.cbean_colon_started_arch or {}
    if self.ability.colon_Architecture then
        local center = self.config.center;

        stop_use()
        if not self.config.center.discovered then
            discover_card(self.config.center)
        end
        G.STATE = G.STATES.SMODS_REDEEM_VOUCHER

        self.states.hover.can = false
        G.GAME.cbean_colon_started_arch[self.config.center_key] = true
        G.GAME.cbean_colon_banned_arch = G.GAME.cbean_colon_banned_arch or {}
        G.GAME.cbean_colon_banned_arch[#G.GAME.cbean_colon_banned_arch+1] = true
        while (#G.GAME.cbean_colon_banned_arch > 15) do
            table.remove(G.GAME.cbean_colon_banned_arch, 0)
        end
        local top_dynatext = nil
        local bot_dynatext = nil

        local eval = center:evaluate_completion(self) or {}
        if eval.colonparen_complete then
            self.ability.colonparen_state = 2;
        elseif eval.colonparen_in_progress then
            self.ability.colonparen_state = 1;
        elseif eval.colonparen_base then
            self.ability.colonparen_state = 0;
        end
        self:set_sprites(center)

        SMODS.trigger_effects({eval, post}, card_to_save)
        
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                local redeem_text = localize('k_cbean_colon_started_ex');
                if self.ability.colonparen_state == 2 then
                    redeem_text = localize('k_cbean_colon_completed_ex')
                end
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
        if self.ability.colonparen_state == 2 then
            card_to_save.ability.colonparen_state = 2;
            G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {};
            local lastid = 0;
            if G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] then
                lastid = G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue]
            end
            G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue+1] = lastid + 1;
            card_to_save.ability.colonparen_archid = lastid + 1;
        end

        card_to_save.VT.x, card_to_save.VT.y = G.cbean_colon_arch.T.x, G.cbean_colon_arch.T.y
        G.cbean_colon_arch:emplace(card_to_save)

        SMODS.calculate_context{
            cbean_colonparen_gain_arch = true
        }

        local eval, post = eval_card(card_to_save, {buying_card = true, buying_self = true, card = card_to_save}) -- buying_card left for back compat, buying_self recommended to use
        SMODS.trigger_effects({eval, post}, card_to_save)


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

        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 3, func = function()
            self:remove()
            return true end }))
            
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
      {card_limit = 2, type = 'shop', highlight_limit = 0})
    for i = 1, #G.cbean_colon_arch.cards do
        local card = G.cbean_colon_arch.cards[i]
        local copy = copy_card(card)
        copy.T.x = card.T.x + card.T.w/2
        copy.T.y = card.T.y
        copy:set_sprites(copy.config.center)

        copy:hard_set_T()
        copy:start_materialize(nil, silent)
        silent = true
        --copy:add_to_deck()
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
    if G.blind_select and ((G.blind_select.VT.y >= 10) or G.CONTROLLER.lock_input or (not G.STATE_COMPLETE)) then
		G.E_MANAGER:add_event(Event({
			blocking = false,
			blockable = true,
			func = function()
				if G.blind_select and ((G.blind_select.VT.y >= 10) or G.CONTROLLER.lock_input or (not G.STATE_COMPLETE)) then return end
				G.E_MANAGER:add_event(Event({
					blocking = false,
					blockable = true,
					func = function()
						self:complete_arch()
						return true
				end}))
				return true
			end
		}))
		return
	end

        local card = copy_card(self)
        local prev_state = G.STATE
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

    if card.children.use_button then card.children.use_button:remove(); card.children.use_button = nil end
    if card.children.sell_button then card.children.sell_button:remove(); card.children.sell_button = nil end
    if card.children.price then card.children.price:remove(); card.children.price = nil end

    if not card.from_area then card.from_area = card.area end
        delay(0.1)
        draw_card(G.colonparen_arch_anim_from, G.colonparen_arch_anim, 1, 'up', true, card, nil, true) 
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
    if self.ability and (
        (self.ability.colonparen_state == 2)
    ) then
        return -- no more calculate for you...
    end
    return old_calc(self, ...)
end
SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'colonparen_complete'
SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'colonparen_in_progress'
SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'colonparen_base'
local calculate_individual_effect = SMODS.calculate_individual_effect;
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
    local old_scored = scored_card;
    if scored_card or effect.colonparen_card then
        scored_card = effect.colonparen_card or scored_card;
        local center = nil
        if scored_card.config then
            center = scored_card.config.center;
        end
        
        if (key == 'colonparen_complete') and (scored_card.ability and scored_card.ability.colon_Architecture) then
            if scored_card.area == G.cbean_colon_arch then
                scored_card.ability.colonparen_state = 2;
                G.E_MANAGER:add_event(Event({trigger = 'immediate', func = function()
                    for i = 1, #G.cbean_colon_arch.cards do 
                        if G.cbean_colon_arch.cards[i] == scored_card then
                            table.remove(G.cbean_colon_arch.cards, i)
                            G.cbean_colon_arch.cards[#G.cbean_colon_arch.cards+1] = scored_card
                            break
                        end
                    end
                    scored_card:set_sprites(center)
                    delay(0.1)
                    scored_card:complete_arch()
                    G.GAME.cbean_colonparen_queue = G.GAME.cbean_colonparen_queue or {}
                    local lastid = 0;
                    if G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] then
                        lastid = G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue]
                    end
                    G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue+1] = lastid + 1;
                    scored_card.ability.colonparen_archid = lastid + 1;
                    return true
                end}))
            else
                scored_card.ability.colonparen_state = 2;
                scored_card:set_sprites()
            end
        elseif key == 'colonparen_in_progress' then
            scored_card.ability.colonparen_state = 1;
            scored_card:set_sprites()
        elseif key == 'colonparen_base' then
            scored_card.ability.colonparen_state = 0;
            scored_card:set_sprites()
        end
    end

    return calculate_individual_effect(effect, old_scored, key, amount, from_edition)
end

local old_moveable_move = Moveable.move;
function Moveable:move(...)
    return old_moveable_move(self, ...)
end

local set_ability = Card.set_ability;
function Card:set_ability(...)
    set_ability(self, ...)
    if not G.CONTROLLER.locks.load then
        if self.playing_card then
            SMODS.calculate_context{
                cbean_colonparen_modify_deck = true
            }
        end
    end
end
