G.P_CENTER_POOLS.Biome = {}

SMODS.Atlas({
	key = "wgrop_biomes",
	path = "7_Wgrop/biomes.png",
	px = 113,
	py = 57
})

---@type SMODS.Center
CBWG.ColdBeans_Biomes = SMODS.Center:extend{
    pos = { x = 0, y = 0 },
    config = {},
    set = 'Biome',
    atlas = 'wgrop_biomes',
    class_prefix = 'biome',
    required_params = {
        'key',
    },
    inject = function(self)
        -- call the parent function to ensure all pools are set
        SMODS.Center.inject(self)
        SMODS.insert_pool(G.P_CENTER_POOLS['Biome'], self)
    end
}

CBWG.ColdBeans_Biomes{
    key = "testBiome"
    
}