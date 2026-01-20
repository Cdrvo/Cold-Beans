SMODS.ConsumableType{
    key = "Consumables2",
    primary_colour = HEX("FFD800"), 
    secondary_colour = HEX("FFD800"),
    text_colour = HEX('4f6367'), --0chill here. Making the text black for readabiity 
    collection_rows = { 5, 5 },
    shop_rate = 0,
    loc_txt = {
        name = "Consumable^2",
        collection = "Consumable^2",
        undiscovered = {
            name = "Not Discovered^2",
            text = {
                "Purchase this card^2",
                "in an unseeded",
                "run^2 to learn",
                "what it does"
            }
        }
    },
}

-- Hi, HuyTheKiller from Pissboys here
-- I just don't like undiscovered sprites not being used or being used inappropriately ;p
SMODS.UndiscoveredSprite {
    key = "Consumables2",
    atlas = "jbill_consume2",
    pos = { x = 5, y = 1 },
    no_overlay = true
}

SMODS.Consumable {
    key = "jbill_tarot",
    set = "Consumables2",
    corresponding_set = "Tarot",
    atlas = "jbill_consume2",
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 3, mod_conv = "m_cbean_jbill_bean" },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize{ type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}


SMODS.Consumable {
    key = "jbill_planet",
    set = "Consumables2",
    corresponding_set = "Planet",
    atlas = "jbill_consume2",
    cost = 5,
    pos = { x = 1, y = 0 },
    can_use = function(self, card)
        if G.GAME.last_hand_played ~= nil then
            return true
        end
    end,
    use = function (self, card, area)
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played then
                _played = hand.played
                _handname = hand_key
            end
        end
        local most_played = _handname --yes that is completely copied from vremade lol. I thought there was a global for that
        SMODS.smart_level_up_hand(card, most_played, nil, 1)
        SMODS.smart_level_up_hand(card, G.GAME.last_hand_played, nil, 1)
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Consumable {
    key = "jbill_spectral",
    set = "Consumables2",
    corresponding_set = "Spectral",
    atlas = "jbill_consume2",
    cost = 6,
    pos = { x = 2, y = 0 },
    can_use = function(self, card)
        return true
    end,
    use = function (self, card, area)
        local cards = {}
        for k, v in pairs(G.hand.cards) do
            cards[#cards+1] = v
        end
        local amount = math.ceil(#cards/2)
        pseudoshuffle(cards)
        print(amount)
        for k, v in pairs(cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after", 
                delay = 1, 
                func = function() 
                    v:juice_up()
                    v:set_ability(SMODS.poll_enhancement({guaranteed = true})) 
                    return true 
                end
            }))
            if amount > 0 then
                SMODS.destroy_cards(v, nil, nil, true)
                amount = amount - 1
            end
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Consumable {
    key = "jbill_blessing",
    set = "Consumables2",
    corresponding_set = "sdown_blessing",
    atlas = "jbill_consume2",
    pos = { x = 3, y = 0 },
    cost = 5,
    config = { extra = { mult = 1, uses = 10} },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.uses } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
            card.ability.extra.uses = card.ability.extra.uses - 1
            if card.ability.extra.uses <= 0 then
                card.ability.extra.mult = 0
                card:start_dissolve()
            end
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end,
    can_use = function(self, card)
        return false
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Consumable {
    key = "jbill_zodiac",
    set = "Consumables2",
    corresponding_set = "sdown_czodiac",
    atlas = "jbill_consume2",
    cost = 4,
    pos = { x = 0, y = 1 },
    config = {max_highlighted = 3, min_highlighted = 3 },
    use = function (self, card, area)
        local rightmost = G.hand.highlighted[1]
        local string = false
        for i = 1, #G.hand.highlighted do
            if G.hand.highlighted[1].T.x < G.hand.highlighted[i].T.x then
                rightmost = G.hand.highlighted[i]
            end
        end
        local rightmost_rank = rightmost:get_id()
        if rightmost_rank == 14 then
            rightmost_rank = "Ace"
            string = true
        elseif rightmost_rank == 13 then
            rightmost_rank = "King"
            string = true
        elseif rightmost_rank == 12 then
            rightmost_rank = "Queen"
            string = true
        elseif rightmost_rank == 11 then
            rightmost_rank = "Jack"
            string = true
        end
        for i = 1, #G.hand.highlighted do
            if not string then
                assert(SMODS.change_base(G.hand.highlighted[i], nil, ""..rightmost_rank))
            else
                assert(SMODS.change_base(G.hand.highlighted[i], nil, rightmost_rank))
            end
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "ZayDerg"
    }
}

SMODS.Consumable {
    key = "jbill_combo",
    set = "Consumables2",
    corresponding_set = "Combo",
    atlas = "jbill_consume2",
    cost = 4,
    pos = { x = 1, y = 1 },
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    can_use = function(self, card)
        if (G.consumeables.config.card_limit - #G.consumeables.cards) >= 1 then
            return true
        end
    end,
    use = function(self, card, area, copier)
        local starter_pool = {}
        local finisher_pool = {}
        for k, v in pairs(G.P_CENTER_POOLS["Combo"]) do
            if v.config.immutable.combo_type == "starter" then
                starter_pool[#starter_pool+1] = v.key
            end
            if v.config.immutable.combo_type == "finisher" then
                finisher_pool[#finisher_pool+1] = v.key
            end
        end
        local chosen_starter = pseudorandom_element(starter_pool, "jbill_combo")
        local chosen_finisher = pseudorandom_element(finisher_pool, "jbill_combo")
        SMODS.add_card({key = chosen_starter})
        SMODS.add_card({key = chosen_finisher})
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Consumable {
    key = "jbill_key",
    set = "Consumables2",
    corresponding_set = "yma_keys",
    atlas = "jbill_consume2",
    cost = 5,
    pos = { x = 2, y = 1 },
    calculate = function(self, card, context)
        if context.starting_shop then
            local key = SMODS.create_card({set = "yma_keys" })
            create_shop_card_ui(key)
            G.shop_jokers:emplace(key)
        end
        if context.end_of_round and context.game_over == false and context.main_eval and (G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo") then
            card:start_dissolve()
        end
    end,
    can_use = function(self, card)
        return false
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Consumable {
    key = "jbill_sheet",
    set = "Consumables2",
    corresponding_set = "cbean_StickerSheet",
    atlas = "jbill_consume2",
    cost = 5,
    pos = { x = 3, y = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_stick2"}
        return {}
    end,
    can_use = function(self, card)
        if #G.jokers.highlighted == 1 then
            if not G.jokers.highlighted[1].ability.jbill_stick2 then
                return true
            end
        end
    end,
    use = function(self, card, area)
    local affected_card = G.jokers.highlighted[1]
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            play_sound("gold_seal", 2, 0.75)
            affected_card:add_sticker("cbean_jbill_stick2", true)
            card:juice_up(0.3, 0.5)
            affected_card:juice_up()
            return true
        end
        }))
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "ZayDerg."
    }
}

SMODS.Consumable {
    key = "jbill_meta",
    set = "Consumables2",
    corresponding_set = "Consumables2",
    atlas = "jbill_consume2",
    cost = 6,
    pos = { x = 4, y = 1 },
    config = {extra = { set = nil }},
    loc_vars = function(self, info_queue, card)
        return {}
    end,
    can_use = function(self, card)
        for i = 1, #G.consumeables.cards do
            if G.consumeables.cards[i] == card and G.consumeables.cards[i-1] then
                card.ability.extra.set = G.consumeables.cards[i-1].config.center.set
                for k, v in pairs(G.P_CENTER_POOLS["Consumables2"]) do
                    if v.corresponding_set == card.ability.extra.set then
                        return true
                    end
                end
            end
        end
    end,
    use = function(self, card, area)
        for k, v in pairs(G.P_CENTER_POOLS["Consumables2"]) do
            if v.corresponding_set == card.ability.extra.set then
                SMODS.add_card( { key = v.key } )
            end
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}


SMODS.Consumable {
    key = "colon_arch",
    set = "Consumables2",
    corresponding_set = "colon_Architecture",
    atlas = "jbill_consume2",
    pos = { x = 5, y = 0 },
    config = { },
    use = function ()
        local nextlist = {
            Teeny = 'Small',
            Small = 'Big',
            Big = 'Boss',
            Boss = 'CEO'
        }
        G.GAME.cbean_jbill_arch_nope = true;
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                Colonparen.set_upcoming_blind(Colonparen.get_new_blind('Teeny'));
                return true
            end
        }))
    end,
    can_use = function ()
        if G.GAME.cbean_jbill_arch_nope then return false end;
        local nextlist = {
            Teeny = 'Small',
            Small = 'Big',
            Big = 'Boss',
            Boss = 'CEO'
        }
        for key, state in pairs(G.GAME.round_resets.blind_states) do
            if (state == 'Select') or (state == 'Current') then
                if not nextlist[key] then return false end;
                return true
            end
        end
        return 
    end,
    beans_credits = {
        idea = "jamirror",
        code = "jamirror",
        team = ":(",
        art = "jamirror"
    }
}