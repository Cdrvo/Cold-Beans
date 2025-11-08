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
        team = ":( Team",
        idea = "Unknown",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.CEOBlind{
    key = "colon_gate",
    pos = { x = 0, y = 1 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 5,
	boss_colour = HEX("a91061"),
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        art = "George The Rat",
        code = "jamirror",
    }
}

ColdBeans.OnCalculate(function (self, context)
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
        G.GAME.colonparen_most_held_rank = chosen
    end
end)

Colonparen.CEOBlind{
    key = "colon_sheet",
    pos = { x = 0, y = 2 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("1e5c51"),
    loc_vars = function (self)
        return {
            vars = {
                localize(G.GAME.colonparen_most_held_rank or 'Ace', 'ranks'),
                localize(G.GAME.colonparen_most_played_rank or '2', 'ranks'),
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                localize('cbean_colon_sheet_held'),
                localize('cbean_colon_sheet_played'),
            }
        }
    end,
    calculate = function (self, blind, context)
        if context.debuff_card 
        and context.debuff_card.base then
            if context.debuff_card.base.value == (G.GAME.colonparen_most_held_rank or 'Ace') then
                for i, card in ipairs(G.hand.cards) do
                    if context.debuff_card == card then
                        return {
                            debuff = true
                        }
                    end
                end
            end
            if context.debuff_card.base.value == (G.GAME.colonparen_most_played_rank or '2') then
                for i, card in ipairs((G.play or {}).cards or {}) do
                    if context.debuff_card == card then
                        return {
                            debuff = true
                        }
                    end
                end
            end
        end
    end,
    beans_credits = {
        team = ":( Team",
        idea = "Unknown",
        art = "George The Rat",
        code = "jamirror",
    }
}