SMODS.Joker {
    key = "0chill_vacation",
    atlas = "0chill_joker_atlas",
    pos = { x = 0, y = 4 },
    rarity = 3,
    order = 1,
    blueprint_compat = true,
    cost = 9,
    config = { 
        immutable = {
            ---------------------- What every combo card needs
            combo_type = "starter",
            sequence = 0, 
            ----------------------
            member = 0, --Keeps track of which effect is active
        },
        extra = {
            cmykl_mult = 1.5,
            CapitalChirp_mult = 4,
            CapitalChirp_num = 1,
            CapitalChirp_denom = 39,           
            restruct_mult = 1.605835806,
            InspectorB_dollars = 0,
            InspectorB_dollar_small = 1,
            InspectorB_dollar_large = 3,
        },
    },
    loc_vars = function(self, info_queue, card) --Modifed From Yeah! Mostly artist Joker 
         if card.ability.immutable.member == 3 then
            info_queue[#info_queue + 1] = { key = 'tag_cbean_0chill_combo', set = 'Tag' }
        end
        if card.ability.immutable.member == 4 then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_cbean_sd_frozen
            info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        end
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.CapitalChirp_num, card.ability.extra.CapitalChirp_denom, "Vacation")
        return {
            key = self.key .. '_member' .. tostring(card.ability.immutable.member),
            vars = {
                colours = { 
                    G.C.RED,
                    G.C.SUITS.Diamonds,
                    G.C.UI.TEXT_INACTIVE,
                    G.C.SECONDARY_SET.Tarot,

                },
                card.ability.extra.cmykl_mult,
                card.ability.extra.CapitalChirp_mult,
                card.ability.extra.CapitalChirp_num,
                card.ability.extra.CapitalChirp_denom,
                card.ability.extra.restruct_mult,
                card.ability.extra.InspectorB_dollars,
                card.ability.extra.InspectorB_dollar_small,
                card.ability.extra.InspectorB_dollar_large
            }
        }
    end,

    load = function(self, card, card_table, other_card) --Modifed from Yeah! Mostly artist Joker
        G.E_MANAGER:add_event(Event({
            func = function()
                card.children.center:set_sprite_pos({x = card.ability.immutable.member, y = 4})
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.individual
        and context.cardarea == G.play
        and card.ability.immutable.sequence > 0
        and card.ability.immutable.member == 0 then --Cmykl's Effect
        local temp_rank = 1
            for i = 1, #context.scoring_hand do
                if temp_rank <= context.scoring_hand[i]:get_id()  then
                    temp_rank = context.scoring_hand[i]:get_id()
                end
            end
            if context.other_card:get_id() == temp_rank then
                return {
                    xmult = card.ability.extra.cmykl_mult
                }
            end
        end

        if context.individual
        and context.cardarea == G.play
        and card.ability.immutable.sequence > 0
        and card.ability.immutable.member == 1 then --Capital Chirps's Effect
            if context.other_card:is_suit('Hearts') then
                if SMODS.pseudorandom_probability(card, "0drivers4ever", card.ability.extra.CapitalChirp_num, card.ability.extra.CapitalChirp_denom) then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = function()
                            play_sound("timpani")
                            local new_card = SMODS.create_card({set = 'Planet', area = G.consumables, edition = 'e_negative'})
                            new_card:add_to_deck()
                            G.consumeables:emplace(new_card)
                            G.GAME.consumeable_buffer = 0
                            new_card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end

                if (card.ability.extra.CapitalChirp_num <= 39) then
                    card.ability.extra.CapitalChirp_num = card.ability.extra.CapitalChirp_num + 1
                end
                return {
                    mult = card.ability.extra.CapitalChirp_mult
                }
            end
        end

        if context.individual
        and context.cardarea == G.play
        and card.ability.immutable.sequence > 0
        and card.ability.immutable.member == 2 then --InspectorB's Effect
            card.ability.extra.InspectorB_dollars = 0
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 13 then
                card.ability.extra.InspectorB_dollars = card.ability.extra.InspectorB_dollars + card.ability.extra.InspectorB_dollar_large
            else
                card.ability.extra.InspectorB_dollars = card.ability.extra.InspectorB_dollars + card.ability.extra.InspectorB_dollar_small
            end
            return {
                dollars = card.ability.extra.InspectorB_dollars
            }
        end

        if context.final_scoring_step
        and (hand_chips * mult > G.GAME.blind.chips)
        and not card.debuff and card.ability.immutable.sequence > 0 
        and card.ability.immutable.member == 3 then --MarioFan597's Effect
            --print("Here")
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_cbean_0chill_combo'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
        end

        if context.joker_main
        and card.ability.immutable.sequence > 0
        and card.ability.immutable.member == 4 then --restruct1225's Effect
            return {
                xmult = card.ability.extra.restruct_mult
            }
        end
        
        if context.after
        and context.cardarea == G.jokers
        and (#G.hand.cards >= 1)
        and card.ability.immutable.sequence > 0
        and card.ability.immutable.member == 4 then --Still restruct's effect
            local eligiblecards = {} --Modifed from cryptid sus
            for k, v in pairs(G.hand.cards) do
                if v.edition and v.edition.cbean_sd_frozen then
                    --print(v)
                    table.insert(eligiblecards, v)
                end
            end
            if #eligiblecards > 0 then
                G.E_MANAGER:add_event(Event({
                    trigger = "before",
                    delay = 1.25,
                    func = function()
                        for k, v in pairs(eligiblecards) do
                            v:set_ability('m_steel', nil, true)
                            card:juice_up(0.5, 0.5)
                        end
                        play_sound("cbean_0chill_pipe")
                        return true
                    end,
                }))                    
            end
        end

        if context.after
        and context.scoring_hand
        and card.ability.immutable.sequence > 0
        and card.ability.immutable.member == 5 then -- Monachrome's effect

            local scored = {}

            -- Track which cards scored
            for _, c in ipairs(context.scoring_hand) do
                scored[c] = true
            end

            -- Take a snapshot of played cards
            local to_check = {}
            for _, c in ipairs(G.play.cards) do
                table.insert(to_check, c)
            end

            -- Destroy unscored played cards
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0,
                func = function()
                    for _, c in ipairs(to_check) do
                        if not scored[c] then
                            c:start_dissolve()
                            c:remove()
                        end
                    end
                    return true
                end
            }))
        end

        if context.after and not context.blueprint and card.ability.immutable.sequence > 0 then 
            --Makes sure it is a different person then last time
            G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 1.25,
                        func = function()
                            local temp_select = 5
                            repeat 
                                temp_select = math.random(0,5)
                            until temp_select ~= card.ability.immutable.member
                            card.ability.immutable.member = temp_select
                            card.children.center:set_sprite_pos({x = card.ability.immutable.member, y = 4})
                            return true
                        end,
                    }))

            --Resets the Joker so that it can be used in the next combo
            card.ability.immutable.sequence = 0
            return{
                message = localize('k_cbean_0chill_formation_ex'),
                no_juice = true
            }

        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"Everyone"},
        art =  "cmykl",
        code = {"MarioFan597",
        "Inspector"},
    }
}

