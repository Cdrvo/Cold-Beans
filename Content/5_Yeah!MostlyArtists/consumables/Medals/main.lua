YMA = YMA or {}

SMODS.MEDALS = {}

SMODS.Atlas({
    key = "yma_medals_atlas",
    path = "5_Yeah!MostlyArtists/medals.png",
    px = 71,
    py = 113,
})

G.P_YMA_MEDALS = G.P_YMA_MEDALS or {}
G.shared_yma_medals = {}

YMA.MEDAL = SMODS.GameObject:extend({
    obj_table = SMODS.MEDALS,
    set = 'yma_medal',
    obj_buffer = {},
    rng_buffer = {},
    atlas = 'yma_medals_atlas',
    discovered = true,
    badge_to_key = {},
    badge_colour = HEX('FFFFFF'),
    unlocked = true,
    pos = { x = 0, y = 0 },
    config = {},
    required_params = {
        'key',
    },
    inject = function(self)
        G.P_YMA_MEDALS[self.key] = self
        G.shared_yma_medals[self.key] = SMODS.create_sprite(0, 0, G.CARD_W, G.CARD_H, SMODS.get_atlas(self.atlas) or SMODS.get_atlas('centers'), self.pos)
        self.badge_to_key[self.key:lower() .. '_medal'] = self.key
        SMODS.insert_pool(G.P_CENTER_POOLS[self.set], self)
        self.rng_buffer[#self.rng_buffer + 1] = self.key
    end,
    get_obj = function(self, key) return G.P_YMA_MEDALS[key] end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        local target = {
            type = 'other',
            set = 'Other',
            key = self.key:lower()..'_medal',
            nodes = desc_nodes,
            vars = specific_vars or {},
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
            if res.set then
                target.type = 'descriptions'
                target.set = res.set
            end
            target.scale = res.scale
            target.text_colour = res.text_colour
        end
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            full_UI_table.name = localize { type = 'name', set = target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} }
        elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name then
            desc_nodes.name = localize{type = 'name_text', key = res.name_key or target.key, set = target.set }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end
        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end
        desc_nodes.background_colour = res.background_colour
    end,
})

SMODS.DrawStep {
    key = 'yma_medal',
    order = 33,
    func = function(self, layer)
        if self.yma_medal ~= nil and G.shared_yma_medals[self.yma_medal] then
            G.shared_yma_medals[self.yma_medal].role.draw_major = self
            G.shared_yma_medals[self.yma_medal]:draw_shader('dissolve', nil, nil, nil, self.children.center)
        end
    end,
    conditions = { vortex = false, facing = 'front' },
}