G.STATES.MAIN_STREET = 24783948327
G.STATES.GRAVEYARD = 1366468461
G.STATES.HELL = 666384372666
G.STATES.DREAMLAND = 7983784839784932
G.STATES.TBOI_CHEST = 875385974835
G.STATES.CASINO = 7326724673643838
G.STATES.SPIN_CASINO = 3576567567567

G.FUNCS.show_yma_main_street = function(e)
    YMA.start_shop_transition()
  stop_use()
  hide_location(G.shop)
  
  G.STATE = G.STATES.MAIN_STREET
  G.STATE_COMPLETE = false
  show_location(G.main_street)

  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  --sign_sprite.states.visible = false
  NAMETEAM.shop_sign("cbean_NAMETEAM_street")
  sign_text = DynaText({string = {''}, colours = {lighten(G.C.BLACK, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
  G.SHOP_SIGN.UIRoot.UIBox:recalculate()
  cached_hand_state = G.hand.states.visible
  G.hand.states.visible = false
  G.GAME.VISITED_STREET = true --Keeps track of if you visited the street. Need to ensure that entering shop effects only happen once per shop.
  YMA.end_shop_transition()
end

G.FUNCS.hide_yma_main_street = function(e)
    YMA.start_shop_transition()
    stop_use()
	hide_location(G.main_street)
	G.hand.states.visible = cached_hand_state
	G.STATE = G.STATES.SHOP
	G.STATE_COMPLETE = false
    show_location(G.shop)

	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.SHOP)
    NAMETEAM.shop_sign("shop_sign")
	--sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
    --sign_sprite.states.visible = true
    sign_text = DynaText({string = {localize('ph_improve_run')}, colours = {lighten(G.C.GOLD, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    YMA.end_shop_transition()
end

function update_main_street()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.MAIN_STREET)
        local main_street_exists = not not G.main_street
        G.main_street = G.main_street or UIBox{
            definition = G.UIDEF.yma_main_street(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        G.yma_mainstreet_graveyard:recalculate()
        G.yma_mainstreet_hell:recalculate()
        G.yma_mainstreet_dreamland:recalculate()
        G.yma_mainstreet_forgery:recalculate()
        G.yma_mainstreet_tboi_chest:recalculate()
        G.yma_mainstreet_casino:recalculate()
        G.yma_mainstreet_stationery:recalculate()

        G.E_MANAGER:add_event(Event({
            func = function()
                G.main_street.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.main_street.T.y - G.main_street.VT.y) < 3 then
                            local nosave_main_street = nil 
                            -- Back to shop button
							play_sound('cbean_pboy_bavoice', G.SPEEDFACTOR*(math.random()*0.4+2), 2.5)
                            G.CONTROLLER:snap_to({node = G.main_street:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_main_street then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
end

local lcpref2 = Controller.L_cursor_press
function Controller:L_cursor_press(x, y)
    lcpref2(self, x, y)
	if G.STATE == G.STATES.MAIN_STREET and G.main_street and G.GAME then
        if G.yma_mainstreet_alleyway and G.yma_mainstreet_alleyway.states.collide.is and yma_can_access_location('balley') then
            G.FUNCS.show_balley()
        elseif G.yma_mainstreet_graveyard and G.yma_mainstreet_graveyard.states.collide.is and yma_can_access_location('graveyard') then
            G.FUNCS.show_yma_graveyard()
        elseif G.yma_mainstreet_hell and G.yma_mainstreet_hell.states.collide.is and yma_can_access_location('hell') then
            G.FUNCS.show_yma_hell()
        elseif G.yma_mainstreet_dreamland and G.yma_mainstreet_dreamland.states.collide.is and yma_can_access_location('dreamland') then
            G.FUNCS.show_yma_dreamland()
        elseif G.yma_mainstreet_tboi_chest and G.yma_mainstreet_tboi_chest.states.collide.is and yma_can_access_location('tboi_chest') then
            G.FUNCS.show_yma_tboi_chest()
        elseif G.yma_mainstreet_casino and G.yma_mainstreet_casino.states.collide.is and yma_can_access_location('casino') then
            G.FUNCS.show_yma_casino()
		elseif G.yma_mainstreet_stationery and G.yma_mainstreet_stationery.states.collide.is and yma_can_access_location('stationery') then
            G.FUNCS.show_stationery()
        --Evil ass Jbill employment gimmick appears!
        elseif G.jbill_employed and G.jbill_employed.states.collide.is then
            G.FUNCS.show_employ()
        elseif G.yma_mainstreet_forgery and  G.yma_mainstreet_forgery.states.collide.is and yma_can_access_location('forgery') then
            G.FUNCS.show_yma_forgery()
        end
	end
end

function G.UIDEF.yma_main_street()
    
    G.yma_mainstreet_alleyway = UIBox{
        definition = G.UIDEF.alleysprite(),
        config = {align='cm', offset = {x=0.1,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_graveyard = UIBox{
        definition = G.UIDEF.gravesprite(),
        config = {align='cm', offset = {x=0,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_hell = UIBox{
        definition = G.UIDEF.hellsprite(),
        config = {align='cm', offset = {x=0,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_dreamland = UIBox{
        definition = G.UIDEF.dreamlandsprite(),
        config = {align='cm', offset = {x=0,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_forgery = UIBox{
        definition = G.UIDEF.forgery_sprite(),
        config = {align='cm', offset = {x=0,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_tboi_chest = UIBox{
        definition = G.UIDEF.tboi_chestsprite(),
        config = {align='cm', offset = {x=0,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_casino = UIBox{
        definition = G.UIDEF.casinosprite(),
        config = {align='cm', offset = {x=0,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    G.yma_mainstreet_stationery = UIBox{
        definition = G.UIDEF.stationery_sprite(),
        config = {align='cm', offset = {x=0,y=0}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    } 
    G.jbill_employed = UIBox{
        definition = G.UIDEF.employsprite(),
        config = {align='cm', offset = {x=0.1,y=-0.2}, major = G.hand, bond = 'Weak', draggable = false, collideable = true, can_collide = true}
    }
    
    local table = {}
    table[#table+1] = {
        n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, colour = G.C.DYN_UI.BOSS_MAIN, minh = 1.5, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_alleyway}},
        }}
    table[#table+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_graveyard}},
        }}
    table[#table+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_hell}},
        }}
    local table2 = {}
    table2[#table2+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_dreamland}},
        }}
    table2[#table2+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_stationery}},
        }}
    table2[#table2+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.jbill_employed}},
    }}
    local table3 = {}
    table3[#table3+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_tboi_chest}},
        }}
    table3[#table3+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object = G.yma_mainstreet_casino}},
        }}
    table3[#table3+1] = {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, minh = 1.5, colour = G.C.DYN_UI.BOSS_MAIN, emboss = 0.05}, nodes={
            {n=G.UIT.O, config={object =  G.yma_mainstreet_forgery}},
        }}


    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.L_BLACK}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes=table},
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes=table2},
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes=table3},
                    {n=G.UIT.R, config={align = "cm", minh = 1.5}, nodes={}},
                }
              },
              
              }, false)
        }}
    return t
end

function G.UIDEF.alleysprite()
  
	local sprite_alley = G.ASSET_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("balley")  and "cbean_pboys_backalley_shop" or "cbean_NAMETEAM_closed"], { x = 0, y = 0 }) or nil
    function sprite_alley:update(dt)
        AnimatedSprite.update(self, dt)
        self.atlas =
            G.ANIMATION_ATLAS[yma_can_access_location("balley")  and "cbean_pboys_backalley_shop" or "cbean_NAMETEAM_closed"]
    end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_alley}},
    }}
    return t
end

function G.UIDEF.gravesprite()
  
	local sprite_grave = G.ASSET_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("graveyard") and "cbean_yma_graveyard_sign" or "cbean_yma_locked_sign"], { x = 0, y = 0 }) or nil
    function sprite_grave:update(dt)
		AnimatedSprite.update(self, dt)
		self.atlas =
			G.ANIMATION_ATLAS[yma_can_access_location("graveyard") and "cbean_yma_graveyard_sign" or "cbean_yma_locked_sign"]
	end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_grave}},
    }}
    return t
end

function G.UIDEF.hellsprite()
  
	local sprite_hell = G.ASSET_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("hell") and "cbean_yma_hell_sign" or "cbean_yma_locked_sign"], { x = 0, y = 0 }) or nil
    function sprite_hell:update(dt)
		AnimatedSprite.update(self, dt)
		self.atlas =
			G.ANIMATION_ATLAS[yma_can_access_location("hell") and "cbean_yma_hell_sign" or "cbean_yma_locked_sign"]
	end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_hell}},
    }}
    return t
