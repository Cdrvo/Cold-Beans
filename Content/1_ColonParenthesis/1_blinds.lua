local G_UIDEF_current_blinds = G.UIDEF.current_blinds;
function G.UIDEF.current_blinds()
	local value = G_UIDEF_current_blinds();
	table.insert(value.nodes, 1, G.GAME.round_resets.blind_states['Teeny'] ~= 'Hide' and {n=G.UIT.C, config={align = "tm", padding = 0.1, outline = 2, r = 0.1, line_emboss = 0.2, outline_colour = G.C.BLACK}, nodes={
      create_UIBox_blind_choice('Teeny', true)
    }} or nil)
	value.nodes[#value.nodes+1] = G.GAME.round_resets.blind_states['CEO'] ~= 'Hide' and {n=G.UIT.C, config={align = "tm", padding = 0.1, outline = 2, r = 0.1, line_emboss = 0.2, outline_colour = G.C.BLACK}, nodes={
      create_UIBox_blind_choice('CEO', true)
    }} or nil;
	return value;
end

function reset_blinds()
    G.GAME.round_resets.blind_states = G.GAME.round_resets.blind_states or {Teeny = 'Select', Small = 'Upcoming', Big = 'Upcoming', Boss = 'Upcoming', CEO = 'Upcoming'}
    if G.GAME.round_resets.blind_states.CEO == 'Defeated' then
        G.GAME.round_resets.blind_states.Teeny = 'Upcoming'
        G.GAME.round_resets.blind_states.Small = 'Upcoming'
        G.GAME.round_resets.blind_states.Big = 'Upcoming'
        G.GAME.round_resets.blind_states.Boss = 'Upcoming'
        G.GAME.round_resets.blind_states.CEO = 'Upcoming'
        G.GAME.blind_on_deck = 'Teeny'

		if G.GAME.next_colonparen_prescribed_blinds then
			G.GAME.colonparen_prescribed_blinds = G.GAME.next_colonparen_prescribed_blinds; -- precribe blinds for this ante
			G.GAME.next_colonparen_prescribed_blinds = nil; -- make sure carry over doesn't happen
		elseif G.GAME.colonparen_prescribed_blinds then
			G.GAME.colonparen_prescribed_blinds = nil -- make sure carry over doesn't happen (since if its set it must be from a previous call to reset_blinds
		end

		G.GAME.round_resets.blind_choices.Boss = Colonparen.get_new_blind('Boss')
		G.GAME.round_resets.blind_choices.Teeny = Colonparen.get_new_blind('Teeny')
		G.GAME.round_resets.blind_choices.Small = Colonparen.get_new_blind('Small')
		G.GAME.round_resets.blind_choices.Big = Colonparen.get_new_blind('Big')
		G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO')

        G.GAME.round_resets.boss_rerolled = false
    end
end

function Blind:get_type()
	return G.GAME.blind_on_deck
end

function Blind:true_type()
	return self.colonparen_blindtype
end

local set_blind = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
	if not reset then
		self.colonparen_blindtype = (blind or {}).colonparen_blindtype;
		if self.colonparen_blindtype == nil then
			if self.name == "Small Blind" then
				self.colonparen_blindtype = 'Small'
			elseif self.name == "Big Blind" then 
				self.colonparen_blindtype = 'Big'
			elseif self.name and self.name ~= '' then
				self.colonparen_blindtype = 'Boss'
			end
		end
	end
	return set_blind(self, blind, reset, silent)
end
for i, name in ipairs({'Teeny', 'Small', 'Big', 'CEO'}) do
	local P_STRING = 'P_' ..  (name:upper()) .. '_BLINDS'
	G[P_STRING] = {}
	Colonparen[name .. 'Blind'] = SMODS.Blind:extend {
        get_obj = function(self, key) return G[P_STRING][key] end,
        register = function(self)
            self.name = self.name or self.key
			self.colonparen_blindtype = name;
            SMODS.Blind.super.register(self)
        end,
        inject = function(self, i)
            -- no pools to query length of, so we assign order manually
            if not self.taken_ownership then
                self.order = 30 + i
            end
            G[P_STRING][self.key] = self
        end
    }
end
G.P_SMALL_BLINDS.bl_small = G.P_BLINDS.bl_small
G.P_BIG_BLINDS.bl_big = G.P_BLINDS.bl_big
Colonparen.BossBlind = SMODS.Blind;

