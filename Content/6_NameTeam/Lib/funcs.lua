function NAMETEAM.poll_sticker(guaranteed, check, check_allowed, set)
	local tab = {}
	for k, v in pairs(SMODS.Stickers) do
		if check ~= nil then
			if not check.ability[k] and not check[k] then
				if check_allowed then
					if
						G.GAME.modifiers["enable_" .. k] == true
						or G.GAME.modifiers["enable_" .. k .. "s_in_shop"] == true
					then
						tab[#tab + 1] = v
					end
				else
					tab[#tab + 1] = v
				end
			end
		else
			if check_allowed then
				if
					G.GAME.modifiers["enable_" .. k] == true
					or G.GAME.modifiers["enable_" .. k .. "s_in_shop"] == true
				then
					tab[#tab + 1] = v
				end
			else
				tab[#tab + 1] = v
			end
		end
	end

    for k, v in pairs(tab) do
        if set then
            if not SMODS.Stickers[v.key].sets[set] then
                table.remove(tab, k)
            end
        end
    end
    
	local random_sticker = pseudorandom_element(tab)
	if not guaranteed then
		if not (pseudorandom("poll_sticker") < tonumber(random_sticker.rate)) then
			random_sticker = nil
		end
	end
	if random_sticker then
		return random_sticker.key
	end
end

function NAMETEAM.replacecards(card) 
    local tab = {}

    if not card then
        return nil
    end

    for k, v in pairs(G.P_CENTER_POOLS.Joker) do
        if v.rarity == (card.rarity or (card.config and card.config.center and card.config.center.rarity)) and v.key ~= (card.key or (card.config and card.config.center and card.config.center.key)) then
            tab[#tab+1] = v.key
        end
    end

    card:juice_up()
    card:set_ability(pseudorandom_element(tab))
end


function NAMETEAM.discard_limit(mod)
	G.GAME.starting_params.discard_limit = G.GAME.starting_params.discard_limit + mod
	if G.GAME.starting_params.discard_limit < 0 then
		sendErrorMessage("Discard limit is less than 0", "HandLimitAPI")
	end
	G.hand.config.highlighted_limit =
		math.max(G.GAME.starting_params.discard_limit, G.GAME.starting_params.play_limit, 5)
end