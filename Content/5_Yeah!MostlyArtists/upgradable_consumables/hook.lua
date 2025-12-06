
-- upgrade my consumables
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local abc = G_UIDEF_use_and_sell_buttons_ref(card)
    if (card.area == G.consumeables and G.consumeables) and not card.debuff then
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "sell_card",
                        func = "can_sell_card",
                        handy_insta_action = "sell",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_sell"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card,
                                                ref_value = "sell_cost_label",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        use = 
        {
            n = G.UIT.C, 
            config = { align = "cr" }, 
            nodes = {
                { 
                    n = G.UIT.C, 
                    config ={
                        ref_table = card, 
                        align = "cr",
                        maxw = 1.25,
                        padding = 0.1, 
                        r=0.08, 
                        minw = 1.25, 
                        minh = (card.area and card.area.config.type == 'joker') and 0 or 1,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = 'use_card', 
                        func = 'can_use_consumeable'}, 
                        nodes={
                            {n=G.UIT.B,
                            config = {w=0.1,h=0.6}},
                            {n=G.UIT.T, 
                            config={text = localize('b_use'),
                            colour = G.C.UI.TEXT_LIGHT, 
                            scale = 0.55, 
                            shadow = true}}
          }}
        }}
        upgrade = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "upgrade",
                        func = "can_upgrade",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = "Upgrade",
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                --ref_table = card,
                                                --ref_value = "upgradecost",
                                                text = "5",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { padding = 0, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            sell,
                        } },
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            use,
                        } },
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            upgrade,
                        } },
                    },
                },
            },
        }
    end
    return abc
end

local upgrading = false

G.FUNCS.can_upgrade = function(e)
    if to_big(G.GAME.dollars - G.GAME.bankrupt_at) >= to_big(5) and not upgrading and not G.CONTROLLER.locked then
        e.config.colour = G.C.GREEN
        e.config.button = "upgrade"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end


G.FUNCS.upgrade = function(e)
    local ref = e.config.ref_table
    --ease_dollars(-ref.ability.upgradecost)
    ease_dollars(-5)
    print(G.consumeables.highlighted[1].config.center.key)
    SMODS.add_card({ set = 'Consumeable', key = "c_cbean_yma_magician_level1" })
    G.consumeables.highlighted[1]:start_dissolve(nil, true)
end