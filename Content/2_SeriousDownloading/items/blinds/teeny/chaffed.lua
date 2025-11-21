Colonparen.TeenyBlind{
    key = "sdown_chaffed",
    atlas = "sdown_blinds_atlas",
    pos = {
        x = 0,
        y = 9,
    },
    mult = 0.75,
    dollars = 2,
    boss_colour = HEX("6B6B6B"),
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
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