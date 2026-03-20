-- main folder for everything outside of team contents
-- read important.txt !!

ColdBeans = SMODS.current_mod

SMDOS = SMODS -- Revo likes mistyping SMODS.

-- Talisman magic-trick!
to_big = to_big or function(x) return x end
to_number = to_number or function(x) return x end

-- defining this here because it would be quite silly for this to not be a global api
local on_calculate_cbs = {}
---Adds a function to a list whose functions are checked in the same place as the global mod calculate.
---@param cb fun(mod: Mod, context: CalcContext): table?
ColdBeans.OnCalculate = function(cb)
	on_calculate_cbs[#on_calculate_cbs + 1] = cb
end

SMODS.current_mod.optional_features = {
	retrigger_joker = true,
	post_trigger = true,
	cardareas = {
		deck = true,
		discard = true
	}
}

SMODS.current_mod.description_loc_vars = function() --Makes mod description background clear
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

-- global joker cache for house rules performance
-- this eliminates repeated SMODS.find_card() calls across all house rules hands
-- If you want to add the infoqueue to them, check out the nameteam lovely file
ColdBeans.joker_cache = {
    -- house rules
    house_rules = false,

	-- collection
    sticker_collection = false,
    stickerbomb = false,
    
    -- 67!!!
    sixth_sense = false,
    mu_cube = false,
    
    -- fibonacci
    fibonacci = false,
    
    -- jackpot
    oops = false,
    nat20 = false,
    set_of_dice = false,
    
   -- lucky 8re8k
    eight_ball = false,

    --sacrifice
    obelisk = false,

    --Yet Another Stone Card Hand
    marble = false,
    stone = false,
    walled_in = false,

    --Favorite Year and Favorite Year Flush
    big_shot = false,

    --Thorny Boquet
    withering_memory = false,

    --Flush Tuah
    jolly = false,
    sly = false,
    duo = false,

    --Flush Threeah
    zany = false,
    wily = false,
    trio = false,
    
    --Pansexual
    shortcut = false,

    --True Home
    seeing_double = false,
    diamondshapewithadotinside = false,

    --Deer in Headlights
    driving_in_my_truck = false,

    --PROCEED
    thorn_ring = false,

    --Zomboids
    znake = false,
    zoybean = false,
    
    -- add more jokers as needed for other house rules hands

}

-- update the entire joker cache at once
function ColdBeans.update_joker_cache()
    --------------------House Rules Jokers-----------------
    ColdBeans.joker_cache.house_rules = next(SMODS.find_card("j_cbean_0chill_house_rules")) ~= nil

    --Collection and Collection 3oak
    ColdBeans.joker_cache.sticker_collection = next(SMODS.find_card("j_cbean_nameteam_sticker_collection")) ~= nil
    ColdBeans.joker_cache.stickerbomb = next(SMODS.find_card("j_cbean_nameteam_stickerbomb")) ~= nil
    
    -- 67 and 67 flush!!! 
    ColdBeans.joker_cache.sixth_sense = next(SMODS.find_card("j_sixth_sense")) ~= nil
    ColdBeans.joker_cache.mu_cube = next(SMODS.find_card("j_cbean_colon_mu_cube")) ~= nil
    
    -- fibonacci
    ColdBeans.joker_cache.fibonacci = next(SMODS.find_card("j_fibonacci")) ~= nil
    
    -- jackpot
    ColdBeans.joker_cache.oops = next(SMODS.find_card("j_oops")) ~= nil
    ColdBeans.joker_cache.nat20 = next(SMODS.find_card("j_cbean_0chill_nat20")) ~= nil
    ColdBeans.joker_cache.set_of_dice = next(SMODS.find_card("j_cbean_yma_set_of_dice")) ~= nil
    
    -- lucky 8re8k
    ColdBeans.joker_cache.eight_ball = next(SMODS.find_card("j_8_ball")) ~= nil

    --sacrifice
    ColdBeans.joker_cache.obelisk = next(SMODS.find_card("j_obelisk")) ~= nil

    --Yet another stone card hand
    ColdBeans.joker_cache.marble = next(SMODS.find_card("j_marble")) ~= nil
    ColdBeans.joker_cache.stone = next(SMODS.find_card("j_stone")) ~= nil
    ColdBeans.joker_cache.walled_in = next(SMODS.find_card("j_cbean_nameteam_walledin")) ~= nil

   	--Favorite Year and Favorite Year Flush
    ColdBeans.joker_cache.big_shot = next(SMODS.find_card("j_cbean_colon_big_shot")) ~= nil

    --thorny_boquete
    ColdBeans.joker_cache.withering_memory = next(SMODS.find_card("j_cbean_wgrop_withering_memory")) ~= nil

    --Flush Tuah
    ColdBeans.joker_cache.jolly = next(SMODS.find_card("j_jolly")) ~= nil
    ColdBeans.joker_cache.sly = next(SMODS.find_card("j_sly")) ~= nil
    ColdBeans.joker_cache.duo = next(SMODS.find_card("j_duo")) ~= nil

    --Flush Threeah
    ColdBeans.joker_cache.zany = next(SMODS.find_card("j_zany")) ~= nil
    ColdBeans.joker_cache.wily = next(SMODS.find_card("j_wily")) ~= nil
    ColdBeans.joker_cache.trio = next(SMODS.find_card("j_trio")) ~= nil

    --Pansexual and Pansexual Flush
    ColdBeans.joker_cache.shortcut = next(SMODS.find_card("j_shortcut")) ~= nil

    --True Home
    ColdBeans.joker_cache.seeing_double = next(SMODS.find_card("j_seeing_double")) ~= nil
    ColdBeans.joker_cache.diamondshapewithadotinside = next(SMODS.find_card("j_cbean_nameteam_diamondshapewithadotinside")) ~= nil

    --Deer in Headlights
    ColdBeans.joker_cache.driving_in_my_truck = next(SMODS.find_card("j_cbean_0chill_driving_in_my_truck")) ~= nil

    --PROCEED
    ColdBeans.joker_cache.thorn_ring = next(SMODS.find_card("j_cbean_0chill_thorn_ring")) ~= nil

    ColdBeans.joker_cache.znake = next(SMODS.find_card("j_cbean_znake_lilly")) ~= nil
    ColdBeans.joker_cache.zoybean = next(SMODS.find_card("j_cbean_zoybean_pod")) ~= nil


end

-- helper functions for common house rules patterns
function ColdBeans.has_house_rules_and(collection_jokers)
    return ColdBeans.joker_cache.house_rules and collection_jokers
end

function ColdBeans.has_any_of(joker_keys)
    for _, key in ipairs(joker_keys) do
        if ColdBeans.joker_cache[key] then
            return true
        end
    end
    return false
end

-- initialize cache on load
ColdBeans.update_joker_cache()

local function GetJokers()
	local jokers = {}
	for i, card in pairs(G.jokers.cards) do
		if card.key then
			jokers[card.key] = card
		end
	end

	return jokers -- to find joker in owned jokers do jokers["key of joker"]
end

function count_consumables()
	if G.consumeables.get_total_count then
		return G.consumeables:get_total_count()
	else
		return #G.consumeables.cards + G.GAME.consumeable_buffer
	end
end

ColdBeans.calculate = function(mod, context)
	-- update global joker cache when jokers are added/removed/sold
	if context.cbean_destroyed or context.card_added or context.buying_card or context.selling_card then
		if ColdBeans.update_joker_cache then
			ColdBeans.update_joker_cache()
		end
	end
	
	if context.round_eval then
		G.GAME.BALLEY_WINS = 0
		G.GAME.yma_forge_closed = nil
	end
	if context.starting_shop then
		G.GAME.cbean_shop_nocontext = true
	end
	if context.ending_shop then
		G.GAME.cbean_shop_nocontext = false
		G.GAME.VISITED_STREET = false
	end

	if context.buying_card and context.card and context.card.config and context.card.config.center and context.card.set == "Voucher" then
		G.GAME.NAMETEAM.voucher_this_ante = true
	end

	if context.individual and context.cardarea == G.play then
		if G.GAME.NAMETEAM.bzzed then
			G.GAME.NAMETEAM.bzzed = G.GAME.NAMETEAM.bzzed - 1
			local a = G.GAME.NAMETEAM.bzzed_amount
			context.other_card.ability.bzzed = true
			return {
				xmult = G.GAME.NAMETEAM.bzzed_amount
			}
		end
	end
	if context.destroy_card and context.cardarea == G.play and ((G.GAME.NAMETEAM.jal_sold and G.GAME.NAMETEAM.jal_sold > 0) or (context.destroy_card.ability.bzzed)) then
		G.GAME.NAMETEAM.jal_triggered = true
		return {
			remove = true
		}
	end

	if context.skip_blind then
		G.GAME.NAMETEAM.skipped = true
	end
	if context.setting_blind then
		G.GAME.NAMETEAM.skipped = false
	end
	if context.before then
		if G.GAME.NAMETEAM.grimrose_number and G.GAME.NAMETEAM.grimrose_number > 0 then
			G.GAME.NAMETEAM.grimrose_triggered = true
			G.GAME.NAMETEAM.grimrose_number = G.GAME.NAMETEAM.grimrose_number - 1
			SMODS.smart_level_up_hand(nil, context.scoring_name, nil, 1)
		end

		if G.GAME.NAMETEAM.gold_rush and G.GAME.NAMETEAM.gold_rush > 0 then
			G.GAME.NAMETEAM.gold_rush = G.GAME.NAMETEAM.gold_rush - 1
			for k, v in pairs(context.scoring_hand) do
				v:set_seal("Gold")
				v:juice_up()
				v:set_ability("m_gold")
			end
		end

		--[[if G.GAME.NAMETEAM.hands then
			print(context.scoring_name)
			if not G.GAME.NAMETEAM.redacted_scale then G.GAME.NAMETEAM.redacted_scale = {} end
			for k, v in pairs(G.GAME.NAMETEAM.hands) do
				if context.scoring_name and context.scoring_name == k then
					if not G.GAME.NAMETEAM.hands[k].visible then
						local add = true
						for kk, vv in pairs(G.GAME.NAMETEAM.redacted_scale) do
							if vv == k then
								add = false
							end
						end
						if add then
							G.GAME.NAMETEAM.redacted_scale[#G.GAME.NAMETEAM.redacted_scale+1] = k
						end
					end
				end
			end
		end]]
	end
	if context.final_scoring_step then
		if G.GAME.NAMETEAM.grimrose_triggered then
			G.GAME.NAMETEAM.grimrose_triggered = false
			local acard = pseudorandom_element(context.scoring_hand, pseudoseed("grimyrosu"))
			if acard then
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.03,
					func = function()
						SMODS.destroy_cards(acard)
						return true
					end
				}))
			end
		end
	end

	if context.cbean_first then
		G.GAME.NAMETEAM.hands = G.GAME.hands --???
	end

	if context.after then
		G.GAME.NAMETEAM.cattail_check = false
		G.GAME.cbean_combo_index = {}
		G.GAME.cbean_combo_unique_hand = {}
		G.GAME.cbean_combos_used_turn = 0

		if G.GAME.NAMETEAM.jal_triggered and G.GAME.NAMETEAM.jal_sold then
			G.GAME.NAMETEAM.jal_sold = G.GAME.NAMETEAM.jal_sold - 1
			G.GAME.NAMETEAM.jal_triggered = false
		end

		if G.GAME.NAMETEAM.first_hand_disable then
			G.GAME.NAMETEAM.first_hand_disable = false
			--idk what im doing
			G.GAME.blind.disabled = false
		end

		for k, v in pairs(G.jokers.cards) do
			if v.debuff and v.key == "j_cbean_jack_o_lantern" and v.ability.extra.hands_left <= 0 then
				if v.ability.extra.debuff_hands > 0 then
					v.ability.extra.debuff_hands = v.ability.exrea.debuff_hands - 1
					NAMETEAM.msg(v, "-1 Debuff Round")
				else
					v.ability.extra.hands_left = 2
					v.ability.extra.debuff_hands = 2
					SMODS.debuff_card(v, false, "jack_lantern_debuff")
					NAMETEAM.msg(v, "Undebuff!")
				end
			end
		end
	end
	if context.end_of_round then
		G.GAME.cbean_combo_unique_round = {}

		if context.main_eval then
			if G.GAME.NAMETEAM.buduh_boomed then -- no event manager
				G.GAME.NAMETEAM.buduh_boomed = nil
				G.GAME.NAMETEAM.buduh_boomed_just_activated = true
				G.GAME.NAMETEAM.buduh_boomed_active = true
			end

			if G.GAME.NAMETEAM.buduh_boomed_active then
				if not G.GAME.NAMETEAM.buduh_boomed_just_activated then
					G.GAME.NAMETEAM.buduh_boomed_active = false
				else
					G.GAME.NAMETEAM.buduh_boomed_just_activated = false
				end
			end

			if G.GAME.NAMETEAM.cards_no_score then
				G.GAME.NAMETEAM.cards_no_score = nil
			end
			for k, v in pairs(G.playing_cards) do
				if v.cbean_banana_timer then
					if v.cbean_banana_timer == 1 then
						v.cbean_banana_timer = nil
						SMODS.debuff_card(v, false, "debuffed_by_banana_launcher")
					else
						v.cbean_banana_timer = v.cbean_banana_timer - 1
					end
				end

				if v.mark_for_perma_no_score and v.ability.marked_by_noctairne then
					v.mark_for_perma_no_score = nil
				end
			end

			for k, v in pairs(G.jokers.cards) do -- needs a check for other values ( iwanted to use - instead of / but i got other jokers to code)
				if v.ability.immutable and v.ability.immutable.cbean_lily_power and v.ability.immutable.cbean_lily_power > 1 then
					v.ability.immutable.cbean_lily_power = v.ability.immutable.cbean_lily_power - 1
					NAMETEAM.msg(v, "-1 " .. localize("k_cbean_lily"))
				elseif v.ability.immutable and v.ability.immutable.cbean_lily_power and v.ability.immutable.cbean_lily_power <= 1 then
					v.ability.immutable.cbean_lily_power = nil
					NAMETEAM.msg(v, localize("k_reset"))
					NAMETEAM.values("/", v, 2, true)
				end

				if v.newly_debuffed then
					v.newly_debuffed = false
				elseif v.was_debuffed_by_elec then
					v.was_debuffed_by_elec = nil
					SMODS.debuff_card(v, false, "elecelec")
				end
			end
		end
	end

	if context.other_joker and (context.other_joker.ability.perma_h_chips > 0 or context.other_joker.ability.perma_h_chips < 0) then
		return {
			chips = context.other_joker.ability.perma_h_chips,
			message_card = context.other_joker,
			no_juice = true,
		}
	end

	if context.destroy_card and context.cardarea == G.play and G.GAME.NAMETEAM.destroy and G.GAME.NAMETEAM.destroy > 0 then
		G.GAME.NAMETEAM.destroy = G.GAME.NAMETEAM.destroy - 1
		return {
			remove = true
		}
	end
	if context.ante_change and context.ante_end then
		if G.GAME.NAMETEAM.healthy_ante then
			G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling + G.GAME.NAMETEAM.healthy_ante
		end

		G.GAME.NAMETEAM.voucher_this_ante = false
	end
	if context.card_added and context.cardarea == G.jokers then
		local jokers = GetJokers()
		local troub, minne, trouv = jokers["j_troubadour"], jokers["j_cbean_colon_minnesang"], jokers["j_cbean_colon_trouvere"]
		if troub and minne and trouv then
			troub:remove()
			minne:remove()
			trouv:remove()
			-- how to not copy paste, but keep in 3 lines so i look smart

			SMODS.add_card({ key = "j_cbean_colon_orchestra" })
		end
		--TODO: move this to a patch to get_blind_amount so it takes effect immediately instead of needing to enter a blind
	elseif context.first_hand_drawn then
		local count = G.GAME.BlindCurse or 0
		local folly = G.GAME.BlindFolly or 0
		local blind = G.GAME.blind
		if count > 0 then
			G.GAME.BlindCurse = G.GAME.BlindCurse - 1
			blind.mult = blind.mult + 0.5
		end
		blind.chips = get_blind_amount(G.GAME.round_resets.ante) * blind.mult * G.GAME.starting_params.ante_scaling + folly
		blind.chip_text = number_format(blind.chips)
	end
	--Jbilling it
	if context.end_of_round then
		--print((G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo"))
	end
	if context.end_of_round and context.game_over == false and context.main_eval and (G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo") then
		G.GAME.CEO_beaten_employment = true
		for k, v in pairs(G.playing_cards) do
			if v.ability.cbean_banished then
				v.ability.cbean_banished = nil
			end
		end
	end
	if G.SETTINGS.language == "en_us" then
		G.pizzazy = true
	else
		G.pizzazy = false
	end
	if context.open_booster and next(SMODS.find_card("j_cbean_jbill_leak")) then
		G.GAME.booster_leaked = false
		G.GAME.refund = context.card.cost
		G.GAME.real_choices = G.GAME.pack_choices
		G.GAME.pack_choices = 0
	end
	-- dunno this, but I'm needing this after
	local haspost = false
	local results = {}
	for i, cb in ipairs(on_calculate_cbs) do
		local result, post = cb(mod, context)
		if result then
			results[#results + 1] = result
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
			for _, v in ipairs({ "team", "idea", "art", "code" }) do
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

ColdBeansConfig = SMODS.current_mod.config
local cbeanConfigTab = function()
	cbean_nodes = {}
	config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} } } }
	cbean_nodes[#cbean_nodes + 1] = config
	cbean_nodes[#cbean_nodes + 1] = create_toggle({
		label = localize("cbean_disable_animations"),
		active_colour = HEX("40c76d"),
		ref_table = ColdBeansConfig,
		ref_value = "animations_disabled",
		callback = function()
		end
	})
	cbean_nodes[#cbean_nodes + 1] = create_toggle({
		label = localize("cbean_disable_copyright"),
		active_colour = HEX("40c76d"),
		ref_table = ColdBeansConfig,
		ref_value = "copyright_disabled",
		callback = function()
		end
	})
	return {
		n = G.UIT.ROOT,
		config = {
			emboss = 0.05,
			minh = 6,
			r = 0.1,
			minw = 10,
			align = "cm",
			padding = 0.2,
			colour = G.C.BLACK,
		},
		nodes = cbean_nodes,
	}
