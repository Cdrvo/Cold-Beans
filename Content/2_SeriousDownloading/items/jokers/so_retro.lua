SMODS.Joker {
    key = "sdown_so_retro",
    name = "So Retro!",
    config = {
        extra = { mult = 8}
    },
    atlas = "sdown_joker_atlas",
    pos = { x = 4, y = 0 },
    loc_vars = function(self, _, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    loc_txt = {
        name = 'So Retro!',
        text = {
            "{C:red}+#1#{} Mult if played",
            "hand is {C:attention}level 1{}",
        }
    },
    calculate = function(self, card, context)
        if context.joker_main and to_number(G.GAME.hands[context.scoring_name].level) == 1 then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art =  "TBA",
        code = "Athebyne",
    }
}