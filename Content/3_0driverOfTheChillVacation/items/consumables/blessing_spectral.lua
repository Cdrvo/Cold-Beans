SMODS.Consumable {
    key = '0chill_cronus',
    set = "Spectral",
    hidden = true,
    soul_set = "sdown_blessing",
    atlas = '0chill_spectral_atlas',
    cost = 8,
    pos = { x = 1, y = 0},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.times_left,
                card.ability.extra.gain,
            },
        }
    end,
    config = {
        extra = {
            times_left = 5,
            should_tick_down = false,
            gain = 3
        }
    },
    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'sdown_blessing' then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "times_left",
                    scalar_value = "gain",
                })
        end
        if context.end_of_round and not context.game_over and context.main_eval then
            for _,consumeable in ipairs(G.consumeables.cards) do
                if consumeable.ability.set == 'sdown_blessing' then
                    card.should_tick_down = true
                end
            end
            if card.should_tick_down then
                card.should_tick_down = false
                card.ability.extra.times_left = card.ability.extra.times_left - 1
            end
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            --else
                --return {
                    --message = (card.ability.extra.times_left)
                --}
            end
        end
    end,
    select_card = "consumeables",
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "cmykl",
        code = "MarioFan597",
    },
}

-- Removes the USE button from Blessings. Directly taken and modifed from the implmentation for keys
local sell_use_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    if not card or not card.ability or ( card.config.center.key ~= "c_cbean_0chill_cronus")  then
        return sell_use_ref(card)
    end

    local sell = {
        n = G.UIT.C,
        config = { align = "cr" },
        nodes = {
            {
                n = G.UIT.C,
                config = { ref_table = card, align = "cr", padding = 0.1, r = 0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card' },
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
                                    { n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                                }
                            },
                            {
                                n = G.UIT.R,
                                config = { align = "cm" },
                                nodes = {
                                    { n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4, shadow = true } },
                                    { n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55, shadow = true } }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    if card.area == G.pack_cards and G.pack_cards then
        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.R,
                    config = { ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5 * card.T.w - 0.15, maxw = 0.9 * card.T.w - 0.15, minh = 0.3 * card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_select_card' },
                    nodes = {
                        { n = G.UIT.T, config = { text = localize('b_select'), colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true } }
                    }
                }
            }
        }
    end

    return {
        n = G.UIT.ROOT,
        config = { padding = 0, colour = G.C.CLEAR },
        nodes = {
            {
                n = G.UIT.C,
                config = { padding = 0.15, align = 'cl' },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { sell }
                    }
                }
            }
        }
    }
end