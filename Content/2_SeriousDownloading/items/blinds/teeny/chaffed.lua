Colonparen.TeenyBlind{
    key = "sdown_chaffed",
    atlas = "colon_TeenyBlind", --placeholder
    --[[
    pos = {
        x = 0,
        y = 0,
    },
    ]]
    mult = 0.75,
    dollars = 2,
    boss_colour = HEX("658e7f"),
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "mys. minty",
    },
    calculate = function (self, blind, context)
        if context.discard and G.GAME.current_round.discards_used <= 0 and context.other_card == G.hand.highlighted[1] then
            blind:wiggle()
            return {
                remove = true
            }
        end
    end
}