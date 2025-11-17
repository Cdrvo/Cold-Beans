Colonparen.TeenyBlind{
    key = "sdown_estrogen",
    atlas = "colon_TeenyBlind", --placeholder
    --[[
    pos = {
        x = 0,
        y = 0,
    },
    ]]
    mult = 0.5,
    dollars = 2,
    boss_colour = HEX("658e7f"),
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "mys. minty",
    },
    calculate = function (self, blind, context)
        if context.discard and G.GAME.current_round.discards_used <= 0 and context.other_card:is_face() then
            assert(SMODS.change_base(context.other_card, nil, "Queen"))
        end
    end
}