G.STATES.AUGMENTATION = 82398283798298

function G.UIDEF.augment_sprite()
  
	local sprite_alley = G.ASSET_ATLAS and AnimatedSprite(0, 0, (113*0.113)*0.2, (71*0.057)*0.2, G.ANIMATION_ATLAS[yma_can_access_location("augmentation")  and "cbean_pboys_backalley_shop" or "cbean_NAMETEAM_closed"], { x = 0, y = 0 }) or nil
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

G.FUNCS.show_yma_augmentation = function(e)
  stop_use()
  hide_location(G.main_street)

  G.yma_augmentation_card_sac = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(10*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = 1, type = 'consumeable', highlight_limit = 1})
  
  G.STATE = G.STATES.AUGMENTATION
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
  show_location(G.yma_augmentation)
end

G.FUNCS.hide_yma_augmentation = function(e)
    stop_use()
	hide_location(G.yma_augmentation)
    if G.yma_augmentation_card_sac then
        if #G.yma_augmentation_card_sac.cards > 0 then
            for k, v in pairs(G.yma_augmentation_card_sac.cards) do 
                draw_card(G.yma_augmentation_card_sac,G.jokers, 100/1,'up', nil, v)
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
    if G.yma_augmentation_card_sac then
        G.yma_augmentation_card_sac.states.visible = false
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            blockable = false,
            blocking = false,
            delay =  0,
            func = (function() 
                    G.yma_augmentation_card_sac:remove()
                    G.yma_augmentation_card_sac = nil;
                return true
            end)
        }))
    end
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
end

function update_yma_augmentation()
    if not G.STATE_COMPLETE then
        stop_use()
        ease_background_colour_blind(G.STATES.AUGMENTATION)
        local yma_augmentation_exists = not not G.yma_augmentation
        G.yma_augmentation = G.yma_augmentation or UIBox{
            definition = G.UIDEF.yma_augmentation(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.yma_augmentation.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.yma_augmentation.T.y - G.yma_augmentation.VT.y) < 3 then
                            -- Back to shop button
                            G.CONTROLLER:snap_to({node = G.yma_augmentation:get_UIE_by_ID('shop_button')})
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

function G.UIDEF.yma_augmentation()
    G.GAME.yma_augmentation_text = localize('k_yma_aug_scrap')
    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.BLACK}, nodes={
                    {n=G.UIT.C, config={align = "cm", padding = 0.05}, nodes={
                        {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                            {n=G.UIT.C, config={align = "cm", padding = 0.2, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 2}, nodes={
                                {n=G.UIT.O, config={object = G.yma_augmentation_card_sac}},
                            }},
                        }},
                        {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                            {n=G.UIT.C, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.SECONDARY_SET.yma_keys, button = 'yma_augmentation_upgrade', func = 'can_upgrade_joker_yma_aug', hover = true,shadow = true}, nodes = {
                                {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                    {n=G.UIT.T, config={text = localize('k_upgrade_ex'), scale = 0.6, colour = G.C.WHITE, shadow = true}},
                                }}
                            }},
                            {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                            }},
                            {n=G.UIT.C, config={align = "cm", minw = 2.8, minh = 1.6, r=0.15,colour = G.C.SECONDARY_SET.yma_keys, button = 'yma_augmentation_select_scrap', func = 'can_scrap_joker_yma_aug', hover = true,shadow = true}, nodes = {
                                {n=G.UIT.R, config={align = "cm", maxw = 2.5}, nodes={
                                    {n=G.UIT.T, config={ref_value = 'yma_augmentation_text', ref_table = G.GAME, scale = 0.6, colour = G.C.WHITE, shadow = true}},
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
    if (not G.yma_augmentation_card_sac) then return end
    if (#G.yma_augmentation_card_sac.cards < 1) or G.CONTROLLER.locks.yma_aug_scrap then 
        if (#G.jokers.highlighted == 1) and get_medal(G.jokers.highlighted[1]) then
            e.config.colour = G.C.SECONDARY_SET.yma_keys
            e.config.button = 'yma_augmentation_select_scrap'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
        G.GAME.yma_augmentation_text = localize('k_yma_aug_scrap')
    elseif #G.yma_augmentation_card_sac.cards == 1 then
        e.config.colour = G.C.SECONDARY_SET.yma_keys
        e.config.button = 'yma_augmentation_unselect_scrap'
        G.GAME.yma_augmentation_text = localize('b_back')
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.can_upgrade_joker_yma_aug = function(e)
    if (not G.yma_augmentation_card_sac) then return end
    if  G.CONTROLLER.locks.yma_aug_scrap then 
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    elseif (#G.yma_augmentation_card_sac.cards == 1) and (#G.jokers.highlighted == 1) and (not (G.jokers.highlighted[1]).yma_medal) then
        e.config.colour = G.C.SECONDARY_SET.yma_keys
        e.config.button = 'yma_augmentation_upgrade'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.yma_augmentation_select_scrap = function (e)
    local jokertomove = G.jokers.highlighted[1];
    draw_card(G.jokers, G.yma_augmentation_card_sac, 100,'up', nil, jokertomove,  0.08)
end

G.FUNCS.yma_augmentation_unselect_scrap = function (e)
    local jokertomove = G.yma_augmentation_card_sac.cards[1];
    draw_card(G.yma_augmentation_card_sac, G.jokers, 100,'up', nil, jokertomove,  0.08)
end

G.FUNCS.yma_augmentation_upgrade = function (e)
    local medal = get_medal(G.yma_augmentation_card_sac.cards[1])
    local joker = G.jokers.highlighted[1]
    G.CONTROLLER.locks.yma_aug_scrap = true

    local percent = 0.85 + (1-0.999)/(1-0.998)*0.3
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() joker:flip();play_sound('tarot2', percent, 0.6);return true end }))

    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() SMODS.destroy_cards(G.yma_augmentation_card_sac.cards[1]);joker:yma_set_medal(medal);return true end }))
    
    G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() joker:flip();play_sound('tarot2', percent, 0.6);joker:juice_up(0.3, 0.3);G.CONTROLLER.locks.yma_aug_scrap = false;return true end }))
end