end

function G.UIDEF.tboi_chestsprite()
  
	local sprite_tboi_chest = G.ANIMATION_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("tboi_chest") and "cbean_yma_chest_sign" or "cbean_NAMETEAM_closed"], { x = 0, y = 0 }) or nil
    function sprite_tboi_chest:update(dt)
		AnimatedSprite.update(self, dt)
		self.atlas =
			G.ANIMATION_ATLAS[yma_can_access_location("tboi_chest") and "cbean_yma_chest_sign" or "cbean_NAMETEAM_closed"]
	end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_tboi_chest}},
    }}
    return t
end

function G.UIDEF.casinosprite()
  
	local sprite_casino = G.ANIMATION_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("casino") and "cbean_yma_casino_sign" or "cbean_NAMETEAM_closed"], { x = 0, y = 0 }) or nil
    function sprite_casino:update(dt)
		AnimatedSprite.update(self, dt)
		self.atlas =
			G.ANIMATION_ATLAS[yma_can_access_location("casino") and "cbean_yma_casino_sign" or "cbean_NAMETEAM_closed"]
	end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_casino}},
    }}
    return t
end

function G.UIDEF.dreamlandsprite()
  
	local sprite_hell = G.ANIMATION_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("dreamland") and "cbean_yma_dreamland_sign" or "cbean_yma_locked_sign"], { x = 0, y = 0 }) or nil
    function sprite_hell:update(dt)
		AnimatedSprite.update(self, dt)
		self.atlas =
			G.ANIMATION_ATLAS[yma_can_access_location("dreamland") and "cbean_yma_dreamland_sign" or "cbean_yma_locked_sign"]
	end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_hell}},
    }}
    return t
