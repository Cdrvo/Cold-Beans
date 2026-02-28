G.STATES.STATIONERY = 102938475688888

SMODS.Font({
	key = "fancy",
	path = "corinthia.ttf",
})

G.FUNCS.nteam_can_exchange_stickers = function(e)
	local can_exchange = false
	if G.jokers and #G.jokers.highlighted == 1 then
		local target = G.jokers.highlighted[1]
		for _, key in ipairs(G.GAME.stationery_accepted) do
			if target.ability and target.ability[key] then
				can_exchange = true
			end
		end
	end
	if can_exchange then
		e.config.colour = G.C.FILTER
		e.config.button = "nteam_exchange_stickers"
	else
		e.config.colour = G.C.L_BLACK
		e.config.button = nil
	end
end

G.FUNCS.nteam_exchange_stickers = function(e)
	local target = G.jokers.highlighted[1]
	for _, key in ipairs(G.GAME.stationery_accepted) do
		if target.ability[key] then
			target:remove_sticker(key)
		end
	end
	G.E_MANAGER:add_event(Event({
		func = function()
			G.GAME.stationery_accepted = NAMETEAM.poll_stationery_accepted()
			G.GAME.stationery_rewards = NAMETEAM.poll_stationery_rewards()
			play_sound("coin2")
			play_sound("other1")
			local acc_container = G.stationery:get_UIE_by_ID("nteam_accepted")
			if acc_container then
				acc_container.config.object:remove()
				acc_container.config.object = UIBox({
					definition = G.UIDEF.nteam_accepted(),
					config = { type = "cm", parent = acc_container },
				})
				acc_container.config.object:recalculate()
			end
			local rew_container = G.stationery:get_UIE_by_ID("nteam_rewards")
			if rew_container then
				rew_container.config.object:remove()
				rew_container.config.object = UIBox({
					definition = G.UIDEF.nteam_rewards(),
					config = { type = "cm", parent = rew_container },
				})
				rew_container.config.object:recalculate()
			end
			SMODS.calculate_context({ nteam_exchange_stationery = true })
			G.stationery:recalculate()
			return true
		end,
	}))
	for _, r in ipairs(G.GAME.stationery_rewards) do
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.2,
			func = function()
				NAMETEAM.STATIONERY_REWARDS[r]:apply(target)
				return true
			end,
		}))
	end
end

G.FUNCS.nteam_can_reroll_stationery = function(e)
	if G.GAME.dollars >= G.GAME.stationery_reroll_cost then
		e.config.button = "nteam_reroll_stationery"
		e.config.colour = G.C.GREEN
	else
		e.config.button = nil
		e.config.colour = G.C.L_BLACK
	end
end

G.FUNCS.nteam_reroll_stationery = function(e)
	G.CONTROLLER.locks.reroll_stationery = true
	G.E_MANAGER:add_event(Event({
		func = function()
			ease_dollars(-G.GAME.stationery_reroll_cost, true)
			G.GAME.stationery_reroll_cost = G.GAME.stationery_reroll_cost + G.GAME.stationery_reroll_cost_scaling
			G.GAME.stationery_accepted = NAMETEAM.poll_stationery_accepted()
			G.GAME.stationery_rewards = NAMETEAM.poll_stationery_rewards()
			play_sound("coin2")
			play_sound("other1")
			local acc_container = G.stationery:get_UIE_by_ID("nteam_accepted")
			if acc_container then
				acc_container.config.object:remove()
				acc_container.config.object = UIBox({
					definition = G.UIDEF.nteam_accepted(),
					config = { type = "cm", parent = acc_container },
				})
				acc_container.config.object:recalculate()
			end
			local rew_container = G.stationery:get_UIE_by_ID("nteam_rewards")
			if rew_container then
				rew_container.config.object:remove()
				rew_container.config.object = UIBox({
					definition = G.UIDEF.nteam_rewards(),
					config = { type = "cm", parent = rew_container },
				})
				rew_container.config.object:recalculate()
			end
			SMODS.calculate_context({ nteam_reroll_stationery = true })
			G.stationery:recalculate()
			return true
		end,
	}))
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.3,
		func = function()
			G.CONTROLLER.locks.reroll_stationery = false
			return true
		end,
	}))
	G.E_MANAGER:add_event(Event({
		func = function()
			save_run()
			return true
		end,
	}))
end

