local old_ease_dollars = ease_dollars;
function ease_dollars(...)
    local stuff = old_ease_dollars(...)
    if G.GAME and G.GAME.blind and G.GAME.blind.name == "The Treasure" then
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
        if G.GAME.blind and G.GAME.blind.name == "The Sheet" then
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
    colon_blind_variables = {
        most_held = function () return G.GAME.colonparen_most_held_rank or 'Ace' end,
        most_played = function() return G.GAME.colonparen_most_played_rank or '2' end,
    },
    loc_vars = function (self)
        return {
            vars = {
                localize(Colonparen.blind_variables.most_held, 'ranks'),
                localize(Colonparen.blind_variables.most_played, 'ranks'),
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
                if context.debuff_card.base.value == Colonparen.blind_variables.most_played then
                    return {
                        debuff = true
                    }
                end
            else
                if context.debuff_card.base.value == Colonparen.blind_variables.most_held then
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

Colonparen.CEOBlind{ -- calc is in a patch or smth idk
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
        G.BlindCurse = 3
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