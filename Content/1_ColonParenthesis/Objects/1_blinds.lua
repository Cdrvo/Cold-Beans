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
        G.GAME.round_resets.blind_states.Teeny = 'Select'
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

		G.GAME.colon_blind_variables = {
			Boss = {},
			Teeny = {},
			Small = {},
			Big = {},
			CEO = {},
			Forced = {}
		}
		G.GAME.round_resets.blind_choices.Boss = Colonparen.get_new_blind('Boss', true)
		G.GAME.round_resets.blind_choices.Teeny = Colonparen.get_new_blind('Teeny', true)
		G.GAME.round_resets.blind_choices.Small = Colonparen.get_new_blind('Small', true)
		G.GAME.round_resets.blind_choices.Big = Colonparen.get_new_blind('Big', true)
		G.GAME.round_resets.blind_choices.CEO = Colonparen.get_new_blind('CEO', true)

        G.GAME.round_resets.boss_rerolled = false
    elseif G.GAME.round_resets.blind_choices[G.GAME.blind_on_deck] == 'bl_cbean_colon_salesman' then
		G.GAME.blind_on_deck = 
			not (G.GAME.round_resets.blind_states.Teeny == 'Defeated' or G.GAME.round_resets.blind_states.Teeny == 'Skipped' or G.GAME.round_resets.blind_states.Teeny == 'Hide') and 'Teeny' or
			not (G.GAME.round_resets.blind_states.Small == 'Defeated' or G.GAME.round_resets.blind_states.Small == 'Skipped' or G.GAME.round_resets.blind_states.Small == 'Hide') and 'Small' or
			not (G.GAME.round_resets.blind_states.Big == 'Defeated' or G.GAME.round_resets.blind_states.Big == 'Skipped'or G.GAME.round_resets.blind_states.Big == 'Hide') and 'Big' or 
			not (G.GAME.round_resets.blind_states.Boss == 'Defeated' or G.GAME.round_resets.blind_states.Boss == 'Skipped'or G.GAME.round_resets.blind_states.Boss == 'Hide') and 'Boss' or 
			'CEO'
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				ease_round(1)
				inc_career_stat('c_rounds', 1)
				if _DEMO then
					G.SETTINGS.DEMO_ROUNDS = (G.SETTINGS.DEMO_ROUNDS or 0) + 1
					inc_steam_stat('demo_rounds')
					G:save_settings()
				end
				G.GAME.round_resets.blind_tag = G.P_TAGS[G.GAME.round_resets.blind_tags[G.GAME.blind_on_deck]]
				G.GAME.round_resets.blind = Colonparen.get_blind_by_key(G.GAME.round_resets.blind_choices[G.GAME.blind_on_deck])
				G.GAME.round_resets.blind_states[G.GAME.blind_on_deck] = 'Current'
				G.blind_select = nil
				delay(0.2)
				return true
			end}))
		G.E_MANAGER:add_event(Event({
			trigger = 'immediate',
			func = function()
				new_round()
				return true
			end
		}))
	end
end

function Blind:get_type()
	local final = true
	for k,v in pairs(G.GAME.round_resets.blind_states) do
		if v == "Upcoming" then final = false break end
	end
	return G.GAME.blind_on_deck, final
end

function Blind:true_type()
	return Colonparen.get_blind_type(self)
end

function Colonparen.get_blind_type(blind)
	local colonparen_blindtype = (blind or {}).colonparen_blindtype;
	if colonparen_blindtype == nil then
		if blind.name == "Small Blind" then
			colonparen_blindtype = 'Small'
		elseif blind.name == "Big Blind" then 
			colonparen_blindtype = 'Big'
		elseif blind.name and blind.name ~= '' then
			colonparen_blindtype = 'Boss'
		end
	end
	return colonparen_blindtype
end

