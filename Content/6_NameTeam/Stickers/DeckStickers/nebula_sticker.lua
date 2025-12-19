SMODS.Sticker({
	key = "nebula",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 2,
		y = 1,
	},
	badge_colour = HEX("567d89"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
		Deck = true,
	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
		return {
			vars = {},
		}
	end,
	apply_to_deck = function(self, back, val)
		NAMETEAM.simple_apply(self, back, val, function()
			if G.consumeables then
				G.consumeables:change_size(-1)
			end
		end, function()
			if G.consumeables then
				G.consumeables:change_size(1)
			end
		end)
	end,
	calculate = function(self, card, context)
		if context.setting_blind and G.GAME.blind:get_type() == "Small" then
			local ae
			for k, v in pairs(G.P_CENTER_POOLS.Planet) do
				if v.config.hand_type == NAMETEAM.most_played() then
					ae = v
					break
				end
			end
			SMODS.add_card({
				key = ae.key,
				edition = "e_negative",
				area = G.consumeables,
				set = "Planet",
			})
		end
	end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "GhostSalt",
	},
})
