Colonparen.CEOBlind {
    key = "sdown_regression",
    name = "The Regression",
    pos = { x = 0, y = 22 },
    boss = { min = 2},
    atlas = "colon_CEOBlind",
    mult = 3,
    boss_colour = HEX("5933BB"),
    loc_vars = function (self)
        return {
            vars = {
                G.GAME.regression_most_rank, G.GAME.regression_least_rank, G.GAME.regression_most_suit, G.GAME.regression_least_suit
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                localize('regression_most_rank'),
                localize('regression_least_rank'),
                localize('regression_most_suit'),
                localize('regression_least_suit'),
            }
        }
    end,
    calculate = function (self, blind, context)
        if blind.disabled then
            return
        end
        if context.after then
            --TODO: Juice the Cards
            for k, v in pairs(context.full_hand) do
                if v.base.value == G.GAME.regression_most_rank then
                    assert(SMODS.change_base(v, nil, G.GAME.regression_least_rank))
                    blind:wiggle()
                end
                if v:is_suit(G.GAME.regression_most_suit) then
                    assert(SMODS.change_base(v, G.GAME.regression_least_suit, nil))
                    blind:wiggle()
                end
            end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "Athebyne",
    }
}