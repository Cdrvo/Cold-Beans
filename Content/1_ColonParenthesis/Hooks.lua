                                                                        -- Blind shit
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
			Colonparen.SpecialBlinds[self.key .. "_" .. name] = self;
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

local old_collection_pool = SMODS.collection_pool
function SMODS.collection_pool(item, ...)
	if item == G.P_BLINDS then
		local stuff = {}
		for i, blind in pairs(Colonparen.SpecialBlinds) do
			stuff[#stuff+1] = blind
		end
		for i, blind in pairs(item) do
			stuff[#stuff+1] = blind
		end
		local tabl = old_collection_pool(stuff, ...)
		table.sort(tabl, function(a,b) return a.order < b.order end)
		return tabl
	end
	return old_collection_pool(item, ...)
end