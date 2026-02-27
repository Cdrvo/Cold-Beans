G.STATES.FORGERY = 82398283798298

function G.UIDEF.forgery_sprite()
  
	local sprite_alley = G.ASSET_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("forgery")  and "cbean_pboys_backalley_shop" or "cbean_yma_locked_sign"], { x = 0, y = 0 }) or nil
    function sprite_alley:update(dt)
        AnimatedSprite.update(self, dt)
        self.atlas =
            G.ANIMATION_ATLAS[yma_can_access_location("forgery")  and "cbean_pboys_backalley_shop" or "cbean_yma_locked_sign"]
    end
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_alley}},
    }}
    return t
end

G.FUNCS.show_yma_forgery = function(e)
  stop_use()
  hide_location(G.main_street)

  G.yma_forgery_card_sac = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(10*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = 1, type = 'consumeable', highlight_limit = 1})
  
  G.STATE = G.STATES.FORGERY
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
  show_location(G.yma_forgery)
end

G.FUNCS.hide_yma_forgery = function(e)
    stop_use()
	hide_location(G.yma_forgery)
    if G.yma_forgery_card_sac then
        if #G.yma_forgery_card_sac.cards > 0 then
            for k, v in pairs(G.yma_forgery_card_sac.cards) do 
                draw_card(G.yma_forgery_card_sac,G.jokers, 100/1,'up', nil, v)
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
    if G.yma_forgery_card_sac then
        G.yma_forgery_card_sac.states.visible = false
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blockable = false,
            blocking = false,
            delay =  0,
            func = (function() 
                    G.yma_forgery_card_sac:remove()
                    G.yma_forgery_card_sac = nil;
                    G.yma_forgery = nil;
                return true
            end)
        }))
    end
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
end

function update_yma_forgery()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.FORGERY)
        local yma_forgery_exists = not not G.yma_forgery
        G.yma_forgery = G.yma_forgery or UIBox{
            definition = G.UIDEF.yma_forgery(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.yma_forgery.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.yma_forgery.T.y - G.yma_forgery.VT.y) < 3 then
                            -- Back to shop button
                            G.CONTROLLER:snap_to({node = G.yma_forgery:get_UIE_by_ID('shop_button')})
                            -- not loaded from save?
                            G.E_MANAGER:add_event(Event({ func = function() save_run(); return true end}))
                            return true
                        end
                    end}))
                return true
            end
        }))


        G.STATE_COMPLETE = true
    end
end

function G.UIDEF.yma_forgery()
    G.GAME.yma_forgery_text = localize('k_yma_aug_scrap')
    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes={
                    {n=G.UIT.C, config={align = "cm", padding = 0.05}, nodes={
                        {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={								
                            {
                                n = G.UIT.C,
                                config = { align = "cm" },
                                nodes = {
                                    {
                                        n = G.UIT.O,
                                        config = {
                                            object = UIBox({
                                                definition = G.UIDEF.yma_forgery_square(),
                                                config = { align = "cm" },
                                            }),
                                        },
                                    },
                                },
                            },
                            {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                            }},
                            {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 2}, nodes={
                                {n=G.UIT.O, config={object = G.yma_forgery_card_sac}},
                            }},
                        }},
                        {n=G.UIT.R, config={align = "cr", padding = 0.05}, nodes={
                            {n=G.UIT.C, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.RED, button = 'yma_forgery_upgrade', func = 'can_upgrade_joker_yma_aug', hover = true,shadow = true}, nodes = {
                                {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                    {n=G.UIT.T, config={text = localize('k_upgrade_ex'), scale = 0.6, colour = G.C.WHITE, shadow = true}},
                                }}
                            }},
                            {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                            }},
                            {n=G.UIT.C, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.ORANGE, button = 'yma_forgery_select_scrap', func = 'can_scrap_joker_yma_aug', hover = true,shadow = true}, nodes = {
                                {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                    {n=G.UIT.T, config={ref_value = 'yma_forgery_text', ref_table = G.GAME, scale = 0.6, colour = G.C.WHITE, shadow = true}},
                                }}
                            }},
                        }}
                }}
                }
              },
              }, false)
        }}
    return t
end