local old_get_new_boss = get_new_boss;
function get_new_boss(...)
	if G.GAME.colonparen_prescribed_blinds 
		and G.GAME.colonparen_prescribed_blinds.Boss then
			return G.GAME.colonparen_prescribed_blinds.Boss
	end
	return old_get_new_boss(...);
end

function Colonparen.get_new_blind(type)
	if type == "Boss" then
		return get_new_boss()
	end
	if G.GAME.colonparen_prescribed_blinds 
		and G.GAME.colonparen_prescribed_blinds[type] then
			return G.GAME.colonparen_prescribed_blinds[type]
	end
	local P_STRING = 'P_' ..  (type:upper()) .. '_BLINDS'
	local eligible_bosses = {}
	if (type == "CEO") then
		for k, v in pairs(G[P_STRING]) do
			local res, options = SMODS.add_to_pool(v)
			options = options or {}
			if not v.boss then
			
			elseif options.ignore_showdown_check then
				eligible_bosses[k] = res and true or nil
			elseif v.in_pool and type(v.in_pool) == 'function' then
				if
					(
						((G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2) ==
						(v.boss.showdown or false)
					)
				then
					eligible_bosses[k] = res and true or nil
				end
			elseif not v.boss.showdown and (((not v.boss.min) or (v.boss.min <= math.max(1, G.GAME.round_resets.ante))) and ((not v.boss.max) or ((math.max(1, G.GAME.round_resets.ante))%G.GAME.win_ante ~= 0 or G.GAME.round_resets.ante < 2))) then
				eligible_bosses[k] = res and true or nil
			elseif v.boss.showdown and (G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2 then
				eligible_bosses[k] = res and true or nil
			end
		end
	else
		for k, v in pairs(G[P_STRING]) do
			eligible_bosses[k] = SMODS.add_to_pool(v)
			if (not G.GAME.bosses_used[k]) then
				G.GAME.bosses_used[k] = 0
			end
		end
	end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    local min_use = nil
    for k, v in pairs(G.GAME.bosses_used) do
        if eligible_bosses[k] then
            eligible_bosses[k] = v
            if (not min_use) or (eligible_bosses[k] <= min_use) then 
                min_use = eligible_bosses[k]
            end
        end
    end
	min_use = min_use or 0
    for k, v in pairs(eligible_bosses) do
        if eligible_bosses[k] then
			if eligible_bosses[k] == true then
				eligible_bosses[k] = 0
			end
            if eligible_bosses[k] > min_use then 
                eligible_bosses[k] = nil
            end
        end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    G.GAME.bosses_used[boss] = (G.GAME.bosses_used[boss] or 0) + 1
    
    return boss
end

function Colonparen.get_blind_by_key(key)
	if key == 'bl_small' then return G.P_BLINDS.bl_small, 'Small' end
	if key == 'bl_big' then return G.P_BLINDS.bl_big, 'Big' end
	if G.P_BLINDS[key] then return G.P_BLINDS[key], 'Boss' end
	for i, name in ipairs({'Teeny', 'Small', 'Big', 'CEO'}) do
		local P_STRING = 'P_' ..  (name:upper()) .. '_BLINDS'
		if G[P_STRING][key] then
			return G[P_STRING][key], name
		end
	end
end

function get_blind_main_colour(blind) --either in the form of the blind key for the P_BLINDS table or type
	local disabled = false
	blind = blind or ''
	local P_BLIND;
	if blind == 'Forced' then
		local bl = Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices[blind])
		P_BLIND = bl
	elseif (blind == 'Boss') or (blind == 'Teeny') or (blind == 'CEO') or (blind == 'Small') or (blind == 'Big') then
		G.GAME.round_resets.blind_states = G.GAME.round_resets.blind_states or {}
		if G.GAME.round_resets.blind_states[blind] == 'Defeated' or G.GAME.round_resets.blind_states[blind] == 'Skipped' then disabled = true end
		P_BLIND = Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices[blind])
	else
		P_BLIND = Colonparen.get_blind_by_key(blind)
	end
	return (disabled or not P_BLIND) and G.C.BLACK or
	P_BLIND.boss_colour or
	(P_BLIND.key == 'bl_small' and mix_colours(G.C.BLUE, G.C.BLACK, 0.6) or
	P_BLIND.key == 'bl_big' and mix_colours(G.C.ORANGE, G.C.BLACK, 0.6)) or G.C.BLACK
end

