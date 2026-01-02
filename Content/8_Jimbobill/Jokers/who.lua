SMODS.Joker {
    key = "jbill_who",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 0, y = 2 },
    rarity = 2,
    cost = 6,
    config = { extra = { xmult = 1, xmult_gain = 0.25 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        if G.GAME.blind_on_deck == "Big" and context.ending_shop then
            G.GAME.round_resets.blind_choices.Boss = Colonparen.get_new_blind('Boss')
            print(G.GAME.round_resets.blind_choices.Boss)
        elseif G.GAME.blind_on_deck == "Boss" and context.ending_shop then
            G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO')
            print(G.GAME.round_resets.blind_choices.CEO)
        end
        if context.setting_blind and (G.GAME.blind_on_deck == "Boss" or G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo") then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
            return {
                message = localize("k_jbill_away"),
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
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Osaka & Men at Work"
    }
}