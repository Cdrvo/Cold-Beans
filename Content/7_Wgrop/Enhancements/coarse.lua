SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_coarse',
    pos = {x = 0, y = 1}, 
    atlas = 'wgrop_enhancement_atlas',
    wgrop_biometype = "wgrop_rosygraveyard",
    config = {dunit = 1, xchips = 1, xcs = 0.05},
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.dunit, card.ability.xchips, card.ability.xcs
        }}
    end,
    calculate = function (self, card, context) --check copied from handsome devils
        if G.jokers then
            local dollar = 0
            for i = 1, #G.jokers.cards do
                dollar = dollar+G.jokers.cards[i].sell_cost
            end
            card.ability.xchips = 1+(dollar*card.ability.xcs)
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                xchips = card.ability.xchips
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