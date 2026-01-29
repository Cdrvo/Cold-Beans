---@type table<string, StationeryReward>
NAMETEAM.STATIONERY_REWARDS = {}
---@type string
NAMETEAM.STATIONERY_REWARDS_LIST = {}

---Returns the UI node for making this show up on screen at the stationery shop
---@param reward StationeryReward
---@param vars any[]
---@param bg_colour? table
---@return UINode
G.UIDEF.nteam_stationery_reward = function(reward, vars, bg_colour)
	return {
		n = G.UIT.R,
		config = { align = "cm" },
		nodes = {
			{
				n = G.UIT.C,
				config = {
					padding = 0.05,
					r = 0.1,
					colour = bg_colour or G.C.UI.BACKGROUND_DARK,
					emboss = 0.05,
					align = "cm",
				},
				nodes = NAMETEAM.create_localized_rows(nil, reward.key, { text_scale = 1.2, loc_vars = vars }),
			},
		},
	}
end

G.UIDEF.nteam_stationery_sticker = function(key)
	return {
		n = G.UIT.C,
		config = { padding = 0.05, r = 0.1, colour = SMODS.Stickers[key].badge_colour, align = "cm", emboss = 0.05 },
		nodes = {
			{
				n = G.UIT.R,
				config = { padding = 0.1, r = 0.1, colour = G.C.UI.BACKGROUND_WHITE, align = "cm" },
				nodes = {
					{
						n = G.UIT.T,
						config = {
							colour = SMODS.Stickers[key].badge_colour,
							scale = 0.32 * 0.9 * 1.6,
							detailed_tooltip = SMODS.Stickers[key],
							text = localize(key, "labels"),
						},
					},
				},
			},
		},
	}
end

