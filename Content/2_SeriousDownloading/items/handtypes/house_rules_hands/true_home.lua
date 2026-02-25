SMODS.PokerHand({
	key = "sdown_true_home",
	l_chips = 50,
	l_mult = 4,
	chips = 145,
	mult = 15,
	cb_house_rules = true,
	visible = function (self)
        local jokers = not not (next(SMODS.find_card('j_cbean_0chill_house_rules')) and (next(SMODS.find_card("j_seeing_double"))) or next(SMODS.find_card("j_cbean_nameteam_diamondshapewithadotinside")))
        local clicked
        if G.jokers and G.jokers.highlighted then
            for _,v in ipairs(G.jokers.highlighted) do
                if v.config.center.key == "j_cbean_0chill_house_rules" then clicked = true end
            end
        end
        return jokers or clicked
    end,
	example = {
		{ "S_A", true },
		{ "S_A", true },
		{ "D_K", true },
		{ "D_K", true },
		{ "D_K", true },
	},
	evaluate = function(parts, hand)
		if
			(#SMODS.find_card("j_cbean_0chill_house_rules") > 0)
			and (
				(#SMODS.find_card("j_seeing_double") > 0)
				or (#SMODS.find_card("j_cbean_nameteam_diamondshapewithadotinside") > 0)
			)
		then --Checks if house rules and required joker are owned
			if #parts._3 < 1 or #parts._2 < 2 then
				return {}
			end
			local unique_suits = {}
			local threes = {}
			local twos = {}
            for _, cards in ipairs(parts._3) do
				for suit, _ in pairs(SMODS.Suits) do
					local t = {}
					local flush_count = 0
					for _, c in pairs(cards) do
						if c:is_suit(suit, nil, true) then
							t[#t + 1] = c
							flush_count = flush_count + 1
						end
					end
					if flush_count >= 3 then
						threes[#threes + 1] = t
					end
				end
			end
			for _, cards in ipairs(parts._2) do
				for suit, _ in pairs(SMODS.Suits) do
					local t = {}
					local flush_count = 0
					for _, c in pairs(cards) do
						local in_three = false
						for _, threes in ipairs(parts._3) do
							for _, c2 in pairs(threes) do
								if c == c2 then
									in_three = true
									break
								end
							end
							if in_three then
								break
							end
						end
						if c:is_suit(suit, nil, true) and not in_three then
							t[#t + 1] = c
							flush_count = flush_count + 1
						end
					end
					if flush_count >= 2 then
						twos[#twos + 1] = t
					end
				end
			end
			
			if #twos < 1 or #threes < 1 then
				return {}
			end
			return { SMODS.merge_lists(twos, threes) }
		end
	end,
})
