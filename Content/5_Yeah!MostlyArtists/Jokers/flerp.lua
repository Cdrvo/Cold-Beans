--[[SMODS.Joker {
	key = 'yma_flerp',
	rarity = 3,
	atlas = 'yma_joker_atlas',
	pos = { x = 0, y = 0 },
	cost = 10,
	blueprint_compat = false,
	config = {},
	loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,
	add_to_deck = function(self, card, from_debuff)
		SMODS.set_scoring_calculation("yma_flerp_window")
	end,
	remove_from_deck = function(self, card, from_debuff)
		SMODS.set_scoring_calculation("multiply")
	end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "None",
        code = "Rainstar",
    }
}]]--