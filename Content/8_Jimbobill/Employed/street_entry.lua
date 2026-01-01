G.STATES.EMPLOY = 42676980085

G.FUNCS.show_employ = function(e)
    stop_use()
    hide_location(G.main_street)

    G.jbill_employed_area = CardArea(
        0, 0, G.jokers.T.w, G.jokers.T.h, 
        {
            card_limit = 5,
            type = 'joker',
            highlight_limit = 1,
            no_card_count = true
        })
    for k, v in pairs(G.P_CENTER_POOLS.Employed) do
        SMODS.add_card({key = v.key, area = G.jbill_employed_area})
    end
    

    G.STATE_COMPLETE = false
    G.STATE = G.STATES.EMPLOY

    local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    ease_background_colour_blind(G.STATE)
    sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_pboys_backalley_shop"]
    G.hand.states.visible = false
    sign_sprite.states.visible = true
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.jbill_employed_screen)
end

G.FUNCS.hide_employ = function(e)
    stop_use()
	hide_location(G.jbill_employed_screen)
    
	G.STATE = G.STATES.MAIN_STREET
	G.STATE_COMPLETE = false
    
	local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
    local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATES.MAIN_STREET)
	sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
    sign_sprite.states.visible = false
    sign_text = DynaText({string = {''}, colours = {lighten(G.C.BLACK, 0.3)},shadow = true, rotate = true, float = true, bump = true, scale = 0.5, spacing = 1, pop_in = 1.5, maxw = 4.3})
    G.dreamlands_consumeable_card_holder.states.visible = false
    G.SHOP_SIGN.UIRoot.UIBox:recalculate()
    show_location(G.main_street)
end


function update_jbill_employed()
    if not G.STATE_COMPLETE then
        stop_use()
        local employ_exists = not not G.jbill_employed_screen
        G.jbill_employed_screen = G.jbill_employed_screen or UIBox{
            definition = G.UIDEF.jbill_employed(),
            config = {align='tmi', offset = {x=0,y=G.ROOM.T.y+20},major = G.hand, bond = 'Weak'}
        }
        G.E_MANAGER:add_event(Event({
            func = function()
                G.jbill_employed_screen.alignment.offset.y = -5.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    blockable = false,
                    func = function()
                        if math.abs(G.jbill_employed_screen.T.y - G.jbill_employed_screen.VT.y) < 3 then
                            local nosave_balley = nil 
                            G.CONTROLLER:snap_to({node = G.jbill_employed_screen:get_UIE_by_ID('shop_button')})
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

function G.UIDEF.jbill_employed()
    local t = {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", colour = G.C.CLEAR, minw = 1, minh = 1, padding = 0.3}, nodes = {
                    {n=G.UIT.R, config={align = "cm", colour = G.C.CLEAR, minw = 1, minh = 1}, nodes = {
                        {n=G.UIT.T, config={align = "cm", text = "Meet our specialists!", scale = 1, colour = G.C.UI.TEXT_LIGHT, minw = 1, minh = 1}}}},
                    {n=G.UIT.R, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.DYN_UI.BOSS_MAIN, minw = 1, minh = 1,}, nodes={
                        {n=G.UIT.O, config={align = "cm", padding = 0.05, object = G.jbill_employed_area, minw = 1, minh = 1}}}},
                    {n=G.UIT.R, config={align = "br", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.CLEAR, minw = 1, minh = 3}, nodes={
                        {n=G.UIT.R, config={align = "br", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.DYN_UI.BOSS_MAIN, minw = 1, minh = 1}, nodes={
                            {n=G.UIT.R, config={align = "br", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.L_BLACK, minw = 1, minh = 1}, nodes={
                                {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'jimbux', prefix = 'J'}}, colours = {G.C.GREEN}, font = G.LANGUAGES['en-us'].font, shadow = true, spacing = 2, bump = true, scale = 1})}}}}}}}}
                }}
            })
        }}
    return t
end