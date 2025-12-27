SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_grapevine',
    pos = {x = 0, y = 5}, 
    atlas = 'wgrop_enhancement_atlas',
    config = {
        extra = {
            upgrade_mult = 4,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.upgrade_mult
        }}
    end,
    calculate = function (self, card, context)
        if context.end_of_round and context.other_card == card and context.cardarea == G.hand then
            context.other_card.ability.mult = (context.other_card.ability.mult or 0) + card.ability.extra.upgrade_mult
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end,
    beans_credits = {
        team = {"wgrop"
        },
        idea = "Garb",
        art =  "gud_username",
        code = "AstraLuna"
    }
}