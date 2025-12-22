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
        beans_credits = {
            team = {"wgrop"
            },
            idea = "Tje.tsu",
            art =  "Tje.tsu",
            code = "Tje.tsu",
        }
    end
}