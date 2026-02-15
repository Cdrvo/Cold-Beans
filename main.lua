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

local function GetJokers()
	local jokers = {}
	for i, card in pairs(G.jokers.cards) do
		if card.config.center.key then
			jokers[card.config.center.key] = card
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
	if context.buying_card and context.card and context.card.config and context.card.config.center and context.card.config.center.set == "Voucher" then
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
			local acard                        = pseudorandom_element(context.scoring_hand, pseudoseed("grimyrosu"))
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

		if G.GAME.NAMETEAM.gold_rush and G.GAME.NAMETEAM.gold_rush > 0 then
			G.GAME.NAMETEAM.gold_rush = G.GAME.NAMETEAM.gold_rush - 1
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0,
				func = function()
					for k, v in pairs(G.play.cards) do
						v:set_seal("Gold")
						v:juice_up()
						v:set_ability("m_gold")
					end
					return true
				end
			}))
		end
	end

	if context.cbean_first then
		G.GAME.NAMETEAM.hands = G.GAME.hands
	end

	if context.after then
		G.GAME.cbean_combo_index = {}
		G.GAME.cbean_combo_unique_hand = {}
		G.GAME.cbean_combos_used_turn = 0
		if G.GAME.NAMETEAM.jal_triggered then
			G.GAME.NAMETEAM.jal_sold = G.GAME.NAMETEAM.jal_sold - 1
			G.GAME.NAMETEAM.jal_triggered = false
		end
		if G.GAME.NAMETEAM.first_hand_disable then
			G.GAME.NAMETEAM.first_hand_disable = false
			--idk what im doing
			G.GAME.blind.disabled = false
		end

		for k, v in pairs(G.jokers.cards) do
			if v.debuff and v.config.center.key == "j_cbean_jack_o_lantern" and v.ability.extra.hands_left <= 0 then
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
				if v.ability.cbean_lily_power and v.ability.cbean_lily_power > 0 then
					v.ability.cbean_lily_power = v.ability.cbean_lily_power - 1
					NAMETEAM.msg(v, "-1")
				elseif v.ability.cbean_lily_power then
					v.ability.cbean_lily_power = nil
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
			blind.mult = blind.mult + 0.5;
		end
		blind.chips = get_blind_amount(G.GAME.round_resets.ante) * blind.mult * G.GAME.starting_params.ante_scaling + folly
		blind.chip_text = number_format(blind.chips)
	end
	--Jbilling it
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
	local haspost = false;
	local results = {}
	for i, cb in ipairs(on_calculate_cbs) do
		local result, post = cb(mod, context)
		if result then
			results[#results + 1] = result;
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
		G.GAME.NAMETEAM.unique_consumables = {}
		G.PISSMAX = 1
		G.SECRET_BUTTON = localize('k_cbean_unique_ex')
	end

	G.GAME.current_round.gfs_card.rank = 'Ace'
	local valid_gfs_cards = {}
	for k, v in ipairs(G.playing_cards) do
		if not SMODS.has_no_rank(v) then
			valid_gfs_cards[#valid_gfs_cards+1] = v
		end
	end
	if valid_gfs_cards[1] then 
		local gfs_card = pseudorandom_element(valid_gfs_cards, pseudoseed('gfs'..G.GAME.round_resets.ante))
		G.GAME.current_round.gfs_card.rank = gfs_card.base.value
		G.GAME.current_round.gfs_card.id = gfs_card.base.id
	end
end




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
