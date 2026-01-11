SMODS.Joker {
    key = "sdown_nesting_doll",
    name = "Nesting Doll",
    config = {
        extra = { repetitions = 1 }
    },
    atlas = "sdown_joker_atlas",
    pos = { x = 6, y = 0 },
    loc_vars = function(self, _, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    loc_txt = {
        name = 'Nesting Doll',
        text = {
            "Retrigger all played cards used in scoring",
            "if hand contains a {C:attention}Two Pair{}",
        }
    },
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if next(context.poker_hands['Two Pair']) then
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.repetitions,
                    card = card,
                }
            end
        end
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art =  "TBA",
        code = "Athebyne",
    }
}