local set_blind = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
	if not reset then
		G.GAME.colon_blind_variables = G.GAME.colon_blind_variables or {
			Boss = {},
			Teeny = {},
			Small = {},
			Big = {},
			CEO = {},
			Forced = {}
		}
		if not G.GAME.colon_blind_variables[G.GAME.blind_on_deck or 'Teeny'] then
			G.GAME.colon_blind_variables[G.GAME.blind_on_deck or 'Teeny'] = {}
		end
		Colonparen.blind_variables = G.GAME.colon_blind_variables[G.GAME.blind_on_deck or 'Teeny']
	end

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
			if self.boss then
				self.spawn_info = self.boss;
				self.boss = nil
			end
			self.colonparen_blindtype = name;
            SMODS.Blind.super.register(self)
			Colonparen.SpecialBlinds[self.key] = self;
        end,
        inject = function(self, i)
            -- no pools to query length of, so we assign order manually
            if not self.taken_ownership then
                self.order = 30 + i
            end
            G[P_STRING][self.key] = self
			if G.CBEAN_COLON_LOADED_SAVE then
				local meta = G.CBEAN_COLON_LOADED_SAVE;
				local v = self;
				local k = self.key;
				if not v.demo and not v.wip then 
					if TESTHELPER_unlocks then v.discovered = true; v.alerted = true  end --REMOVE THIS
					if not v.discovered and meta.discovered[k] then 
						v.discovered = true
					end
					if v.discovered and meta.alerted[k] then 
						v.alerted = true
					elseif v.discovered then
						v.alerted = false
					end
				end
			end
        end
    }
end
G.P_SMALL_BLINDS.bl_small = G.P_BLINDS.bl_small
G.P_BIG_BLINDS.bl_big = G.P_BLINDS.bl_big
Colonparen.BossBlind = SMODS.Blind;

function Colonparen.calculateReplacedBlind(blind, slot, with)
	if with and with.config and with.config.center and with.config.center.calculate then
		local blind_object = Colonparen.get_blind_by_key(blind);
		local result = with.config.center:calculate(card, {
			blind = blind,
			blind_object = blind_object,
			cbean_colon_set_blind = true,
			blind_slot = slot,
			blind_type = Colonparen.get_blind_type(blind_object)
		}) or {}
		return result.blind or blind;
	end
	if G.deck then
		local blind_object = Colonparen.get_blind_by_key(blind);
		local result = SMODS.calculate_context({
			blind = blind,
			blind_object = blind_object,
			cbean_colon_set_blind = true,
			blind_slot = slot,
			blind_type = Colonparen.get_blind_type(blind_object)
		}) or {}
		return result.blind or blind
	else
		return blind
	end
end

local old_get_new_boss = get_new_boss;
function get_new_boss(...)
	if G.GAME.modifiers.cbean_sdown_all_blinds_are then
		return G.GAME.modifiers.cbean_sdown_all_blinds_are
	end
	if G.GAME.colonparen_prescribed_blinds 
		and G.GAME.colonparen_prescribed_blinds.Boss then
			return Colonparen.calculateReplacedBlind(G.GAME.colonparen_prescribed_blinds.Boss, "Boss")
	end
	return Colonparen.calculateReplacedBlind(old_get_new_boss(...), "Boss")
end


