Colonparen.CEOBlind {
    key = "sdown_regression",
    name = "The Regression",
    pos = { x = 0, y = 3 },
    boss = { min = 2},
    atlas = "sdown_blinds_atlas",
    mult = 3,
    boss_colour = HEX("2E3534"),
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
            local regressed = false
            --TODO: Juice the Cards
            for k, v in pairs(context.full_hand) do
                if v.base.value == G.GAME.regression_most_rank then
                    regressed = true
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            v:juice_up()
                            assert(SMODS.change_base(v, nil, G.GAME.regression_least_rank))
                            return true
                        end
                    }))
                end
                if v:is_suit(G.GAME.regression_most_suit) then
                    regressed = true
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                            v:juice_up()
                            assert(SMODS.change_base(v, G.GAME.regression_least_suit, nil))
                            return true
                        end
                    }))
                end
            end
            if regressed then
                G.E_MANAGER:add_event(Event({
                    func = function ()
                        blind:wiggle()
                        return true
                    end,
                }))
            end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    }
}