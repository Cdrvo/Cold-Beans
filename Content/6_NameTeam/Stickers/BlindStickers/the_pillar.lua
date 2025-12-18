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
		local had_sticker = back.ability[self.key]
		back.ability[self.key] = val
		if back.ability[self.key] and not had_sticker then
			if self.NAMETEAM_removed then
				if val == false then
					self:NAMETEAM_removed(self)
				else
					self:NAMETEAM_applied(self)
				end
			end
		end
	end,
	NAMETEAM_removed = function(self, card)
		if G.playing_cards then
			for k, v in pairs(G.playing_cards) do
				if v.debuffed_by_pillarstkr then
					v.debuffed_by_pillarstkr = nil
					SMODS.debuff_card(v, false, "NAMETEAM_pillar_sticker")
				end
			end
		end
	end,
	calculate = function(self, card, context)
		if context.final_scoring_step then
			G.E_MANAGER:add_event(Event({
				func = function()
					for k, v in pairs(context.scoring_hand) do
						SMODS.debuff_card(v, true, "NAMETEAM_pillar_sticker")
						v:juice_up()
						v.debuffed_by_pillarstkr = true
					end
					return true
				end,
			}))
		end
		if context.end_of_round and G.GAME.blind.boss then
			for k, v in pairs(G.playing_cards) do
				if v.debuffed_by_pillarstkr then
					v.debuffed_by_pillarstkr = nil
					SMODS.debuff_card(v, false, "NAMETEAM_pillar_sticker")
				end
			end
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Inky",
	},
})
