SMODS.current_mod.optional_features = function()
    return {
        cardareas = {
            deck = true
        }
    }
end

SMODS.current_mod.custom_card_areas = function(G)
	G.flace = CardArea(
		G.consumeables.T.x + 3, G.hand.T.y - 3, G.consumeables.T.w / 2.2, G.consumeables.T.h,
        {
            card_limit = 1, 
            type = 'joker', 
            highlight_limit = 1, 
            no_card_count = true 
        }
	)
end

FLACE = {}

FLACE.Flace = SMODS.Center:extend {
        unlocked = true,
        discovered = true,
        pos = { x = 0, y = 0 },
        atlas = 'tuning',
        config = {},
        class_prefix = 'ace',
        set = 'Flace',
        subset = "Tuning",
        required_params = {
            'key',
        },
        inject = function(self)
        if not G.P_CENTER_POOLS[self.set] then
            G.P_CENTER_POOLS[self.set] = {}
        end
            SMODS.Center.inject(self)
        end,
        set_card_type_badge = function(self, card, badges)
            badges[#badges + 1] = create_badge("Flying Ace", G.C.MULT, G.C.WHITE, 1.2)
            badges[#badges + 1] = create_badge(card.config.center.subset, G.C.GREEN, G.C.WHITE, 1.2)
        end,
        generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
            SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        end
    }
    
SMODS.load_file("content/tuning.lua")()
SMODS.load_file("content/trinkets.lua")()

SMODS.Atlas {
	key = "tuning",
	path = "tuning.png",
	px = 71,
	py = 95
}

SMODS.Atlas {
	key = "stick",
	path = "stickers.png",
	px = 71,
	py = 95
}

G.FUNCS.your_collection_stolen_from_LOCALTHUNK = function(args)
  if not args or not args.cycle_config then return end
  for j = 1, #G.your_collection do
    for i = #G.your_collection[j].cards,1, -1 do
      local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
      c:remove()
      c = nil
    end
  end
  for i = 1, 3 do
    for j = 1, #G.your_collection do
      local center = G.P_CENTER_POOLS.Flace[i+(j-1)*3 + (3*#G.your_collection*(args.cycle_config.current_option - 1))]
      if not center then break end
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      G.your_collection[j]:emplace(card)
    end
  end
end

function create_UIBox_your_collection_stolen()
  local deck_tables = {}
  G.SETTINGS.paused = true
  G.your_collection = {}
  for j = 1, 2 do
    G.your_collection[j] = CardArea(
      0,0,
      3*G.CARD_W,
      0.95*G.CARD_H, 
      {card_limit = 3, type = 'title', highlight_limit = 0})
    table.insert(deck_tables, 
    {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.your_collection[j]}}
    }}
    )
  end

  local joker_options = {}
  for i = 1, math.ceil(#G.P_CENTER_POOLS.Flace/(3*#G.your_collection)) do
    table.insert(joker_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(#G.P_CENTER_POOLS.Flace/(3*#G.your_collection))))
  end

  for i = 1, 3 do
    for j = 1, #G.your_collection do
      local center = G.P_CENTER_POOLS.Flace[i+(j-1)*3]
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
      G.your_collection[j]:emplace(card)
    end
  end
  G.selected_card = G.P_CENTER_POOLS["Flace"][1]
  G.selected_area = CardArea(
      0,0,
      1.1*G.CARD_W,
      1.1*G.CARD_H, 
      {card_limit = 1, type = 'title', highlight_limit = 0, collection = true})
  local t =
    { n = G.UIT.ROOT, config = {r = 0.1, minw = 1, minh = 1, align = "cm", padding = 0.5, colour = G.C.L_BLACK, outline = 3 }, nodes = {
        { n = G.UIT.R, config = {minw=1, minh=1, padding = 0.1, colour = G.C.CLEAR }, nodes = {
            { n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.CLEAR }, nodes = {
                { n = G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes=deck_tables }, 
                { n = G.UIT.R, config={align = "cm"}, nodes={
                    create_option_cycle({options = joker_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_stolen_from_LOCALTHUNK', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
        }}}},
            { n = G.UIT.C, config = {minw=1, minh=1, colour = G.C.CLEAR, padding = 0.2 }, nodes = {
                { n = G.UIT.R, config = {r = 0.1, minw = 1, minh = 1, align = "cm", colour = G.C.BLACK }, nodes = {
                    { n=G.UIT.O, config = { align = "cm", object = G.selected_area, id = G.selected_card.key, func = "tune_card_check" }}}},
                UIBox_button{ label = {"SELECT"}, scale = 0.5, minw = 2, minh = 1, colour = G.C.GREEN, r = 0.1, button = "select_flace" },
                UIBox_button{ label = {"RANDOM"}, scale = 0.5, minw = 2, minh = 1, colour = G.C.PURPLE, r = 0.1, button = "random_flace" },
                UIBox_button{ label = {"CANCEL"}, scale = 0.5, minw = 2, minh = 1, colour = G.C.MULT, r = 0.1, button = "cancel_flace_choice" }}
    }}}}}
G.FUNCS.overlay_menu({
    definition = t
        }
    )
    SMODS.add_card { area = G.selected_area, key = G.selected_card.key }
end

local Card_click_ref = Card.click
function Card:click()
    Card_click_ref(self)
    if self.ability.set == "Flace" and G.selected_area then
        G.selected_card = self.config.center
    end
end

function G.FUNCS.tune_card_check(e)
    if e.config.object and G.selected_card.key ~= e.config.id then
        if G.selected_area.cards[1] then
            G.selected_area.cards[1]:remove()
        end
        SMODS.add_card { area = G.selected_area, key = G.selected_card.key }
        e.config.id = G.selected_card.key
    end
end

function G.FUNCS.select_flace()
    G.FUNCS.exit_overlay_menu()
    SMODS.add_card { area = G.flace, key = G.selected_card.key }
end

function G.FUNCS.random_flace()
    G.selected_card = pseudorandom_element(G.P_CENTER_POOLS["Flace"], "randombutt")
end

function G.FUNCS.cancel_flace_choice()
    G.FUNCS.exit_overlay_menu()
end

--Tuning buttons:
function G.FUNCS.blueskill(e) -- Blue buton's func...
    local card = G.flace.cards[1]
    if G.flace.cards[1].config.center:can_use_blue(card) then
        e.config.button = "bluebutton"
        e.config.colour = G.C.CHIPS
    else
        e.config.button = nil
        e.config.colour = G.C.BLACK
    end
end

G.FUNCS.bluebutton = function () -- Blue button's effect
    local card = G.flace.cards[1]
    G.flace.cards[1].config.center:use_blue(card)
    G.flace.cards[1]:highlight(false)
end

function G.FUNCS.redskill(e) -- redbutt func
    local card = G.flace.cards[1]
    if G.flace.cards[1].config.center:can_use_red(card) then
        e.config.button = "redbutton"
        e.config.colour = G.C.MULT
    else
        e.config.button = nil
        e.config.colour = G.C.BLACK
    end
end

function G.FUNCS.redbutton() -- redbutt effect
    local card = G.flace.cards[1]
    G.flace.cards[1].config.center:use_red(card)
    G.flace.cards[1]:highlight(false)
end

--Here come the trinkets!!
function G.FUNCS.trinketskill(e)
    local card = G.flace.cards[1]
    if G.flace.cards[1].config.center:can_use(card) then
        e.config.button = "trinketbutt"
        e.config.colour = G.C.GREEN
    else
        e.config.button = nil
        e.config.colour = G.C.BLACK
    end
end

function G.FUNCS.trinketbutt()
    local card = G.flace.cards[1]
    G.flace.cards[1].config.center:use(card)
    G.flace.cards[1]:highlight(false)
end

function G.FUNCS.recalc(e)
    e.parent.UIBox:recalculate()
end

local start_run_ref = Game.start_run
function Game:start_run(args)
    start_run_ref(self, args)
    create_UIBox_your_collection_stolen()
end

local highlight_hooky = Card.highlight
function Card:highlight(is_highlighted)
    highlight_hooky(self, is_highlighted)
    local tuning_ui = {n = G.UIT.ROOT, config = { minw = 1, minh = 1, align = "tm", colour = G.C.CLEAR}, nodes = {
	            {n = G.UIT.C, config = { minw = 1, minh = 1, colour = G.C.CLEAR, r = 0.1, padding = 0.15, func = "recalc" }, nodes = {
                    UIBox_button{ label = {"USE  "}, scale = 0.6, minw = 1.5, minh = 1, colour = G.C.BLACK, r = 0.1, button = nil, func = "blueskill", shadow = true},
                    UIBox_button{ label = {"USE  "}, scale = 0.6, minw = 1.5, minh = 1, colour = G.C.BLACK, r = 0.1, button = nil, func = "redskill", shadow = true},
            }}}}
    local trinket_ui = {n = G.UIT.ROOT, config = { minw = 1, minh = 1, align = "tm", colour = G.C.CLEAR}, nodes = {
	            {n = G.UIT.C, config = { minw = 1, minh = 1, colour = G.C.CLEAR, r = 0.1, padding = 0.15, func = "recalc" }, nodes = {
                    UIBox_button{ label = {"USE  "}, scale = 0.6, minw = 1.5, minh = 1, colour = G.C.BLACK, r = 0.1, button = nil, func = "trinketskill", shadow = true},
            }}}}
    local select_card_ut = {n = G.UIT.ROOT, config = { minw = 1, minh = 1, align = "tm", colour = G.C.CLEAR}, nodes = {
	            {n = G.UIT.C, config = { minw = 1, minh = 1, colour = G.C.CLEAR, r = 0.1, padding = 0.15, func = "recalc" }, nodes = {
                    {n = G.UIT.R, config = { minw = 1, minh = 0.8, align = "cm", padding = 0.1, colour = G.C.GREEN, r = 0.1, button = "ut_draw", shadow = true}, nodes = { 
                        { n = G.UIT.T, config = { text = "SELECT", colour = G.C.WHITE, scale = 0.5, shadow = true }}}},
            }}}}
    local select_card_go = {n = G.UIT.ROOT, config = { minw = 1, minh = 1, align = "tm", colour = G.C.CLEAR}, nodes = {
	            {n = G.UIT.C, config = { minw = 1, minh = 1, colour = G.C.CLEAR, r = 0.1, padding = 0.15, func = "recalc" }, nodes = {
                    {n = G.UIT.R, config = { minw = 1, minh = 0.8, align = "cm", padding = 0.1, colour = G.C.GREEN, r = 0.1, button = "go_draw", shadow = true}, nodes = { 
                        { n = G.UIT.T, config = { text = "SELECT", colour = G.C.WHITE, scale = 0.5, shadow = true }}}},
            }}}}
        if self.highlighted and self.config.center.subset == "Tuning" then
            self.children.use_button = UIBox({    
                definition = tuning_ui,
                config = {
                parent = self,
                align = 'tm',
                offset = { x = -1.3, y = 2.5 },
                colour = G.C.CLEAR}})
        elseif self.children.use_button and self.highlighted and self.config.center.subset == "Tuning" then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
        if self.highlighted and self.config.center.subset == "Trinket" then
            self.children.use_button = UIBox({    
                definition = trinket_ui,
                config = {
                parent = self,
                align = 'tm',
                offset = { x = -1.3, y = 2 },
                colour = G.C.CLEAR}})
        elseif self.children.use_button and self.highlighted and self.config.center.subset == "Trinket" then
            self.children.use_button:remove()
            self.children.use_button = nil
        end
        if self.highlighted and self.area == G.suit_selector and G.suit_selector then
            self.children.use_button = UIBox({    
                definition = select_card_ut,
                config = {
                parent = self,
                align = 'tm',
                offset = { x = 0, y = 0.4 },
                colour = G.C.CLEAR}})
        elseif self.children.use_button and self.highlighted and self.area == G.suit_selector and G.suit_selector then
                self.children.use_button:remove()
                self.children.use_button = nil
        end
        if self.highlighted and self.ref ~= nil then
            self.children.use_button = UIBox({    
                definition = select_card_go,
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