NAMETEAM.TUTORIAL_STATE = 0

function G.UIDEF.nteam_scholar()
	local tutorial_positions = { 7, 8, 7, 9, 11, 10, 7, 8, 9, 9, 10 }

	local sprite =
		Sprite(0, 0, G.CARD_W * 1.5, G.CARD_H * 1.5, G.ASSET_ATLAS["cbean_NAMETEAM_Jokers"], { x = 7, y = 2 })
	sprite.states.collide.can = true
	sprite.states.drag.can = false
	sprite.config.speech_bubble_align = { align = "bm", offset = { x = 0, y = 0.1 }, parent = sprite }
	sprite.children.tutorial_text = not G.GAME.seen_stationery_tutorial
		and UIBox({
			definition = G.UIDEF.speech_bubble("cbean_nteam_tutorial_" .. NAMETEAM.TUTORIAL_STATE, { quip = true }),
			config = sprite.config.speech_bubble_align,
		})
		or nil
	function sprite:hover()
		Node.hover(self)
		if G.GAME.seen_stationery_tutorial and NAMETEAM.TUTORIAL_STATE == 0 then
			self.children.tutorial_text = UIBox({
				definition = G.UIDEF.speech_bubble("cbean_nteam_tutorial_" .. NAMETEAM.TUTORIAL_STATE, { quip = true }),
				config = self.config.speech_bubble_align,
			})
		end
		self:juice_up(0.05, 0.03)
		play_sound('paper1', math.random() * 0.2 + 0.9, 0.35)
	end

	function sprite:stop_hover()
		Node.stop_hover(self)
		if G.GAME.seen_stationery_tutorial and NAMETEAM.TUTORIAL_STATE == 0 and self.children.tutorial_text then
			self.children.tutorial_text:remove()
			self.children.tutorial_text = nil
		end
	end

	function sprite:say_stuff(n)
		if n <= 0 then return end
		local new_said = math.random(1, 11)
		while new_said == self.last_said do
			new_said = math.random(1, 11)
		end
		self.last_said = new_said
		play_sound('voice' .. new_said, math.random() * 0.3 + 1.2, 0.5)
		self:juice_up(0.1, 0.1)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			blockable = false,
			blocking = false,
			delay = 0.35,
			func = function()
				self:say_stuff(n - 1)
				return true
			end
		}))
	end

	function sprite:click()
		Node.click(self)
		NAMETEAM.TUTORIAL_STATE = (NAMETEAM.TUTORIAL_STATE + 1) % 11
		if NAMETEAM.TUTORIAL_STATE == 10 then
			G.GAME.seen_stationery_tutorial = true
		end
		if self.children.tutorial_text then
			self.children.tutorial_text:remove()
			self.children.tutorial_text = nil
		end
		self.children.tutorial_text = UIBox({
			definition = G.UIDEF.speech_bubble("cbean_nteam_tutorial_" .. NAMETEAM.TUTORIAL_STATE, { quip = true }),
			config = self.config.speech_bubble_align,
		})
		self:set_sprite_pos({ x = tutorial_positions[NAMETEAM.TUTORIAL_STATE + 1], y = 2 })
		self:say_stuff(3)
	end

	local t = {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{ n = G.UIT.O, config = { object = sprite } },
		},
	}
	return t
end

function G.UIDEF.nteam_accepted()
	local stickers_accepted = {}
	for _, key in ipairs(G.GAME.stationery_accepted) do
		stickers_accepted[#stickers_accepted + 1] = G.UIDEF.nteam_stationery_sticker(key)
	end
	return {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0.1 },
				nodes = stickers_accepted,
			},
		},
	}
end

function G.UIDEF.nteam_rewards()
	local rewards = {}
	for _, key in ipairs(G.GAME.stationery_rewards) do
		rewards[#rewards + 1] = NAMETEAM.STATIONERY_REWARDS[key]:generate_ui()
	end
	return {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{
				n = G.UIT.C,
				config = { align = "cm", padding = 0.1 },
				nodes = rewards,
			},
		},
	}
end

