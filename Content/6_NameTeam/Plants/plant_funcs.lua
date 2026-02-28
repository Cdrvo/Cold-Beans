
G.FUNCS.your_collection_jokers_not_pvz = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = NAMETEAM.create_UIBox_your_collection_jokers_not_pvz(),
  }
end

function NAMETEAM.create_UIBox_your_collection_jokers_not_pvz()
  local deck_tables = {}

  G.your_collection = {}
  for j = 1, 3 do
    G.your_collection[j] = CardArea(
      G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      5*G.CARD_W,
      0.95*G.CARD_H, 
      {card_limit = 5, type = 'title', highlight_limit = 0, collection = true})
    table.insert(deck_tables, 
    {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.your_collection[j]}}
    }}
    )
  end

  local jokers_in_collection = 0
  for _,v in pairs(G.P_CENTER_POOLS.Joker) do
	if not v.pvz_plant then
		jokers_in_collection = jokers_in_collection+1
	end
  end
  local joker_options = {}
  for i = 1, math.ceil(jokers_in_collection/(5*#G.your_collection)) do
    table.insert(joker_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(jokers_in_collection/(5*#G.your_collection))))
  end

  local non_pvz_jokers = {}
  for _,v in pairs(G.P_CENTER_POOLS["Joker"]) do
	if not v.pvz_plant and not v.no_collection then
	  non_pvz_jokers[#non_pvz_jokers+1] = v
	end
  end

  for i = 1, 5 do
    for j = 1, #G.your_collection do
      local center = non_pvz_jokers[i+(j-1)*5]
	  sendDebugMessage(center.key, "nameteamSplitJokers")
		local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
		card.sticker = get_joker_win_sticker(center)
		G.your_collection[j]:emplace(card)
    end
  end

  INIT_COLLECTION_CARD_ALERTS()
  
  local t =  create_UIBox_generic_options({ back_func = 'your_collection', contents = {
        {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
        {n=G.UIT.R, config={align = "cm"}, nodes={
          create_option_cycle({options = joker_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_joker_page_non_pvz', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
        }}
    }})
  return t
end

G.FUNCS.your_collection_joker_page_non_pvz = function(args)
  if not args or not args.cycle_config then return end
  for j = 1, #G.your_collection do
    for i = #G.your_collection[j].cards,1, -1 do
      local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
      c:remove()
      c = nil
    end
  end

  local non_pvz_jokers = {}
  for _,v in pairs(G.P_CENTER_POOLS["Joker"]) do
	if not v.pvz_plant and not v.no_collection then
	  non_pvz_jokers[#non_pvz_jokers+1] = v
	end
  end

  for i = 1, 5 do
    for j = 1, #G.your_collection do
      local center = non_pvz_jokers[i+(j-1)*5 + (5*#G.your_collection*(args.cycle_config.current_option - 1))]
      if not center then break end
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      card.sticker = get_joker_win_sticker(center)
      G.your_collection[j]:emplace(card)
    end
  end
  INIT_COLLECTION_CARD_ALERTS()
end

G.FUNCS.your_collection_jokers_pvz = function(e)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = NAMETEAM.create_UIBox_your_collection_jokers_pvz(),
  }
end

function NAMETEAM.create_UIBox_your_collection_jokers_pvz()
  local deck_tables = {}

  G.your_collection = {}
  for j = 1, 3 do
    G.your_collection[j] = CardArea(
      G.ROOM.T.x + 0.2*G.ROOM.T.w/2,G.ROOM.T.h,
      5*G.CARD_W,
      0.95*G.CARD_H, 
      {card_limit = 5, type = 'title', highlight_limit = 0, collection = true})
    table.insert(deck_tables, 
    {n=G.UIT.R, config={align = "cm", padding = 0.07, no_fill = true}, nodes={
      {n=G.UIT.O, config={object = G.your_collection[j]}}
    }}
    )
  end

  local jokers_in_collection = 0
  for _,v in pairs(G.P_CENTER_POOLS.Joker) do
	if v.pvz_plant and not v.no_collection then
		jokers_in_collection = jokers_in_collection+1
	end
  end
  local joker_options = {}
  for i = 1, math.ceil(jokers_in_collection/(5*#G.your_collection)) do
    table.insert(joker_options, localize('k_page')..' '..tostring(i)..'/'..tostring(math.ceil(jokers_in_collection/(5*#G.your_collection))))
  end

  local pvz_jokers = {}
  for _,v in pairs(G.P_CENTER_POOLS["Joker"]) do
	if v.pvz_plant then
	  pvz_jokers[#pvz_jokers+1] = v
	end
  end

  for i = 1, 5 do
    for j = 1, #G.your_collection do
      local center = pvz_jokers[i+(j-1)*5]
	  sendDebugMessage(center.key, "nameteamSplitJokers")
		local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, nil, center)
		card.sticker = get_joker_win_sticker(center)
		G.your_collection[j]:emplace(card)
    end
  end

  INIT_COLLECTION_CARD_ALERTS()
  
  local t =  create_UIBox_generic_options({ back_func = 'your_collection', contents = {
        {n=G.UIT.R, config={align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05}, nodes=deck_tables}, 
        {n=G.UIT.R, config={align = "cm"}, nodes={
          create_option_cycle({options = joker_options, w = 4.5, cycle_shoulders = true, opt_callback = 'your_collection_joker_page_pvz', current_option = 1, colour = G.C.RED, no_pips = true, focus_args = {snap_to = true, nav = 'wide'}})
        }}
    }})
  return t
end

G.FUNCS.your_collection_joker_page_pvz = function(args)
  if not args or not args.cycle_config then return end
  for j = 1, #G.your_collection do
    for i = #G.your_collection[j].cards,1, -1 do
      local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
      c:remove()
      c = nil
    end
  end

  local pvz_jokers = {}
  for _,v in pairs(G.P_CENTER_POOLS["Joker"]) do
	if v.pvz_plant and not v.no_collection then
	  pvz_jokers[#pvz_jokers+1] = v
	end
  end

  for i = 1, 5 do
    for j = 1, #G.your_collection do
      local center = pvz_jokers[i+(j-1)*5 + (5*#G.your_collection*(args.cycle_config.current_option - 1))]
      if not center then break end
      local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w/2, G.your_collection[j].T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, center)
      card.sticker = get_joker_win_sticker(center)
      G.your_collection[j]:emplace(card)
    end
  end
  INIT_COLLECTION_CARD_ALERTS()
end