end

SMODS.current_mod.config_tab = cbeanConfigTab

SMODS.Atlas({
	key = "modicon",
	path = "7_Wgrop/Icon.png",
	px = 32,
	py = 32
})

SMODS.current_mod.reset_game_globals = function(run_start)
	if run_start then
		G.GAME.beaten_ceo_num = 0
		G.GAME.cbean_beaten_ceos = {}
		G.GAME.NAMETEAM.unique_consumables = {}
		G.PISSMAX = 1
		G.SECRET_BUTTON = localize('k_cbean_unique_ex')
	end

	G.GAME.current_round.gfs_card.rank = 'Ace'
	local valid_gfs_cards = {}
	for k, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_rank(v) then
			valid_gfs_cards[#valid_gfs_cards + 1] = v
		end
	end
	if valid_gfs_cards[1] then
		local gfs_card = pseudorandom_element(valid_gfs_cards, pseudoseed('gfs' .. G.GAME.round_resets.ante))
		G.GAME.current_round.gfs_card.rank = gfs_card.base.value
		G.GAME.current_round.gfs_card.id = gfs_card.base.id
	end
	for k, v in pairs(SMDOS.ConsumableTypes) do
			if G.P_CENTER_POOLS[k] then
				for _, _card in pairs(G.P_CENTER_POOLS[k]) do
					if _card and _card.config.max_highlighted and _card.cbean_shrunk_by_violet then
						_card.cbean_shrunk_by_violet = nil
						_card.config.max_highlighted = _card.config.max_highlighted / 2
					elseif
						_card
						and _card.config
						and _card.config.extra
						and type(_card.config.extra) == "table"
						and _card.config.extra.max_highlighted
						and _card.cbean_shrunk_by_violet
					then
						_card.cbean_shrunk_by_violet = nil
						_card.config.extra.max_highlighted = _card.config.extra.max_highlighted / 2
					end
				end
			end
	end
	if not G.cbean_has_seen_blind_headsup_this_session
		and not G.PROFILES[G.SETTINGS.profile].cbean_has_seen_blind_headsup then
		G.FUNCS.run_cbean_blind_menu()
	end
end


--Copyright UI Heads up
--Lets the player immediatly disable copyrighted materials at the very start

G.FUNCS.run_cbean_copyright_menu = function()
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu {
		definition = create_cbean_copyright_menu()
	}
end

function create_cbean_copyright_menu()
	local dontshowagain = create_toggle({
		label = localize("cbean_dontshowagain"),
		active_colour = HEX("40c76d"),
		ref_table = G,
		ref_value = "cbean_did_player_no_show_again",
		callback = function()
		end,
	})

	local t = create_UIBox_generic_options({
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0.1 },
				nodes = {
					{
						n = G.UIT.T,
						config = {
							align = "tm",
							text = "Cold Beans",
							colour = G.C.UI.TEXT_LIGHT,
							scale = 1
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = { align = "cm", minw = 7, minh = 5, colour = G.C.BLACK, emboss = 0.05, r = 0.1 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_1"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.5 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_2"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_3a"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_3b"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_4a"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_4b"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_5"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_copyright_headsup_6"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					dontshowagain
				}
			}
		},
		back_label = localize("b_continue"),
		back_func = "exit_cbean_copyright_overlay_menu"
	})
	return t
end

G.FUNCS.exit_cbean_copyright_overlay_menu = function()
	if not G.OVERLAY_MENU then return end

	G.CONTROLLER.locks.frame_set = true
	G.CONTROLLER.locks.frame = true
	G.CONTROLLER:mod_cursor_context_layer(-1000)
	G.OVERLAY_MENU:remove()
	G.OVERLAY_MENU = nil
	G.VIEWING_DECK = nil
	G.SETTINGS.paused = false

	G:save_settings()

	G.cbean_has_seen_copyright_headsup_this_session = true
	G.PROFILES[G.SETTINGS.profile].cbean_has_seen_copyright_headsup = G.cbean_did_player_no_show_again
	G:save_settings()
end

local main_menu_ref = Game.main_menu
Game.main_menu = function(change_context)
	local ret = main_menu_ref(change_context)

	if not G.cbean_has_seen_copyright_headsup_this_session
		and not G.PROFILES[G.SETTINGS.profile].cbean_has_seen_copyright_headsup then
		G.FUNCS.run_cbean_copyright_menu()
	end

	return ret
end

--Street Explanation UI
--Explains the basic mechanics of the street on first entry

G.FUNCS.run_cbean_street_menu = function()
	G.SETTINGS.paused = true
	G.FUNCS.overlay_menu {
		definition = create_cbean_street_menu()
	}
end

function create_cbean_street_menu()
	local dontshowagainstreet = create_toggle({
		label = localize("cbean_dontshowagain"),
		active_colour = HEX("40c76d"),
		ref_table = G,
		ref_value = "cbean_did_player_no_show_again_street",
		callback = function()
		end,
	})

	local other_t = create_UIBox_generic_options({
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0.1 },
				nodes = {
					{
						n = G.UIT.T,
						config = {
							align = "tm",
							text = "Cold Beans",
							colour = G.C.UI.TEXT_LIGHT,
							scale = 1
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = { align = "cm", minw = 7, minh = 6, colour = G.C.BLACK, emboss = 0.05, r = 0.1 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_1a"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.7
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_1b"),
											colour = G.C.FILTER,
											scale = 0.7
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.5 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_2a"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_2b"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_3"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.3 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_4"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_5a"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_5b"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_6a"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_6b"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.3 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_7"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_street_headsup_8"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					dontshowagainstreet
				}
			}
		},
		back_label = localize("b_continue"),
		back_func = "exit_cbean_street_overlay_menu"
	})
	return other_t
end

G.FUNCS.exit_cbean_street_overlay_menu = function()
	if not G.OVERLAY_MENU then return end

	G.CONTROLLER.locks.frame_set = true
	G.CONTROLLER.locks.frame = true
	G.CONTROLLER:mod_cursor_context_layer(-1000)
	G.OVERLAY_MENU:remove()
	G.OVERLAY_MENU = nil
	G.VIEWING_DECK = nil
	G.SETTINGS.paused = false

	G:save_settings()

	G.cbean_has_seen_street_headsup_this_session = true
	G.PROFILES[G.SETTINGS.profile].cbean_has_seen_street_headsup = G.cbean_did_player_no_show_again_street
	G:save_settings()
end

--The call function for the street UI is directly attached to the show street function. Look for it in the medal UI file

--Blind Explanation UI
--Explains the basic mechanics of the teeny/ceo blinds and biomes on first entry

G.FUNCS.run_cbean_blind_menu = function() --I am not pausing as it has a visual glitch with the blinds
	--G.SETTINGS.paused = true
	G.FUNCS.overlay_menu {
		definition = create_cbean_blind_menu()
	}
end

function create_cbean_blind_menu()
	local dontshowagainblind = create_toggle({
		label = localize("cbean_dontshowagain"),
		active_colour = HEX("40c76d"),
		ref_table = G,
		ref_value = "cbean_did_player_no_show_again_blind",
		callback = function()
		end,
	})

	local other_t = create_UIBox_generic_options({
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0.1 },
				nodes = {
					{
						n = G.UIT.T,
						config = {
							align = "tm",
							text = "Cold Beans",
							colour = G.C.UI.TEXT_LIGHT,
							scale = 1
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = { align = "cm", minw = 7, minh = 7, colour = G.C.BLACK, emboss = 0.05, r = 0.1 },
				nodes = {
					{
						n = G.UIT.C,
						config = { align = "cm" },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_1a"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.7
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("b_blinds"),
											colour = G.C.FILTER,
											scale = 0.7
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_1b"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.7
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_biomes"),
											colour = G.C.FILTER,
											scale = 0.7
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.5 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_2a"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("k_ante"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_2b"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},

								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_teeny_blinds"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_3"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_ceo_blinds"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									},

								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.3 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_teeny_blinds"),
											colour = G.C.FILTER,
											scale = 0.4
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_4"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.4
										}
									},
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_5"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.4
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.3 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_ceo_blinds"),
											colour = G.C.FILTER,
											scale = 0.4
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_6"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.4
										}
									},
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_7"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.4
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.5 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_biomes"),
											colour = G.C.FILTER,
											scale = 0.5
										}
									},
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_8"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									},
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_9"),
											colour = G.C.UI.TEXT_LIGHT,
											scale = 0.5
										}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.B,
										config = { align = "cm", w = 1, h = 0.1 },
										nodes = {}
									}
								}
							},
							{
								n = G.UIT.R,
								config = { align = "cm" },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											align = "cm",
											text = localize("cbean_blind_headsup_10"),
											colour = G.C.GREY,
											scale = 0.4
										}
									}
								}
							},
						}
					}
				}
			},
			{
				n = G.UIT.R,
				config = { align = "cm" },
				nodes = {
					dontshowagainblind
				}
			}
		},
		back_label = localize("b_continue"),
		back_func = "exit_cbean_blind_overlay_menu"
	})
	return other_t
