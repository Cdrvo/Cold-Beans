SMODS.Joker{
    key = 'wgrop_glass_spire',
    atlas = 'wgrop_joker_atlas',
    rarity = 2,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 1},
    config = {
        extra = {
        }
    },

    loc_vars = function(self, info_queue, card)
         info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_wgrop_coarse
        return {
            vars = {
            }
        }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local cardsdestroyed = SMODS.shallow_copy(context.removed)
            local glassbeenremoved = {}
            for _, removed_card in ipairs(cardsdestroyed) do
                print(SMODS.get_enhancements(removed_card))
                if SMODS.get_enhancements(removed_card)['m_glass'] == true then 
                    table.insert(glassbeenremoved, removed_card)
                end
            end
            if #glassbeenremoved > 0 then
                for i, v in ipairs(glassbeenremoved) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                                local copy = copy_card(v)
                                G.hand:emplace(copy)
                                copy:set_ability('m_cbean_wgrop_coarse')
                                card_eval_status_text(copy, 'extra', nil, nil, nil, {message =('!'), colour = G.C.ATTENTION})
                                table.insert(G.playing_cards, copy)
                            return true
                        end
                    }))
                end
            end
            print(glassbeenremoved)
        end
    end,
    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "AstralLuna",
    code = "Tje.tsu",
    }
}

