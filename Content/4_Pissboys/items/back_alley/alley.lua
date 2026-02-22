G.STATES.BALLEY = 1461461461

G.MODE = 0
G.turotial_speech = 1
G.STATE_CHOOSEBALL = false
G.STATE_SWAPBALL = false
G.STATE_SHOWBALL = false

SMODS.current_mod.calculate = function(self,context)
    if context.round_eval then
        G.GAME.BALLEY_WINS = 0
  	end
end

SMODS.Sound({
	key = "music_cbean_pboy_alleytheme",
	path = "4_Pissboys/pboy_alleytheme.ogg",
	sync = false,
	pitch = 1,
	select_music_track = function()
		return (G.STATE == G.STATES.BALLEY or G.STATE == G.STATES.GRAVEYARD)
			and 7
	end,
})

G.FUNCS.can_use_bet = function(e)
  if not G.STATE_CHOOSEBALL and not G.STATE_SWAPBALL and not G.STATE_SHOWBALL then
	  if G.MODE == 3 and G.GAME.dollars > 0 and G.GAME.BALLEY_WINS and G.GAME.BALLEY_WINS < 3 then
		e.config.colour = G.C.RED
		e.config.button = 'start_balley'
	  elseif G.MODE == 2.5 and G.GAME.dollars > 0 and G.GAME.BALLEY_WINS and G.GAME.BALLEY_WINS < 3 then
		e.config.colour = G.C.MONEY
		e.config.button = 'start_balley'
	  elseif G.MODE == 2 and G.GAME.dollars > 0 and G.GAME.BALLEY_WINS and G.GAME.BALLEY_WINS < 3 then
		e.config.colour = G.C.GREEN
		e.config.button = 'start_balley'
	  else
		e.config.colour = G.C.L_BLACK
		e.config.button = nil
	  end
  else
		e.config.button = nil
  end
end


G.FUNCS.start_balley = function(e)
  stop_use()
  G.num = G.num and G.num > 0 and G.num or 8 * G.MODE or 1
  for key, ad in pairs(G.cups) do
			G.cups[key].newy = 0
			G.cups[key].alignment.offset.y = -4.8
			G.cups[key].newx = 0
			G.cups[key].ball = false
			G.aball.config.major.T.scale = 0.01
			G.aball.UIRoot.parent.T.scale = 0.01	
  end
  local numb = {"0", "1", "2"}
  pseudoshuffle(numb)
  G.cups[tonumber(numb[1])].alignment.offset.y = -6.3
  G.cups[tonumber(numb[1])].newy = 1.5
  G.cups[tonumber(numb[1])].ball = true
  G.aball.config.offset.x = G.cups[tonumber(numb[1])].config.offset.x
  G.STATE_SHOWBALL = true
  G.ajoker.children.speech_bubble.states.visible = false
  G.ajoker.children.speech_bubble:remove()
  
  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0.2,
    func = function()
    G.E_MANAGER:add_event(Event({
      func = function()
        G.CONTROLLER.interrupt.focus = false
        G.CONTROLLER.locks.start_balley = false
        for i = 1, #G.jokers.cards do
          G.jokers.cards[i]:calculate_joker({start_balley = true})
        end
        return true
      end
    }))
    return true
  end
  }))
  G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
end