end

G.FUNCS.exit_cbean_blind_overlay_menu = function()
	if not G.OVERLAY_MENU then return end

	G.CONTROLLER.locks.frame_set = true
	G.CONTROLLER.locks.frame = true
	G.CONTROLLER:mod_cursor_context_layer(-1000)
	G.OVERLAY_MENU:remove()
	G.OVERLAY_MENU = nil
	G.VIEWING_DECK = nil
	--G.SETTINGS.paused = false

	G:save_settings()

	G.cbean_has_seen_blind_headsup_this_session = true
	G.PROFILES[G.SETTINGS.profile].cbean_has_seen_blind_headsup = G.cbean_did_player_no_show_again_blind
	G:save_settings()
end





--[[
local main_menu_plant_check = Game.main_menu
function Game:main_menu(change_context)
	local plant_check = main_menu_plant_check(self, change_context)
	local plant_count = 0
	for k, v in pairs(G.P_CENTERS) do
		if v.atlas == 'cbean_NAMETEAM_PlantPlaceholder' then
			local name = localize { type = 'name_text', set = "Joker", key = v.key }
			plant_count = plant_count + 1
			print(name)
		end
	end
	print("Plants missing art: " .. plant_count)

	return plant_check
end
]]

-- replacing
SMODS.current_mod.menu_cards = function()
	return {
		{ key = 'j_cbean_coldbean' },
		remove_original = true,
		func = function()
			for k, v in pairs(G.title_top.cards) do
				if v.config.center.key == "j_cbean_coldbean" then
					v.edition = { cbean_sd_frozen = true } -- <- crashes with mods like Hyperfixation otherwise
				end
			end
		end
	}
