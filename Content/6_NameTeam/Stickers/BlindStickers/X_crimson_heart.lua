SMODS.Sticker({
	key = "crimson_heart_sticker",
	showdown_sticker = true,
	atlas = "NAMETEAM_Stickers_boss",
	pos = {
		x = 5,
		y = 2,
	},
	badge_colour = HEX("ac3232"),
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
		for _, j in ipairs(G.jokers.cards) do
			SMODS.recalc_debuff(j)
		end
	end,
	NAMETEAM_removed = function(self, card)
		for _, j in ipairs(G.jokers.cards) do
			j.ability.crimson_heart_sticker_chosen = nil
			SMODS.recalc_debuff(j)
		end
	end,
	calculate = function(self, card, context)
		if context.debuff_card and context.debuff_card.area == G.jokers then
			if context.debuff_card.ability.crimson_heart_sticker_chosen then
				return {
					debuff = true,
				}
			end
		end
		if context.press_play and G.jokers.cards[1] then
			self.prepped = true
		end
		if context.hand_drawn then
			if self.prepped and G.jokers.cards[1] then
				local prev_chosen_set = {}
				local fallback_jokers = {}
				local jokers = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i].ability.crimson_heart_sticker_chosen then
						prev_chosen_set[G.jokers.cards[i]] = true
						G.jokers.cards[i].ability.crimson_heart_sticker_chosen = nil
						if G.jokers.cards[i].debuff then
							SMODS.recalc_debuff(G.jokers.cards[i])
						end
					end
				end
				for i = 1, #G.jokers.cards do
					if not G.jokers.cards[i].debuff then
						if not prev_chosen_set[G.jokers.cards[i]] then
							jokers[#jokers + 1] = G.jokers.cards[i]
						end
						table.insert(fallback_jokers, G.jokers.cards[i])
					end
				end
				if #jokers == 0 then
					jokers = fallback_jokers
				end
				local _card = pseudorandom_element(jokers, "crimson_heart_sticker")
				if _card then
					_card.ability.crimson_heart_sticker_chosen = true
					SMODS.recalc_debuff(_card)
					_card:juice_up()
				end
			end
			self.prepped = nil
		end
		if context.end_of_round and context.main_eval and not context.game_over then
			for _, j in ipairs(G.jokers.cards) do
				j.ability.crimson_heart_sticker_chosen = nil
				SMODS.recalc_debuff(j)
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