local game_update = Game.update
function Game:update(dt)
	if not G.OVERLAY_MENU then G.run_setup_overlay = nil end
    if G.num and G.MODE and G.cups and #G.cups and G.GAME then
		local speed_cup = dt * 5 * G.MODE or 0.625
			for key, ad in pairs(G.cups) do
					if G.num > 0 and G.STATE_SWAPBALL and G.cups[key].newx and not(G.cups[key].newx > -(0.2*G.MODE) and G.cups[key].newx < (0.2*G.MODE)) then
						G.cups[key].config.offset.x = G.cups[key].newx > 0 and G.cups[key].config.offset.x + speed_cup or G.cups[key].config.offset.x - speed_cup 
						G.cups[key].newx = G.cups[key].newx > 0 and G.cups[key].newx - speed_cup or G.cups[key].newx +  speed_cup
					end
					if (G.STATE_SHOWBALL and G.num > 0 or G.cups[key].skipstate) and G.cups[key].newy and not(G.cups[key].newy > -0.01 and G.cups[key].newy < 0.01) then
						G.cups[key].config.offset.y = G.cups[key].newy > 0 and G.cups[key].config.offset.y + dt * 1 or G.cups[key].config.offset.y - dt * 1
						G.cups[key].newy = G.cups[key].newy > 0 and G.cups[key].newy - dt * 1 or G.cups[key].newy + dt * 1
					end
					if G.cups[key].ball then
							G.aball.config.offset.x = G.cups[key].config.offset.x
					end
			end
			if G.STATE_SWAPBALL and (G.cups[0].newx > -(0.2*G.MODE) and G.cups[0].newx < (0.2*G.MODE)) and (G.cups[1].newx > -(0.2*G.MODE) and G.cups[1].newx < (0.2*G.MODE)) and (G.cups[2].newx > -(0.2*G.MODE) and G.cups[2].newx < (0.2*G.MODE)) then
				G.num = G.num - 1
				if G.num == 0 then
					G.STATE_CHOOSEBALL = true
					G.STATE_SWAPBALL = false
					for key, ad in pairs(G.cups) do
							if G.cups[key].newx then
									G.cups[key].config.offset.x = G.cups[key].config.offset.x + G.cups[key].newx
							end
							G.cups[key].newx = 0
					end
				else
					update_value_shiff()
				end
			end
			if G.STATE_SHOWBALL and (G.cups[0].newy > -0.01 and G.cups[0].newy < 0.01) and (G.cups[1].newy > -0.01 and G.cups[1].newy < 0.01) and (G.cups[2].newy > -0.01 and G.cups[2].newy < 0.01) then
				update_value_shiff()
				G.STATE_SHOWBALL = false
				G.STATE_SWAPBALL = true
				G.aball.states.visible = false
			end
	end
    
    return game_update(self, dt)
end

local lcpref2 = Controller.L_cursor_press
function Controller:L_cursor_press(x, y)
    lcpref2(self, x, y)
	if not G.STATE_CHOOSEBALL and G.balley and G.GAME and G.balley.definition.nodes[1].nodes[1].nodes[1].nodes[1].nodes[3].nodes[6].nodes[1].config.object.states.collide.is then
		if G.turotial_speech and G.turotial_speech < 8 then
			play_sound('cbean_pboy_bavoice', G.SPEEDFACTOR*(math.random()*0.4+2), 2.5)
			G.ajoker:juice_up()
			G.ajoker.children.speech_bubble:remove()
			G.ajoker.children.speech_bubble.states.visible = true
			G.ajoker.config.speech_bubble_align = {align= 'bm', offset = {x=0,y=0},parent = G.ajoker}
			G.ajoker.children.speech_bubble = 
			UIBox{
								definition = G.UIDEF.speech_bubble('cbean_pboys_tutorial_'..G.turotial_speech, {quip = true}),
								config = G.ajoker.config.speech_bubble_align
			}
			G.turotial_speech = G.turotial_speech + 1
		else
			G.turotial_speech = 1
			G.ajoker.children.speech_bubble.states.visible = false
		end
	end
	if G.STATE_CHOOSEBALL and G.cups and #G.cups and G.GAME then
		for key, ad in pairs(G.cups) do
			if G.cups[key].states.collide.is then
				  G.ajoker.children.speech_bubble:remove()
				  G.aball.states.visible = true
				  if G.cups[key].ball then
					ease_dollars(G.current_betmoney)
					if G.GAME.BALLEY_WINS < 2 then
						--print("Less than 3 Wins")
						G.GAME.BALLEY_WINS = G.GAME.BALLEY_WINS + 1
						G.aball.config.offset.x = G.cups[key].config.offset.x
						G.aball.config.offset.y = G.cups[key].config.offset.y+0.8
						G.ajoker.definition.nodes[1].config.object.sprite_pos.x = 3
						G.ajoker.config.speech_bubble_align = {align= 'bm', offset = {x=0,y=0},parent = G.ajoker}
						G.ajoker.children.speech_bubble = 
						UIBox{
								definition = G.UIDEF.speech_bubble('cbean_pboys_win_'..math.random(1,7), {quip = true}),
								config = G.ajoker.config.speech_bubble_align
						}
					else
						--print("3 or More Wins")
						G.GAME.BALLEY_WINS = G.GAME.BALLEY_WINS + 1
						G.aball.config.offset.x = G.cups[key].config.offset.x
						G.aball.config.offset.y = G.cups[key].config.offset.y+0.8
						G.ajoker.definition.nodes[1].config.object.sprite_pos.x = math.random(5,6)
						G.ajoker.config.speech_bubble_align = {align= 'bm', offset = {x=0,y=0},parent = G.ajoker}
						G.ajoker.children.speech_bubble = 
						UIBox{
								definition = G.UIDEF.speech_bubble('cbean_pboys_get_out_'..math.random(1,7), {quip = true}),
								config = G.ajoker.config.speech_bubble_align
						}
					end
				  else
					ease_dollars(-G.current_betmoney)
					for _, v in ipairs(SMODS.find_card("j_cbean_pboys_ihaveagun")) do
						SMODS.calculate_effect({message = localize("k_ihaveagun_ex")}, v)
						ease_dollars(math.floor(v.ability.extra.percent*G.current_betmoney))
					end
					G.ajoker.definition.nodes[1].config.object.sprite_pos.x = 4
					G.ajoker.config.speech_bubble_align = {align= 'bm', offset = {x=0,y=0},parent = G.ajoker}
					G.ajoker.children.speech_bubble = 
					UIBox{
							definition = G.UIDEF.speech_bubble('cbean_pboys_lose_'..math.random(1,7), {quip = true}),
							config = G.ajoker.config.speech_bubble_align
					}
				  end
				  play_sound('cbean_pboy_bavoice', G.SPEEDFACTOR*(math.random()*0.4+2), 2.5)
				  G.ajoker:juice_up()
				  G.current_betmoney = 0
				  G.MODE = 0
				  G.cups[key].alignment.offset.y = -6.3
				  G.cups[key].newy = 1.5
				  G.ajoker.children.speech_bubble.states.visible = true
				  G.cups[key].skipstate = true
				  G.STATE_CHOOSEBALL = false
				  local nosave_balley = nil 
				  if not nosave_balley then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
			end
		end
	end