end



-- Thanks, Hot Potato! (gosh we really have used a lot of its code, huh)

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = localize("b_cbean_credits"),
            tab_definition_function = G.FUNCS.cbean_create_credits_thingy
        },

    }
end


function G.FUNCS.cbean_create_credits_thingy(e)
	local uibox = ColdBeans.make_me_a_credits_page_please(1)
	local options = {}
	for i, team in ipairs(G.localization.cbean_credits) do
		options[#options + 1] = localize("cbean_credits_team") .. " " .. i .. " - " .. team.name
	end
	options[#options + 1] = "the goo"

	SMODS.LAST_SELECTED_MOD_TAB = nil
	local t = {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{
				n = G.UIT.C,
				config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", padding = 0.2 },
						nodes = {
							{
								n = G.UIT.O,
								config = {
									object = DynaText({
										string = localize("cbean_credits_title"),
										float = true,
										pop_in = 0,
										pop_in_rate = 4,
										silent = true,
										shadow = true,
										scale = 1,
										rotate = true,
										colours = { G.C.EDITION },
									}),
								},
							},
						},
					},
					{
						n = G.UIT.R,
						config = { align = "cm", minh = 6 },
						nodes = {
							uibox,
						},
					},
					{
						n = G.UIT.R,
						config = {
							align = "cm",
						},
						nodes = {
							create_option_cycle({
								options = options,
								w = 9,
								scale = 0.75,
								cycle_shoulders = true,
								opt_callback = "regenerate_cbean_credits_thingy",
								current_option = 1,
								colour = G.ACTIVE_MOD_UI
										and (G.ACTIVE_MOD_UI.ui_config or {}).collection_option_cycle_colour
									or G.C.RED,
								focus_args = { snap_to = true, nav = "wide" },
							}),
						},
					},
				},
			},
		},
	}
	return t
