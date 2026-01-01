SMODS.Joker {
    key = "jbill_leak",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 0, y = 1 },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
    end,
    calculate = function(self, card, context)
        if context.skipping_booster and not G.GAME.booster_leaked then
		    return {
                dollars = G.GAME.refund
            }
	    end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}
