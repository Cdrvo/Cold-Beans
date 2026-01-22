SMODS.Joker {
    key = "pboys_yellow_snow",
    atlas = "pboys_joker_atlas",
    pos = { x = 8, y = 0 },
    rarity = 2,
    order = 9,
    blueprint_compat = true,
    cost = 4,
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
    end,
    calculate = function(self, card, context)
        if context.selling_card and context.card ~= card then
            local target = pseudorandom_element(G.playing_cards or {}, pseudoseed("pboys_yellow_snow"))
            if target then
                target:set_ability("m_cbean_pboys_piss", nil, true)
                G.E_MANAGER:add_event(Event({func = function()
                    target:juice_up()
                return true end}))
                return {
                    message = localize("k_cbean_piss_ex"),
                    colour = G.C.FILTER,
                }
            end
        end
    end,
	joker_display_def = function(JokerDisplay)
        return { 
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "piss_name" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.piss_name = localize{type = "name_text", set = "Enhanced", key = "m_cbean_pboys_piss", nodes = {}}
            end,
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Nrio_Modder",
        art = "Pumpkin man",
        code = "HuyTheKiller",
    }
}