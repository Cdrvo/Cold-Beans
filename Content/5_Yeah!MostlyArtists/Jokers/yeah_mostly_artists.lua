SMODS.Joker {
    key = 'yma_yeah_mostly_artists',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.base, card.ability.extra.odds,
            'yma')
        if card.ability.extra.pos == 0 then
            info_queue[#info_queue + 1] = { key = 'tag_buffoon', set = 'Tag' }
        end
        return {
            key = self.key .. '_form' .. tostring(card.ability.extra.pos),
            vars = {
                numerator,
                denominator,
                card.ability.extra.type,
                card.ability.extra.mult,
                card.ability.extra.chips,
            }
        }
    end,

    rarity = 3,
    atlas = 'yma_team_atlas',
    pos = { x = 0, y = 0 },
    cost = 7,
    blueprint_compat = false,

    config = {
        extra = {
            pos = 0,
            pos_override = { x = 0, y = 0 },
            type = "Flush",
            mult = 1,
            base = 1,
            odds = 4,
            chips = 25,
        }
    },

    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.pos = pseudorandom("seed", 0, 4)
        card.ability.extra.pos_override.x = card.ability.extra.pos
        card.children.center:set_sprite_pos(card.ability.extra.pos_override)
    end,
    load = function(self, card, card_table, other_card)
        G.E_MANAGER:add_event(Event({
            func = function()
                card.children.center:set_sprite_pos(card.ability.extra.pos_override)
                return true
            end
        }))
    end,
    add_to_deck = function(self, card, context)
        card.ability.extra.pos = pseudorandom("seed", 0, 4)
        card.ability.extra.pos_override.x = card.ability.extra.pos
        card.children.center:set_sprite_pos(card.ability.extra.pos_override)
    end,
    calculate = function(self, card, context)
        local pos = card.ability.extra.pos

        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                delay = 0.05,
                func = function()
                    card:juice_up(0.3, 0.2)
                    card.ability.extra.pos = pseudorandom("seed", 0, 4)
                    card.ability.extra.pos_override.x = card.ability.extra.pos
                    card.children.center:set_sprite_pos(card.ability.extra.pos_override)
                    return true
                end
            }))
            SMODS.calculate_effect({ message = localize('k_yma_transform'), colour = G.C.FILTER }, card)
        end

        if pos == 0 then -- FirstTry: 1 in 4 chance cards held in hand create a Buffoon Tag
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                if SMODS.pseudorandom_probability(card, 'yma_firsttry', card.ability.extra.base, card.ability.extra.odds, 'yma') then
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            add_tag(Tag('tag_buffoon'))
                            play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                            play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                            return true
                        end)
                    }))
                    SMODS.calculate_effect({ message = localize('k_yma_tag'), colour = G.C.FILTER }, context.other_card)
                    return nil, true
                end
            end
        elseif pos == 1 then -- Flynn: Cards held in hand permanently gain +1 mult
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
                context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +
                    card.ability.extra.mult
                SMODS.calculate_effect({ message = localize('k_upgrade_ex'), colour = G.C.FILTER }, context.other_card)
            end
        elseif pos == 2 then -- Rainstar: if played hand contains a flush convert all cards held in hand into the suit of the first played card
            if context.before and context.main_eval and not context.blueprint then
                local first_card = context.scoring_hand and context.scoring_hand[1]
                if first_card then
                    card.ability.extra.suit = first_card.base.suit
                end
            end
            if context.after and context.main_eval and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) then
                for _, valid_card in ipairs(G.hand.cards) do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            assert(SMODS.change_base(valid_card, card.ability.extra.suit))
                            valid_card:juice_up()
                            return true
                        end
                    }))
                end
            end
        elseif pos == 3 then -- cloudzXIII: If played hand contains a card with an enhancement, enhance a random card held in hand
            if context.joker_main and context.full_hand then
                local has_enhancement = false
                for _, c in ipairs(context.full_hand) do
                    if next(SMODS.get_enhancements(c)) then
                        has_enhancement = true
                        break
                    end
                end

                if has_enhancement then
                    local valid_cards = {}
                    for _, c in ipairs(G.hand.cards) do
                        if not next(SMODS.get_enhancements(c)) then
                            table.insert(valid_cards, c)
                        end
                    end

                    if #valid_cards > 0 then
                        local chosen = pseudorandom_element(valid_cards, pseudoseed("yma_cloudzXIII"))
                        local enhancement = SMODS.poll_enhancement { key = "kh_seed", guaranteed = true }
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                chosen:set_ability(enhancement, true)
                                chosen:juice_up()
                                return true
                            end
                        }))
                    end
                end
            end
        elseif pos == 4 then -- RattlingSnow353: +25 chips, Every 2 hands played, transform into a random key
            card.children.center:set_sprite_pos(card.ability.extra.pos_override)
            if context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
            end
            if context.after then
                local pool = {}
                for k, v in pairs(G.P_CENTER_POOLS['yma_keys']) do
                    pool[#pool + 1] = v.key
                end
                local ran_key = pseudorandom_element(pool, pseudoseed('yma_keys'))
                YMA_reroll_card(card, ran_key, 'yma_keys', 'yma_identity', card.config.center.key, nil, "after")
            end
        elseif pos == 5 then -- Lyre

        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Yeah! Mostly Artists",
        art = "Yeah! Mostly Artists",
        code = "cloudzXIII",
    }
}
