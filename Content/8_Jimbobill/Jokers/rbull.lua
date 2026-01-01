SMODS.Joker {
    key = "jbill_redbull",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 1 },
    rarity = 2,
    cost = 5,
    config = { extra = { discards = 67, hands = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
		    ease_discard(card.ability.extra.discards)
	    end
        if G.GAME.current_round.hands_played and G.GAME.current_round.hands_played > card.ability.extra.hands then
            card:start_dissolve()
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}