end

function G.UIDEF.employsprite()
  --for now chicot is taking backalley sign, because he's kinda an asshole and we need a placeholder
	local sprite_employ = G.ASSET_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS["cbean_jbill_specialist"], { x = 0, y = 0 }) or nil

    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_employ}},
    }}
    return t
end

G.FUNCS.show_yma_casino = function(e)
    YMA.start_shop_transition()
  stop_use()
  hide_location(G.main_street)
  
  G.STATE = G.STATES.CASINO
  G.STATE_COMPLETE = false
  

  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  NAMETEAM.shop_sign("cbean_yma_casino_sign")
  --sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_yma_casino_sign"]
  G.hand.states.visible = false
  --sign_sprite.states.visible = true
  G.SHOP_SIGN.UIRoot.UIBox:recalculate()
  show_location(G.yma_casino)
  YMA.end_shop_transition()
end

G.FUNCS.hide_yma_casino = function(e)
    YMA.start_shop_transition()
    stop_use()
	hide_location(G.yma_casino)
	G.STATE = G.STATES.MAIN_STREET
	G.STATE_COMPLETE = false
    
	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.MAIN_STREET)
    NAMETEAM.shop_sign("cbean_NAMETEAM_street")
	--sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
    --sign_sprite.states.visible = false
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
    YMA.end_shop_transition()
end

function update_yma_casino()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.CASINO)
        local casino_exists = not not G.yma_casino
        G.yma_casino = G.yma_casino or UIBox{
            definition = G.UIDEF.yma_casino(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.yma_casino.alignment.offset.y = -5.3
                if not G.yma_casino_slots then
                    for i = 1, 3 do
                        G.yma_casino_slots = G.yma_casino_slots or {}
                        G.yma_casino_slots_sprite_ref = G.yma_casino_slots or {}
                        G.yma_casino_slots_sprite_ref[i-1] = G.UIDEF.yma_get_random_casino_slot()
                        G.yma_casino_slots[i-1] = UIBox{
                            definition = G.yma_casino_slots_sprite_ref[i-1],
                            config = {align="tmi", offset = {x=i*2.5-0.75,y=G.ROOM.T.y+22}, major = G.casino_slots_holder, bond = 'Weak', draggable = true, collideable = true, can_collide = true}
                        }
                        G.yma_casino_slots[i-1].reel_phase = math.random() * 0.5
                        G.yma_casino_slots[i-1].reel_speed = 1.0
                        G.yma_casino_slots[i-1].stop_delay = (i - 1) * 0.35 
                        G.yma_casino_slots[i-1].stopped = false
                    
                        G.yma_casino_slots[i-1].newy = 1.8
                    end
                    G.yma_spin_timer = 0
                    G.yma_spin_duration = 4.5 
                    G.yma_spin_active = false

                    for key, ad in pairs(G.yma_casino_slots) do
		                G.yma_casino_slots[key].alignment.offset.y = 0.8
                        G.yma_casino_slots[key].alignment.offset.x = G.yma_casino_slots[key].alignment.offset.x - 4.2
	                end
                    G.yma_casino_slot_machine = UIBox{
                        definition = G.UIDEF.yma_get_casino_machine(),
                        config = {align="tmi", offset = {x=1*2.5-0.75,y=G.ROOM.T.y+22}, major = G.casino_slots_holder, bond = 'Weak', draggable = true, collideable = false, can_collide = false}
                    }
                    G.yma_casino_slot_machine.alignment.offset.y = -4.2
                    G.yma_casino_slot_machine.alignment.offset.x = 0.2
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.yma_casino.T.y - G.yma_casino.VT.y) < 3 then
                            local nosave_yma_casino = nil 
                            -- Back to shop button
                            G.CONTROLLER:snap_to({node = G.yma_casino:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_yma_casino then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
end

local game_update = Game.update
function Game:update(dt)
    if G.yma_casino_slots and G.yma_spin_active and G.STATE == G.STATES.SPIN_CASINO then
        G.yma_spin_timer = G.yma_spin_timer + dt

        local t = math.min(G.yma_spin_timer / G.yma_spin_duration, 1)
        local ease = 1 - (1 - t) * (1 - t) 
        local global_speed = 3 - (ease * 3)
        local score = {}

        for _, slot in pairs(G.yma_casino_slots) do
            if slot and not slot.stopped then
                if G.yma_spin_timer >= slot.stop_delay then
                    local speed = dt * 8 * global_speed * slot.reel_speed

                    slot.config.offset.y = slot.config.offset.y + speed

                    if slot.config.offset.y + slot.reel_phase > 2.4 then
                        slot.config.offset.y = -0.8 - slot.reel_phase

                        local new_def = G.UIDEF.yma_get_random_casino_slot()

                        slot.definition.nodes[1].config.object.sprite_pos = new_def.nodes[1].config.object.sprite_pos
                    end
                end

                if t >= 1 and G.yma_spin_timer >= slot.stop_delay then
                    slot.stopped = true
                    slot.config.offset.y = 0.8 
                end
            end
        end

        if t >= 1 then
            G.yma_spin_active = false
            for _, slot in pairs(G.yma_casino_slots) do
                local pos = slot.definition.nodes[1].config.object.sprite_pos
                score[yma_pos_to_symbol(pos)] = score[yma_pos_to_symbol(pos)] or 0
                score[yma_pos_to_symbol(pos)] = score[yma_pos_to_symbol(pos)] + 1
            end
            G.yma_casino_roll = score
            yma_calculate_casino(score)
            G.STATE = G.STATES.CASINO
        end
    end

    return game_update(self, dt)
end

function yma_pos_to_symbol(pos)
    if pos.y == 1 then
        return 'Joker'
    elseif pos.x == 0 then
        return 'Heart'
    elseif pos.x == 1 then
        return 'Spade'
    elseif pos.x == 2 then
        return 'Club'
    elseif pos.x == 3 then
        return 'Diamond'
    elseif pos.x == 4 then
        return 'Cold Bean'
    elseif pos.x == 5 then
        return 'Banana'
    end
end

function G.UIDEF.yma_casino()
    G.casino_slots_holder = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(10*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = 3, type = 'hand', highlight_limit = 2, visable = false, no_card_count = true})

    G.GAME.yma_casino_spin_cost = 10
    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.WHITE, emboss = 0.05, minw = 8.2}, nodes={
                          {n=G.UIT.O, config={object = G.casino_slots_holder}},
                      }},
                    }},
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.RED, button = 'spin_yma_casino', func = 'can_spin_yma_casino', hover = true,shadow = true}, nodes = {
                            {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                {n=G.UIT.T, config={text = localize('k_yma_spin_casino').." ("..localize('$')..G.GAME.yma_casino_spin_cost..")", scale = 0.6, colour = G.C.WHITE, shadow = true}},
                            }},
                        }},
                      }},
                    }},
                }
              },
              
              }, false)
        }}
    return t
