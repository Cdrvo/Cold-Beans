SMODS.Sticker({
	key = "the_club_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 1,
		y = 0,
	},
	badge_colour = HEX("b9cb92"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Blind = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	apply_to_deck = function(self, back, val)
		NAMETEAM.simple_apply(self, back, val)
	end,
	NAMETEAM_applied = function(self, card)
		for _, c in ipairs(G.playing_cards) do
			SMODS.recalc_debuff(c)
		end
	end,
	NAMETEAM_removed = function(self, card)
		for _, c in ipairs(G.playing_cards) do
			SMODS.recalc_debuff(c)
		end
	end,
	calculate = function(self, card, context)
		if
			context.debuff_card
			and context.debuff_card.area ~= G.jokers
			and context.debuff_card:is_suit("Clubs", true)
		then
			return {
				debuff = true,
			}
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
