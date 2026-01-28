SMODS.PokerHand({
	key = "nteam_collection",
	l_chips = 75,
	l_mult = 5,
	chips = 100,
	mult = 20,
	cb_house_rules = true,
	visible = function(self)
		local joker = not not next(SMODS.find_card("j_cbean_0chill_house_rules"))
		local clicked
		if G.jokers and G.jokers.highlighted then
			for _, v in ipairs(G.jokers.highlighted) do
				if v.config.center.key == "j_cbean_0chill_house_rules" then
					clicked = true
				end
			end
		end
		local played = G.GAME.hands and G.GAME.hands[self.key] and (G.GAME.hands[self.key].played or 0) > 0

		return joker and (played or clicked)
	end,
	example = {
		{ "D_3", true },
		{ "H_K", true },
		{ "H_J", true },
		{ "C_2", false },
		{ "S_9", false },
	},
	evaluate = function(parts, hand)
		if #SMODS.find_card("j_cbean_0chill_house_rules") > 0 then -- if we have the house rules
			return parts.cbean_nteam_collection_part
		end
	end,
})

SMODS.PokerHandPart({
    key = "nteam_collection_part",
    func = function (hand)
        local seen = {}
        local num_with_stickers = 0
        local in_hand = {}
        if #hand < 3 then
            return {}
        end
        for _, card in ipairs(hand) do
            local stickers = NAMETEAM.get_all_stickers(card)
            if #stickers > 0 then
                num_with_stickers = num_with_stickers + 1
                in_hand[#in_hand+1] = card
            end
            for _, key in ipairs(stickers) do
                seen[key] = true
            end
        end
        if num_with_stickers < 3 or NAMETEAM.len(seen) < 3 then
            return {}
        end
        return { in_hand }
    end,
})