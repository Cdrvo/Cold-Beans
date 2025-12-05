SMODS.Joker {
    key = "pboys_watermelon",
    atlas = "pboys_joker_atlas",
    pos = { x = 1, y = 1 },
    rarity = 1,
    order = 11,
    blueprint_compat = false,
    eternal_compat = false,
    cost = 4,
    config = {extra = {round_tally = 9}},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = "k_cbean_pissjoker", set = "Other" }
		info_queue[#info_queue + 1] = G.P_CENTERS.m_cbean_pboys_piss
        return {vars = {card.ability.extra.round_tally}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            local target = pseudorandom_element(G.hand.cards, pseudoseed("pboys_watermelon"))
            if target then
                target:set_ability("m_cbean_pboys_piss", nil, true)
                G.E_MANAGER:add_event(Event({func = function()
                    target:juice_up()
                return true end}))
            end
            if card.ability.extra.round_tally - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER,
                    no_retrigger = true
                }
            else
                card.ability.extra.round_tally = card.ability.extra.round_tally - 1
                return {
                    message = card.ability.extra.round_tally..'',
                    colour = G.C.FILTER,
                    no_retrigger = true
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.ability.extra", ref_value = "round_tally" },
                { text = "/" },
                { ref_table = "card.joker_display_values", ref_value = "start_count" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.start_count = card.joker_display_values.start_count or card.ability.extra.round_tally
            end,
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Pumpkin man",
        art = "FlameThrowerFIM",
        code = "HuyTheKiller",
    }
}