G.UIDEF.nteam_stationery = function()
	local stickers_accepted = {}
	for _, key in ipairs(G.GAME.stationery_accepted) do
		stickers_accepted[#stickers_accepted + 1] = G.UIDEF.nteam_stationery_sticker(key)
	end
	local rewards = {}
	for _, key in ipairs(G.GAME.stationery_rewards) do
		rewards[#rewards + 1] = NAMETEAM.STATIONERY_REWARDS[key]:generate_ui()
	end
	local t = {
		n = G.UIT.ROOT,
		config = {
			align = "cl",
			colour = G.C.CLEAR,
		},
		nodes = {
			UIBox_dyn_container({
				{
					n = G.UIT.R,
					config = { align = "cm", colour = G.C.DYN_UI.BOSS_MAIN, r = 0.1, padding = 0.1, emboss = 0.05 },
					nodes = {
						{
							n = G.UIT.C,
							config = { padding = 0.1, colour = G.C.L_BLACK, r = 0.1, minh = 10 },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{
											n = G.UIT.C,
											config = {},
											nodes = NAMETEAM.create_localized_rows(
												nil,
												"cbean_stationery_name",
												{ text_scale = 0.9 }
											),
										},
									},
								},
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{
											n = G.UIT.O,
											config = {
												object = UIBox({
													definition = G.UIDEF.nteam_scholar(),
													config = { align = "cm" },
												}),
											},
										},
									},
								},
							},
						},
						{
							n = G.UIT.C,
							config = { padding = 0.1, minh = 10 },
							nodes = {
								UIBox_button({
									func = "nteam_can_exchange_stickers",
									label = { localize("b_nteam_exchange") },
									minh = 1.5,
									scale = 0.6
								}),
								{
									n = G.UIT.R,
									config = {},
									nodes = {
										{
											n = G.UIT.B,
											config = { w = 0.1, h = 0.05 },
										},
									},
								},
								{
									n = G.UIT.R,
									config = { align = "cm", r = 0.1 },
									nodes = {
										{
											n = G.UIT.C,
											config = {
												--colour = G.C.GREEN,
												r = 0.1,
												align = "cm",
												shadow = true,
												minw = 2.7,
												minh = 1.5,
												func = "nteam_can_reroll_stationery",
												button = "nteam_reroll_stationery",
												hover = true,
											},
											nodes = {
												{
													n = G.UIT.R,
													config = { align = "cm" },
													nodes = {
														{
															n = G.UIT.T,
															config = {
																text = localize("k_reroll"),
																scale = 0.4,
																colour = G.C.UI.TEXT_LIGHT,
															},
														},
													},
												},
												{
													n = G.UIT.R,
													config = {},
													nodes = {
														{
															n = G.UIT.B,
															config = { w = 0.1, h = 0.05 },
														},
													},
												},
												{
													n = G.UIT.R,
													config = { align = "cm" },
													nodes = {
														{
															n = G.UIT.T,
															config = {
																text = localize("$"),
																scale = 0.7,
																colour = G.C.UI.TEXT_LIGHT,
															},
														},
														{
															n = G.UIT.T,
															config = {
																scale = 0.75,
																colour = G.C.UI.TEXT_LIGHT,
																ref_table = G.GAME,
																ref_value = "stationery_reroll_cost",
															},
														},
													},
												},
											},
										},
									},
								},
							},
						},
						{
							n = G.UIT.C,
							config = { padding = 0.1, colour = G.C.L_BLACK, r = 0.1, minh = 10 },
							nodes = {
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{
											n = G.UIT.C,
											config = {},
											nodes = NAMETEAM.create_localized_rows(
												nil,
												"cbean_stationery_accepts",
												{ text_scale = 1.2, minw = 5 }
											),
										},
									},
								},
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{
											n = G.UIT.O,
											config = {
												object = UIBox({
													definition = G.UIDEF.nteam_accepted(),
													config = { align = "cm" },
												}),
												id = "nteam_accepted",
											},
										},
									},
								},
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{
											n = G.UIT.C,
											config = {},
											nodes = NAMETEAM.create_localized_rows(
												nil,
												"cbean_stationery_gives",
												{ text_scale = 1.2, minw = 5 }
											),
										},
									},
								},
								{
									n = G.UIT.R,
									config = { align = "cm" },
									nodes = {
										{
											n = G.UIT.O,
											config = {
												object = UIBox({
													definition = G.UIDEF.nteam_rewards(),
													config = { align = "cm" },
												}),
												id = "nteam_rewards",
											},
										},
									},
								},
							},
						},
					},
				},
			}, false),
		},
	}
	return t
end

