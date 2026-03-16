SMODS.Joker {
    key = "jbill_palte",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 2, y = 1 },
    rarity = 2,
    cost = 5,
    update = function(self, card, dt)
        if G.STATE == G.STATES.SELECTING_HAND then
            G.GAME.blind.chip_text = "???"
        end
        if G.GAME.blind and G.GAME.blind.chip_text and G.GAME.blind.chip_text ~= "???" then
            G.GAME.blind.chip_text = "???"
        end
    end,
    config = { extra = { xmult = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        idea = "Vince Gilligan",
        code = "Evgast",
        team = "Jimbobill",
        art = "Vince Gilligan"
    }
}