-- main folder for everything outside of team contents
-- read important.txt !!

ColdBeans = SMODS.current_mod
G.compat = { -- So like add mods you want to crossmod with or mods such as joker display for compatability
	["JokerDisplay"] = SMODS.find_mod("VanillaRemade") -- I mean vremade 
}

-- Check through wanted mods
for i, mod in pairs(WantedMods) do 
	if mod ~= nil then
		table.insert(G.compat, mod)
	end
end

-- defining this here because it would be quite silly for this to not be a global api
local on_calculate_cbs = {}
ColdBeans.OnCalculate = function (cb)
	on_calculate_cbs[#on_calculate_cbs+1] = cb
end

local function GetJokers()
	local jokers = {}
	for i, card in pairs(G.jokers.cards) do
		if card.config.center.key then
			jokers[card.config.center.key] = card
		end
	end

	return jokers -- to find joker in owned jokers do jokers["key of joker"]
end

ColdBeans.calculate = function(mod, context)
	if context.card_added and context.cardarea == G.jokers then
		local jokers = GetJokers()
		local troub, minne, trouv = jokers["j_troubadour"], jokers["j_cbean_colon_minnesang"], jokers["j_cbean_colon_trouvere"]
		print(jokers)
		if troub and minne and trouv then
			troub:remove()
			minne:remove()
			trouv:remove()
			-- how to not copy paste, but keep in 3 lines so i look smart

			SMODS.add_card({key = "j_cbean_colon_orchestra"})
		end
	end
	-- dunno this, but I'm needing this after
    local haspost = false;
    local results = {}
    for i, cb in ipairs(on_calculate_cbs) do
        local result, post = cb(mod, context)
        if result then
            results[#results+1] = result;
        end
        if post then
            haspost = true
        end
    end
    if #results == 0 then return nil, haspost end
    if #results == 1 then return results[1], haspost end
    return SMODS.merge_effects(unpack(results)), haspost
end

Colonparen = {
	SpecialBlinds = {}
}

function ColdBeans.recursive_load(path)
	local files = NFS.getDirectoryItems(ColdBeans.path .. path)
	table.sort(files)
	for _, item in ipairs(files) do
		if string.sub(item, -4) == ".lua" then
			print("ColdBeans: Loading " .. item:gsub("%d+_", ""))
			local f, err = SMODS.load_file(path .. "/" .. item)
			if err then
				error(err)
			elseif f then
				f()
			end
		elseif path:find("%.") == nil then
			ColdBeans.recursive_load(path .. "/" .. item)
		end
	end
end

ColdBeans.recursive_load("Content") 
-- more folders can be loaded by simply duplicating this 

-- Credits!

-- Taken from Hot Potato's main code
local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
	if not SMODS.config.no_mod_badges and obj and obj.beans_credits then
		local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
		if obj.beans_credits.art or obj.beans_credits.code or obj.beans_credits.idea or obj.beans_credits.team or obj.beans_credits.custom then
			local scale_fac = {}
			local min_scale_fac = 1
			local strings = { ColdBeans.display_name }
			for _, v in ipairs({ "team" , "idea", "art", "code"}) do
				if obj.beans_credits[v] then
					if type(obj.beans_credits[v]) == "string" then obj.beans_credits[v] = { obj.beans_credits[v] } end
					for i = 1, #obj.beans_credits[v] do
						strings[#strings + 1] =
							localize({ type = "variable", key = "coldbean_" .. v, vars = { obj.beans_credits[v][i] } })
							[1]
					end
				end
			end
			if obj.beans_credits.custom then
				strings[#strings + 1] = localize({ type = "variable", key = obj.beans_credits.custom.key, vars = { obj.beans_credits.custom.text } })
			end
			for i = 1, #strings do
				scale_fac[i] = calc_scale_fac(strings[i])
				min_scale_fac = math.min(min_scale_fac, scale_fac[i])
			end
			local ct = {}
			for i = 1, #strings do
				ct[i] = {
					string = strings[i],
				}
			end
			for i = 1, #badges do
				if badges[i].nodes[1].nodes[2].config.object.string == ColdBeans.display_name then --this was meant to be a hex code but it just doesnt work for like no reason so its hardcoded
					badges[i].nodes[1].nodes[2].config.object:remove()
					badges[i] = {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = {
                            {
                                n = G.UIT.R,
                                config = {
                                    align = "cm",
                                    colour = ColdBeans.badge_colour,
                                    r = 0.1,
                                    minw = 2 / min_scale_fac,
                                    minh = 0.36,
                                    emboss = 0.05,
                                    padding = 0.03 * 0.9,
                                },
                                nodes = {
                                    { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                                    {
                                        n = G.UIT.O,
                                        config = {
                                            object = DynaText({
                                                string = ct or "ERROR",
                                                colours = { obj.beans_credits and obj.beans_credits.text_colour or HEX("678d8f") },
                                                silent = true,
                                                float = true,
                                                shadow = true,
                                                offset_y = -0.03,
                                                spacing = 1,
                                                scale = 0.33 * 0.9,
                                            }),
                                        },
                                    },
                                    { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                                },
                            },
                        },
                    }
					break
				end
			end
		end
	end
end