function Colonparen.set_upcoming_blind(blind)
	if blind.key then
		blind = blind.key
	elseif blind == 'Boss' or blind == 'Teeny' or blind == 'CEO' or blind == 'Small' or blind == 'Big' then
		blind = Colonparen.get_new_blind(blind)
	end
	G.GAME.round_resets.force_blind = blind
	G.GAME.round_resets.blind_states['Forced'] = "Select"
	if G.blind_select then        
		G.blind_select:remove()
		G.blind_prompt_box:remove()
		G.STATE_COMPLETE = false
	end
end

function Colonparen.are_blinds_prescribed_at(...) -- ... is slots
	G.GAME.next_colonparen_prescribed_blinds = G.GAME.next_colonparen_prescribed_blinds or {}
	for i, slot in ipairs({...}) do
		if G.GAME.next_colonparen_prescribed_blinds[slot] then
			return true
		end
	end
	return false
end

function Colonparen.prescribe_blinds(config, override)
	-- example config structure
	-- any of these fields can be omitted
	--[[
		{
			Teeny = "bl_goad",
			Small = "bl_small",
			Big = "bl_big",
			Boss = "bl_final_heart",
			CEO = "bl_plant"
		}
	]]
	-- second parameter is for controlling what happens if a blind already exists in a slot (default is to override)

	if override == nil then override = true end
	G.GAME.next_colonparen_prescribed_blinds = G.GAME.next_colonparen_prescribed_blinds or {}
	for slot, blind in pairs(config) do
		if (not G.GAME.next_colonparen_prescribed_blinds[slot]) or override then
			G.GAME.next_colonparen_prescribed_blinds[slot] = blind
		end
	end
end

G.P_LOWER_GREEK_BLINDS = {}
G.P_UPPER_GREEK_BLINDS = {}
Colonparen.LowerGreekBlind = SMODS.Blind:extend {
	get_obj = function(self, key) return G.P_LOWER_GREEK_BLINDS[key] end,
	register = function(self)
		self.name = self.name or self.key
		self.colonparen_blindtype = 'Greek';

		SMODS.Blind.super.register(self)
	end,
	inject = function(self, i)
		-- no pools to query length of, so we assign order manually
		if not self.taken_ownership then
			self.order = 30 + i
		end
		G.P_LOWER_GREEK_BLINDS[self.key] = self
	end
}
Colonparen.UpperGreekBlind = SMODS.Blind:extend {
	get_obj = function(self, key) return G.P_UPPER_GREEK_BLINDS[key] end,
	register = function(self)
		self.name = self.name or self.key
		self.colonparen_blindtype = 'Greek';

		SMODS.Blind.super.register(self)
	end,
	inject = function(self, i)
		-- no pools to query length of, so we assign order manually
		if not self.taken_ownership then
			self.order = 30 + i
		end
		G.P_UPPER_GREEK_BLINDS[self.key] = self
	end
}
Colonparen.GreekBlinds = {}
Colonparen.GreekBlind = function (config)
	--[[[
	Colonparen.GreekBlind{
		key = "whatever",
		lower = { whateber blind def },
		upper = { whatever blind def }
	}
	]]

	local key = config.key;
	config.lower.key = config.lower.key or "lower_" .. key;
	local lowercase = Colonparen.LowerGreekBlind(config)
	config.upper.key = config.upper.key or "upper_" .. key;
	local uppercase = Colonparen.UpperGreekBlind(config)
	SMODS.modify_key(config, SMODS.current_mod and SMODS.current_mod.prefix, true)
	Colonparen.GreekBlinds[config.key] = {
		key = config.key,
		lowercase = lowercase,
		uppercase = uppercase
	}
end

function Colonparen.spawnGreekBlind(key)
	if not Colonparen.GreekBlinds[key] then
		error("Greek blind does not exist: " .. key)
	end
	local greek = Colonparen.GreekBlinds[key]
	Colonparen.prescribe_blinds{
		Boss = greek.lowercase.key,
		CEO = greek.uppercase.key,
	}
end
function Colonparen.canSpawnGreekBlind()
	return Colonparen.are_blinds_prescribed_at("Boss", "CEO")
end

SMODS.Consumable:take_ownership('c_entr_new', {
	use = function(self, card, area, copier)
        Colonparen.set_upcoming_blind('bl_entr_red')
    end,
    can_use = function(self, card)
        return not G.GAME.round_resets.force_blind and G.blind_select
	end,
})


local update_callbacks = {}
function Colonparen.UpdateBlindVariables(callback)
	update_callbacks[#update_callbacks+1] = callback;
end

function Colonparen.callUpdateBlindVariables()
	for i, func in ipairs(update_callbacks) do
		func()
	end
end