Colonparen.TeenyBlind{
    key = "sdown_estrogen",
    atlas = "sdown_blinds_atlas",
    pos = {
        x = 0,
        y = 8,
    },
    mult = 0.75,
    dollars = 2,
    boss_colour = HEX("E23688"),
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "mys. minty",
    },
    calculate = function (self, blind, context)
        if context.discard and context.other_card:is_face() then
            blind:wiggle()
            assert(SMODS.change_base(context.other_card, nil, "Queen"))
        end
    end
}