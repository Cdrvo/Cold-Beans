SMODS.Sticker({
	key = "the_pillar_sticker",
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 3,
		y = 1,
	},
	badge_colour = HEX("7e6752"),
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
		NAMETEAM.simple_apply(self, back, val, function()
			for _, c in ipairs(G.playing_cards) do
				SMODS.recalc_debuff(c)
			end
		end, function()
			for _, c in ipairs(G.playing_cards) do
				SMODS.recalc_debuff(c)
			end
		end)
	end,
	calculate = function(self, card, context)
		if
			context.debuff_card
			and context.debuff_card.area ~= G.jokers
			and context.debuff_card.ability.played_this_ante
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
