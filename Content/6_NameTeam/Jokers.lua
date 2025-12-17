SMODS.Atlas({
    key = "NAMETEAM_Jokers",
    path = "6_NameTeam/ColdBeansJokers.png",
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = "NAMETEAM_Jokers2",
    path = "6_NameTeam/ColdBeansJokers2.png",
    px = 71,
    py = 95,
})

SMODS.Joker {
    key = 'nameteam_topsyturvy',
    config = { extra = { three_given_chips = 20, two_given_chips = 40 } },
    rarity = 1,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 0, y = 0 },
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.three_given_chips, card.ability.extra.two_given_chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "she_her",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 3 then
            return { chips = card.ability.extra.three_given_chips }
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 2 then
            return { chips = card.ability.extra.two_given_chips }
        end
    end
}

SMODS.Joker {
    key = "nameteam_bettercreditcard",
    config = { extra = { bankrupt_at = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bankrupt_at } }
    end,
    rarity = 3,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 1, y = 0 },
    draw = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    cost = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
        if G.GAME.dollars < G.GAME.bankrupt_at then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_dollars(-G.GAME.bankrupt_at - G.GAME.dollars)
                    return true
                end
            }))
        end
    end
}

SMODS.Joker {
    key = "nameteam_hollyjollyjoker",
    config = { extra = { money = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    rarity = 2,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 2, y = 0 },
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_they",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and context.other_card:is_suit("Clubs") and next(context.poker_hands["Pair"]) then
            return { dollars = card.ability.extra.money }
        end
    end
}

SMODS.Joker {
    key = "nameteam_stachenscarfen",
    rarity = 3,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 3, y = 0 },
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    }
}

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local staches = SMODS.find_card("j_cbean_nameteam_stachenscarfen")
    if next(staches) and not (forced_key and G.P_CENTERS[forced_key] and G.P_CENTERS[forced_key].rarity == 2) then
        legendary = nil
        _rarity = 0.71
        forced_key = nil
    end
    return create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end

local smods_create_card_ref = SMODS.create_card
function SMODS:create_card(t)
    local staches = SMODS.find_card("j_cbean_nameteam_stachenscarfen")
    if next(staches) and not (t and t.forced_key and G.P_CENTERS[t.forced_key] and G.P_CENTERS[t.forced_key].rarity == 2) then
        if not t then t = {} end
        t.legendary = nil
        t.rarity = 0.71
        t.forced_key = nil
    end
    return smods_create_card_ref(self, t)
end

SMODS.Joker {
    key = "nameteam_alecwatson",
    rarity = 2,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 6, y = 0 },
    cbean_anim = {
        { xrange = { first = 6, last = 8 }, y = 0, t = 0.1 },
        { x = 7,                            y = 0, t = 0.1 }
    },
    cost = 7,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",
    hpot_unbreedable = true,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.buying_card and context.card.ability.consumeable and count_consumables() < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            local _card = context.card
            return {
                extra = {
                    focus = card,
                    message = localize('k_copied_ex'),
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = function()
                                play_sound("timpani")
                                local new_card = SMODS.create_card({ set = _card.config.center.set, area = G.consumeables, key = _card.config.center.key })
                                new_card:add_to_deck()
                                G.consumeables:emplace(new_card)
                                G.GAME.consumeable_buffer = 0
                                new_card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                },
                colour = G.C.FILTER,
                card = card
            }
        end
    end
}

SMODS.Joker {
    key = "nameteam_diamondshapewithadotinside",
    config = { extra = { mult = 7 } },
    rarity = 1,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 0, y = 1 },
    cbean_anim = { { xrange = { first = 0, last = 3 }, y = 1, t = 0.1 } },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "any_all",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
            local valid = false
            for _, v in ipairs(context.scoring_hand) do
                if not v:is_suit("Diamonds") or SMODS.has_any_suit(v) then
                    valid = true; break;
                end
            end

            if valid then return { mult = card.ability.extra.mult } end
        end
    end
}

SMODS.Joker {
    key = "nameteam_giveway",
    config = { extra = { xmult = 2 } },
    rarity = 1,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 4, y = 1 },
    pos_extra = { x = 5, y = 1 },
    draw_extra = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.initial_scoring_step then return { xmult = 2 } end
    end
}

SMODS.Joker {
    key = "nameteam_ghostimage",
    config = { extra = { levels = 1 } },
    rarity = 2,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 6, y = 1 },
    pos_extra = { x = 7, y = 1 },
    draw_extra = function(self, card, layer)
        if self.discovered or card.params.bypass_discovery_center then
            card.cbean_extra:draw_shader('negative_shine', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "they_them",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.set == "Planet" then
            local valid_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(k) then valid_hands[#valid_hands + 1] = k end
            end
            local chosen_hand = pseudorandom_element(valid_hands, pseudoseed("ghostimage"))

            G.E_MANAGER:add_event(Event({
                func = function()
                    SMODS.smart_level_up_hand(card, chosen_hand, nil, card.ability.extra.levels)
                    return true
                end
            }))
            return { message = localize('k_level_up_ex'), colour = G.C.FILTER }
        end
    end
}

SMODS.Joker {
    key = "nameteam_tipoftheiceberg",
    config = { extra = { counted_rerolls = 0, added_chips = 15, current_chips = 0 } },
    rarity = 1,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 8, y = 1 },
    cbean_anim = {
        { xrange = { first = 8, last = 10 }, y = 1, t = 0.3 }
    },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.added_chips, card.ability.extra.current_chips } }
    end,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pronouns = "it_its",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    },

    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_chips > 0 then return { chips = card.ability.extra.current_chips } end

        if context.reroll_shop and not context.blueprint then card.ability.extra.counted_rerolls = card.ability.extra.counted_rerolls + 1 end
        if context.ending_shop and not context.blueprint then card.ability.extra.counted_rerolls = 0 end

        if context.buying_card and not context.blueprint and card.ability.extra.counted_rerolls == 0 then
            card.ability.extra.current_chips = card.ability.extra.current_chips + card.ability.extra.added_chips
            return { message = localize("k_upgrade_ex"), colour = G.C.FILTER }
        end
    end
}
