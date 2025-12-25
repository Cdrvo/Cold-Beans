SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_thistled',
    pos = {x = 0, y = 0}, 
    atlas = 'wgrop_enhancement_atlas',
    wgrop_biometype = "wgrop_rosygraveyard",
    config = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_wgrop_pale_remnant
        return { vars = {
        }}
    end,
    update = function(self, card) -- check copied from garb (hi garb)
        if card.debuff or card.perma_debuff then
        card.debuff = false
        card.perma_debuff = false
        return true
        end
    end,
    calculate = function (self, card, context) --check copied from handsome devils
        if context.remove_playing_cards then
            for _, c in ipairs(context.removed) do
                if c == card then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                                local copy = copy_card(card)
                                G.hand:emplace(copy)
                                copy:set_ability ('m_cbean_wgrop_pale_remnant')
                                card_eval_status_text(copy, 'extra', nil, nil, nil, {message =('!'), colour = HEX('C57384')})
                                table.insert(G.playing_cards, copy)
                            return true
                        end
                    }))
                end
            end
        end
    end,
    beans_credits = {
        team = "wgrop",
        idea = "Tje.tsu",
        art =  "Tje.tsu",
        code = "Tje.tsu",
    }
}