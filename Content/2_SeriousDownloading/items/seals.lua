

SMODS.Seal {
    key = 'sdown_lunar',
    pos = { x = 0, y = 0 },
    atlas = "sdown_seal_atlas",
    badge_colour = HEX("BA000E"),
    loc_txt = {
        name = 'Lunar Seal',
        text = {
            "Creates a {C:attention}Chinese Zodiac{} card",
            "when hand is played",
            "{C:inactive}(Must have room)"
        }
    },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Crabus",
        code = "Athebyne",
    },
    calculate = function(self, card, context)
        --TODO: Temporary trigger condition of on score until we decide on one.
        --welp i guess we never decided on one huh
        if  context.main_scoring and context.cardarea == G.play and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            return {
                message = localize('sdown_czodiac_add'), colour = HEX("BA000E"),
                func = function()
                    SMODS.add_card({ set = 'sdown_czodiac' })
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                    return true
                end
            }
        end
    end
}