end

G.FUNCS.can_spin_yma_casino = function(e)
    e.children[1].children[1].config.text = localize('k_yma_spin_casino').." ("..localize('$')..G.GAME.yma_casino_spin_cost..")"
    if G.yma_spin_active or to_big(G.GAME.dollars) < to_big(G.GAME.yma_casino_spin_cost) then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.RED
        e.config.button = 'spin_yma_casino'
    end
end

function G.UIDEF.yma_get_random_casino_slot()
    local num = pseudorandom('slots', 0, 6)
    local y = nil
    if num == 6 then
        y = 1
        num = 0
    end
  
	local sprite_slot = SMODS.create_sprite(0, 0, 1, 1, 'cbean_yma_casino_slots', { x = num, y = y or 0 }) or nil
    
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR, offset}, nodes={
            {n=G.UIT.O, config={object = sprite_slot}},
    }}
    return t
end

function G.UIDEF.yma_get_casino_machine()
  
	local sprite_slot = SMODS.create_sprite(0, 0, 15, 12, 'cbean_yma_casino_slot_machine', { x = 0, y = 0 }) or nil
    
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR, offset}, nodes={
            {n=G.UIT.O, config={object = sprite_slot}},
    }}
    return t
end

G.FUNCS.spin_yma_casino = function(e) 
    stop_use()
    G.STATE = G.STATES.SPIN_CASINO
    if not G.yma_casino_slots then return end
    ease_dollars(-G.GAME.yma_casino_spin_cost or 10)

    G.yma_spin_timer = 0
    G.yma_spin_duration = 4.5
    G.yma_spin_active = true

    for _, slot in pairs(G.yma_casino_slots) do
        slot.stopped = false
        slot.reel_phase = math.random() * 0.5
    end
    G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
end

G.FUNCS.show_yma_tboi_chest = function(e)
YMA.start_shop_transition()
  stop_use()
  hide_location(G.main_street)
  if CM.states.slot_visible == 1 then
        G.FUNCS.toggle_jokers_items()
  end
  G.STATE = G.STATES.TBOI_CHEST
  G.STATE_COMPLETE = false
  

  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  NAMETEAM.shop_sign("cbean_yma_chest_sign")
  --sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_yma_chest_sign"]
  G.hand.states.visible = false
  --sign_sprite.states.visible = true
  G.SHOP_SIGN.UIRoot.UIBox:recalculate()
  show_location(G.yma_tboi_chest)
  YMA.end_shop_transition()
end

G.FUNCS.hide_yma_tboi_chest = function(e)
    YMA.start_shop_transition()
    stop_use()
	hide_location(G.yma_tboi_chest) 
    if CM.states.slot_visible == -1 then
        G.FUNCS.toggle_jokers_items()
   end
	G.STATE = G.STATES.MAIN_STREET
	G.STATE_COMPLETE = false
    
	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.MAIN_STREET)
    NAMETEAM.shop_sign("cbean_NAMETEAM_street")
	--sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
    --sign_sprite.states.visible = false
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
    YMA.end_shop_transition()
