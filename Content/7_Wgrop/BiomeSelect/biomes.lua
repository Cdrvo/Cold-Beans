G.P_CENTER_POOLS.Biome = {}

SMODS.Atlas({
    key = "wgrop_biomes",
    path = "7_Wgrop/biomes.png",
    px = 113,
    py = 57
})

G['P_BIOMES'] = {}
G['P_BIOME_POOLS'] = {}
G['P_BIOME_POOLS']['default'] = {}
G.P_CENTER_POOLS['default'] = {}

CBWG.ColdBeans_Biomes = {}

---@type SMODS.Center
CBWG.ColdBeans_Biome = SMODS.ObjectType:extend{
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'wgrop_biomes',
    class_prefix = 'biome',
    required_params = {'key'},
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
        if blind.set ~= self.key then
            table.insert(G.P_BIOME_POOLS[self.key], blind)
        end
    end,
    delete_blind = function(self, blind)
        if blind.set ~= self.key then
            table.remove(G.P_BIOME_POOLS[self.key], blind)
        end
        if blind.pools then blind.pools[self.key] = nil end
    end
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_desert",
    blinds = {["bl_wheel"] = true,["bl_hook"] = true,["bl_manacle"] = true,["bl_window"] = true, ["bl_mark"] = true, ["bl_final_acorn"] = true, ["bl_cbean_colon_pot"] = true},
    cards = {}
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 1},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_forest",
    blinds = {["bl_ox"] = true, ["bl_club"] = true, ["bl_plant"] = true, ["bl_serpent"] = true, ["bl_final_leaf"] = true, ["bl_cbean_colon_treasure"] = true, ["bl_cbean_colon_seed"] = true, ["bl_cbean_colon_compass"] = true, ["bl_cbean_colon_outcrop"] = true},
    cards = {}
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 2},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_graveyard",
    blinds = {["bl_psychic"] = true, ["bl_goad"] = true, ["bl_eye"] = true, ["bl_final_vessel"] = true, ["bl_cbean_colon_assassination"] = true, ["bl_cbean_colon_hole"] = true, ["bl_cbean_colon_curse"] = true, ["bl_cbean_colon_regression"] = true},
    cards = {}
}


CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 3},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_volcanic",
    blinds = {["bl_needle"] = true, ["bl_flint"] = true,["bl_mouth"] = true,["bl_head"] = true, ["bl_final_heart"] = true, ["bl_cbean_colon_folly"] = true},
    cards = {}
}


CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 4},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_glaciers",
    blinds = {["bl_arm"] = true, ["bl_pillar"] = true, ["bl_fish"] = true, ["bl_water"] = true, ["bl_final_bell"] = true,["bl_cbean_colon_island"] = true, ["bl_cbean_colon_astro"] = true, ["bl_cbean_colon_sinker"] = true},
    cards = {}
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 5},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_city",
    blinds = {["bl_house"] = true, ["bl_wall"] = true, ["bl_cbean_colon_gate"] = true,  ["bl_final_bell"] = true, ["bl_cbean_colon_stamp"] = true, ["bl_cbean_colon_salesman"] = true, ["bl_cbean_colon_factory"] = true, ["bl_cbean_colon_pipeline"] = true, ["bl_cbean_colon_rebellion"] = true, ["bl_cbean_sdown_estrogen"] = true},
    cards = {}
}
-- ante 1 blinds have been removed as they get ignored and only the wall appears on ante 1
-- all biomes should have a finisher blind or they get the wall
-- wall is beautiful wall is beautiful wall is beautiful


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
    biome = biome or "wgrop_city"
    return biome
end

function CBWG.get_new_boss()
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
    if G.GAME.perscribed_bosses and
        G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then
        local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante]
        G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
        G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
        return ret_boss
    end
    if G.FORCE_BOSS then return G.FORCE_BOSS end

    local eligible_bosses = {}

    for key, value in pairs(G.P_BIOME_POOLS[G.GAME.round_resets.blind_biome]) do -- Hello from Wgrop!
        for k, v in pairs(G.P_BLINDS) do
            if k == value then
                local res, options = SMODS.add_to_pool(v)
                options = options or {}
                if not v.boss then

                elseif options.ignore_showdown_check then
                    eligible_bosses[k] = res and true or nil
                elseif v.in_pool and type(v.in_pool) == 'function' then
                    if (((G.GAME.round_resets.ante) % G.GAME.win_ante == 0 and
                        G.GAME.round_resets.ante >= 2) ==
                        (v.boss.showdown or false)) then
                        eligible_bosses[k] = res and true or nil
                    end
                elseif not v.boss.showdown and
                    (v.boss.min <= math.max(1, G.GAME.round_resets.ante) and
                        ((math.max(1, G.GAME.round_resets.ante)) %
                            G.GAME.win_ante ~= 0 or G.GAME.round_resets.ante < 2)) then
                    eligible_bosses[k] = res and true or nil
                elseif v.boss.showdown and (G.GAME.round_resets.ante) %
                    G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2 then
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
        if v.key == key then return true end
    end
end

local injectitems_ref = SMODS.injectItems

SMODS.injectItems = function()

    injectitems_ref()
    BLIND_MASTER = {}
    BIOME_BLINDS = {}

    for k, v in pairs(G['P_BIOME_POOLS']) do
        for _, w in pairs(v) do table.insert(BIOME_BLINDS, w) end
    end

    for k, v in pairs(SMODS.Blinds) do table.insert(BLIND_MASTER, v.key) end

    for k, v in pairs(G.P_BLINDS) do table.insert(BLIND_MASTER, v.key) end

    for k, v in pairs(BLIND_MASTER) do 
        for _, w in pairs(BIOME_BLINDS) do if w == v then goto continue end end
        table.insert(G['P_BIOME_POOLS']['default'], v)
        for key, value in pairs(G['P_BIOME_POOLS']) do
            table.insert(G['P_BIOME_POOLS'][key], v)
        end
        ::continue::
    end

    CARD_MASTER = {}
    BIOME_CARDS = {}

    for k, v in pairs(G['P_BIOMES']) do
        for _, w in pairs(G.P_CENTER_POOLS[k]) do
            table.insert(BIOME_CARDS, w)
        end
    end
    
    for k, v in pairs(G.P_CENTER_POOLS['Joker']) do table.insert(CARD_MASTER, v) end
    
    for k, v in pairs(CARD_MASTER) do 
        for _, w in pairs(BIOME_CARDS) do if w == v then goto continue end end
        table.insert(G.P_CENTER_POOLS['default'], v)
        for key, value in pairs(G['P_BIOMES']) do
            table.insert(G.P_CENTER_POOLS[key], v)
        end
        ::continue::
    end
end