--This was taken and modifed straight from entropy
--Used on the vacation joker to activate combo moves
--This was taken and modifed straight from entropy
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local abc = G_UIDEF_use_and_sell_buttons_ref(card)
    if (card.area == G.jokers and G.jokers and card.config.center.key == "j_cbean_0chill_vacation") and not card.debuff and not G.CONTROLLER.locked then --Gives buttons to entropic marble Joker
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = { --Default Sell Button
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
        combo_button = { --Our new button that activates the card
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = { --Button to Sell Stone Cards
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
                        button = "use_combo",
                        func = "can_use_combo",
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
                                                text = localize("b_use"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.6,
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
            config = { padding = 0.0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { padding = 0.1, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            sell,
                        } },
                        {
                            n = G.UIT.R,
                            config = { align = "cl" },
                            nodes = {
                                combo_button,
                            },
                        },
                    },
                },
            },
        }
    end
    return abc
end


G.FUNCS.can_use_combo = function(e) --Last part of the condition past the second and is the standard consumable restruction
    if G.GAME.blind.in_blind and CanCombo(e.config.ref_table) and not (not skip_check and ((G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))) then
        --print("Yes")
        e.config.colour = G.C.RED
        e.config.button = "can_combo"
    elseif G.GAME.blind.in_blind and CanUncombo(e.config.ref_table) and not (not skip_check and ((G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0))) then
        --print("Yes")
        e.config.colour = G.C.RED
        e.config.button = "can_uncombo"
    else
        --print("Nope")
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end


G.FUNCS.can_combo = function(e)
    --print("Tried Selecting Combo")
    SelectCombo(e.config.ref_table)
end

G.FUNCS.can_uncombo = function(e)
    --print("Tried Unselecting Combo")
    UnselectCombo(e.config.ref_table)
end