end

function update_yma_tboi_chest()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.TBOI_CHEST)
        local tboi_chest_exists = not not G.yma_tboi_chest
        G.yma_tboi_chest = G.yma_tboi_chest or UIBox{
            definition = G.UIDEF.yma_tboi_chest(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        G.E_MANAGER:add_event(Event({
            func = function()
                G.yma_tboi_chest.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.yma_tboi_chest.T.y - G.yma_tboi_chest.VT.y) < 3 then
                            local nosave_yma_tboi_chest = nil 
                            -- Back to shop button
                            G.CONTROLLER:snap_to({node = G.yma_tboi_chest:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_yma_tboi_chest then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
end

function G.UIDEF.yma_tboi_chest()
    local _size = 2
    G.tboi_chest_cards = CardArea(
        G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
        math.max(1,math.min(_size,5))*G.CARD_W*1.1,
        1.05*G.CARD_H,
        {card_limit = _size, type = 'joker', highlight_limit = 1, no_card_count = true})
    G.GAME.tboi_chest_card_amt = G.GAME.tboi_chest_card_amt or 0
    if G.GAME.tboi_chest_cards then
        G.GAME.tboi_chest_selected_item = false
        for i, key in ipairs(G.GAME.tboi_chest_cards) do
            local cardd = create_card('yma_tboi_items',G.tboi_chest_cards, nil, nil, nil, nil, key, 'for')
            if i == #G.GAME.tboi_chest_cards then
                --print("Last")
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.15,
                func = function()
                    cardd:flip()
                    return true
                end
            }))
            end
            G.tboi_chest_cards:emplace(cardd)
        end
    elseif G.GAME.tboi_chest_card_amt > 0 then
        G.GAME.tboi_chest_selected_item = false
        G.GAME.tboi_chest_cards = {}
        for i = 1, G.GAME.tboi_chest_card_amt do
            local cardd = create_card('yma_tboi_items',G.tboi_chest_cards, nil, nil, nil, nil, nil, 'for')
            if i == G.GAME.tboi_chest_card_amt then
                --print("Last")
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.15,
                    func = function()
                        cardd:flip()
                        return true
                    end
                }))
            end
            G.GAME.tboi_chest_cards[#G.GAME.tboi_chest_cards+1] = cardd.config.center.key
            G.tboi_chest_cards:emplace(cardd)
        end
        G.GAME.tboi_chest_card_amt = 0
    end
    local tbale = {num = 1}
    local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
        {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
            {n=G.UIT.R, config={align = "cm"}, nodes={
            {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
                    {n=G.UIT.O, config={object = G.tboi_chest_cards}},}}}}}},
        {n=G.UIT.R, config={align = "cm"}, nodes={}},
        {n=G.UIT.R, config={align = "tm"}, nodes={
            {n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
                UIBox_dyn_container({
                    {n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
                        {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = localize('k_yma_tboi_chest'), colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
                        {n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
                            {n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
                            {n=G.UIT.O, config={object = DynaText({string = {{ref_table = tbale, ref_value = 'num'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
                }),}},
                }}}}}}
    return t
end

G.FUNCS.show_yma_dreamland = function(e)
YMA.start_shop_transition()
  stop_use()
  hide_location(G.main_street)

  G.dreamlands_consumeable_card_holder = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(10*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = 999999999999, type = 'consumeable', highlight_limit = 1})
  
  G.STATE = G.STATES.DREAMLAND
  G.STATE_COMPLETE = false
  

  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  NAMETEAM.shop_sign("cbean_yma_dreamland_sign")
  --sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_yma_dreamland_sign"]
  G.hand.states.visible = false
  --sign_sprite.states.visible = true
  sign_text = DynaText({string = {localize('ph_dreamland')}, colours = {lighten(G.C.RED, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
  G.SHOP_SIGN.UIRoot.UIBox:recalculate()
  show_location(G.yma_dreamland)
  YMA.end_shop_transition()
end

G.FUNCS.hide_yma_dreamland = function(e)
    YMA.start_shop_transition()
    stop_use()
	hide_location(G.yma_dreamland)
    if G.dreamlands_consumeable_card_holder then
        if #G.dreamlands_consumeable_card_holder.cards > 0 then
            for k, v in pairs(G.dreamlands_consumeable_card_holder.cards) do 
                draw_card(G.dreamlands_consumeable_card_holder,G.consumeables, 100/1,'up', nil, v)
            end
        end
    end
	G.STATE = G.STATES.MAIN_STREET
	G.STATE_COMPLETE = false
    
	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.MAIN_STREET)
    NAMETEAM.shop_sign("cbean_NAMETEAM_street")
	--sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
    --sign_sprite.states.visible = false
    sign_text = DynaText({string = {''}, colours = {lighten(G.C.BLACK, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
    if G.dreamlands_consumeable_card_holder then
        G.dreamlands_consumeable_card_holder.states.visible = false
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blockable = false,
            blocking = false,
            delay =  0,
            func = (function() 
                    G.dreamlands_consumeable_card_holder.states.visible = false
                    G.dreamlands_consumeable_card_holder:remove()
                    G.dreamlands_consumeable_card_holder = nil;
                return true
            end)
        }))
    end
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
    YMA.end_shop_transition()
end

function update_yma_dreamland()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.DREAMLAND)
        local dreamland_exists = not not G.yma_dreamland
        G.yma_dreamland = G.yma_dreamland or UIBox{
            definition = G.UIDEF.yma_dreamland(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        G.dreamlands_consumeable_card_holder.states.visible = true
        if #G.dreamlands_consumeable_card_holder.cards <= 0 then
            G.FUNCS.draw_from_card_area_to_card_area(G.consumeables, G.dreamlands_consumeable_card_holder)
        end
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.yma_dreamland.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.yma_dreamland.T.y - G.yma_dreamland.VT.y) < 3 then
                            local nosave_yma_dreamland = nil 
                            -- Back to shop button
                            G.CONTROLLER:snap_to({node = G.yma_dreamland:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_yma_dreamland then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
end

function G.UIDEF.yma_dreamland()
    G.GAME.yma_dreamland_improve_text = localize('k_yma_polish')
    G.GAME.yma_dreamland_chance_text = localize('k_yma_chance_to_fail_key')
    G.GAME.yma_upgradecost_text = G.GAME.yma_upgradecost_text or 5


    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 8.2}, nodes={
                          {n=G.UIT.O, config={object = G.dreamlands_consumeable_card_holder}},
                      }},
                    }},
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.SECONDARY_SET.yma_keys, button = 'improve_consumable_yma_dreamland', func = 'can_improve_consumable_yma_dreamland', hover = true,shadow = true}, nodes = {
                            {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                {n=G.UIT.T, config={ref_table = G.GAME, ref_value = 'yma_dreamland_improve_text', scale = 0.6, colour = G.C.WHITE, shadow = true}},
                            }},
                            {n=G.UIT.R, config={align = "cm", minh = 0.3}, nodes={
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={ref_table = G.GAME, ref_value = 'yma_dreamland_chance_text', scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                        }},
                      }},
                      {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.GREEN, button = 'upgrade_from_dreamland', func = 'can_upgrade_from_dreamland', hover = true,shadow = true}, nodes = {
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize('k_yma_dreamland_upgrade'), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize('$'), scale = 0.7, colour = G.C.WHITE, shadow = true}},
                                {n=G.UIT.T, config={ref_table = G.GAME, ref_value = 'yma_upgradecost_text', scale = 0.6, colour = G.C.WHITE, shadow = true}},
                            }},
                        }},
                      }},
                    }},
                }
              },
              }, false)
        }}
    return t