end

function update_balley()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.BALLEY)
        local balley_exists = not not G.balley
        G.balley = G.balley or UIBox{
            definition = G.UIDEF.balley(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
		G.balley.definition.nodes[1].nodes[1].nodes[1].nodes[1].nodes[3].nodes[6].nodes[1].config.object.states.collide.can = true
		G.ajoker = UIBox{
            definition = G.UIDEF.alleyjoker(),
            config = {align='tmi', offset = {x=-4.3,y=G.ROOM.T.y+18}, major = G.hand, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
        }
		G.ajoker.definition.nodes[1].config.object.sprite_pos.x = 2
		G.aball = UIBox{
            definition = G.UIDEF.alleyball(),
            config = {align='tmi', offset = {x=1.75,y=G.ROOM.T.y+22}, major = G.hand, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
        }
		G.cups = G.cups or {}
		for i = 0, 2 do
				G.cups[i] = UIBox{
					definition = G.UIDEF.newcup(i),
					config = {align="tmi", offset = {x=i*2.5-0.75,y=G.ROOM.T.y+22}, major = G.hand, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
				}
		end

        G.E_MANAGER:add_event(Event({
            func = function()
                G.balley.alignment.offset.y = -5.3
				G.ajoker.alignment.offset.y = -4.8
				G.aball.config.offset.y = -4.0
				for key, ad in pairs(G.cups) do
					G.cups[key].alignment.offset.y = -4.8
				end
				G.ajoker.config.speech_bubble_align = {align= 'bm', offset = {x=0,y=0},parent = G.ajoker}
				G.ajoker.children.speech_bubble = 
				UIBox{
									definition = G.UIDEF.speech_bubble('cbean_pboys_hi_'..math.random(1,7), {quip = true}),
									config = G.ajoker.config.speech_bubble_align
				}
				G.ajoker.children.speech_bubble:set_role{
									role_type = 'Minor',
									xy_bond = 'Weak',
									r_bond = 'Strong',
									major = G.ajoker,
				}
				if not G.SHOP_SIGN then
					local shop_sign = AnimatedSprite(0,0, 4.4, 2.2, G.ANIMATION_ATLAS["cbean_pboys_backalley_shop"])
					shop_sign:define_draw_steps({
						{shader = 'dissolve', shadow_height = 0.05},
						{shader = 'dissolve'}
					})
					G.SHOP_SIGN = UIBox{
						definition = 
							{n=G.UIT.ROOT, config = {colour = G.C.DYN_UI.MAIN, emboss = 0.05, align = 'cm', r = 0.1, padding = 0.1}, nodes={
								{n=G.UIT.R, config={align = "cm", padding = 0.1, minw = 4.72, minh = 3.1, colour = G.C.DYN_UI.DARK, r = 0.1}, nodes={
									{n=G.UIT.R, config={align = "cm"}, nodes={
										{n=G.UIT.O, config={object = shop_sign}}
									}},
									{n=G.UIT.R, config={align = "cm"}, nodes={
										{n=G.UIT.O, config={object = DynaText({string = {localize('ph_improve_run')}, colours = {lighten(G.C.GOLD, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})}}
									}},
								}},
							}},
						config = {
							align="cm",
							offset = {x=0,y=0},
							major = G.HUD:get_UIE_by_ID('row_blind'),
							bond = 'Weak'
						}
					}
					G.current_betmoney = 0
					G.hand.states.visible = false
				end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.balley.T.y - G.balley.VT.y) < 3 then
                            local nosave_balley = nil 
                            -- Back to shop button
							play_sound('cbean_pboy_bavoice', G.SPEEDFACTOR*(math.random()*0.4+2), 2.5)
							G.ajoker:juice_up()
                            G.CONTROLLER:snap_to({node = G.balley:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_balley then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end

end

-- Let's go gambling
G.FUNCS.show_balley = function(e)
  stop_use()
  hide_location(G.main_street)
  
  G.current_betmoney = 0
  G.STATE = G.STATES.BALLEY
  G.STATE_COMPLETE = false
	NAMETEAM.shop_sign("cbean_pboys_backalley_shop")
  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  --sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_pboys_backalley_shop"]
  G.hand.states.visible = false
  --sign_sprite.states.visible = true
  sign_text = DynaText({string = {localize('ph_alley_wager')}, colours = {lighten(G.C.GOLD, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
end

-- Clicked back to shop
G.FUNCS.hide_balley = function(e)
  if not G.STATE_CHOOSEBALL and not G.STATE_SWAPBALL and not G.STATE_SHOWBALL then
	  stop_use()
	  for key, ad in pairs(G.cups) do
			G.cups[key]:remove()
	  end
	  G.cups = {}
	  G.STATE = G.STATES.MAIN_STREET
	  G.STATE_COMPLETE = false
	  NAMETEAM.shop_sign("cbean_NAMETEAM_street")
	  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
	  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	  ease_background_colour_blind(G.STATES.MAIN_STREET)
	  --sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
	  --sign_sprite.states.visible = false
	  sign_text = DynaText({string = {''}, colours = {lighten(G.C.BLACK, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
	  show_location(G.main_street)

	  hide_many_locations({G.aball, G.aball})
	  G.ajoker.alignment.offset.y = G.ROOM.T.y + 22
	  if G.ajoker and G.ajoker.children and G.ajoker.children.speech_bubble then
		G.ajoker.children.speech_bubble.states.visible = false
	  end
	  G.ajoker:remove()
	  G.aball.alignment.offset.y = G.ROOM.T.y + 22
	  G.aball:remove()
	  hide_location(G.balley)
	  G.balley.alignment.offset.y = G.ROOM.T.y + 20

	  for key, ad in pairs(G.cups) do
			hide_location(G.cups[key])
			G.cups[key].balley.config.offset.y = G.ROOM.T.y + 22
			G.cups[key]:remove()
	  end
	  
		-- TODO
	  --[[G.CONTROLLER.locks.toggle_shop = true
	  if G.shop then 
		for i = 1, #G.jokers.cards do
		  G.jokers.cards[i]:calculate_joker({ending_shop = true})
		end
		G.E_MANAGER:add_event(Event({
		  trigger = 'immediate',
		  func = function()
			G.shop.alignment.offset.y = G.ROOM.T.y + 29
			G.SHOP_SIGN.alignment.offset.y = -15
			return true
		  end
		})) 
		G.E_MANAGER:add_event(Event({
		  trigger = 'after',
		  delay = 0.5,
		  func = function()
			G.shop:remove()
			G.shop = nil
			G.SHOP_SIGN:remove()
			G.SHOP_SIGN = nil
			G.STATE_COMPLETE = false
			G.STATE = G.STATES.BLIND_SELECT
			G.CONTROLLER.locks.toggle_shop = nil
			return true
		  end
		}))
	  end]]
   end
end