SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_pale_remnant',
    pos = {x = 1, y = 0}, 
    atlas = 'wgrop_enhancement_atlas',
    wgrop_biometype = "wgrop_rosygraveyard",
    config = {xms = 0.2, cxm=1},
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.xms, card.ability.cxm
      }}
    end,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot2')
                    SMODS.modify_rank(card, -1)
                    card:juice_up()
                    card.ability.cxm = card.ability.cxm+card.ability.xms
                    return true
                end
            }))
            return {
                xmult = card.ability.cxm
            }
        end
    end,
    beans_credits = {
        team = {"wgrop"
        },
        idea = "Tje.tsu",
        art =  "Tje.tsu",
        code = "Tje.tsu",
    }
}