--why did you use Type as a variable what are you doing
local type_ = type
function Colonparen.get_new_blind(type, startofante)
	--Okay, this seems super redundant but I can't seem to work out how to get the modifier to already prescribe blinds?
	if G.GAME.modifiers.cbean_sdown_all_blinds_are then
		return G.GAME.modifiers.cbean_sdown_all_blinds_are
	end
	if G.GAME.colonparen_prescribed_blinds 
		and G.GAME.colonparen_prescribed_blinds[type] then
			return Colonparen.calculateReplacedBlind(G.GAME.colonparen_prescribed_blinds[type], type)
	end
	if type == "Boss" then
		return get_new_boss()
	end
	local P_STRING = 'P_' ..  (type:upper()) .. '_BLINDS'
	local eligible_bosses = {}

	if type == 'CEO' then
		for k, v in pairs(G[P_STRING]) do
			local res, options = SMODS.add_to_pool(v)
			options = options or {}
			if not v.spawn_info then

			elseif options.ignore_showdown_check then
				eligible_bosses[k] = res and true or nil
			elseif v.in_pool and type_(v.in_pool) == 'function' then
				if
					(
						((G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2) ==
						(v.spawn_info.showdown or false)
					) and v:in_pool(startofante)
				then
					eligible_bosses[k] = res and true or nil
				end
			elseif (not v.spawn_info.showdown) and (((not v.spawn_info.min) or (v.spawn_info.min <= math.max(1, G.GAME.round_resets.ante))) and ((math.max(1, G.GAME.round_resets.ante))%G.GAME.win_ante ~= 0 or G.GAME.round_resets.ante < 2)) then
				eligible_bosses[k] = res and true or nil
			elseif v.spawn_info.showdown and (G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2 then
				eligible_bosses[k] = res and true or nil
			end
		end
	elseif type == 'Teeny' then
		for k, v in pairs(G[P_STRING]) do
			if not v.spawn_info or not v.spawn_info.min or (v.spawn_info.min <= math.max(1, G.GAME.round_resets.ante)) then
				eligible_bosses[k] = SMODS.add_to_pool(v)
				if (not G.GAME.bosses_used[k]) then
					G.GAME.bosses_used[k] = 0
				end
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
	--print()
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    G.GAME.bosses_used[boss] = (G.GAME.bosses_used[boss] or 0) + 1
	return Colonparen.calculateReplacedBlind(boss, type)
end

function Colonparen.get_blind_by_key(key)
	if key == 'bl_small' then return G.P_BLINDS.bl_small, 'Small' end
	if key == 'bl_big' then return G.P_BLINDS.bl_big, 'Big' end
	if G.P_BLINDS[key] then return G.P_BLINDS[key], 'Boss' end
	for i, name in ipairs({'Teeny', 'Small', 'Big', 'CEO', 'LOWER_GREEK', 'UPPER_GREEK'}) do
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
		Colonparen.SpecialBlinds[self.key] = self;
	end,
	inject = function(self, i)
		-- no pools to query length of, so we assign order manually
		if not self.taken_ownership then
			self.order = 30 + i
		end
		G.P_LOWER_GREEK_BLINDS[self.key] = self
		if G.CBEAN_COLON_LOADED_SAVE then
			local meta = G.CBEAN_COLON_LOADED_SAVE;
			local v = self;
			local k = self.key;
			if not v.demo and not v.wip then 
				if TESTHELPER_unlocks then v.discovered = true; v.alerted = true  end --REMOVE THIS
				if not v.discovered and meta.discovered[k] then 
					v.discovered = true
				end
				if v.discovered and meta.alerted[k] then 
					v.alerted = true
				elseif v.discovered then
					v.alerted = false
				end
			end
		end
	end
}
Colonparen.UpperGreekBlind = SMODS.Blind:extend {
	get_obj = function(self, key) return G.P_UPPER_GREEK_BLINDS[key] end,
	register = function(self)
		self.name = self.name or self.key
		self.colonparen_blindtype = 'Greek';

		SMODS.Blind.super.register(self)
		Colonparen.SpecialBlinds[self.key] = self;
	end,
	inject = function(self, i)
		-- no pools to query length of, so we assign order manually
		if not self.taken_ownership then
			self.order = 30 + i
		end
		G.P_UPPER_GREEK_BLINDS[self.key] = self
		if G.CBEAN_COLON_LOADED_SAVE then
			local meta = G.CBEAN_COLON_LOADED_SAVE;
			local v = self;
			local k = self.key;
			if not v.demo and not v.wip then 
				if TESTHELPER_unlocks then v.discovered = true; v.alerted = true  end --REMOVE THIS
				if not v.discovered and meta.discovered[k] then 
					v.discovered = true
				end
				if v.discovered and meta.alerted[k] then 
					v.alerted = true
				elseif v.discovered then
					v.alerted = false
				end
			end
		end
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
	local name = config.name;
	local mult = config.mult;
	local pos = config.pos;
	local boss_colour = config.boss_colour;
	config.lower.key = config.lower.key or "lower_" .. key;
	config.lower.name = config.lower.name or name;
	config.lower.mult = config.lower.mult or mult;
	config.lower.pos = config.lower.pos or pos;
	config.lower.atlas = config.lower.atlas or "colon_LowercaseGreekBlind";
	config.lower.boss_colour = config.lower.boss_colour or boss_colour;
	config.lower.greekblind_key = key;
	config.lower.is_lower = true;
	local lowercase = Colonparen.LowerGreekBlind(config.lower)

	config.upper.key = config.upper.key or "upper_" .. key;
	config.upper.name = config.upper.name or name;
	config.upper.mult = config.upper.mult or mult;
	config.upper.pos = config.upper.pos or pos;
	config.upper.atlas = config.upper.atlas or "colon_UppercaseGreekBlind";
	config.upper.boss_colour = config.upper.boss_colour or boss_colour;
	config.upper.greekblind_key = key;
	config.upper.is_upper = true;
	local uppercase = Colonparen.UpperGreekBlind(config.upper)

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

local old_draw = AnimatedSprite.draw_self
function AnimatedSprite:draw_self(...)
	if self.atlas and (self.atlas.name == "cbean_colon_CEshOwdown") then
		G.cbean_colon_shared_WINGS.T = copy_table(self.T);
		G.cbean_colon_shared_WINGS.VT = copy_table(self.VT);
		local change = (48/34);
		G.cbean_colon_shared_WINGS.T.w = G.cbean_colon_shared_WINGS.T.w * change
		G.cbean_colon_shared_WINGS.T.h = G.cbean_colon_shared_WINGS.T.h * change
		G.cbean_colon_shared_WINGS.VT.w = G.cbean_colon_shared_WINGS.VT.w * change
		G.cbean_colon_shared_WINGS.VT.h = G.cbean_colon_shared_WINGS.VT.h * change
		local offsetx = (7/48) * G.cbean_colon_shared_WINGS.T.w;
		local offsety = (7/48) * G.cbean_colon_shared_WINGS.T.h;
		G.cbean_colon_shared_WINGS.T.x = G.cbean_colon_shared_WINGS.T.x - offsetx
		G.cbean_colon_shared_WINGS.T.y = G.cbean_colon_shared_WINGS.T.y - offsety
		G.cbean_colon_shared_WINGS.VT.x = G.cbean_colon_shared_WINGS.VT.x - offsetx
		G.cbean_colon_shared_WINGS.VT.y = G.cbean_colon_shared_WINGS.VT.y - offsety
		-- print("OI M8")
		G.cbean_colon_shared_WINGS:draw_self(...)
	end
	return old_draw(self, ...)
end


-- hardcoding stuff is fun
Colonparen.GREEK_ORDER = {bl_cbean_lower_colon_alpha = 0, bl_cbean_upper_colon_alpha = 1, bl_cbean_lower_colon_beta = 2, bl_cbean_upper_colon_beta = 3, bl_cbean_lower_colon_gamma = 4, bl_cbean_upper_colon_gamma = 5, bl_cbean_lower_colon_delta = 6, bl_cbean_upper_colon_delta = 7, bl_cbean_lower_colon_epsilon = 8, bl_cbean_upper_colon_epsilon = 9, bl_cbean_lower_colon_zeta = 10, bl_cbean_upper_colon_zeta = 11, bl_cbean_lower_colon_eta = 12, bl_cbean_upper_colon_eta = 13, bl_cbean_lower_colon_theta = 14, bl_cbean_upper_colon_theta = 15, bl_cbean_lower_colon_iota = 16, bl_cbean_upper_colon_iota = 17, bl_cbean_lower_colon_kappa = 18, bl_cbean_upper_colon_kappa = 19, bl_cbean_lower_colon_lambda = 20, bl_cbean_upper_colon_lambda = 21, bl_cbean_lower_colon_mu = 22, bl_cbean_upper_colon_mu = 23, bl_cbean_lower_colon_nu = 24, bl_cbean_upper_colon_nu = 25, bl_cbean_lower_colon_xi = 26, bl_cbean_upper_colon_xi = 27, bl_cbean_lower_colon_omicron = 28, bl_cbean_upper_colon_omicron = 29, bl_cbean_lower_colon_pi = 30, bl_cbean_upper_colon_pi = 31, bl_cbean_lower_colon_rho = 32, bl_cbean_upper_colon_rho = 33, bl_cbean_lower_colon_sigma = 34, bl_cbean_upper_colon_sigma = 35, bl_cbean_lower_colon_tau = 36, bl_cbean_upper_colon_tau = 37, bl_cbean_lower_colon_upsilon = 38, bl_cbean_upper_colon_upsilon = 39, bl_cbean_lower_colon_phi = 40, bl_cbean_upper_colon_phi = 41, bl_cbean_lower_colon_chi = 42, bl_cbean_upper_colon_chi = 43, bl_cbean_lower_colon_psi = 44, bl_cbean_upper_colon_psi = 45, bl_cbean_lower_colon_omega = 46, bl_cbean_upper_colon_omega = 47}

local old_collection_pool = SMODS.collection_pool
function SMODS.collection_pool(item, ...)
	if item == G.P_CENTER_POOLS.colon_Architecture then
		table.sort(item, function (a, b) 
			a = Colonparen.GREEK_ORDER[((Colonparen.GreekBlinds[a.greek_blind] or {}).lowercase or {}).key] or 0;
			b = Colonparen.GREEK_ORDER[((Colonparen.GreekBlinds[b.greek_blind] or {}).lowercase or {}).key] or 0;
			return a < b
		end)
	elseif item == G.P_BLINDS then
		local typevalue = {
			Teeny = 1,
			Small = 2,
			Big = 3,
			Boss = 4,
			Showdown = 5,
			CEO = 6,
			CEOShowdown = 7,
			Greek = 8
		}
		local function get_typevalue(blind)
			if blind.key == 'bl_small' then
				return typevalue.Small
			elseif blind.key == "bl_big" then
				return typevalue.Big
			elseif (blind.colonparen_blindtype == "CEO") and blind.spawn_info.showdown then
				return typevalue.CEOShowdown
			elseif typevalue[blind.colonparen_blindtype] then
				return typevalue[blind.colonparen_blindtype]
			elseif blind.boss and blind.boss.showdown then
				return typevalue.Showdown
			else
				return typevalue.Boss
			end
		end
		local stuff = {}
		for i, blind in pairs(Colonparen.SpecialBlinds) do
			stuff[#stuff+1] = blind
		end
		for i, blind in pairs(item) do
			stuff[#stuff+1] = blind
		end

		local tabl = old_collection_pool(stuff, ...)
		local categories = {
			{},
			{},
			{},
			{},
			{},
			{},
			{},
			{}
		}

		for i = 1, #tabl do
			local val = get_typevalue(tabl[i]);
			local list = categories[val];
			list[#list+1] = tabl[i];
		end
		local newtable = {}
		for i = 1, #categories do
			table.sort(categories[i], function (a, b) 
				if (Colonparen.GREEK_ORDER[a.key] and Colonparen.GREEK_ORDER[b.key]) then
					return Colonparen.GREEK_ORDER[a.key] < Colonparen.GREEK_ORDER[b.key]
				elseif a.greekblind_key then
					return a.greekblind_key < b.key
				elseif b.greekblind_key then
					return a.key < b.greekblind_key
				else
					return a.key < b.key 
				end
			end)
			for q, v in ipairs(categories[i]) do
				newtable[#newtable+1] = v
			end
		end
		return newtable
	end
	return old_collection_pool(item, ...)
end

SMODS.other_calculation_keys[#SMODS.other_calculation_keys+1] = 'blind';
SMODS.silent_calculation.blind = true
local update_context_flags = SMODS.update_context_flags;
function SMODS.update_context_flags(context, flags)
	update_context_flags(context, flags)
	if flags.blind then
		context.blind = flags.blind
		context.blind_object = Colonparen.get_blind_by_key(context.blind);
		context.blind_type = Colonparen.get_blind_type(context.blind_object)
	end
end

local calculate_individual_effect = SMODS.calculate_individual_effect;
SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)
	if key == 'blind' then
		return {
			blind = amount
		}
	end
	return calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end

local is_getter_context = SMODS.is_getter_context;
function SMODS.is_getter_context(context)
	if context.cbean_colon_set_blind then
		return "cbean_colon_set_blind"
	end
	return is_getter_context(context)
end

function Colonparen.BossOrCEO()
	local t = Colonparen.get_blind_type(G.GAME.blind)
	return (t == "Boss") or (t == "CEO")
end

SMODS.Joker:take_ownership('j_matador', {
    calculate = function(self, card, context)
        if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered and (G.GAME.blind_on_deck == "CEO") then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra
                return {
                    dollars = card.ability.extra,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end,
}, true)