end

G.FUNCS.can_improve_consumable_yma_dreamland = function(e)
    local has_vaild_card, card_set = false, nil
    if not G.dreamlands_consumeable_card_holder then return end
    if #G.dreamlands_consumeable_card_holder.highlighted == 1 then
        has_vaild_card, card_set = yma_improveable_consumable(G.dreamlands_consumeable_card_holder.highlighted[1])
    end
    if #G.dreamlands_consumeable_card_holder.highlighted ~= 1 or G.CONTROLLER.locks.dreamland_improve or not has_vaild_card then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    elseif (card_set == 'yma_keys') then
        e.config.colour = G.C.SECONDARY_SET.yma_keys
        e.config.button = 'improve_consumable_yma_dreamland'
        G.GAME.yma_dreamland_improve_text = localize('k_yma_polish')
        G.GAME.yma_dreamland_chance_text = localize('k_yma_chance_to_fail_key')
    elseif card_set == 'sdown_blessing' then
        e.config.colour = G.C.SECONDARY_SET.sdown_blessing
        e.config.button = 'improve_consumable_yma_dreamland'
        G.GAME.yma_dreamland_improve_text = localize('k_yma_pray')
        G.GAME.yma_dreamland_chance_text = localize('k_yma_chance_to_fail_belssing')
    end
end

