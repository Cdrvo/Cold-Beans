SMODS.Joker {
    key = "jbill_stare",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 5 },
    rarity = 2,
    cost = 5,
    config = { extra = { xmult = 1, xmult_gain = 0.25, percentage = 110 } },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.xmult, 
                card.ability.extra.xmult_gain, 
                card.ability.extra.percentage
            } 
        }
    end,
    calculate = function(self, card, context)
        if context.blind_defeated and (((G.GAME.chips / G.GAME.blind.chips) * 100) < card.ability.extra.percentage) then
            --print(((G.GAME.chips / G.GAME.blind.chips) * 100))
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
                scaling_message = {
                    message = "+X" .. card.ability.extra.xmult_gain,
                    colour = G.C.MULT
                }
            })
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = {"Jimbobill/",
                "0 Drivers of",
                "The Chill Vaction"},
        art = "MarioFan597"
    }
}