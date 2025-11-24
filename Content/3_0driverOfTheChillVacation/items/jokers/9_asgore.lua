SMODS.Joker {
    key = "0chill_driving_in_my_truck",  -- HELP THIS IS BROKEN
    atlas = "0chill_joker_atlas",
    pos = { x = 3, y = 0 },
    rarity = 3,
    order = 1,
    blueprint_compat = true,
    cost = 9,
    config = { extra = { xmult_gain = 0.5, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.card and context.card:get_id() == "K" then
            card.ability.extra.stored = card.ability.extra.stored + card.ability.extra.base_mult
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
                colour = G.C.RED,
                remove = true
            }
        end
        if context.ante_up then
            card.ability.extra.xmult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"restruct"},
        art =  "Monachrome",
        code = "restruct",
    }
}