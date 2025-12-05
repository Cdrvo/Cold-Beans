function G.UIDEF.alleyball()
  
	local sprite_ball = G.ASSET_ATLAS and Sprite(0, 0, 34*0.071, 34*0.095, G.ASSET_ATLAS['cbean_pboys_backalley_other_atlas'], { x = 1, y = 0 }) or nil

    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_ball}},
    }}
    return t
end

function G.UIDEF.alleyjoker()
  
	local sprite_joker = G.ASSET_ATLAS and Sprite(0, 0, 34*0.071, 34*0.095, G.ASSET_ATLAS['cbean_pboys_backalley_other_atlas'], { x = 2, y = 0 }) or nil

    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_joker}},
    }}
    return t
end


function G.UIDEF.newcup(value)
  
	local sprite_cup = G.ASSET_ATLAS and Sprite(0, 0, 34*0.071, 34*0.095, G.ASSET_ATLAS['cbean_pboys_backalley_other_atlas'], { x = 0, y = 0 }) or nil

    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            {n=G.UIT.O, config={object = sprite_cup}},
    }}
    return t
end


function G.UIDEF.balley()
	
	G.info = G.ASSET_ATLAS and Sprite(0, 0, 34*0.035, 34*0.035, G.ASSET_ATLAS['cbean_pboys_backalley_tags_atlas'], { x = 0, y = 0 }) or nil
	G.alley_money = {n=G.UIT.O, config={object = DynaText({string = {localize('$')..G.GAME.dollars}, font = G.LANGUAGES['en-us'].font ,colours = {G.C.MONEY}, shadow = true, scale = 0.65})}}

    local t = {n=G.UIT.ROOT, config = {align = 'cl', colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({
                {n=G.UIT.C, config={align = "cm", padding = 0.1, emboss = 0.05, r = 0.1, colour = G.C.DYN_UI.BOSS_MAIN}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.05}, nodes={
                      {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, colour = G.C.L_BLACK, emboss = 0.05, minw = 3.4, minh = 3.7}, nodes={}},
                      {n=G.UIT.C, config={align = "cm", padding = 0.15, minw = 8.5, maxw = 10.5, r=0.2, colour = G.C.L_BLACK, emboss = 0.05}},
                    }},
                    {n=G.UIT.R, config={align = "cm", minh = 1.8}, nodes={}},
                    {n=G.UIT.R, config={align = "cm", padding = 0.0}, nodes={    
						{n=G.UIT.C, config={align = "cm", padding = 0.8}, nodes={
							{n=G.UIT.R,config={id = 'next_round_button', align = "cm", minw = 2.8, minh = 1.3, r=0.15,colour = G.C.L_BLACK, one_press = false, button = 'hide_balley', hover = true,shadow = true, func = "can_use_bet" }, nodes = {
							  {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'y', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
								{n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
								  {n=G.UIT.T, config={text = localize('k_cbean_pboys_abet'), scale = 0.8, colour = G.C.WHITE, shadow = true}}
								}},
							  }},              
							}},   
						}},
						{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
							{n=G.UIT.R,config={id = 'next_round_button', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.L_BLACK, one_press = false, button = "ease_babet", amount = -1, hover = true,shadow = true}, nodes = {
							  {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'y', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
								{n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
								  {n=G.UIT.T, config={text = localize('k_cbean_pboys_aminus'), scale = 0.8, colour = G.C.WHITE, shadow = true}}
								}},
							  }},              
							}},   
						}},
						{n=G.UIT.R, config={align = "cm", minw = 1.5}, nodes={}},
						{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 2.3, minh = 1.3, colour = G.C.L_BLACK, emboss = 0.05, r = 0.1}, nodes={
							  {n=G.UIT.R, config={align = "cm"}, nodes={
								{n=G.UIT.C, config={align = "cm", r = 0.1, minw = 2.1, minh = 1.15, colour = G.C.BLACK}, nodes={
								  {n=G.UIT.O, config={object = DynaText({string = {{ref_table = G, ref_value = 'current_betmoney', prefix = localize('$')}}, maxw = 1.35, colours = {G.C.MONEY}, font = G.LANGUAGES['en-us'].font, shadow = true,spacing = 2, bump = true, scale = 0.8}), id = 'dollar_text_UI'}}
								}},
							  }},
							}},  
						}},
						{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
							{n=G.UIT.R,config={id = 'next_round_button', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.L_BLACK, one_press = false, button = "ease_babet", amount = 1, hover = true,shadow = true}, nodes = {
							  {n=G.UIT.R, config={align = "cm", padding = 0.07, focus_args = {button = 'y', orientation = 'cr'}, func = 'set_button_pip'}, nodes={
								{n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
								  {n=G.UIT.T, config={text = localize('k_cbean_pboys_aplus'), scale = 0.8, colour = G.C.WHITE, shadow = true}}
								}},
							  }},              
							}},   
						}},
						{n=G.UIT.C, config={align = "cm", minw = 1.3, minh = 1.3, padding = 0.5}, nodes={
                          {n=G.UIT.O, config={object = G.info}},
						}},
						{n=G.UIT.R, config={align = "cm", minw = 1.5}, nodes={}},
                    }}
                }
              },
              
              }, false)
        }}
    return t
end