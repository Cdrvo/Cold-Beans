SMODS.Joker {
    key = "sdown_path",
    name = "Path in the Woods",
    config = {
        extra = { odds = 10 },
    },
    atlas = "sdown_joker_atlas",
    pos = { x = 2, y = 0 },
    loc_vars = function(self, _, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'sdown_path')
        return { vars = { numerator, denominator } }
    end,
    loc_txt = {
        name = 'Path in the Woods',
        text = {
            "Played {C:attention}Queens{} lose their {C:attention}Enhancement{} and gain a random non-rankless {C:attention}Enhancement{}",
            "{C:green}#1# in #2# chance{} to gain an {C:edition}Edition{} instead"
        }
    },
    calculate = function(self, card, context)
        if context.scoring_hand and #context.scoring_hand > 0 then
            local all_enhancements = get_current_pool("Enhanced")
            local valid_enhancements = {}
            -- Loop through the original list of all enhancements
            for _, enhancement in ipairs(all_enhancements) do
                if enhancement ~= "UNAVAILABLE" and not (enhancement == 'm_stone' or G.P_CENTERS[enhancement].no_rank) then
                    valid_enhancements[#valid_enhancements + 1] = enhancement
                end
            end
            for k, v in ipairs(context.scoring_hand) do
                if v:get_id() == 12 and not v.debuff and v.config.center == G.P_CENTERS.c_base then
                    if SMODS.pseudorandom_probability(card, 'path_in_the_woods', 1, card.ability.extra.odds) then
                        --random edition
                    else
                        --random enhancement
                    end
                end
            end
        end
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art =  "Slipstream",
        code = "Athebyne",
    }
}