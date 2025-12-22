G.P_CENTER_POOLS.Biome = {}

SMODS.Atlas({
	key = "wgrop_biomes",
	path = "7_Wgrop/biomes.png",
	px = 113,
	py = 57
})

---@type SMODS.Center
CBWG.ColdBeans_Biomes = SMODS.ObjectType:extend{
    pos = { x = 0, y = 0 },
    config = {},
    atlas = 'wgrop_biomes',
    class_prefix = 'biome',
    required_params = {
        'key',
    },
    inject = function(self)
        SMODS.ObjectType.inject(self)
        if self.blinds then
            for k, v in pairs(G.P_BLINDS) do
                if self.blinds[k] then self:inject_blind(v) end
            end
        end
    end,
    inject_blind = function(self, blind)
        if blind.set ~= self.key then SMODS.insert_pool(G.P_CENTER_POOLS[self.key], blind) end
        if not blind.pools then blind.pools = {} end
        blind.pools[self.key] = true
    end
}

CBWG.ColdBeans_Biomes{
    key = "testBiome"
    
}