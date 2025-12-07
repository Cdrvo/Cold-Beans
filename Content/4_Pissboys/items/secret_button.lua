-- idk why this is not working
SMODS.current_mod.reset_game_globals = function(run_start)
  if run_start then 
    G.PISSMAX = 1
  end
end

G.FUNCS.can_switch = function(e)
  local text = localize('k_cbean_unique_ex')
  if G.STATE == G.STATES.BALLEY then
	  text=localize('k_cbean_aexit_ex')
	  e.config.colour = G.C.RED
	  e.config.button = 'hide_balley'
  elseif G.STATE == G.STATES.GRAVEYARD then
      text=localize('k_cbean_aexit_ex')
	  e.config.colour = G.C.RED
	  e.config.button = 'hide_yma_graveyard'
  elseif G.STATE == G.STATES.SHOP and #SMODS.find_card("c_cbean_yma_moon") >= 1 and G.GAME and G.GAME.cbean and #G.GAME.cbean.destroyed_jokers > 0 then
	  text=localize('k_cbean_yma_graveyard')
	  e.config.colour = G.C.BLACK
	  e.config.button = 'show_yma_graveyard'
  elseif G.STATE == G.STATES.SHOP then
	  text=localize('k_cbean_balley_ex')
	  e.config.colour = G.C.GREEN
	  e.config.button = 'show_balley'
  elseif G.STATE == G.STATES.SELECTING_HAND and G.PISSMAX and G.PISSMAX > 0 and G.hand.highlighted and #G.hand.highlighted > 0 then
			text=localize('k_cbean_piss_ex')
			e.config.button = 'piss_in_hand'
			e.config.colour = G.C.YELLOW
  else 
		e.config.colour = G.C.L_BLACK
		e.config.button = nil
  end
  if e.children[1].config.text ~= text then
	e.children[1].config.text = text
	if not (G.STATE == G.STATES.SELECTING_HAND) then
		e.children[1].UIBox:recalculate()
	end
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
          text = localize('k_cbean_unique_ex'),
          scale = 0.5,
          colour = G.C.WHITE,
          shadow = true
        }
      }
    }
  }
  return orig
end