G.FUNCS.improve_consumable_yma_dreamland = function(e) 
    stop_use()
    G.CONTROLLER.locks.dreamland_improve = true
    if G.CONTROLLER:save_cardarea_focus('dreamlands_consumeable_card_holder') then G.CONTROLLER.interrupt.focus = true end
    local card = G.dreamlands_consumeable_card_holder.highlighted[1]
    local temp, set = yma_improveable_consumable(card)
    if set == 'sdown_blessing' then
    if SMODS.pseudorandom_probability(card, 'dreamland_improve', 1, 2, nil, true) then
        card.ability.extra.times_left = card.ability.extra.times_left + 1 
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
        else
            if G.GAME and G.GAME.used_vouchers['v_cbean_yma_krater'] and SMODS.pseudorandom_probability(card, 'dreamland_improve', 1, 3, nil, true) then
                card.ability.extra.times_left = card.ability.extra.times_left + 1 
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
            else
                card.ability.yma_failed_pray = true
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_yma_pray_fail')})
            end
        end
    elseif set == 'yma_keys' then
        if SMODS.pseudorandom_probability(card, 'dreamland_improve', 2, 3, nil, true) then
            if card.ability.consumeable.extra.type == 'cards' then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses + 2
                card.ability.consumeable.extra.max_uses = card.ability.consumeable.extra.max_uses + 2 
            end
            card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses + 1 
            card.ability.consumeable.extra.max_uses = card.ability.consumeable.extra.max_uses + 1 
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
        else
            if SMODS.pseudorandom_probability(card, 'dreamland_failed', 3, 4, nil, true) then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_yma_polish_fail')})
            else
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_yma_key_broke')})
                SMODS.destroy_cards(card, nil, nil, true)
            end
        end
    end
    
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          G.CONTROLLER.interrupt.focus = false
          G.CONTROLLER.locks.dreamland_improve = false
          G.CONTROLLER:recall_cardarea_focus('dreamlands_consumeable_card_holder')
          return true
        end
      }))
    G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
end

G.FUNCS.show_yma_hell = function(e)
YMA.start_shop_transition()
  stop_use()
  hide_location(G.main_street)
  
  G.STATE = G.STATES.HELL
  G.STATE_COMPLETE = false
  

  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  NAMETEAM.shop_sign("cbean_yma_hell_sign")
  --sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_yma_hell_sign"]
  G.hand.states.visible = false
  --sign_sprite.states.visible = true
  sign_text = DynaText({string = {localize('ph_hell')}, colours = {lighten(G.C.RED, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
  G.SHOP_SIGN.UIRoot.UIBox:recalculate()
  show_location(G.yma_hell)
  YMA.end_shop_transition()
end

G.FUNCS.hide_yma_hell = function(e)
    YMA.start_shop_transition()
    stop_use()
    G.FUNCS.draw_from_card_area_to_card_area(G.hells_playing_card_holder, G.deck)
	hide_location(G.yma_hell)
	G.STATE = G.STATES.MAIN_STREET
	G.STATE_COMPLETE = false
    
	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.MAIN_STREET)
    NAMETEAM.shop_sign("cbean_NAMETEAM_street")
	--sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
    --sign_sprite.states.visible = false
    G.hells_playing_card_holder.states.visible = false
    sign_text = DynaText({string = {''}, colours = {lighten(G.C.BLACK, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
    YMA.end_shop_transition()
end

function update_yma_hell()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.HELL)
        local hell_exists = not not G.yma_hell
        G.yma_hell = G.yma_hell or UIBox{
            definition = G.UIDEF.yma_hell(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        G.hells_playing_card_holder.states.visible = true
        if #G.hells_playing_card_holder.cards <= 0 then
            G.FUNCS.draw_from_deck_to_card_area(G.hells_playing_card_holder, 10)
        end
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.yma_hell.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.yma_hell.T.y - G.yma_hell.VT.y) < 3 then
                            local nosave_yma_hell = nil 
                            -- Back to shop button
                            G.CONTROLLER:snap_to({node = G.yma_hell:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            if not nosave_yma_hell then G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end})) end
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
end

function G.UIDEF.yma_hell()
    G.hells_playing_card_holder = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(10*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = 10, type = 'hand', negative_info = 'playing_card', highlight_limit = 2})

    G.GAME.hell_upgrade_uses_left = 5

    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 8.2}, nodes={
                          {n=G.UIT.O, config={object = G.hells_playing_card_holder}},
                      }},
                    }},
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                        {n=G.UIT.R, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.DARK_EDITION, button = 'upgrade_yma_hell', func = 'can_upgrade_yma_hell', hover = true,shadow = true}, nodes = {
                            {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                {n=G.UIT.T, config={text = localize('k_hell_sac')..' ('..G.GAME.hell_upgrade_uses_left..'/5)', scale = 0.6, colour = G.C.WHITE, shadow = true}},
                            }},
                        }},
                      }},
                    }},
                }
              },
              
              }, false)
        }}
    return t
end

G.FUNCS.can_upgrade_yma_hell = function(e)
    e.children[1].children[1].config.text = localize('k_hell_sac')..' ('..G.GAME.hell_upgrade_uses_left..'/5)'
    if G.CONTROLLER.locks.hell_sac or G.GAME.hell_upgrade_uses_left <= 0 or #G.hells_playing_card_holder.highlighted ~= 2 then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.DARK_EDITION
        e.config.button = 'upgrade_yma_hell'
    end
end

