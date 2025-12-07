G.STATES.GRAVEYARD = 1366468461

G.FUNCS.show_yma_graveyard = function(e)
  stop_use()
  hide_shop()
  
  G.STATE = G.STATES.GRAVEYARD
  G.STATE_COMPLETE = false
  if G.graveyard and G.graveyard.alignment.offset.py then 
        G.graveyard.alignment.offset.y = G.graveyard.alignment.offset.py
        G.graveyard.alignment.offset.py = nil
  end

  local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  ease_background_colour_blind(G.STATE)
  sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_pboys_backalley_shop"]
  cached_hand_state = G.hand.states.visible
  G.hand.states.visible = false

end

G.FUNCS.hide_yma_graveyard = function(e)
	stop_use()
    if G.graveyard then 
      G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          G.graveyard.alignment.offset.y = G.ROOM.T.y + 29
          return true
        end
      })) 
      --G.E_MANAGER:add_event(Event({
      --  trigger = 'after',
      --  delay = 0.5,
      --  func = function()
      --    if G.graveyard then
      --      G.graveyard:remove()
      --      G.graveyard = nil
      --    end
      --    return true
      --  end
      --}))
    end
	G.hand.states.visible = cached_hand_state
	G.STATE = G.STATES.SHOP
	G.STATE_COMPLETE = false
    if G.graveyard and G.graveyard.alignment.offset.py then 
      G.graveyard.alignment.offset.py = G.graveyard.alignment.offset.y
      G.graveyard.alignment.offset.y = G.ROOM.T.y + 29
    end
	local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
	ease_background_colour_blind(G.STATES.SHOP)
	sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
	show_shop()
end

function update_graveyard()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.GRAVEYARD)
        local graveyard_exists = not not G.graveyard
        G.graveyard = G.graveyard or UIBox{
            definition = G.UIDEF.yma_graveyard(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }

        G.E_MANAGER:add_event(Event({
            func = function()
                G.graveyard.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.graveyard.T.y - G.graveyard.VT.y) < 3 then
                            local nosave_graveyard = nil 
                            -- Back to shop button
							play_sound('cbean_pboy_bavoice', G.SPEEDFACTOR*(math.random()*0.4+2), 2.5)
                            G.CONTROLLER:snap_to({node = G.graveyard:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_graveyard then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end

end

function G.UIDEF.yma_graveyard()
    G.graveyard_jokers = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(G.GAME.shop.joker_max*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = G.GAME.shop.joker_max, type = 'shop', highlight_limit = 1, negative_info = true})

    for i = 1, G.GAME.shop.joker_max - #G.graveyard_jokers.cards do
        local new_shop_card = create_card_for_graveyard_jokers(G.graveyard_jokers)
        G.graveyard_jokers:emplace(new_shop_card)
        new_shop_card:juice_up()
    end

    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.GREY, button = 'reroll_yma_graveyard', func = 'can_reroll_yma_graveyard', hover = true,shadow = true}, nodes = {
                          {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'x', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                              {n=G.UIT.T, config={text = localize('k_reroll'), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3, minw = 1}, nodes={
                              {n=G.UIT.T, config={text = localize('$'), scale = 0.7, colour = G.C.WHITE, shadow = true}},
                              {n=G.UIT.T, config={ref_table = G.GAME.current_round, ref_value = 'reroll_cost', scale = 0.75, colour = G.C.WHITE, shadow = true}},
                            }}
                          }}
                        }},
                      }},
                      {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 8.2}, nodes={
                          {n=G.UIT.O, config={object = G.graveyard_jokers}},
                      }},
                    }},
                }
              },
              
              }, false)
        }}
    return t
end

G.FUNCS.can_reroll_yma_graveyard = function(e)
    if ((G.GAME.dollars-G.GAME.bankrupt_at) - G.GAME.current_round.reroll_cost < 0) and G.GAME.current_round.reroll_cost ~= 0 then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.GREY
        e.config.button = 'reroll_yma_graveyard'
    end
end

G.FUNCS.reroll_yma_graveyard = function(e) 
    stop_use()
    G.CONTROLLER.locks.shop_reroll = true
    if G.CONTROLLER:save_cardarea_focus('graveyard_jokers') then G.CONTROLLER.interrupt.focus = true end
    local reroll_cost = G.GAME.current_round.reroll_cost
    if G.GAME.current_round.reroll_cost > 0 then 
      inc_career_stat('c_shop_dollars_spent', G.GAME.current_round.reroll_cost)
      inc_career_stat('c_shop_rerolls', 1)
      ease_dollars(-G.GAME.current_round.reroll_cost)
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          local final_free = G.GAME.current_round.free_rerolls > 0
          G.GAME.current_round.free_rerolls = math.max(G.GAME.current_round.free_rerolls - 1, 0)
          G.GAME.round_scores.times_rerolled.amt = G.GAME.round_scores.times_rerolled.amt + 1

          calculate_reroll_cost(final_free)
          for i = #G.graveyard_jokers.cards,1, -1 do
            local c = G.graveyard_jokers:remove_card(G.graveyard_jokers.cards[i])
            c:remove()
            c = nil
          end

          --save_run()

          play_sound('coin2')
          play_sound('other1')
          
          for i = 1, G.GAME.shop.joker_max - #G.graveyard_jokers.cards do
            local new_shop_card = create_card_for_graveyard_jokers(G.graveyard_jokers)
            G.graveyard_jokers:emplace(new_shop_card)
            new_shop_card:juice_up()
          end
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = function()
        G.E_MANAGER:add_event(Event({
          func = function()
            G.CONTROLLER.interrupt.focus = false
            G.CONTROLLER.locks.shop_reroll = false
            G.CONTROLLER:recall_cardarea_focus('graveyard_jokers')
            SMODS.calculate_context({reroll_shop = true, cost = reroll_cost})
            return true
          end
        }))
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
end

function create_card_for_graveyard_jokers(area)
    local total_rate = G.GAME.joker_rate + G.GAME.playing_card_rate
    local polled_rate = pseudorandom(pseudoseed('cdt'..G.GAME.round_resets.ante))*total_rate
    local check_rate = 0
    -- need to preserve order to leave RNG unchanged
    local rates = {
    {type = 'Joker', val = G.GAME.joker_rate},
    }
    for _, v in ipairs(rates) do
        if polled_rate > check_rate and polled_rate <= check_rate + v.val then
            local key = nil
            if G.GAME and G.GAME.cbean and #G.GAME.cbean.destroyed_jokers > 0 then
                key = pseudorandom_element(G.GAME.cbean.destroyed_jokers, pseudoseed('yma_moon'))
            end
            local card = create_card(v.type, area, nil, nil, nil, nil, key, 'gra')
            create_shop_card_ui(card, v.type, area)
            G.E_MANAGER:add_event(Event({
                func = (function()
                    for k, v in ipairs(G.GAME.tags) do
                        if v:apply_to_run({type = 'store_joker_modify', card = card}) then break end
                    end
                    return true
                end)
            }))
            return card
        end
        check_rate = check_rate + v.val
    end
  end