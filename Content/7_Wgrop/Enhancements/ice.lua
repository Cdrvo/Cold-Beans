SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_ice',
    pos = {x = 0, y = 2}, 
    atlas = 'wgrop_enhancement_atlas',
    config = {
        extra = {
            xchips = 1,
            xchips_mod = 0.2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.xchips_mod,
            card.ability.extra.xchips + G.GAME.current_round.hands_played*card.ability.extra.xchips_mod
        }}
    end,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play and card.facing ~= 'back' then
            return {
                xchips = (card.ability.extra.xchips + G.GAME.current_round.hands_played*card.ability.extra.xchips_mod)
                }
        end
    end,
    beans_credits = {
        team = {"wgrop"
        },
        idea = "AstraLuna",
        art =  "gud_username",
        code = "AstraLuna"
    }
}