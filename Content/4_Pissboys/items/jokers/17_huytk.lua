SMODS.Joker {
    key = "pboys_huythekiller",
    atlas = "pboys_joker_atlas",
    pos = { x = 7, y = 1 },
    rarity = 2,
    order = 17,
    blueprint_compat = true,
    cost = 6,
    config = {extra = {retriggers = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_cbean_pboys_piss
        return {vars = {card.ability.extra.retriggers}}
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card == context.scoring_hand[1] then
                local piss_count = 0
                for i, v in ipairs(context.scoring_hand) do
                    if SMODS.has_enhancement(v, "m_cbean_pboys_piss") then
                        piss_count = piss_count + 1
                    end
                end
                if card.ability.extra.retriggers - piss_count > 0 then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.retriggers - piss_count,
                        card = card
                    }
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "x" },
                { ref_table = "card.joker_display_values", ref_value = "retriggers", retrigger_type = "mult" },
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" },
            },
            calc_function = function(card)
                local piss_count = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if SMODS.has_enhancement(scoring_card, "m_cbean_pboys_piss") then
                            piss_count = piss_count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                        end
                    end
                end
                card.joker_display_values.retriggers = math.max(card.ability.extra.retriggers - piss_count, 0)
                card.joker_display_values.localized_text = localize{type = "name_text", set = "Enhanced", key = "m_cbean_pboys_piss", nodes = {}}
            end,
            retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
                if held_in_hand then return 0 end
                local first_card = scoring_hand and JokerDisplay.calculate_leftmost_card(scoring_hand)
                return first_card and playing_card == first_card and
                    (joker_card.joker_display_values.retriggers or 0)*JokerDisplay.calculate_joker_triggers(joker_card) or 0
            end,
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "HuyTheKiller",
        art = "FlameThrowerFIM",
        code = "HuyTheKiller",
    }
}