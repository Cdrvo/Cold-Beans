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
			config = { align = "cm", padding = 0.05, colour = args.bg_colour, r = 0.1, emboss = 0.05, minw = args.minw },
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
			config = { align = "cm", padding = 0.05, colour = args.bg_colour, r = 0.1, emboss = 0.05, minw = args.minw },
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

---@generic T
---@param t T[]
---@param func fun(item: T): boolean
---@return T[]
function NAMETEAM.filter(t, func)
	local ret = {}
	for _, v in ipairs(t) do
		if func(v) then
			table.insert(ret, v)
		end
	end
	return ret
end

-- Both of these take sticker tables, not keys to strings
function Card:NAMETEAM_remove_sticker_calc(sticker) 
	if sticker and self.area then
    	if sticker.NAMETEAM_removed then sticker:NAMETEAM_removed(self) end
		SMODS.calculate_context({sticker_removed = true, other_sticker = sticker, other_card = self})
	end
end

function Card:NAMETEAM_apply_sticker_calc(sticker) 
	if sticker and self.area then
    	if sticker.NAMETEAM_applied then sticker:NAMETEAM_applied(self) end
		SMODS.calculate_context({sticker_applied = true, other_sticker = sticker, other_card = self})
	end
end

-- ColdBeans.OnCalculate(function (mod, context)
-- 	if context.sticker_applied or context.sticker_removed then
-- 		return {
-- 			message = "HI"
-- 		}
-- 	end
-- end)

function NAMETEAM.most_played()
	local _hand, _tally = nil, -1
	for k, v in ipairs(G.handlist) do
		if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
			_hand = v
			_tally = G.GAME.hands[v].played
		end
	end
	return _hand
end

---@param sticker SMODS.Sticker
---@param card Card | Back
---@param val any
---@param on_apply? fun()
---@param on_remove? fun()
function NAMETEAM.simple_apply(sticker, card, val, on_apply, on_remove)
	local had_sticker = card.ability[sticker.key]
	card.ability[sticker.key] = val
	if val and not had_sticker and on_apply then
		on_apply()
	elseif had_sticker and not val and on_remove then
		on_remove()
	end
end

function NAMETEAM.get_amount_of_unique_stickers()
    -- Starting by listing all sticker keys
    sticker_keys = {}
    sticker_gotten = {}
    unique_stickers = 0
    for k, v in pairs(SMODS.Stickers) do
        sticker_keys[#sticker_keys+1] = v.key
    end
    for k, v in ipairs(G.jokers.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) and jv then
                sticker_gotten[jk] = true
            end
        end
    end
    for k, v in ipairs(G.playing_cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) and jv then
                sticker_gotten[jk] = true
            end
        end
    end
    for k, v in ipairs(G.consumeables.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) and jv then
                sticker_gotten[jk] = true
            end
        end
    end
    for jk, jv in pairs(G.GAME.selected_back.ability) do
        if NAMETEAM.contains(sticker_keys, jk) and jv then
            sticker_gotten[jk] = true
        end
    end
    for _ in pairs(sticker_gotten) do
        unique_stickers = unique_stickers +1 
    end
    return unique_stickers
end

function NAMETEAM.get_amount_of_stickers()
    -- Starting by listing all sticker keys
    sticker_keys = {}
    sticker_amount = 0
    for k, v in pairs(SMODS.Stickers) do
        sticker_keys[#sticker_keys+1] = v.key
    end
    for k, v in ipairs(G.jokers.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) and jv then
                sticker_amount = sticker_amount + 1
            end
        end
    end
    for k, v in ipairs(G.playing_cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) and jv then
                sticker_amount = sticker_amount + 1
            end
        end
    end
    for k, v in ipairs(G.consumeables.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) and jv then
                sticker_amount = sticker_amount + 1
            end
        end
    end
    for jk, jv in pairs(G.GAME.selected_back.ability) do
        if NAMETEAM.contains(sticker_keys, jk) and jv then
            sticker_amount = sticker_amount + 1
        end
    end
    return sticker_amount
end

function NAMETEAM.random_joker(area, exclude_card)
	local jokers = {}
	for i = 1, #area do
		if area[i] ~= exclude_card then
			jokers[#jokers + 1] = area[i]
		end
	end
	local result = pseudorandom_element(jokers, pseudoseed("nteam_random_joker"))
	return result
end

function NAMETEAM.mult_value(table, value)	
	new_table = {}
	for k, v in pairs(table) do
		if type(v) == "table" then
			new_new_table = copy_table(NAMETEAM.mult_value(v, value))
			new_table[k] = new_new_table
		elseif type(v) == "number" then
			if
			v ~= 0 and (v ~= 1 or (name ~= "x_chips" and name ~= "x_mult"))
			then
				new_table[k] = v * 2
			else
				new_table[k] = v
			end
		else
			new_table[k] = v
		end
	end

	return new_table
end

