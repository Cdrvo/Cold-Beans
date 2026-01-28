SMODS.Sticker({
	key = "locked",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 5,
		y = 1,
	},
	badge_colour = HEX("aaaaaa"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
	sticker_type = "Negative",
	sets = {
		Default = true,
		Enhanced = true,
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
	NAMETEAM_applied = function(self, card)
		G.GAME.nteam_locked_index = G.GAME.nteam_locked_index + 1
		card.ability.nteam_lock_link = card.ability.nteam_lock_link or {}
		card.ability.nteam_lock_id = G.GAME.nteam_locked_index
		card.ability.nteam_lock_link[#card.ability.nteam_lock_link + 1] = G.GAME.nteam_locked_index
		local pool = {}
		for _, c in ipairs(G.playing_cards) do
			if c ~= card then
				pool[#pool + 1] = c
			end
		end
		local target = pseudorandom_element(pool, "lock_selection")
		target.ability.nteam_lock_link = target.ability.nteam_lock_link or {}
		target.ability.nteam_lock_link[#target.ability.nteam_lock_link + 1] = G.GAME.nteam_locked_index
	end,
	NAMETEAM_removed = function(self, card)
		for _, c in ipairs(G.playing_cards) do
			if
				c ~= card
				and c.ability.nteam_lock_link
				and NAMETEAM.contains(c.ability.nteam_lock_link, card.ability.nteam_lock_id)
			then
				NAMETEAM.remove_element(c.ability.nteam_lock_link, card.ability.nteam_lock_id)
				if #c.ability.nteam_lock_link == 0 then
					c.ability.nteam_lock_link = nil
				end
				break
			end
		end
		card.ability.nteam_lock_id = nil
	end,
	beans_credits = {
		code = "ThunderEdge",
		team = "Name Team",
		art = "???",
	},
})

ColdBeans.OnCalculate(function(mod, context)
	if context.remove_playing_cards then
		local locked_destroy = {}
		for _, card in ipairs(context.removed) do
			if card.ability.nteam_lock_link then -- if the card has been targeted by locked or has locked
				for _, id in ipairs(card.ability.nteam_lock_link) do -- scan all ids
					for _, checked in ipairs(G.playing_cards) do -- find the other card with the id
						if
							checked ~= card -- is the checked card not the current card being destroyed
                            and not checked.getting_sliced -- is the checked card not being destroyed currently
							and checked.ability.nteam_lock_link -- does the checked card have a list of locked ids
							and NAMETEAM.contains(checked.ability.nteam_lock_link, id) -- does the checked card have our specified id
							and not NAMETEAM.contains(context.removed, checked) -- is the card being checked not being removed currently
						then
							locked_destroy[#locked_destroy + 1] = checked
							break
						end
					end
				end
			end
		end
		if #locked_destroy > 0 then
			SMODS.destroy_cards(locked_destroy, nil, true)
		end
	end
end)
