SMODS.Joker {
    key = "pboys_pumpkinman",
    atlas = "pboys_joker_atlas",
    pos = { x = 8, y = 1 },
    rarity = 1,
    order = 18,
    blueprint_compat = true,
    cost = 5,
    config = {extra = {mult = 4, money = 1}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_gold
        return {vars = {card.ability.extra.mult, card.ability.extra.money}}
    end,
    enhancement_gate = "m_gold", --consistent with Golden Ticket
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, "m_gold") then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.money
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    mult = card.ability.extra.mult,
                    dollars = card.ability.extra.money,
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
                { text = " +$", colour = G.C.GOLD },
                { ref_table = "card.joker_display_values", ref_value = "money", retrigger_type = "mult", colour = G.C.GOLD },
            },
            text_config = { colour = G.C.MULT },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" },
            },
            calc_function = function(card)
                local count = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if SMODS.has_enhancement(scoring_card, "m_gold") then
                            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
                card.joker_display_values.money = card.ability.extra.money*count
                card.joker_display_values.mult = card.ability.extra.mult*count
                card.joker_display_values.localized_text = localize{type = "name_text", set = "Enhanced", key = "m_gold", nodes = {}}
            end,
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Pumpkin man",
        art = "Pumpkin man",
        code = "HuyTheKiller",
    }
}