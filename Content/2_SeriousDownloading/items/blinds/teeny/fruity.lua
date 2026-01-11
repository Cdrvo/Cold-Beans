Colonparen.TeenyBlind{
    key = "sdown_fruity",
    atlas = "sdown_blinds_atlas",
    pos = {
        x = 0,
        y = 9,
    },
    mult = 0.75,
    dollars = 2,
    boss_colour = HEX("3e276b"),
    loc_vars = function(self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 4, 'sdown_fruity')
        return { vars = { numerator, denominator } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    calculate = function (self, blind, context)
        if context.before and  context.scoring_hand and context.poker_hands ~= nil and next(context.poker_hands['cbean_sdown_antistraight']) and SMODS.pseudorandom_probability(blind, 'vremade_wheel', 1, 4) then
            local cards = {}
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_edition() == nil then
                    table.insert(cards, context.scoring_hand[i])
                end
            end
            local fruity_card = cards[math.random(#cards)]
            G.E_MANAGER:add_event(Event({
                func = function()
                    if cards and #cards > 0 then
                        fruity_card:juice_up()
                        fruity_card:set_edition({ polychrome = true }, true, true)
                    end
                    return true end
            }))
        end
    end
}