G.P_CENTER_POOLS.Biome = {}

SMODS.Atlas({
	key = "wgrop_biomes",
	path = "7_Wgrop/biomes.png",
	px = 113,
	py = 57
})

G['P_BIOMES'] = {}
G['P_BIOME_POOLS'] = {}
G['P_BIOME_POOLS']['default'] = { "bl_small", "bl_big", "bl_tooth", "bl_fish", "bl_cbean_colon_sheet", "bl_cbean_colon_promise", "bl_cbean_colon_button", "bl_cbean_colon_alpha",}
-- IF YOUR BLIND DOES NOT APPEAR IN POOL IT IS BECAUSE IT'S NOT IN ANY BIOME POOL, ADD YOUR JOKER TO THE BIOME POOL OF YOUR CHOOSING OR HERE IN DEFAULT TO HAVE IT APPEAR ALWAYS
-- -wgrop



CBWG.ColdBeans_Biomes = {}

---@type SMODS.Center
CBWG.ColdBeans_Biome = SMODS.ObjectType:extend{
    pos = { x = 0, y = 0 },
    config = {},
    atlas = 'wgrop_biomes',
    class_prefix = 'biome',
    required_params = {
        'key',
    },
    inject = function(self)
        SMODS.ObjectType.inject(self)
        G['P_BIOMES'][self.key] = true
        G['P_BIOME_POOLS'][self.key] = copy_table(G['P_BIOME_POOLS']['default'])
        if self.blinds then
            for k, v in pairs(G.P_BLINDS) do
                if self.blinds[k] then self:inject_blind(k) end
            end
            print(tprint(G.P_CEO_BLINDS))
            for k, v in pairs(G.P_CEO_BLINDS) do
                if self.blinds[k] then self:inject_blind(k) end
                print(k)
            end
        end
        CBWG.ColdBeans_Biomes[self.key] = self
    end,
    inject_blind = function(self, blind)
        if blind.set ~= self.key then table.insert(G.P_BIOME_POOLS[self.key], blind) end
    end,
    delete_blind = function(self, blind)
        if blind.set ~= self.key then table.remove(G.P_BIOME_POOLS[self.key], blind) end
        if blind.pools then blind.pools[self.key] = nil end
    end,
}

CBWG.ColdBeans_Biome{
    pos = { x = 0, y = 5 },
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_city",
    blinds = {
        ["bl_small"] = true,
    },
    cards = {
        ["j_blue_joker"] = true,
    }
}

-- Function that gets a new biome
function CBWG.get_new_biome(new_biome)
    local eligible_biomes = {}
    for k, v in pairs(G.P_BIOMES) do 
        if new_biome then
            if k ~= G.GAME.round_resets.blind_biome then
                eligible_biomes[k] = v
            end
        else
            eligible_biomes[k] = v
        end
    end
    local _, biome = pseudorandom_element(eligible_biomes, pseudoseed('biome'))
    return biome
end

function CBWG.get_new_boss()
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {
    }
    if G.GAME.perscribed_bosses and G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then 
        local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante] 
        G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
        G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
        return ret_boss
    end
    if G.FORCE_BOSS then return G.FORCE_BOSS end
    
    local eligible_bosses = {}

	for key, value in pairs (G.P_BIOME_POOLS[G.GAME.round_resets.blind_biome]) do -- Hello from Wgrop!
        for k, v in pairs(G.P_BLINDS) do
            if k == value then
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
                elseif not v.boss.showdown and (v.boss.min <= math.max(1, G.GAME.round_resets.ante) and ((math.max(1, G.GAME.round_resets.ante))%G.GAME.win_ante ~= 0 or G.GAME.round_resets.ante < 2)) then
                    eligible_bosses[k] = res and true or nil
                elseif v.boss.showdown and (G.GAME.round_resets.ante)%G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2 then
                    eligible_bosses[k] = res and true or nil
                end
            end
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    local min_use = 100
    for k, v in pairs(G.GAME.bosses_used) do
        if eligible_bosses[k] then
            eligible_bosses[k] = v
            if eligible_bosses[k] <= min_use then 
                min_use = eligible_bosses[k]
            end
        end
    end
    for k, v in pairs(eligible_bosses) do
        if eligible_bosses[k] then
            if eligible_bosses[k] > min_use then 
                eligible_bosses[k] = nil
            end
        end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    boss = boss or "bl_wall" -- Banner default
    G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1
    
    return boss
end

function CBWG.in_pool(key)
    for k, v in ipairs(G.P_CENTER_POOLS[G.GAME.round_resets.blind_biome]) do
        if v.key == key then
            return true
        end
    end
end