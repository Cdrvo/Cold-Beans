SMODS.Joker {
    key = "pboys_nrio",
    atlas = "pboys_joker_atlas",
    pos = { x = 6, y = 1 },
    rarity = 1,
    order = 16,
    blueprint_compat = false,
    cost = 5,
    config = {type = "Full House", extra = {dollars = 1, dollar_mod = 1}}, -- i think money shouldnt start at 0
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.dollars, card.ability.extra.dollar_mod, localize(card.ability.type, "poker_hands")}}
    end,
    calculate = function(self, card, context)
        if context.before and context.poker_hands and next(context.poker_hands[card.ability.type]) then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "dollars",
                scalar_value = "dollar_mod",
                scaling_message = {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.GOLD,
                    card = card
                }
            })
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.dollars > 0 then
            return card.ability.extra.dollars
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+$" },
                { ref_table = "card.ability.extra", ref_value = "dollars" },
            },
            text_config = { colour = G.C.GOLD },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.localized_text = localize("k_round")
            end
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Nrio_Modder",
        art = "Gfsgfs",
        code = "HuyTheKiller",
    }
}