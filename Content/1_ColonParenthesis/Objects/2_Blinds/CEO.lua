local old_ease_dollars = ease_dollars;
function ease_dollars(mod, ...)
    local stuff = old_ease_dollars(mod, ...)
    if G.GAME and G.GAME.blind and G.GAME.blind.name == "The Treasure" and mod > 0 then
        G.GAME.blind.mult = G.GAME.blind.mult + 0.2;
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.GAME.blind:juice_up()
    end
    return stuff
end

Colonparen.CEOBlind{
    key = "colon_treasure",
    name = "The Treasure",
    pos = { x = 0, y = 0 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("628fc6"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}

ColdBeans.OnCalculate(function (self, context)
    local either_changed = false;
    if context.before and (#context.scoring_hand > 0) then
        if not G.GAME.colonparen_most_played_ranks then
            G.GAME.colonparen_most_played_ranks = {}
        end
        for i, card in ipairs(context.scoring_hand) do
            if not G.GAME.colonparen_most_played_ranks[card.base.value] then
                G.GAME.colonparen_most_played_ranks[card.base.value] = 0
            end
            G.GAME.colonparen_most_played_ranks[card.base.value] = G.GAME.colonparen_most_played_ranks[card.base.value] + 1
        end
        local min_use = 0;
        local chosen = context.scoring_hand[1].base.value;
        for rank, use in pairs(G.GAME.colonparen_most_played_ranks) do
            if use > min_use then
                min_use = use;
                chosen = rank
            end
        end
        if G.GAME.colonparen_most_played_rank ~= chosen then
            either_changed = true
        end
        G.GAME.colonparen_most_played_rank = chosen
    end
    if context.before and (#G.hand.cards > 0) then
        if not G.GAME.colonparen_most_held_ranks then
            G.GAME.colonparen_most_held_ranks = {}
        end
        for i, card in ipairs(G.hand.cards) do
            if not G.GAME.colonparen_most_held_ranks[card.base.value] then
                G.GAME.colonparen_most_held_ranks[card.base.value] = 0
            end
            G.GAME.colonparen_most_held_ranks[card.base.value] = G.GAME.colonparen_most_held_ranks[card.base.value] + 1
        end
        local min_use = 0;
        local chosen = G.hand.cards[1].base.value;
        for rank, use in pairs(G.GAME.colonparen_most_played_ranks) do
            if use > min_use then
                min_use = use;
                chosen = rank
            end
        end
        if G.GAME.colonparen_most_held_rank ~= chosen then
            either_changed = true
        end
        G.GAME.colonparen_most_held_rank = chosen
    end
    if either_changed then
        if G.GAME.blind and (G.GAME.blind.name == "The Sheet" or G.GAME.blind.name == "The Regression") then
            G.GAME.blind:set_text()
        end
    end
end)

Colonparen.CEOBlind{
    key = "colon_gate",
    name = "The Gate",
    pos = { x = 0, y = 1 },
    boss = { min = 2 },
	atlas = "colon_CEOBlind",
    mult = 5,
	boss_colour = HEX("ce249c"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

local calculate_context = SMODS.calculate_context;
function SMODS.calculate_context(context, return_table, no_resolve)
    --get most common and least common ranks and suit in deck at the start of each ante. Note: does not work on ante 1 because smods doesnt have a context for that
    if (G.GAME and context.ante_end) then
        local common_suit, common_rank, uncommon_suit, uncommon_rank = nil, nil, nil, nil
        local temp_suit_val, temp_rank_val = 0, 0
        local suit_table1, suit_table2, rank_table1, rank_table2 = {}, {}, {}, {}
        for k, v in pairs(G.playing_cards) do
            if not SMODS.has_no_suit(v) then suit_table1[v.base.suit] = (suit_table1[v.base.suit] or 0) + 1 end
            if not SMODS.has_no_rank(v) then rank_table1[v.base.value] = (rank_table1[v.base.value] or 0) + 1 end
        end
        for suit, count in pairs(suit_table1) do
            table.insert(suit_table2, {suit = suit, count = count})
        end
        for rank, count in pairs(rank_table1) do
            table.insert(rank_table2, {rank = rank, count = count})
        end
        table.sort(suit_table2, function(a, b) return a.count > b.count end)
        table.sort(rank_table2, function(a, b) return a.count > b.count end)
        --if your deck is entirely rankless or suitless cards, give Default Values
        --Otherwise, if there is an equal amount of every rank/suit, pick values at random
        if not next(rank_table2) then
            G.GAME.regression_most_rank = 'King'
            G.GAME.regression_least_rank = '2'
        elseif rank_table2[1].rank == rank_table2[#rank_table2].rank then
            if #rank_table2 == 1 then --if your entire deck is one rank, turn it into something new :)
                G.GAME.regression_most_rank = rank_table2[1].rank
                G.GAME.regression_least_rank = rank_table2[1].rank
                while G.GAME.regression_least_rank == rank_table2[1].rank do
                    G.GAME.regression_least_rank = pseudorandom_element(SMODS.Ranks, pseudoseed('seed')).rank
                end
            else
                local rank_random1 = pseudorandom_element(rank_table2, pseudoseed('seed')).rank
                G.GAME.regression_most_rank = rank_random1
                G.GAME.regression_least_rank = rank_random1
                while G.GAME.regression_least_rank == rank_random1 do
                    G.GAME.regression_least_rank = pseudorandom_element(rank_table2, pseudoseed('seed')).rank
                end
            end
        else
            G.GAME.regression_most_rank = rank_table2[1].rank
            G.GAME.regression_least_rank = rank_table2[#rank_table2].rank
        end
        if not next(suit_table2) then
            G.GAME.regression_most_suit = 'Spades'
            G.GAME.regression_least_suit = 'Diamonds'
        elseif suit_table2[1].suit == suit_table2[#suit_table2].suit then
            if #suit_table2 == 1 then --if your entire deck is one suit, turn it into something new :)
                G.GAME.regression_most_suit = suit_table2[1].suit
                G.GAME.regression_least_suit = suit_table2[1].suit
                while G.GAME.regression_least_suit == suit_table2[1].suit do
                    G.GAME.regression_least_suit = pseudorandom_element(SMODS.Suits, pseudoseed('seed')).suit
                end
            else
                local suit_random1 = pseudorandom_element(suit_table2, pseudoseed('seed')).suit
                G.GAME.regression_most_suit = suit_random1
                G.GAME.regression_least_suit = suit_random1
                while G.GAME.regression_least_suit == suit_random1 do
                    G.GAME.regression_least_suit = pseudorandom_element(suit_table2, pseudoseed('seed')).suit
                end
            end
        else
            G.GAME.regression_most_suit = suit_table2[1].suit
            G.GAME.regression_least_suit = suit_table2[#suit_table2].suit
        end
    end
    if (G.GAME and G.GAME.blind and (G.GAME.blind.name == "The Sheet" or G.GAME.blind.name == "The Stamp"))
        and context.before then
            for i, card in ipairs(G.play.cards) do
                SMODS.recalc_debuff(card)
            end
    end
    return calculate_context(context, return_table, no_resolve)
end

Colonparen.CEOBlind{
    key = "colon_sheet",
    name = "The Sheet",
    pos = { x = 0, y = 2 },
    boss = { min = 6 },
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("459373"),
    config = {},
    colon_blind_variables = {
        most_held = function() return G.GAME.colonparen_most_held_rank or 'Ace' end,
        most_played = function() return G.GAME.colonparen_most_played_rank or '2' end,
    },
    loc_vars = function (self)
        return {
            vars = {
                localize(Colonparen.blind_variables.most_held or 'sheet_most_held',
                Colonparen.blind_variables.most_held and 'ranks' or nil),
                localize(Colonparen.blind_variables.most_played or 'sheet_most_played',
                Colonparen.blind_variables.most_played and 'ranks' or nil),
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                localize('sheet_most_held'),
                localize('sheet_most_played'),
            }
        }
    end,
    calculate = function (self, blind, context)
        if context.debuff_card 
        and context.debuff_card.base then
            if context.debuff_card.area == G.play then
                if context.debuff_card.base.value
                and context.debuff_card.base.value == Colonparen.blind_variables.most_played then
                    return {
                        debuff = true
                    }
                end
            else
                if context.debuff_card.base.value
                and context.debuff_card.base.value == Colonparen.blind_variables.most_held then
                    return {
                        debuff = true
                    }
                end
            end
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}

local set_seal = Card.set_seal;
function Card.set_seal(self, ...)
    local ret = set_seal(self, ...)
    if G.GAME and G.GAME.blind and G.GAME.blind.name == "The Stamp" then
        SMODS.recalc_debuff(self)
    end
    return ret
end

Colonparen.CEOBlind{
    key = "colon_stamp",
    name = "The Stamp",
    pos = { x = 0, y = 16 },
    boss = { min = 4 },
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("da9a81"),
    calculate = function(self, blind, context)
        if context.debuff_card and context.debuff_card.seal then
            return {
                debuff = true
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.CEOBlind{
    key = "colon_assassination",
    name = "The Assassination",
    pos = { x = 0, y = 14 },
    boss = { min = 1 },
	atlas = "colon_CEOBlind",
    mult = 1,
	boss_colour = HEX("70558a"),
    set_blind = function(self, blind, from_debuff)
        local target_joker = nil
        for i, joker in ipairs(G.jokers.cards) do
            if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced then
                target_joker = joker
                break
            end
        end
        if target_joker then
            target_joker.getting_sliced = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                    return true
                end
            }))
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

Colonparen.CEOBlind{ -- The check for it is in the Team Blind lovely stuff, but the actual skipping of the shop is handeled by the WGroup Biome UI
    key = "colon_salesman",
    name = "The Salesman",
    pos = { x = 0, y = 17 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("741543"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.CEOBlind {
    key = "colon_factory",
    name = "The Factory",
    pos = { x = 0, y = 13 }, -- no idea if this is the right one
    boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("47585B"),
    calculate = function(self, blind, context)
        if context.hand_drawn then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local card = SMODS.create_card({
                set = "Playing Card",
                enhancement = "m_stone"
            })
            card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, card)
            G.hand:emplace(card)
            card.states.visible = nil

            SMODS.debuff_card(card, true, "wawafactorymadeCEO")
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_materialize()
                    blind:juice_up()
                    return true
                end
            }))
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

--Note for probably team :( on round two: get ceo blind in_pools to work and give this an in_pool req of having a joker
--with an edition. if you dont have any editions then this blind is literally only beneficial
Colonparen.CEOBlind{
    key = "colon_promise",
    name = "The Promise",
    pos = { x = 0, y = 12 }, -- no idea if this is the right one
    boss = {},
	atlas = "colon_CEOBlind",
    mult = 2,
	boss_colour = HEX("97D6E8"),
    calculate = function(self, blind, context)
        if context.end_of_round and context.main_eval then
            if G.GAME.current_round.hands_played == 1 then
                local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
                
                if #editionless_jokers > 0 then
                    local eligible_card = pseudorandom_element(editionless_jokers, 'cbean_promiseCEO')
                    eligible_card:set_edition('e_polychrome', true)
                end
            else
                if G.jokers and G.jokers.cards then
                    for _, joker in pairs(G.jokers.cards) do
                        if joker.edition and joker.edition.key ~= "e_negative" then
                            -- joker:set_ability('c_base')          -- This will make the joker no longer a joker, and instead a card that only has an edition
                            joker:set_edition(nil)
                        end
                    end
                end
            end
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.CEOBlind{
    key = "colon_seed",
    name = "The Seed",
    pos = { x = 0, y = 15 },
    boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("B3FF5F"),
    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play then
            G.GAME.blind.mult = G.GAME.blind.mult + 0.5;
            G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling -- I sure hope the game doesnt hate this
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
            G.GAME.blind:juice_up()
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.CEOBlind{
    key = "colon_pipeline",
    name = "The Pipeline",
    pos = { x = 0, y = 20 },
    boss = { min = 2 },
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("CC730F"),
    calculate = function(self, blind, context)
        if context.before then
            blind.wawa_xmult = 1.2
        elseif context.other_joker then
            local save = blind.wawa_xmult
            blind.wawa_xmult = blind.wawa_xmult - 0.1
            return {
                xmult = save
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.CEOBlind{
    key = "colon_button",
    name = "The Button",
    pos = { x = 0, y = 21 },
    boss = { min = 4 },
	atlas = "colon_CEOBlind",
    mult = 8,
	boss_colour = HEX("547e7a"),
    set_blind = function(self, blind)
        ease_hands_played(5)
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

Colonparen.CEOBlind{
    key = "colon_hole",
    name = "The Hole",
    pos = { x = 0, y = 22 },
    boss = { min = 2 },
	atlas = "colon_CEOBlind",
    mult = 0,
	boss_colour = HEX("1e2b2d"), -- background color of blind collection screen
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

Colonparen.CEOBlind {
    key = "colon_curse",
    name = "The Curse",
    pos = { x = 0, y = 23 },
    boss = { min = 2 },
    atlas = "colon_CEOBlind",
    mult = 3,
    boss_colour = HEX("5933BB"),
    defeat = function(self)
        G.GAME.BlindCurse = 3
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.CEOBlind{
    key = "colon_pot",
    name = "The Pot",
    pos = { x = 0, y = 24 },
    boss = { min = 2 },
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("8B6248"), -- background color of blind collection screen
    calculate = function(self, blind, context)
        if context.before then
            local ohGodSomethingChanged = false
            
            for _, card in pairs(G.play.cards) do
                local count = 0
                local v_mods = {enhanced = SMODS.get_enhancements(card), edition = card.edition, seal = card.seal}
                for _, mod in pairs(v_mods) do
                    if mod then
                        count = count + 1
                    end
                end

                if count >= 2 then
                    card:set_ability('c_base')
                    card:set_seal(nil)
                    card:set_edition(nil)
                end 
            end

            if ohGodSomethingChanged then blind:juice_up() end
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.CEOBlind {
    key = "colon_compass",
    name = "The Compass",
    pos = { x = 0, y = 25 },
    boss = {},
    atlas = "colon_CEOBlind",
    mult = 3,
    boss_colour = HEX("425AA7"),
    calculate = function(self, blind, context)
        if context.before then
            -- Noooooo, you cant just do that. Shut up nerd, Ill do that and copy it anyway (about the copied line from the thing at the top)
            blind.mult = blind.mult + 1;
            blind.chips = get_blind_amount(G.GAME.round_resets.ante)*blind.mult*G.GAME.starting_params.ante_scaling
            blind.chip_text = number_format(blind.chips)
            blind:juice_up()
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}

Colonparen.CEOBlind {
    key = "colon_island",
    name = "The Island",
    pos = { x = 0, y = 26 },
    boss = { min = 4 },
    atlas = "colon_CEOBlind",
    mult = 0.3,
    boss_colour = HEX("72364E"),
    calculate = function(self, blind, context)
        if blind.disabled then return end

        if context.debuff_card and context.debuff_card.area == G.jokers then
            if context.debuff_card.ability.island_debuffed then
                return {
                    debuff = true
                }
            end
        end
        if context.hand_drawn and G.jokers.cards[2] then

            local _card = pseudorandom_element(G.jokers.cards, 'CEO_islandSafeJoker')

            if _card then

                for _, v in pairs(G.jokers.cards) do    
                    if v ~= _card then 
                        v.ability.island_debuffed = true
                        v:juice_up()
                        SMODS.recalc_debuff(v) 
                    end 
                end

                blind:wiggle()
            end

        end
        if context.hand_drawn then
            blind.prepped = nil
        end
    end,
    disable = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.island_debuffed = nil
        end
    end,
    defeat = function(self)
        for _, joker in ipairs(G.jokers.cards) do
            joker.ability.island_debuffed = nil
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "Bitter",
    }
}