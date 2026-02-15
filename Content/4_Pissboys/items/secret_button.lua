-- reset_game_globals merged with the existing one in main.lua

G.FUNCS.can_switch = function(e)
  G.SECRET_BUTTON = localize('k_cbean_unique_ex')
  
  if G.STATE == G.STATES.MAIN_STREET then
	  G.SECRET_BUTTON=localize('k_cbean_aexit_ex')
	  e.config.colour = G.C.RED
	  e.config.button = 'hide_yma_main_street'
  elseif G.STATE == G.STATES.SHOP then
	  G.SECRET_BUTTON=localize('k_cbean_yma_street')
	  e.config.colour = G.C.GREEN
	  e.config.button = 'show_yma_main_street'
  elseif G.STATE == G.STATES.BALLEY then
	  G.SECRET_BUTTON=localize('k_cbean_aexit_ex')
	  e.config.colour = G.C.RED
	  e.config.button = 'hide_balley'
  elseif yma_state_function_events(e) then
      G.SECRET_BUTTON = localize('k_cbean_aexit_ex')
      yma_state_function_events(e) 
  elseif G.STATE == G.STATES.STATIONERY then
      G.SECRET_BUTTON=localize('k_cbean_aexit_ex')
	  e.config.colour = G.C.RED
	  e.config.button = 'hide_stationery'
  elseif G.STATE == G.STATES.EMPLOY then
      G.SECRET_BUTTON=localize('k_cbean_aexit_ex')
	  e.config.colour = G.C.RED
	  e.config.button = 'hide_employ'
  elseif G.STATE == G.STATES.SELECTING_HAND and G.PISSMAX and G.PISSMAX > 0 and G.hand.highlighted and #G.hand.highlighted > 0 then
			G.SECRET_BUTTON=localize('k_cbean_piss_ex')
			e.config.button = 'piss_in_hand'
			e.config.colour = G.C.YELLOW
  elseif not G.GAME.booster_leaked and SMODS.OPENED_BOOSTER and next(SMODS.find_card("j_cbean_jbill_leak")) then
			G.SECRET_BUTTON=localize('k_jbill_leak')
			e.config.button = 'leak_booster'
			e.config.colour = G.C.YELLOW
  else 
		e.config.colour = G.C.L_BLACK
		e.config.button = nil
  end
end

G.FUNCS.piss_in_hand = function(e)
  G.PISSMAX = G.PISSMAX - 1
  for k, val in ipairs(G.hand.highlighted) do
        val:set_ability("m_cbean_pboys_piss", nil, true)
  end
  local nosave_balley = nil 
  if not nosave_balley then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
end


--from Uniks mod very cool (bean)
local uibox_ref = create_UIBox_HUD
function create_UIBox_HUD()
    local orig = uibox_ref()
    local scale = 0.4
    local stake_sprite = get_stake_sprite(G.GAME.stake or 1, 0.5)

    -- local contents = {}

    local spacing = 0.13
    local temp_col = G.C.DYN_UI.BOSS_MAIN
    local temp_col2 = G.C.DYN_UI.BOSS_DARK

    G.GAME.unik_overshoot = G.GAME.unik_overshoot or 0
    G.GAME.OvershootFXVal = G.GAME.OvershootFXVal or 0

    --Shortening buttons:
    --Run info
    if orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[1].nodes[1].config.id == "run_info_button" then
    orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[1].nodes[1] = {n=G.UIT.R, config={id = 'run_info_button', align = "cm", minh = 1, minw = 1.5,padding = 0.05, r = 0.1, hover = true, colour = G.C.RED, button = "run_info", shadow = true}, nodes={
            {n=G.UIT.R, config={align = "cm", padding = 0, maxw = 1.4}, nodes={
              {n=G.UIT.T, config={text = localize('b_run_info_1'), scale = 1.2*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
            }},
            {n=G.UIT.R, config={align = "cm", padding = 0, maxw = 1.4}, nodes={
              {n=G.UIT.T, config={text = localize('b_run_info_2'), scale = 1*scale, colour = G.C.UI.TEXT_LIGHT, shadow = true, focus_args = {button = G.F_GUIDE and 'guide' or 'back', orientation = 'bm'}, func = 'set_button_pip'}}
            }}
          }}
    end
    --options:
    if orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[1].nodes[2].config.button == "options" then
        orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[1].nodes[2] = {n=G.UIT.R, config={align = "cm", minh = 1, minw = 1.5,padding = 0.05, r = 0.1, hover = true, colour = G.C.ORANGE, button = "options", shadow = true}, nodes={
            {n=G.UIT.C, config={align = "cm", maxw = 1.4, focus_args = {button = 'start', orientation = 'bm'}, func = 'set_button_pip'}, nodes={
              {n=G.UIT.T, config={text = localize('b_options'), scale = scale, colour = G.C.UI.TEXT_LIGHT, shadow = true}}
            }},
          }}
    end
    
    --adding a new button
    orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[1].nodes[#orig.nodes[1].nodes[1].nodes[5].nodes[1].nodes[1].nodes + 1] = {
    n = G.UIT.R,
    config = {
      align = "cm",
      minh = 1, 
	  minw = 1.5,
      r = 1,
      colour = G.C.GREEN,
      hover = true,
      shadow = true,
      button = "piss_in_hand",
	  func = "can_switch",
    },
    nodes = {
      {
        n = G.UIT.T,
        config = {
          ref_table = G,
		  ref_value = "SECRET_BUTTON",
          scale = 0.5,
          colour = G.C.WHITE,
          shadow = true
        }
      }
    }
  }
  return orig
end

