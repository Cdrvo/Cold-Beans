local start_run_ref = Game.start_run
function Game:start_run(args)
    start_run_ref(self, args)
    G.GAME.xmult_in_extra = { "j_acrobat", "j_ancient", "j_baron", "j_baseball", "j_blackboard", "j_drivers_license", "j_flower_pot", "j_photograph", "j_seeing_double", "j_triboulet"}
    G.GAME.b_pressed_lmao = false
    G.GAME.konami_counter = 0
    if not G.GAME.jimbux then
        G.GAME.jimbux = 0
    end
end

local card_click_ref = Card.click
function Card:click()
    card_click_ref(self)
    if G.jokers then
        SMODS.calculate_context { jbill_clicked = self }
    end
    if self.config.center.key == "j_cbean_jbill_elephant" then
        self.ability.extra.clicks = self.ability.extra.clicks + 1
    end
end

G.UIDEF.employed_use = function(card)
    local t = {n = G.UIT.ROOT, config = { minw = 1, minh = 1, align = "tm", colour = G.C.CLEAR}, nodes = {
	                        {n = G.UIT.C, config = { minw = 1, minh = 1, colour = G.C.CLEAR, r = 0.1, padding = 0.15, func = "recalc" }, nodes = {
                                UIBox_button{ label = {"USE  "}, ref_table = card, scale = 0.6, minw = 1.5, minh = 1, colour = G.C.BLACK, r = 0.1, button = nil, func = "employed_update_use", shadow = true},
                        }}}}
    return t
end
G.UIDEF.select_card = function ()
    t = {n = G.UIT.ROOT, config = { minw = 1, minh = 1, align = "tm", colour = G.C.CLEAR}, nodes = {
	            {n = G.UIT.C, config = { minw = 1, minh = 1, colour = G.C.CLEAR, r = 0.1, padding = 0.15, func = "recalc" }, nodes = {
                    {n = G.UIT.R, config = { minw = 1, minh = 0.8, align = "cm", padding = 0.1, colour = G.C.GREEN, r = 0.1, button = "selector_butt", shadow = true}, nodes = { 
                        { n = G.UIT.T, config = { text = "SELECT", colour = G.C.WHITE, scale = 0.5, shadow = true }}}},
            }}}}
            return t
end

local highlight_hooky = Card.highlight
function Card:highlight(is_highlighted)
    highlight_hooky(self, is_highlighted)
    if self.highlighted and self.ability.set == "Employed" then
        self.children.use_button = UIBox({    
            definition = G.UIDEF.employed_use(self),
            config = {
            parent = self,
            align = 'tm',
            offset = { x = -1.3, y = 2.5 },
            colour = G.C.CLEAR}})
    elseif self.children.use_button and self.highlighted and self.config.center.set == "Employed" then
        self.children.use_button:remove()
        self.children.use_button = nil
    end
    if self.highlighted and self.ref ~= nil then
        self.children.use_button = UIBox({    
            definition = G.UIDEF.select_card(),
            config = {
            parent = self,
            align = 'tm',
            offset = { x = 0, y = 0.4 },
            colour = G.C.CLEAR}})
    elseif self.children.use_button and self.highlighted and self.ref ~= nil then
            self.children.use_button:remove()
            self.children.use_button = nil
    end
end

local card_isfaceref = Card.is_face

function Card:is_face(from_boss)
	
	if self.ability.cbean_jaded then
		return true
	end
	
	return card_isfaceref(self, from_boss)
end