G.FUNCS.upgrade_yma_hell = function(e) 
    stop_use()
    G.CONTROLLER.locks.hell_sac = true
    if G.CONTROLLER:save_cardarea_focus('hells_playing_card_holder') then G.CONTROLLER.interrupt.focus = true end
    local uses_left = G.GAME.hell_upgrade_uses_left
    local upgraded_card = G.hells_playing_card_holder.highlighted[1]
    local destroyed_card = G.hells_playing_card_holder.highlighted[2]
    for k, v in pairs(G.hells_playing_card_holder.cards) do
        if v == G.hells_playing_card_holder.highlighted[1] then
            destroyed_card = G.hells_playing_card_holder.highlighted[1]
            upgraded_card = G.hells_playing_card_holder.highlighted[2]
        end
        if v == G.hells_playing_card_holder.highlighted[2] then
            destroyed_card = G.hells_playing_card_holder.highlighted[2]
            upgraded_card = G.hells_playing_card_holder.highlighted[1]
        end
    end
    yma_hell_upgrade_card(upgraded_card)
    destroyed_card.highlighted = false
    SMODS.destroy_cards(destroyed_card)
    G.hells_playing_card_holder.highlighted[2] = nil
    
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
          G.CONTROLLER.interrupt.focus = false
          G.CONTROLLER.locks.hell_sac = false
          G.CONTROLLER:recall_cardarea_focus('hells_playing_card_holder')
          return true
        end
      }))
    G.GAME.hell_upgrade_uses_left = G.GAME.hell_upgrade_uses_left - 1
    G.yma_hell.UIRoot.UIBox:recalculate()
    G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
end

G.FUNCS.show_yma_graveyard = function(e)
YMA.start_shop_transition()
  stop_use()
  hide_location(G.main_street)
  
  G.STATE = G.STATES.GRAVEYARD
  G.STATE_COMPLETE = false
  

  --local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
  local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
  ease_background_colour_blind(G.STATE)
  NAMETEAM.shop_sign("cbean_yma_graveyard_sign")
  --sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
  G.hand.states.visible = false
  --sign_sprite.states.visible = true
  sign_text = DynaText({string = {localize('ph_graveyard')}, colours = {lighten(G.C.RED, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
  show_location(G.graveyard)
  YMA.end_shop_transition()
end

G.FUNCS.hide_yma_graveyard = function(e)
    YMA.start_shop_transition()
    stop_use()
	hide_location(G.graveyard)
	G.STATE = G.STATES.MAIN_STREET
	G.STATE_COMPLETE = false
    
	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.MAIN_STREET)
    NAMETEAM.shop_sign("cbean_NAMETEAM_street")
	--sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_yma_graveyard_sign"]
   -- sign_sprite.states.visible = false
    sign_text = DynaText({string = {''}, colours = {lighten(G.C.BLACK, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
    show_location(G.main_street)
    YMA.end_shop_transition()
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
    local total_rate = G.GAME.joker_rate
    local polled_rate = pseudorandom(pseudoseed('cdt'..G.GAME.round_resets.ante))*total_rate
    local check_rate = 0
    
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

G.FUNCS.draw_from_card_area_to_card_area = function(card_area, card_area2)
    local hand_count = #card_area.cards
    for i=1, hand_count do --draw cards from deck
        draw_card(card_area, card_area2, i*100/hand_count,'down', nil, nil,  0.08)
    end
end

G.FUNCS.draw_from_deck_to_card_area = function(card_area, amt)
    local hand_space = amt
    local cards_to_draw = {}
    if not hand_space then
        local limit = card_area.config.card_limit - #card_area.cards - (SMODS.cards_to_draw or 0)
        local unfixed = not card_area.config.fixed_limit
        local n = 0
        while n < #G.deck.cards do
            local card = G.deck.cards[#G.deck.cards-n]
            local mod = unfixed and (card.ability.card_limit - card.ability.extra_slots_used) or 0
            if limit - 1 + mod < 0 then
            else    
                limit = limit - 1 + mod
                table.insert(cards_to_draw, card)
                if limit <= 0 then break end
            end
            n = n + 1
        end
        hand_space = #cards_to_draw
    end
    local flags = SMODS.calculate_context({drawing_cards = true, amount = hand_space})
    hand_space = math.min(#G.deck.cards, flags.cards_to_draw or flags.modify or hand_space)
    delay(0.3)
    SMODS.cards_to_draw = (SMODS.cards_to_draw or 0) + math.max(hand_space, 0)
    SMODS.drawn_cards = {}
    for i=1, hand_space do --draw cards from deckL
        if G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK then 
            draw_card(G.deck,card_area, i*100/hand_space,'up', true, cards_to_draw[i])
        else
            draw_card(G.deck,card_area, i*100/hand_space,'up', true, cards_to_draw[i])
        end
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()                
            SMODS.cards_to_draw = SMODS.cards_to_draw - math.max(hand_space, 0)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 0.4,
        func = function()
            if #SMODS.drawn_cards > 0 then
                SMODS.calculate_context({first_hand_drawn = not G.GAME.current_round.any_hand_drawn and G.GAME.facing_blind,
                                        hand_drawn = G.GAME.facing_blind and SMODS.drawn_cards,
                                        other_drawn = not G.GAME.facing_blind and SMODS.drawn_cards})
                SMODS.drawn_cards = {}
                if G.GAME.facing_blind then G.GAME.current_round.any_hand_drawn = true end
            end
            return true
        end
    }))

end
