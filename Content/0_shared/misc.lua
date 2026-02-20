NAMETEAM = {
	no_progress = 0,
}

NANEMTEAM = NAMETEAM -- revo typo protection

SMODS.DrawStep({
	key = "plant_cost",
	order = 5,
	func = function(self, layer)
		if
			self.config.center.pvz_plant
			and self.config.center.key ~= "j_cbean_pboys_peashooter"
			and self.config.center.discovered
		then
			local plant_buy = { n = G.UIT.T, config = { text = "$" .. self.cost, colour = G.C.MONEY, scale = 0.5 } }
			local plant_sell =
				{ n = G.UIT.T, config = { text = "$" .. self.sell_cost, colour = G.C.MONEY, scale = 0.5 } }
			if not (self.area == G.jokers or (self.area == G.consumeables and self.ability.yma_temp_key)) then
				if not self.children.plant_buy then
					self.children.plant_buy = UIBox({
						definition = {
							n = G.UIT.ROOT,
							config = { align = "cm", colour = G.C.CLEAR },
							nodes = {
								plant_buy
							}
						},
						config = {
							parent = self,
							align = "tm",
							offset = { x = 0, y = 2.4 },
						},
					})
				end
				self.children.plant_buy:draw()
			elseif self.children.plant_buy and self.area == G.jokers then
				self.children.plant_buy:remove()
				self.children.plant_buy = nil
			end
			if self.area == G.jokers or (self.area == G.consumeables and self.ability.yma_temp_key) then
				if not self.children.plant_sell then
					self.children.plant_sell = UIBox({
						definition = {
							n = G.UIT.ROOT,
							config = { align = "cm", colour = G.C.CLEAR },
							nodes = {
								plant_sell
							}
						},
						config = {
							parent = self,
							align = "tm",
							offset = { x = 0, y = 2.4 },
						},
					})
				end
				self.children.plant_sell:draw()
			elseif self.children.plant_sell and self.area ~= G.jokers then
				self.children.plant_sell:remove()
				self.children.plant_sell = nil
			end
		else
			if self.children.plant_sell then
				self.children.plant_sell:remove()
				self.children.plant_sell = nil
			end
			if self.children.plant_buy then
				self.children.plant_buy:remove()
				self.children.plant_buy = nil
			end
		end
	end,
	conditions = { vortex = false, facing = "front" }
})

_G.CBWG = {}

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
G.C.BLIND['wgrop_forest'] = HEX("27745C")  
G.C.BLIND['wgrop_desert'] = HEX("D9A867")  
G.C.BLIND['wgrop_graveyard'] = HEX("766974")
G.C.BLIND['wgrop_volcanic'] = HEX("782C2C")
G.C.BLIND['wgrop_city'] = HEX("ADBBBC")
G.C.BLIND['wgrop_glaciers'] = HEX("82BFB9")

CBWG.ColdBeans_Biomes = {}

---@type SMODS.Center
CBWG.ColdBeans_Biome = SMODS.ObjectType:extend{
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'wgrop_biomes',
    class_prefix = 'biome',
    required_params = {'key'},
    set = "Biome",
    inject = function(self)
        SMODS.ObjectType.inject(self)
        G['P_BIOMES'][self.key] = true
        G['P_BIOME_POOLS'][self.key] = copy_table(G['P_BIOME_POOLS']['default'])
        CBWG.ColdBeans_Biomes[self.key] = self
    end,
    register = function (self)
        if self.registered then
            sendWarnMessage(('Detected duplicate register call on object %s'):format(self.key), self.set)
            return
        end
        SMODS.ObjectType.register(self)
        self.order = #self.obj_buffer
    end,
    enter = function(self)
    end,
    exit = function(self)
    end,
    in_pool = function(self)
        return true
    end,
    create_fake_card = function(self)
        return { ability = copy_table(self.config), fake_card = true }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        if not card then
            card = self:create_fake_card()
        end
        local target = {
            type = 'descriptions',
            key = self.key,
            set = self.set,
            nodes = desc_nodes,
            AUT = full_UI_table,
            vars =
                specific_vars or {}
        }
        local res = {}
        if self.loc_vars and type(self.loc_vars) == 'function' then
            res = self:loc_vars(info_queue, card) or {}
            target.vars = res.vars or target.vars
            target.key = res.key or target.key
            target.set = res.set or target.set
            target.scale = res.scale
            target.text_colour = res.text_colour
        end

        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            full_UI_table.name = self.set == 'Enhanced' and 'temp_value' or localize { type = 'name', set = target.set, key = res.name_key or target.key, nodes = full_UI_table.name, vars = res.name_vars or target.vars or {} }
        elseif desc_nodes ~= full_UI_table.main and not desc_nodes.name and self.set ~= 'Enhanced' then
            desc_nodes.name = localize{type = 'name_text', key = res.name_key or target.key, set = target.set }
        end
        if specific_vars and specific_vars.debuffed and not res.replace_debuff then
            target = { type = 'other', key = 'debuffed_' ..
            (specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes, AUT = full_UI_table, }
        end
        if res.main_start then
            desc_nodes[#desc_nodes + 1] = res.main_start
        end

        localize(target)
        if res.main_end then
            desc_nodes[#desc_nodes + 1] = res.main_end
        end
        desc_nodes.background_colour = res.background_colour
    end
}
