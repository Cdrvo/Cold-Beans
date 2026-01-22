SMODS.Joker {
    key = "pboys_flame",
    atlas = "pboys_joker_atlas",
    pos = { x = 3, y = 1 },
    rarity = 1,
    order = 12,
    blueprint_compat = true,
    cost = 6,
    config = {extra = {xmult = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local first_found = nil
            for i = #context.scoring_hand, 1, -1 do
                if context.scoring_hand[i]:get_id() == 14
                or context.scoring_hand[i]:get_id() == 10 then
                    first_found = context.scoring_hand[i]
                    break
                end
            end
            if context.other_card == first_found then
                return {
                    x_mult = card.ability.extra.xmult
                }
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "xmult", retrigger_type = "exp" }
                    }
                }
            },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ", 10)" },
            },
            calc_function = function(card)
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                local target_cards = {}
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() == 14
                        or scoring_card:get_id() == 10 then
                            table.insert(target_cards, scoring_card)
                        end
                    end
                end
                local sorted_cards = JokerDisplay.sort_cards(target_cards)
                local first_found = sorted_cards and sorted_cards[#sorted_cards]
                card.joker_display_values.xmult = first_found and
                    (card.ability.extra.xmult ^ JokerDisplay.calculate_card_triggers(first_found, scoring_hand)) or 1
                card.joker_display_values.localized_text = localize("Ace", "ranks")
            end
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "FlameThrowerFIM",
        art = "FlameThrowerFIM",
        code = "HuyTheKiller",
    }
}