jbill_create_card_selector = function(amount, type)
G.jbill_card_selector = {}
G.jbill_card_selector.amount_selected = 0
G.jbill_card_selector.amount_selectable = amount
G.jbill_card_selector.type = type
    local suits = {}
    local areas = {}
    for k, v in pairs(G.playing_cards) do
        if v.area ~= G.jbill_card_selector then
            local contained = false
            local current_suit = v.base.suit
            for k, v in pairs(suits) do
                if v == current_suit then
                    contained = true
                end
            end
            if not contained then
                table.insert(suits, current_suit)
            end
        end
    for k, v in pairs(suits) do
        if not G.jbill_card_selector[v] then
            G.jbill_card_selector[v] = CardArea(0, 0, G.CARD_W * (8 + 0.1), (G.CARD_H/2) * 1.1, {
            card_limit = 0,
            view_deck = false,
            type = "hand",
            no_card_count = true
            })
            areas[#areas+1] = {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                                    {n=G.UIT.O, config={object = G.jbill_card_selector[v] }}
                            }}
        end
        end
    end
    for k, v in pairs(G.playing_cards) do
        if v.area ~= G.jbill_card_selector then
            local copy = copy_card(v)
            copy.ref = v
            copy.T.w = v.T.w/2
            copy.T.h = v.T.h/2
            G.jbill_card_selector[v.base.suit]:emplace(copy)
        end
    end
        G.FUNCS.overlay_menu({
            definition = create_UIBox_generic_options({
                contents = {
                    { n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.CLEAR }, nodes = {
                    { n = G.UIT.C, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = areas }}}}
            })
        })
end

ease_jimbux = function (amount)
    G.GAME.jimbux = G.GAME.jimbux + amount
end

function G.FUNCS.recalc(e)
    e.parent.UIBox:recalculate()
end

function G.FUNCS.employed_update_use(e)
    if e.config.ref_table.config.center.set == "Employed" then
        if e.config.ref_table.config.center.type == "chicot" and G.GAME.CEO_beaten_employment then
            e.config.button = "employed_button_use"
            e.config.colour = G.C.GREEN
        elseif e.config.ref_table.config.center.type == "perkeo" and #G.consumeables.cards < G.consumeables.config.card_limit and G.consumeables and G.consumeables.highlighted and #G.consumeables.highlighted == 1 and G.GAME.jimbux >= 3 then
            e.config.button = "employed_button_use"
            e.config.colour = G.C.GREEN
        elseif e.config.ref_table.config.center.type == "canio" and G.GAME.jimbux >= 2 then
            e.config.button = "employed_button_use"
            e.config.colour = G.C.GREEN
        elseif e.config.ref_table.config.center.type == "yorick" and G.GAME.jimbux >= 2 then
            e.config.button = "employed_button_use"
            e.config.colour = G.C.GREEN
        elseif e.config.ref_table.config.center.type == "triboulet" and G.GAME.jimbux >= 2 then
            e.config.button = "employed_button_use"
            e.config.colour = G.C.GREEN
        else
            e.config.button = nil
            e.config.colour = G.C.BLACK
        end
    end
end

function G.FUNCS.employed_button_use(e)
    if e.config.ref_table.config.center.type == "chicot" then
        ease_jimbux(5)
        G.GAME.CEO_beaten_employment = false
        e.config.ref_table:highlight(false)
    end
    if e.config.ref_table.config.center.type == "perkeo" then
        local copy = copy_card(G.consumeables.highlighted[1])
        G.consumeables:emplace(copy)
        ease_jimbux(-3)
        e.config.ref_table:highlight(false)
    end
    if e.config.ref_table.config.center.type == "canio" then
        ease_jimbux(-2)
        jbill_create_card_selector(1, "canio")
        e.config.ref_table:highlight(false)
    end
    if e.config.ref_table.config.center.type == "yorick" then
        ease_jimbux(-1)
        jbill_create_card_selector(3, "yorick")
    end
    if e.config.ref_table.config.center.type == "triboulet" then
        ease_jimbux(-1)
        jbill_create_card_selector(2, "triboulet")
        e.config.ref_table:highlight(false)
    end
end

function G.FUNCS.selector_butt(e)
    local Card = e.parent.parent.parent.parent
    local apply = Card.ref
    if G.jbill_card_selector.type == "canio" then
        SMODS.destroy_cards(apply)
        SMODS.destroy_cards(Card)
    elseif
    G.jbill_card_selector.type == "yorick" then
        Card.T.w = Card.T.w*2
        Card.T.h = Card.T.h*2
        Card:add_sticker('cbean_banished', true)
        Card.T.w = Card.T.w/2
        Card.T.h = Card.T.h/2
        apply:add_sticker('cbean_banished', true)
    elseif
    G.jbill_card_selector.type == "triboulet" then
        Card:add_sticker('cbean_jaded', true)
        apply:add_sticker('cbean_jaded', true)
    end
    G.jbill_card_selector.amount_selected = G.jbill_card_selector.amount_selected + 1
    if G.jbill_card_selector.amount_selectable <= G.jbill_card_selector.amount_selected then
        G.FUNCS.exit_overlay_menu()
    end
end

G.FUNCS.leak_booster = function(e)
    G.GAME.booster_leaked = true
    G.GAME.pack_choices = G.GAME.real_choices
    G.GAME.refund = 0
end