SMODS.Joker {
    key = "pboys_watermelon",
    atlas = "NAMETEAM_Jokers", -- mwehehehe get animated suckers
    pos = { x = 0, y = 10 },
    cbean_anim = {
        { xrange = { first = 0, last = 11 }, y = 10, t = 0.1 },
        { xrange = { first = 0, last = 2 }, y = 11, t = 0.1 }
    },
    pos_extra = { x = 3, y = 11 },
    cbean_anim_extra = {
        { x = 3, y = 11, t = 0.075 },
        { x = 4, y = 11, t = 0.125 },
        { x = 5, y = 11, t = 0.175 },
        { x = 6, y = 11, t = 0.3 },
        { x = 5, y = 11, t = 0.175 },
        { x = 4, y = 11, t = 0.125 },
        { x = 3, y = 11, t = 0.075 },
        { x = 7, y = 11, t = 0.125 },
        { x = 8, y = 11, t = 0.175 },
        { x = 9, y = 11, t = 0.3 },
        { x = 8, y = 11, t = 0.175 },
        { x = 7, y = 11, t = 0.125 }
    },
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