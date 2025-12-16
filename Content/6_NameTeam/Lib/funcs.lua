function NAMETEAM.poll_sticker(guaranteed, check, check_allowed, set, test)
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

	local finaltab = {}

	for k, v in pairs(tab) do
		if SMODS.Stickers[v.key].sets[set] then
			finaltab[#finaltab + 1] = v
		end
	end

	local random_sticker = pseudorandom_element(finaltab)

	if random_sticker then
		if guaranteed then
			random_sticker = random_sticker
		else
			if pseudorandom("poll_sticker") < tonumber(SMODS.Stickers[random_sticker.key].rate) then
				random_sticker = nil
			end
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
		if
			v.rarity == (card.rarity or (card.config and card.config.center and card.config.center.rarity))
			and v.key ~= (card.key or (card.config and card.config.center and card.config.center.key))
		then
			tab[#tab + 1] = v.key
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

-- Yoinked from Paperback
function NAMETEAM.plasma_visuals(card)
	update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })

	-- Cosmetic effects
	G.E_MANAGER:add_event(Event({
		func = function()
			-- Play sounds and change the color of the scoring values
			play_sound("gong", 0.94, 0.3)
			play_sound("gong", 0.94 * 1.5, 0.2)
			play_sound("tarot1", 1.5)
			ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
			ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })

			-- If a card was passed, show the balanced message on it
			if card then
				SMODS.calculate_effect({
					message = localize("k_balanced"),
					colour = { 0.8, 0.45, 0.85, 1 },
					instant = true,
				}, card)
			end

			-- Return the colors to normal
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				blockable = false,
				blocking = false,
				delay = 4.3,
				func = function()
					ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
					ease_colour(G.C.UI_MULT, G.C.RED, 2)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				trigger = "after",
				blockable = false,
				blocking = false,
				no_delete = true,
				delay = 6.3,
				func = function()
					G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] =
						G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
					G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] =
						G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
					return true
				end,
			}))
			return true
		end,
	}))

	delay(0.6)
end

-- Stolen straight from StackOverflow
function NAMETEAM.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

-- Yoinked from Multiverse
function NAMETEAM.create_localized_rows(set, key, args)
	args = args or {}
	args.bg_colour = args.bg_colour or G.C.WHITE
	local loc_entry
	args.text_scale = args.text_scale or 1
	if set then
		loc_entry = G.localization.descriptions[set][key]
	else
		loc_entry = G.localization.misc.dictionary[key]
	end
	local rows = {}
	if set then
		table.insert(rows, {
			n = G.UIT.R,
			config = { align = "cm", padding = 0.05 },
			nodes = {
				{
					n = G.UIT.C,
					config = { align = "cm" },
					nodes = {
						{ n = G.UIT.T, config = { text = loc_entry.name, colour = G.C.UI.TEXT_LIGHT, scale = 0.4 } },
					},
				},
			},
		})
		local text_rows = {}
		for _, line in ipairs(loc_entry.text_parsed) do
			table.insert(text_rows, {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = SMODS.localize_box(line, { scale = 0.9 * args.text_scale, vars = args.loc_vars }),
			})
		end
		table.insert(rows, {
			n = G.UIT.R,
			config = { align = "cm", padding = 0.05, colour = args.bg_colour, r = 0.1, emboss = 0.05 },
			nodes = {
				{
					n = G.UIT.C,
					config = { align = "cm", padding = 0.05 },
					nodes = text_rows,
				},
			},
		})
	else
		local text_rows = {}
		for _, line in ipairs(loc_entry) do
			table.insert(text_rows, {
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = SMODS.localize_box(loc_parse_string(line), { scale = 0.9 * args.text_scale, vars = args.loc_vars }),
			})
		end
		table.insert(rows, {
			n = G.UIT.R,
			config = { align = "cm", padding = 0.05, colour = args.bg_colour, r = 0.1, emboss = 0.05 },
			nodes = {
				{
					n = G.UIT.C,
					config = { align = "cm", padding = 0.05 },
					nodes = text_rows,
				},
			},
		})
	end
	return rows
end

function NAMETEAM.get_unique_pseudorandom_elements(t, n, seed)
	local eligible = {}
	for i = 1, #t do
		eligible[#eligible + 1] = i
	end
	local ret = {}
	for i = 1, math.min(n, #t) do
		local target_index, eligible_index = pseudorandom_element(eligible, seed)
		ret[#ret + 1] = t[target_index]
		table.remove(eligible, eligible_index)
	end
	return ret
end

function NAMETEAM.filter(t, func)
	local ret = {}
	for _, v in ipairs(t) do
		if func(v) then
			table.insert(ret, v)
		end
	end
	return ret
end