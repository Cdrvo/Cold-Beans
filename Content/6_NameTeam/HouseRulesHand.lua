SMODS.PokerHand({
	key = "nteam_collection",
	l_chips = 75,
	l_mult = 5,
	chips = 100,
	mult = 20,
	cb_house_rules = true,
	visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card("j_cbean_nameteam_sticker_collection")))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
	example = {
		{ "D_3", true, stickers = { "eternal", "cbean_hooking" } },
		{ "H_K", true, stickers = { "cbean_mailed" } },
		{ "H_J", true, stickers = { "rental" } },
		{ "C_2", false },
		{ "S_9", false },
	},
	evaluate = function(parts, hand)
		if (#SMODS.find_card("j_cbean_0chill_house_rules") > 0) and (#SMODS.find_card("j_cbean_nameteam_sticker_collection") > 0) then -- if we have the house rules
			return parts.cbean_nteam_collection_part
		end
	end,
})

SMODS.PokerHand({
	key = "nteam_collection_3oak",
	l_chips = 90,
	l_mult = 7,
	chips = 150,
	mult = 30,
	cb_house_rules = true,
	visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and next(SMODS.find_card("j_cbean_nameteam_sticker_collection")))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
	example = {
		{ "D_3", true, stickers = { "eternal", "cbean_hooking" } },
		{ "H_3", true, stickers = { "cbean_mailed" } },
		{ "C_3", true, stickers = { "rental" } },
		{ "C_2", false },
		{ "S_9", false },
	},
	evaluate = function(parts, hand)
		if (#SMODS.find_card("j_cbean_0chill_house_rules") > 0) and (#SMODS.find_card("j_cbean_nameteam_sticker_collection") > 0) and #parts.cbean_nteam_collection_part > 0 and #parts._3 > 0 then -- if we have the house rules
			return { SMODS.merge_lists(parts.cbean_nteam_collection_part, parts._3) }
		end
	end,
})

SMODS.PokerHandPart({
	key = "nteam_collection_part",
	func = function(hand)
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
				in_hand[#in_hand + 1] = card
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
