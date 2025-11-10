local old_ease_dollars = ease_dollars;
function ease_dollars(...)
    local stuff = old_ease_dollars(...)
    if G.GAME and G.GAME.blind and G.GAME.blind.name == "cbean-colon-treasure" then
        G.GAME.blind.mult = G.GAME.blind.mult + 0.2;
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.GAME.blind:juice_up()
    end
    return stuff
end

Colonparen.CEOBlind{
    key = "colon_treasure",
    name = "cbean-colon-treasure",
    pos = { x = 0, y = 0 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("2b62a7"),
    beans_credits = {
        team = ":(",
        idea = "Unknown",
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
        if G.GAME.blind and G.GAME.blind.name == "Colon-The Sheet" then
            G.GAME.blind:set_text()
        end
    end
end)

local calculate_context = SMODS.calculate_context;
function SMODS.calculate_context(context, return_table, no_resolve)
    if (G and G.GAME and G.GAME.blind and G.GAME.blind.name == "Colon-The Sheet")
        and context.before then
            for i, card in ipairs(G.play.cards) do
                SMODS.recalc_debuff(card)
            end
    end
    return calculate_context(context, return_table, no_resolve)
end

Colonparen.CEOBlind{
    key = "colon_sheet",
    name = "Colon-The Sheet",
    pos = { x = 0, y = 2 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("1e5c51"),
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
        idea = "Unknown",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.CEOBlind{
    key = "colon_sheet",
    name = "Colon-The Sheet",
    pos = { x = 0, y = 2 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("1e5c51"),
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
        idea = "Unknown",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.CEOBlind{
    key = "colon_stamp",
    pos = { x = 0, y = 16 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 5,
	boss_colour = HEX("a13535"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    calculate = function (self, blind, context)
        if context.debuff_card 
        and context.debuff_card 
        and context.debuff_card.seal then
            return {
                debuff = true
            }
        end
    end,

}

Colonparen.CEOBlind{
    key = "colon_salesman",
    name = 'Colon-The Salesman',
    pos = { x = 0, y = 17 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 5,
	boss_colour = HEX("741543"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}