end

function G.FUNCS.regenerate_cbean_credits_thingy(e)
	if not e then return end
	if not e.cycle_config then return end
	local page = G.OVERLAY_MENU:get_UIE_by_ID("cbean_credits_page")
	if page then
		page:remove()
		local uibox = ColdBeans.make_me_a_credits_page_please(e.cycle_config.current_option)
		page.UIBox:add_child(uibox, page)
		page.UIBox:recalculate()
	end
end

local atlases = {
	{ name = "JBillLogo", px = 114, py = 34 },
	{ name = "WGropLogo", px = 104, py = 40 },
	{ name = "NTeamLogo", px = 60, py = 42 },
	{ name = "YMArtistsLogo", px = 79, py = 53 },
	{ name = "PBoysLogo", px = 67, py = 51 },
	{ name = "ZDOTCVacLogo", px = 109, py = 34 },
	{ name = "SDownLogo", px = 106, py = 54 },
	{ name = "CParenLogo", px = 104, py = 42 }
}
for _, atlas in ipairs(atlases) do
	SMODS.Atlas {
		key = atlas.name,
		path = "General/" .. atlas.name .. ".png",
		px = atlas.px,
		py = atlas.py
	}
end

SMODS.Atlas {
	key = "goo",
	path = "General/goo.png",
	px = 121,
	py = 75
}

