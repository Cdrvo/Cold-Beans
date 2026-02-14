SMODS.Joker {
    key = "jbill_who",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 3 },
    rarity = 2,
    cost = 6,
    config = { extra = { xmult = 1, xmult_gain = 0.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if G.GAME.blind_on_deck == "Big" and context.ending_shop then
            G.GAME.round_resets.blind_choices.Boss = Colonparen.get_new_blind('Boss')
            G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO')
        end
        if context.setting_blind and (G.GAME.blind_on_deck == "Boss" or G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo") then
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_gain",
                    scaling_message = {
                        message = localize("k_who_away"),
                        colour = G.C.MULT
                    }
                })
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Evgast Placeholder"
    }
}