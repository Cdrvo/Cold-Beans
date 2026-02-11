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
