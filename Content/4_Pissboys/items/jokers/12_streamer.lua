SMODS.Joker {
    key = "pboys_streamer",
    atlas = "pboys_joker_atlas",
    pos = { x = 2, y = 1 },
    rarity = 1,
    order = 12,
    blueprint_compat = true,
    cost = 6,
    config = {extra = {dollar_min = 1, dollar_max = 3}},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.c_aura
        return {vars = {card.ability.extra.dollar_min, card.ability.extra.dollar_max, localize{type = 'name_text', set = "Spectral", key = "c_aura", nodes = {}}}}
    end,
    calculate = function(self, card, context) --Making an exception for combo card since using them doesn't actually use them
        if (context.using_consumeable and context.consumeable.ability.set ~= "Combo") or context.cbean_streamer_hype
        or (context.end_of_round and context.main_eval and G.GAME.current_round.hands_played == 1) then
            return {
                dollars = pseudorandom("streamer_donate", card.ability.extra.dollar_min, card.ability.extra.dollar_max)
            }
        end
        if context.before and G.GAME.cbean_combo_index and #G.GAME.cbean_combo_index > 0 then
            local money = 0
            for i = 1, #G.GAME.cbean_combo_index do
                money = money + pseudorandom("streamer_donate", card.ability.extra.dollar_min, card.ability.extra.dollar_max)
            end
            return {
                dollars = money
            }
        end
    end,
    joker_display_def = function(JokerDisplay)
        return {
            text = {
                { text = "(" },
                { text = "+$", colour = G.C.GOLD },
                { ref_table = "card.ability.extra", ref_value = "dollar_min", retrigger_type = "mult", colour = G.C.GOLD },
                { text = "-" },
                { text = "+$", colour = G.C.GOLD },
                { ref_table = "card.ability.extra", ref_value = "dollar_max", retrigger_type = "mult", colour = G.C.GOLD },
                { text = ")" },
            },
            text_config = { colour = G.C.UI.TEXT_INACTIVE },
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