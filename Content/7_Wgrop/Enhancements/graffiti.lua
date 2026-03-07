SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_graffiti',
    pos = {x = 0, y = 3}, 
    atlas = 'wgrop_enhancement_atlas',
    config = { extra = {tax = 10, odds = 4, scale = 7.5, retrigger = 0}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.tax+(card.ability.extra.scale*card.ability.extra.retrigger), G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.scale
        }}
    end,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if pseudorandom('riceshowermwa') < G.GAME.probabilities.normal/card.ability.extra.odds then
                local tag_pool = get_current_pool('Tag')
                local selected_tag = pseudorandom_element(tag_pool, pseudoseed('tagsed'))
                local check = 1
                while selected_tag == 'UNAVAILABLE' do
                    check = check + 1
                    selected_tag = pseudorandom_element(tag_pool, pseudoseed('tagsedseed'..check))
                end
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        add_tag(Tag(selected_tag))
                        return true
                    end)
                }))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message =('Vandalized!'), colour = G.C.GREEN})
            else
                card_eval_status_text(card, 'extra', nil, nil, nil, {message =('Caught!'), colour = G.C.RED})
            end
            if card.ability.extra.retrigger < (100-card.ability.extra.tax)/card.ability.extra.scale then
                card.ability.extra.retrigger = card.ability.extra.retrigger+1
            end
            return {
                chip_mod = -1*(math.floor((card.ability.extra.tax+(card.ability.extra.scale*card.ability.extra.retrigger))*(hand_chips/100))),
                mult_mod = -1*(math.floor((card.ability.extra.tax+(card.ability.extra.scale*card.ability.extra.retrigger))*(mult/100)))
            }
        end
        if context.end_of_round then
            card.ability.extra.retrigger = 0
        end
    end,
    beans_credits = {
        team = {"wgrop"
        },
        idea = "Tje.tsu",
        art =  "Tje.tsu",
        code = "Tje.tsu"
    }
}