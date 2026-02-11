NAMETEAM = {
    no_progress = 0
}

NANEMTEAM = NAMETEAM -- revo typo protection

SMODS.DrawStep {
	key = 'plant_cost',
	order = 5,
	func = function(self)
		if self.config.center.pvz_plant and not self.config.center.key == "j_cbean_pboys_peashooter" and self.config.center.discovered then
		  local plant_buy = {n = G.UIT.T, config = {text = "$"..self.cost, colour = G.C.MONEY, scale = 0.5}}
		  local plant_sell = {n = G.UIT.T, config = {text = "$"..self.sell_cost, colour = G.C.MONEY, scale = 0.5}}
		  if (self.area ~= G.jokers) and not self.children.plant_buy then
		    self.children.plant_buy = UIBox({
				definition = plant_buy,
				config = {
					parent = self,
					align = 'tm',
					offset = { x = 0, y = 2.4 },
					colour = G.C.CLEAR}
			})
		    self.children.plant_buy:draw()
		elseif self.children.plant_buy and self.area == G.jokers then 
			self.children.plant_buy:remove()
			self.children.plant_buy = nil
		end
		  	if (self.area == G.jokers) and not self.children.plant_sell then
				self.children.plant_sell = UIBox({
					definition = plant_sell,
					config = {
						parent = self,
						align = 'tm',
						offset = { x = 0, y = 2.4 },
						colour = G.C.CLEAR}
				})
		    	self.children.plant_sell:draw()
		  	elseif self.children.plant_sell and self.area ~= G.jokers then
				self.children.plant_sell:remove()
				self.children.plant_sell = nil
		  	end
		end 
	end
}
