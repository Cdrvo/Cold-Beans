SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_shower", 
    atlas = "pboys_joker_atlas",
    pos = { x = 2, y = 0 },
    rarity = 3,
    order = 3,
    blueprint_compat = true,
    cost = 6,
    config = { extra = { dollars = 2 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.individual and (context.cardarea == G.play or context.cardarea == G.hand) and
            SMODS.has_enhancement(context.other_card, 'm_cbean_pboys_piss') and not context.end_of_round then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_cbean_pboys_piss') then
                return true
            end
        end
        return false
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Gfsgfs",
        art =  "Gfsgfs",
        code = "Nrio_Modder",
    }
}