SMODS.Consumable {
    key = '0chill_cronus',
    set = "Spectral",
    hidden = true,
    soul_set = "sdown_blessing",
    atlas = '0chill_spectral_atlas',
    cost = 8,
    pos = { x = 1, y = 0},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.times_left,
                card.ability.extra.gain,
            },
        }
    end,
    config = {
        extra = {
            times_left = 5,
            should_tick_down = false,
            gain = 3
        }
    },
    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'sdown_blessing' then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "times_left",
                    scalar_value = "gain",
                })
        end
        if context.end_of_round and not context.game_over and context.main_eval then
            for _,consumeable in ipairs(G.consumeables.cards) do
                if consumeable.ability.set == 'sdown_blessing' then
                    card.should_tick_down = true
                end
            end
            if card.should_tick_down then
                card.should_tick_down = false
                card.ability.extra.times_left = card.ability.extra.times_left - 1
            end
            if card.ability.extra.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                SMODS.calculate_effect({message = localize('k_dispelled_ex') }, card)
            --else
                --return {
                    --message = (card.ability.extra.times_left)
                --}
            end
        end
    end,
    select_card = "consumeables",
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "cmykl",
        code = "MarioFan597",
    },
}