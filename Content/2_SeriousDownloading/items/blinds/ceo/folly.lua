Colonparen.CEOBlind {
    key = "sdown_folly",
    name = "The Folly",
    pos = { x = 0, y = 22 },
    boss = { min = 1 },
    atlas = "colon_CEOBlind",
    mult = 1,
    boss_colour = HEX("5933BB"),
    calculate = function(self, blind, context)
        if context.modify_ante and context.ante_end and not blind.disabled then
            if G.GAME.chips > G.GAME.blind.chips then
                if not G.GAME.BlindFolly then G.GAME.BlindFolly = 0 end
                G.GAME.BlindFolly = G.GAME.BlindFolly + (G.GAME.chips - G.GAME.blind.chips) end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "Athebyne",
    }
}