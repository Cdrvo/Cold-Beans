local misprint_gradient = SMODS.Gradient({
	key = "misprint_gradient",
	colours = {
		G.C.BLACK,
		G.C.RED,
		G.C.GREEN,
		G.C.DYN_UI.BOSS_PALE,
		G.C.ORANGE,
		G.C.PURPLE,
		G.C.DYN_UI.BOSS_DARK,
		G.C.WHITE,
		G.C.BLUE,
		G.C.YELLOW,
		G.C.ETERNAL,
	},
	cycle = 2,
})

SMODS.Sticker({
	key = "misprinted",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 6,
		y = 1,
	},
	badge_colour = misprint_gradient,
	config = { copied = nil },
	rate = 0.06,
	needs_enable_flag = true,
	sticker_type = "Negative",
	sets = {
		Default = true,
		Enhanced = true,
		Joker = true,
		Consumable = true,
		Deck = true,
	},
	loc_vars = function(self, info_queue, card)
		local text = "None"
		if self.config.copied then
			text = localize(self.config.copied, "labels")
		end
		return {
			vars = { text },
		}
	end,
	calculate = function(self, card, context)
		local ret = nil
		if self.config.copied and SMODS.Stickers[self.config.copied] and SMODS.Stickers[self.config.copied].calculate then
			ret = SMODS.Stickers[self.config.copied]:calculate(card, context)
		end
		if context.end_of_round and not context.game_over and context.main_eval then
			if card == G.deck.cards[1] or card == G.deck then
				local pool = {}
				for k, v in pairs(SMODS.Stickers) do
					if k ~= "cbean_misprinted" and v.sets["Deck"] then
						pool[#pool + 1] = k
					end
				end
				if
					self.config.copied
					and SMODS.Stickers[self.config.copied]
					and SMODS.Stickers[self.config.copied].NAMETEAM_removed
				then
					SMODS.Stickers[self.config.copied]:NAMETEAM_removed(card)
				end
				self.config.copied = pseudorandom_element(pool, "misprint_sticker")
				if
					self.config.copied
					and SMODS.Stickers[self.config.copied]
					and SMODS.Stickers[self.config.copied].NAMETEAM_applied
				then
					SMODS.Stickers[self.config.copied]:NAMETEAM_applied(card)
				end
			else
				local pool = {}
				for k, v in pairs(SMODS.Stickers) do
					if k ~= "cbean_misprinted" and v.sets[card.ability.set] then
						pool[#pool + 1] = k
					end
				end
				if
					self.config.copied
					and SMODS.Stickers[self.config.copied]
					and SMODS.Stickers[self.config.copied].NAMETEAM_removed
				then
					SMODS.Stickers[self.config.copied]:NAMETEAM_removed(card)
				end
				self.config.copied = pseudorandom_element(pool, "misprint_sticker")
				if
					self.config.copied
					and SMODS.Stickers[self.config.copied]
					and SMODS.Stickers[self.config.copied].NAMETEAM_applied
				then
					SMODS.Stickers[self.config.copied]:NAMETEAM_applied(card)
				end
			end
			SMODS.calculate_effect({
				message = localize("k_cbean_nteam_randomized"),
			}, card)
		end
		return ret
	end,
	NAMETEAM_removed = function(self, card)
		if
			self.config.copied
			and SMODS.Stickers[self.config.copied]
			and SMODS.Stickers[self.config.copied].NAMETEAM_removed
		then
			SMODS.Stickers[self.config.copied]:NAMETEAM_removed(card)
		end
	end,
	beans_credits = {
		code = "ThunderEdge",
		team = "Name Team",
		art = "Doggfly",
	},
})
