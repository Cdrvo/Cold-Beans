G.FUNCS.your_collection_cbean_biomes = function()
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu({
		definition = NAMETEAM.create_UIBox_your_collection_biomes(),
	})
end

function NAMETEAM.create_UIBox_your_collection_biomes()
	G.E_MANAGER:add_event(Event({
		func = function()
			G.FUNCS.cbean_biome_collection_page({ cycle_config = {} })
			return true
		end,
	}))
	return {
		n = G.UIT.O,
		config = {
			object = UIBox({
				definition = NAMETEAM.create_UIBox_your_collection_biomes_content(),
				config = { offset = { x = 0, y = 0 }, align = "cm" },
			}),
			id = "your_collection_biome_contents",
			align = "cm",
		},
	}
end

function NAMETEAM.create_UIBox_your_collection_biomes_content(page)
	page = page or 1
	args = {}
	local pool = SMODS.collection_pool(CBWG.ColdBeans_Biomes)
	local rows = 2
	local cols = 3
	local table_nodes = {}
	for i = 1, rows do
		local col_nodes = {}
		for j = 1, cols do
			if pool[(i - 1) * cols + j + (page - 1) * rows * cols] then
				local biome = pool[(i - 1) * cols + j + (page - 1) * rows * cols]
				local temp_sprite = SMODS.create_sprite(0, 0, 113 / 57 * G.CARD_W, G.CARD_W, biome.atlas, biome.pos)
				col_nodes[#col_nodes + 1] = {
					n = G.UIT.C,
					config = { align = "cm", padding = 0.07, },
					nodes = {
						{
							n = G.UIT.O,
							config = {
								object = temp_sprite,
							},
						},
					},
				}
			end
		end
		table_nodes[#table_nodes + 1] = {
			n = G.UIT.R,
			config = { align = "cm", padding = 0.07 },
			nodes = col_nodes,
		}
	end
	local options = {}
	for i = 1, math.ceil(#pool / (rows * cols)) do
		table.insert(
			options,
			localize("k_page") .. " " .. tostring(i) .. "/" .. tostring(math.ceil(#pool / (rows * cols)))
		)
	end
    local temp_sprite = SMODS.create_sprite(0, 0, 2, 2, "cbean_wgrop_biomes", { x = 0, y = 0 })
	local t = create_UIBox_generic_options({
		colour = G.ACTIVE_MOD_UI
			and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_colour or (G.ACTIVE_MOD_UI.ui_config or {}).colour),
		bg_colour = G.ACTIVE_MOD_UI
			and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_bg_colour or (G.ACTIVE_MOD_UI.ui_config or {}).bg_colour),
		back_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_back_colour or (
			G.ACTIVE_MOD_UI.ui_config or {}
		).back_colour),
		outline_colour = G.ACTIVE_MOD_UI and ((G.ACTIVE_MOD_UI.ui_config or {}).collection_outline_colour or (
			G.ACTIVE_MOD_UI.ui_config or {}
		).outline_colour),
		back_func = G.ACTIVE_MOD_UI and "openModUI_" .. G.ACTIVE_MOD_UI.id or "your_collection",
		snap_back = args.snap_back,
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm" },
						nodes = table_nodes,
					},
				},
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					create_option_cycle({
						options = options,
						w = 4.5,
						cycle_shoulders = true,
						opt_callback = "cbean_biome_collection_page",
						current_option = page,
						colour = G.ACTIVE_MOD_UI and (G.ACTIVE_MOD_UI.ui_config or {}).collection_option_cycle_colour
							or G.C.RED,
						no_pips = true,
						focus_args = { snap_to = true, nav = "wide" },
					}),
				},
			},
		},
	})
	return t
end

function G.FUNCS.cbean_biome_collection_page(args)
	local page = args and args.cycle_config.current_option or 1
	local t = NAMETEAM.create_UIBox_your_collection_biomes_content(page)
	local e = G.OVERLAY_MENU:get_UIE_by_ID("your_collection_biome_contents")
	if e and e.config.object then
		e.config.object:remove()
	end
	e.config.object = UIBox({
		definition = t,
		config = { offset = { x = 0, y = 0 }, align = "cm", parent = e },
	})
end