G.FUNCS.show_stationery = function(e)
YMA.start_shop_transition()
	stop_use()
	play_sound("button")
	hide_location(G.main_street)
	play_sound("cancel")
	G.STATE_COMPLETE = false
	G.STATE = G.STATES.STATIONERY
	SMODS.calculate_context { cbean_entered_stationery = true }
	--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
	local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
	ease_background_colour_blind(G.STATE)
	--sign_sprite.atlas = G.ANIMATION_ATLAS["cbean_NAMETEAM_stationery"]
	NAMETEAM.shop_sign("cbean_NAMETEAM_stationery")
	G.hand.states.visible = false
	--sign_sprite.states.visible = true
	sign_text = DynaText({
		string = { localize("ph_stationery") },
		colours = { G.C.GOLD, G.C.IMPORTANT },
		shadow = true,
		rotate = true,
		float = true,
		bump = true,
		scale = 0.5,
		spacing = 1,
		pop_in = 1.5,
		maxw = 4.3,
	})
	YMA.end_shop_transition()
end

G.FUNCS.hide_stationery = function(e)
	if true then
		YMA.start_shop_transition()
		stop_use()
		G.STATE = G.STATES.MAIN_STREET
		G.STATE_COMPLETE = false
		--local sign_sprite = G.SHOP_SIGN.UIRoot.children[1].children[1].children[1].config.object
		local sign_text = G.SHOP_SIGN.UIRoot.children[1].children[2].children[1].config.object
		ease_background_colour_blind(G.STATES.MAIN_STREET)
		--sign_sprite.atlas = G.ANIMATION_ATLAS["shop_sign"]
		NAMETEAM.shop_sign("cbean_NAMETEAM_street")
		--sign_sprite.states.visible = false
		sign_text = DynaText({
			string = { "" },
			colours = { lighten(G.C.BLACK, 0.3) },
			shadow = true,
			rotate = true,
			float = true,
			bump = true,
			scale = 0.5,
			spacing = 1,
			pop_in = 1.5,
			maxw = 4.3,
		})
		play_sound("button")
		show_location(G.main_street)
		play_sound("cancel")
		hide_location(G.stationery)
		G.stationery.alignment.offset.y = G.ROOM.T.y + 20

		YMA.end_shop_transition()
	end
end

function G.UIDEF.stationery_sprite()
	local sprite_stationery = G.ANIMATION_ATLAS
		and AnimatedSprite(
			0,
			0,
			(113 * 0.113) * 0.2,
			(57 * 0.113) * 0.2,
			G.ANIMATION_ATLAS[yma_can_access_location("stationery") and "cbean_NAMETEAM_stationery" or "cbean_NAMETEAM_closed"],
			{ x = 0, y = 0 }
		)
		or nil
	function sprite_stationery:update(dt)
		AnimatedSprite.update(self, dt)
		self.atlas =
			G.ANIMATION_ATLAS[yma_can_access_location("stationery") and "cbean_NAMETEAM_stationery" or "cbean_NAMETEAM_closed"]
	end

	local t = {
		n = G.UIT.ROOT,
		config = { align = "cm", colour = G.C.CLEAR },
		nodes = {
			{ n = G.UIT.O, config = { object = sprite_stationery } },
		},
	}
	return t
end

function update_stationery()
	if not G.STATE_COMPLETE then
		stop_use()
		ease_background_colour_blind(G.STATES.STATIONERY)
		G.stationery = G.stationery
			or UIBox({
				definition = G.UIDEF.nteam_stationery(),
				config = { align = "tmi", offset = { x = 0, y = G.ROOM.T.y + 20 }, major = G.hand, bond = "Weak" },
			})
		G.stationery:recalculate()
		G.E_MANAGER:add_event(Event({
			func = function()
				G.stationery.alignment.offset.y = -5.3
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.2,
					blockable = false,
					func = function()
						if math.abs(G.stationery.T.y - G.stationery.VT.y) < 3 then
							local nosave_stationery = nil
							-- Back to shop button
							G.CONTROLLER:snap_to({ node = G.stationery:get_UIE_by_ID("shop_button") })
							-- not loaded from save?
							if not nosave_stationery then
								G.E_MANAGER:add_event(Event({
									func = function()
										save_run()
										return true
									end,
								}))
							end
							return true
						end
						return false
					end,
				}))
				return true
			end,
		}))

		G.STATE_COMPLETE = true
	end
end
