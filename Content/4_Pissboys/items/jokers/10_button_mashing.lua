SMODS.Joker {
    key = "pboys_button_mashing",
    atlas = "pboys_joker_atlas",
    pos = { x = 9, y = 0 },
    rarity = 2,
    order = 10,
    blueprint_compat = true,
    cost = 5,
    config = {extra = {odds = 3}},
    loc_vars = function(self, info_queue, card)
		return {vars = {SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "pboys_button_mashing")}}
    end,
    calculate = function(self, card, context)
        if context.joker_main and SMODS.pseudorandom_probability(card, "pboys_button_mashing", 1, card.ability.extra.odds)
        and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 0.25 --yikes, it takes 4 combo cards to fill a slot
            G.E_MANAGER:add_event(Event({
                func = (function()
                        SMODS.add_card{set = "Combo", key_append = "butma"}
                        G.GAME.consumeable_buffer = 0
                    return true
                end)}))
            return {
                message = localize("k_cbean_mash_ex"),
                colour = G.C.SECONDARY_SET.Combo,
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "odds" },
                    { text = ")" },
                }
            },
            extra_config = { colour = G.C.GREEN, scale = 0.3 },
            calc_function = function(card)
                card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "pboys_button_mashing") } }
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