YMA.TUTORIAL_STATE = 0
function G.UIDEF.yma_forgery_square()
	local tutorial_positions = { 0, 1, 2, 0, 1, 4, 0 }

	local sprite =
		Sprite(0, 0, G.CARD_W * 1.5, G.CARD_H * 1.5, G.ASSET_ATLAS["cbean_yma_squimbo"], { x = 0, y = 0 })
	sprite.states.collide.can = true
	sprite.states.drag.can = false
	sprite.config.speech_bubble_align = { align = "bm", offset = { x = 0, y = 0.1 }, parent = sprite }
	sprite.children.tutorial_text = not G.GAME.seen_medal_tutorial
		and UIBox({
			definition = G.UIDEF.speech_bubble("cbean_yma_forgery_tutorial_" .. YMA.TUTORIAL_STATE, { quip = true }),
			config = sprite.config.speech_bubble_align,
		})
		or nil
	function sprite:hover()
		Node.hover(self)
		if G.GAME.seen_medal_tutorial and YMA.TUTORIAL_STATE == 0 then
			self.children.tutorial_text = UIBox({
				definition = G.UIDEF.speech_bubble("cbean_yma_forgery_tutorial_" .. YMA.TUTORIAL_STATE, { quip = true }),
				config = self.config.speech_bubble_align,
			})
		end
		self:juice_up(0.05, 0.03)
		play_sound('paper1', math.random() * 0.2 + 0.9, 0.35)
	end

	function sprite:stop_hover()
		Node.stop_hover(self)
		if G.GAME.seen_medal_tutorial and YMA.TUTORIAL_STATE == 0 and self.children.tutorial_text then
			self.children.tutorial_text:remove()
			self.children.tutorial_text = nil
		end
	end

	function sprite:say_stuff(n, sprite)
		if n <= 0 then return end
		local new_said = math.random(1, 11)
		while new_said == self.last_said do
			new_said = math.random(1, 11)
		end
		self.last_said = new_said
		play_sound('voice' .. new_said, math.random() * 0.3 + 1.2, 0.5)
		self:juice_up(0.1, 0.1)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			blockable = false,
			blocking = false,
			delay = 0.35,
			func = function()
				self:say_stuff(n - 1)
				return true
			end
		}))
	end

	function sprite:click()
		Node.click(self)
		YMA.TUTORIAL_STATE = (YMA.TUTORIAL_STATE + 1) % 7
		if YMA.TUTORIAL_STATE == 6 then
			G.GAME.seen_medal_tutorial = true
		end
		if self.children.tutorial_text then
			self.children.tutorial_text:remove()
			self.children.tutorial_text = nil
		end
		self.children.tutorial_text = UIBox({
			definition = G.UIDEF.speech_bubble("cbean_yma_forgery_tutorial_" .. YMA.TUTORIAL_STATE, { quip = true }),
			config = self.config.speech_bubble_align,
		})
		self:set_sprite_pos({ x = tutorial_positions[YMA.TUTORIAL_STATE + 1], y = 0 })
		self:say_stuff(3)
	end

	local t = {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{ n = G.UIT.O, config = { object = sprite } },
		},
	}
	return t
end

local function get_rarity(jok)
    if (not jok.config.center.rarity) then return 'N/A' end
    local vanilla = {
        'Common',
        'Uncommon',
        'Rare',
        'Legendary'
    }
    return vanilla[jok.config.center.rarity] or jok.config.center.rarity
end

local function get_medal(jok)
    local rarity = get_rarity(jok)
    if rarity == 'Common' then
        return 'cbean_yma_common'
    end
    if rarity == 'Uncommon' then
        return 'cbean_yma_uncommon'
    end
    if rarity == 'Rare' then
        return 'cbean_yma_rare'
    end
    if rarity == 'Legendary' then
        return 'cbean_yma_legendary'
    end
end

G.FUNCS.can_scrap_joker_yma_aug = function(e)
    if (not G.yma_forgery_card_sac) then return end
    if (#G.yma_forgery_card_sac.cards < 1) or G.CONTROLLER.locks.yma_aug_scrap then 
        if (#G.jokers.highlighted == 1) and get_medal(G.jokers.highlighted[1]) then
            e.config.colour = G.C.ORANGE
            e.config.button = 'yma_forgery_select_scrap'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
        G.GAME.yma_forgery_text = localize('k_yma_aug_scrap')
    elseif #G.yma_forgery_card_sac.cards == 1 then
        e.config.colour = G.C.ORANGE
        e.config.button = 'yma_forgery_unselect_scrap'
        G.GAME.yma_forgery_text = localize('b_back')
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.can_upgrade_joker_yma_aug = function(e)
    if (not G.yma_forgery_card_sac) then return end
    if  G.CONTROLLER.locks.yma_aug_scrap then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    elseif (#G.yma_forgery_card_sac.cards == 1) and (#G.jokers.highlighted == 1) and (not (G.jokers.highlighted[1]).yma_medal) then
        e.config.colour = G.C.RED
        e.config.button = 'yma_forgery_upgrade'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.yma_forgery_select_scrap = function (e)
    local jokertomove = G.jokers.highlighted[1];
    draw_card(G.jokers, G.yma_forgery_card_sac, 100,'up', nil, jokertomove,  0.08)
end

G.FUNCS.yma_forgery_unselect_scrap = function (e)
    local jokertomove = G.yma_forgery_card_sac.cards[1];
    draw_card(G.yma_forgery_card_sac, G.jokers, 100,'up', nil, jokertomove,  0.08)
end

G.FUNCS.yma_forgery_upgrade = function (e)
    local medal = get_medal(G.yma_forgery_card_sac.cards[1])
    local joker = G.jokers.highlighted[1]
    G.CONTROLLER.locks.yma_aug_scrap = true

    local percent = 0.85 + (1-0.999)/(1-0.998)*0.3
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() joker:flip();play_sound('tarot2', percent, 0.6);return true end }))

    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() SMODS.destroy_cards(G.yma_forgery_card_sac.cards[1]);joker:yma_set_medal(medal);return true end }))
    
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() joker:flip();play_sound('tarot2', percent, 0.6);joker:juice_up(0.3, 0.3);G.CONTROLLER.locks.yma_aug_scrap = false;return true end }))
end