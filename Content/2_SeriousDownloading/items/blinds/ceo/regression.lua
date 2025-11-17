Colonparen.CEOBlind {
    key = "sdown_regression",
    name = "The Regression",
    pos = { x = 0, y = 22 },
    boss = { min = 3 },
    atlas = "colon_CEOBlind",
    mult = 3,
    boss_colour = HEX("5933BB"),
    colon_blind_variables = {
        most_held = function () return G.GAME.colonparen_most_held_rank or 'Ace' end,
        most_played = function() return G.GAME.colonparen_most_played_rank or '2' end,
    },
    loc_vars = function (self)
        return {
            vars = {
                localize(Colonparen.blind_variables.most_held, 'ranks'),
                localize(Colonparen.blind_variables.most_played, 'ranks'),
                localize(Colonparen.blind_variables.most_held, 'suits'),
                localize(Colonparen.blind_variables.most_played, 'suits'),
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                localize('sheet_most_held'),
                localize('sheet_most_played'),
                localize('sheet_most_held'),
                localize('sheet_most_played'),
            }
        }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "Athebyne",
    }
}