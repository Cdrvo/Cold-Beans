SMODS.Joker {
    key = "0chill_driving_in_my_truck",
    atlas = "0chill_joker_atlas",
    pos = { x = 2, y = 1 },
    rarity = 3,
    order = 1,
    blueprint_compat = true,
    cost = 9,
    config = { extra = { xmult_gain = 2, xmult = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if
            (context.cardarea == G.play or context.cardarea == "unscored")
            and context.destroying_card
            and not context.blueprint
            and not context.retrigger_joker
        then
            if context.destroying_card:get_id() == 13 then
                play_sound('cbean_0chill_asgore')
                SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar_value = "xmult_gain",
                        scaling_message = {
                            message = "Berkuntruckin",
                            colour = G.C.RED,
                        },
                    })
                    return {
                        card = context.other_card,
                        remove = not context.destroying_card.ability.eternal,
                    }
            end
        end
        if context.ante_change and context.ante_change > 0 then
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
        code = {"restruct",
        "MarioFan597"},
    }
}