local localize_table = function(table_thing, args, config)
	local t = {}
	if table_thing then
		for _, line in ipairs(table_thing) do
			local localised = SMODS.localize_box(type(line) == "string" and loc_parse_string(line) or line, args)
			table.insert(t, {
				n = G.UIT.R,
				config = { align = args.align, minh = args.minh },
				nodes = localised,
			})
		end
	end
	return { n = G.UIT.C, config = config, nodes = t }
end

ColdBeans.make_me_a_credits_page_please = function(team)
	if team == 9 then
		local goo_atlas = "cbean_goo"
		local goo_sprite = Sprite(0, 0, 4 * (G.ASSET_ATLAS[goo_atlas].px / G.ASSET_ATLAS[goo_atlas].py), 4, G.ASSET_ATLAS[goo_atlas], { x = 0, y = 0 })
		goo_sprite.states.drag.can = false
  		goo_sprite.states.hover.can = false
  		goo_sprite.states.collide.can = false
		return {
			n = G.UIT.C,
			config = { minw = 8, colour = G.C.CLEAR, align = "cm", id = "cbean_credits_page" },
			nodes = {
				{ n = G.UIT.R, config = { align = "tm", padding = 0.1 }, nodes = { { n = G.UIT.O, config = { object = goo_sprite, align = "cm" } } } }
			}
		}
	end
	local columns = 3
	local t = {}

	local team_atlas = "cbean_"..G.localization.cbean_credits[team or 1].atlas
	local team_sprite = Sprite(0, 0, 2 * (G.ASSET_ATLAS[team_atlas].px / G.ASSET_ATLAS[team_atlas].py), 2, G.ASSET_ATLAS[team_atlas], { x = 0, y = 0 })
	team_sprite.states.drag.can = false
  	team_sprite.states.hover.can = false
  	team_sprite.states.collide.can = false
	t[#t + 1] = { n = G.UIT.R, config = { align = "tm", padding = 0.1 }, nodes = { { n = G.UIT.O, config = { object = team_sprite, align = "tm" } } } }

	local team_guys = G.localization.cbean_credits[team or 1].members
	-- Don't look ;u; this loop logic works for teams of 6 and 7
	for i = 0, 1 do
		local guys = {}
		for j = 1, columns + i do
			local guy = team_guys[(i * columns) + j]
			if guy then
				guys[#guys + 1] = {
					n = G.UIT.C,
					config = { align = "cm", padding = 0.15 },
					nodes = {
						{
							n = G.UIT.R,
							config = { align = "cm" },
							nodes = { localize_table({ "{E:2,C:white}" .. guy .. "{}" }, { default_col = G.C.UI.TEXT_LIGHT, align = "cm", scale = 1.2 }) }
						}
					}
				}
			else
				break
			end
		end

		local guys_row = {
			n = G.UIT.R,
			config = { align = "cm", id = "team_member_row_" .. i },
			nodes = guys
		}

		t[#t + 1] = guys_row
	end

	local team_desc = G.localization.cbean_credits[team or 1].description
	local loc = localize_table(team_desc, { default_col = G.C.UI.TEXT_LIGHT, align = "cm", scale = 1 })
	t[#t + 1] = {
		n = G.UIT.R,
		config = { align = "cm", padding = 0.2 },
		nodes = { loc }
	}

	return {
		n = G.UIT.C,
		config = { minw = 8, colour = G.C.CLEAR, align = "cm", id = "cbean_credits_page" },
		nodes = t
	}
end