---@class StationeryReward
---@field key string A unique identifier for this object.
---@field no_prefix_key string Is the same as `key` but without `"cbean_reward_"` prefixed to it.
---@field apply fun(self: StationeryReward, card: Card): nil Called whenever the reward is claimed from the Stationery Shop.
---@field loc_vars? fun(self: StationeryReward): any[]?  See [NAMETEAM.StationeryReward](lua://NAMETEAM.StationeryReward) for details.
---@field config? table Data that is stored to this reward.
---@field in_pool? fun(self: StationeryReward): boolean Whether or not this reward can be rolled.
---@field colour? table When the UI for this reward is generated, the background of the UI will be `colour`.
---@field generate_ui fun(self: StationeryReward): UINode Generates the UI for this reward. DO NOT override this, unless you know what you are doing.

---Adds a reward to the pool of rewards that the Stationery Shop can give.
---You must use a localization entry for this object: `loc_txt` is not supported.
---Format the localization entry for a StationeryReward as follows (inside `misc.dictionary`):
---```lua
---cbean_reward_myCoolKey = {
---    "Row 1",
---    "{C:attention}Supports text formatting!{}",
---}
---```
---Note that you should return an integer-indexed array of objects from `loc_vars`.
---#1#, #2#, etc. will be filled as usual from the values in the array returned from `loc_vars`
---The only non-integer index value that has an effect is `colours`, and sends
---custom colors to a localization entry. See https://github.com/Steamodded/smods/wiki/Text-Styling#variablecustom-background-colour-modifier-b
---for more details regarding using custom colors in localization entries.
---@param t StationeryReward
NAMETEAM.StationeryReward = function(t)
	local prefixed = "cbean_reward_" .. t.key
	NAMETEAM.STATIONERY_REWARDS[prefixed] = {
		key = prefixed,
		no_prefix_key = t.key,
		apply = t.apply,
		loc_vars = t.loc_vars or function(self) end,
		config = t.config,
		colour = t.colour,
		generate_ui = function(self)
			return G.UIDEF.nteam_stationery_reward(
				self,
				self:loc_vars(),
				self.colour
					or (self.config and self.config.sticker and SMODS.Stickers[self.config.sticker].badge_colour)
			)
		end,
		in_pool = t.in_pool or function(self)
			return true
		end,
	}
	NAMETEAM.STATIONERY_REWARDS_LIST[#NAMETEAM.STATIONERY_REWARDS_LIST + 1] = prefixed
end

---@return string[]
function NAMETEAM.poll_stationery_rewards()
	local ret = {}
	local pool = NAMETEAM.filter(NAMETEAM.STATIONERY_REWARDS_LIST, function(key)
		return NAMETEAM.STATIONERY_REWARDS[key]:in_pool()
	end)
	return NAMETEAM.get_unique_pseudorandom_elements(
		pool,
		G.GAME.stationery_num_rewards,
		"stationery_rewards" .. G.GAME.round_resets.ante
	)
end

---@return string[]
function NAMETEAM.poll_stationery_accepted()
	local ret = {}
	local pool = NAMETEAM.filter(SMODS.Sticker.obj_buffer, function(key)
		return (SMODS.Stickers[key].sets or {})["Joker"] == true and not string.find(key, "pinned")
	end)
	return NAMETEAM.get_unique_pseudorandom_elements(
		pool,
		G.GAME.stationery_num_accepted,
		"stationery_accepted" .. G.GAME.round_resets.ante
	)
end

ColdBeans.OnCalculate(function(mod, context)
	if context.starting_shop then
		G.GAME.stationery_reroll_cost = (G.GAME.round_resets.free_stationery_rerolls > 0) and 0
			or G.GAME.round_resets.base_stationery_reroll_cost
		G.GAME.stationery_accepted = NAMETEAM.poll_stationery_accepted()
		G.GAME.stationery_rewards = NAMETEAM.poll_stationery_rewards()
	end
end)

NAMETEAM.StationeryReward({
	key = "money",
	config = { money = 10 },
	colour = G.C.MONEY,
	apply = function(self, card)
		ease_dollars(self.config.money)
		SMODS.calculate_effect({
			message = localize("$") .. self.config.money,
			instant = true,
			colour = G.C.MONEY,
		}, card)
	end,
	loc_vars = function(self)
		return { self.config.money }
	end,
})

NAMETEAM.StationeryReward({
	key = "joker_edition",
	apply = function(self, card)
		if #G.jokers.cards < G.jokers.config.card_limit then
			SMODS.add_card({
				set = "Joker",
				edition = SMODS.poll_edition({ guaranteed = true, key = "stationery_reward_joker_edition" }),
			})
			SMODS.calculate_effect({
				message = localize("k_plus_joker"),
				instant = true,
			}, card)
		end
	end,
	in_pool = function(self)
		return #G.jokers.cards < G.jokers.config.card_limit
	end,
})

NAMETEAM.StationeryReward({
	key = "shield",
	config = { sticker = "cbean_shield" },
	apply = function(self, card)
		card:add_sticker(self.config.sticker, true)
		SMODS.calculate_effect({
			message = localize(self.config.sticker, "labels") .. "!",
			instant = true,
			colour = SMODS.Stickers[self.config.sticker].badge_colour,
		}, card)
	end,
	loc_vars = function(self)
		return { colours = { SMODS.Stickers[self.config.sticker].badge_colour } }
	end,
})

NAMETEAM.StationeryReward({
	key = "plasma",
	config = { sticker = "cbean_plasma" },
	apply = function(self, card)
		G.GAME.selected_back:nteam_apply_sticker(self.config.sticker)
		SMODS.calculate_effect({
			message = localize(self.config.sticker, "labels") .. "!",
			instant = true,
			colour = SMODS.Stickers[self.config.sticker].badge_colour,
		}, G.deck.cards[1] or G.deck)
	end,
	loc_vars = function(self)
		return { colours = { SMODS.Stickers[self.config.sticker].badge_colour } }
	end,
	in_pool = function(self)
		return G.GAME.selected_back.ability and not G.GAME.selected_back.ability[self.config.sticker]
	end,
})

NAMETEAM.StationeryReward({
	key = "black",
	config = { sticker = "cbean_black" },
	apply = function(self, card)
		G.GAME.selected_back:nteam_apply_sticker(self.config.sticker)
		SMODS.calculate_effect({
			message = localize(self.config.sticker, "labels") .. "!",
			instant = true,
			colour = SMODS.Stickers[self.config.sticker].badge_colour,
		}, G.deck.cards[1] or G.deck)
	end,
	loc_vars = function(self)
		return { colours = { SMODS.Stickers[self.config.sticker].badge_colour } }
	end,
	in_pool = function(self)
		return G.GAME.selected_back.ability and not G.GAME.selected_back.ability[self.config.sticker]
	end,
})

NAMETEAM.StationeryReward({
	key = "painted",
	config = { sticker = "cbean_painted" },
	apply = function(self, card)
		G.GAME.selected_back:nteam_apply_sticker(self.config.sticker)
		SMODS.calculate_effect({
			message = localize(self.config.sticker, "labels") .. "!",
			instant = true,
			colour = SMODS.Stickers[self.config.sticker].badge_colour,
		}, G.deck.cards[1] or G.deck)
	end,
	loc_vars = function(self)
		return { colours = { SMODS.Stickers[self.config.sticker].badge_colour } }
	end,
	in_pool = function(self)
		return G.GAME.selected_back.ability and not G.GAME.selected_back.ability[self.config.sticker]
	end,
})

NAMETEAM.StationeryReward({
	key = "house",
	config = { sticker = "cbean_painted" },
	apply = function(self, card)
		if #G.jokers.cards < G.jokers.config.card_limit then
			SMODS.add_card({
				key = "j_cbean_0chill_house_rules",
			})
			SMODS.calculate_effect({
				message = localize("k_plus_joker"),
				instant = true,
			}, card)
		end
	end,
	in_pool = function(self)
		return #G.jokers.cards < G.jokers.config.card_limit
	end,
})

NAMETEAM.StationeryReward({
	key = "sheets",
	config = { amount = 2 },
	loc_vars = function(self)
		return { self.config.amount }
	end,
	apply = function(self, card)
		for i = 1, self.config.amount do
			SMODS.add_card({
				set = "cbean_StickerSheet",
				edition = "e_negative",
			})
		end
		SMODS.calculate_effect({
			message = localize("k_plus_stickersheet"),
			instant = true,
		}, card)
	end,
})

NAMETEAM.StationeryReward({
	key = "blessings",
	config = { amount = 2 },
	loc_vars = function(self)
		return { self.config.amount }
	end,
	apply = function(self, card)
		for i = 1, self.config.amount do
			SMODS.add_card({
				set = "sdown_blessing",
				edition = "e_negative",
			})
		end
		SMODS.calculate_effect({
			message = localize("k_plus_blessing"),
			instant = true,
		}, card)
	end,
})

NAMETEAM.StationeryReward({
	key = "zodiacs",
	config = { amount = 2 },
	loc_vars = function(self)
		return { self.config.amount }
	end,
	apply = function(self, card)
		for i = 1, self.config.amount do
			SMODS.add_card({
				set = "sdown_czodiac",
				edition = "e_negative",
			})
		end
		SMODS.calculate_effect({
			message = localize("sdown_czodiac_add"),
			instant = true,
		}, card)
	end,
})

NAMETEAM.StationeryReward({
	key = "combos",
	config = { amount = 2 },
	loc_vars = function(self)
		return { self.config.amount }
	end,
	apply = function(self, card)
		for i = 1, self.config.amount do
			SMODS.add_card({
				set = "Combo",
				edition = "e_negative",
			})
		end
		SMODS.calculate_effect({
			message = localize("k_plus_combo_card"),
			instant = true,
		}, card)
	end,
})

NAMETEAM.StationeryReward({
	key = "keys",
	config = { amount = 2 },
	loc_vars = function(self)
		return { self.config.amount }
	end,
	apply = function(self, card)
		for i = 1, self.config.amount do
			SMODS.add_card({
				set = "yma_keys",
				edition = "e_negative",
			})
		end
		SMODS.calculate_effect({
			message = localize("k_plus_key"),
			instant = true,
		}, card)
	end,
})