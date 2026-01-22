SMODS.Joker {
    key = "pboys_gfs",
    atlas = "pboys_joker_atlas",
    pos = { x = 5, y = 1 },
    rarity = 1,
    order = 15,
    blueprint_compat = true,
    cost = 5,
    config = {extra = {mult = 5}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult, localize(G.GAME.current_round.gfs_card.rank, "ranks")}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if context.other_card:get_id() == G.GAME.current_round.gfs_card.id then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                        card = card,
                    }
                else
                    return {
                        h_mult = card.ability.extra.mult,
                        card = card,
                    }
                end
            end
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
            },
            text_config = { colour = G.C.MULT },
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" },
            },
            calc_function = function(card)
                local playing_hand = next(G.play.cards)
                local mult = 0
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_hand or not playing_card.highlighted then
                        if playing_card.facing and not (playing_card.facing == 'back') and not playing_card.debuff and playing_card:get_id() == G.GAME.current_round.gfs_card.id then
                            mult = mult + card.ability.extra.mult * JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                        end
                    end
                end
                card.joker_display_values.mult = mult
                card.joker_display_values.localized_text = localize(G.GAME.current_round.gfs_card.rank, "ranks")
            end
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Gfsgfs",
        art = "Gfsgfs",
        code = "HuyTheKiller",
    }
}