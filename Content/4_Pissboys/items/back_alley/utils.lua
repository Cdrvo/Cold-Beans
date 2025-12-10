
-- Common utility functions



function show_location(location)
    if location and location.alignment.offset.py then 
      location.alignment.offset.y = location.alignment.offset.py
      location.alignment.offset.py = nil
    end
end

function hide_location(location)
    if location and not location.alignment.offset.py then
      location.alignment.offset.py = location.alignment.offset.y
      location.alignment.offset.y = G.ROOM.T.y + 29
    end
end

function hide_many_locations(locations)
	for k, v in pairs(locations) do
		if v and not v.alignment.offset.py then
		  v.alignment.offset.py = v.alignment.offset.y
		  v.alignment.offset.y = G.ROOM.T.y + 29
		end
	end
end

function update_value_shiff()
		local numb = {"0", "1", "2"}
		pseudoshuffle(numb)
		
		for key, ad in pairs(G.cups) do
				if G.cups[key].newx then
						G.cups[key].config.offset.x = G.cups[key].config.offset.x + G.cups[key].newx
				end
				if G.cups[key].newy then
						G.cups[key].config.offset.y = G.cups[key].config.offset.y + G.cups[key].newy
						
				end
				G.cups[key].newx = 0
				G.cups[key].newy = 0
				G.cups[key].skipstate = 0
		end
		
		G.cups[tonumber(numb[1])].definition.nodes[1].config.object,G.cups[tonumber(numb[2])].definition.nodes[1].config.object,G.cups[tonumber(numb[3])].definition.nodes[1].config.object = G.cups[0].definition.nodes[1].config.object,G.cups[1].definition.nodes[1].config.object,G.cups[2].definition.nodes[1].config.object
		local first_cup_x = G.cups[tonumber(numb[1])].config.offset.x
		local second_cup_x = G.cups[tonumber(numb[2])].config.offset.x
		G.cups[tonumber(numb[1])].newx = second_cup_x-first_cup_x
		G.cups[tonumber(numb[2])].newx = first_cup_x-second_cup_x
end

function G.FUNCS.ease_babet(e)
	if not G.STATE_CHOOSEBALL and not G.STATE_SWAPBALL and not G.STATE_SHOWBALL then
		local num = e.config.amount
		local betsp = {0,1,2,5,10,25,40,60,100}
		for key, value in pairs(betsp) do
				if G.current_betmoney == betsp[key] then
					G.current_betmoney = betsp[(key+num)] and G.GAME.dollars >= to_big(betsp[(key+num)]) and betsp[(key+num)] or G.current_betmoney
					if G.current_betmoney > 59 then
						G.MODE = 3
					elseif G.current_betmoney > 24 then
						G.MODE = 2.5
					elseif G.current_betmoney > 0 then
						G.MODE = 2
					else
						G.MODE = 0
					end
					break
				end
		end
	end
end