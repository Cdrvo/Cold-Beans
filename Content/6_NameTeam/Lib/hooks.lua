local remove_old = Card.remove
function Card:remove()
    if self.added_to_deck or (self.area and (self.area == G.hand or self.area == G.deck)) then
        SMODS.calculate_context({
            cbean_destroyed = true,
            cbean_destroyed_card = self
        })
    end
    return remove_old(self)
end

local update_hook = G.update
function G:update(dt)
	update_hook(self, dt)
	if not G.GAME.nteam_sticker_obtained and G.jokers then
		for _, j in ipairs(G.jokers.cards) do
			for _, key in ipairs(SMODS.Sticker.obj_buffer) do
				if j.ability[key] then
					G.GAME.nteam_sticker_obtained = true
					break
				end
			end
		end
	end
end

local start_run_hook = G.start_run
function G:start_run(args)
	start_run_hook(self, args)
	---@type integer
	G.GAME.stationery_num_accepted = G.GAME.stationery_num_accepted or 2
	---@type string[]
	G.GAME.stationery_accepted = G.GAME.stationery_accepted
		or NAMETEAM.poll_stationery_accepted()
	---@type integer
	G.GAME.stationery_num_rewards = G.GAME.stationery_num_rewards or 1
	---@type string[]
	G.GAME.stationery_rewards = G.GAME.stationery_rewards
		or NAMETEAM.poll_stationery_rewards()
    -- initialize ability table where deck stickers are stored
	---@type string[]
    G.GAME.selected_back.ability = G.GAME.selected_back.ability or {}
	---@type integer
	G.GAME.round_resets.base_stationery_reroll_cost = G.GAME.round_resets.base_stationery_reroll_cost or 5
	---@type integer
	G.GAME.round_resets.free_stationery_rerolls = G.GAME.round_resets.free_stationery_rerolls or 0
	---@type integer
	G.GAME.stationery_reroll_cost = G.GAME.round_resets.base_stationery_reroll_cost or 5
	---@type integer
	G.GAME.stationery_reroll_cost_scaling = G.GAME.stationery_reroll_cost_scaling or 1
	---@type boolean
	G.GAME.seen_stationery_tutorial = G.GAME.seen_stationery_tutorial or false
	---@type boolean
	G.GAME.already_no_interest = G.GAME.already_no_interest or false
	---@type integer
	G.GAME.dangerous_mult = G.GAME.dangerous_mult or 1
end

local apply_hook = Back.apply_to_run
function Back:apply_to_run()
	apply_hook(self)
	if G.GAME.modifiers.no_interest then
		G.GAME.already_no_interest = true
	end
end

-- Following 2 hooks are for storing and saving the stickers to the deck
local save_deck_hook = Back.save
function Back:save()
    local ret = save_deck_hook(self)
    ret.ability = self.ability
    return ret
end

local load_deck_hook = Back.load
function Back:load(backTable)
    load_deck_hook(self, backTable)
    self.ability = backTable.ability
end

local function transparent_helper(t)
	t.config.colour = G.C.CLEAR
	t.config.outline_colour = G.C.CLEAR
	t.config.no_fill = true
	if t.nodes then
		for i, child in ipairs(t.nodes) do
			transparent_helper(child)
		end
	end
end

local popup_hook = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
	local ret = popup_hook(card)
	if G.deck and G.deck.cards[1] == card then
		transparent_helper(ret)
	end
	return ret
end

local get_popup_offset_hook = Card.align_h_popup
function Card:align_h_popup()
	local ret = get_popup_offset_hook(self)
	if G.deck and self == G.deck.cards[1] then
		local d_sticker_count = 0
		for k, _ in pairs(G.GAME.selected_back.ability) do
			if SMODS.Stickers[k] then
				d_sticker_count = d_sticker_count + 1
			end
		end
		local fac = 2.4 - math.max(0, d_sticker_count - 6) * 0.25
		ret.offset.y = ret.offset.y + fac
	end
	return ret
end

local apply_sticker_hook = Card.add_sticker
function Card:add_sticker(sticker, bypass_check)
	local already_had = self.ability[sticker]
	apply_sticker_hook(self, sticker, bypass_check)
	if not already_had and self.ability[sticker] then
		self:NAMETEAM_apply_sticker_calc(SMODS.Stickers[sticker])
	end
end

local remove_sticker_hook = Card.remove_sticker
function Card:remove_sticker(sticker)
	local already_had = self.ability[sticker]
	remove_sticker_hook(self, sticker)
	if already_had and not self.ability[sticker] then
		self:NAMETEAM_remove_sticker_calc(SMODS.Stickers[sticker])
	end
end

local old_set_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
	if self and self.ability and self.ability.set == "Default" then
		for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
			if not self.ability["cbean_barren"] then
				return old_set_ability(self, center, initial, delay_sprites)
			end
		end
	else
		return old_set_ability(self, center, initial, delay_sprites)
	end
end

local old_play_highlighted = G.FUNCS.play_cards_from_highlighted
function G.FUNCS.play_cards_from_highlighted(e)
	SMODS.calculate_context({cbean_first = true})
	old_play_highlighted(e)
end

local add_to_deck_old = Card.add_to_deck
function Card:add_to_deck(from_debuff)
	local ret = add_to_deck_old(self, from_debuff)
	if self and self.ability then
		for k, v in pairs(SMODS.Stickers) do
			if self.ability[k] then
				print(k ..  " is added to the deck")
				self:NAMETEAM_apply_sticker_calc(SMODS.Stickers[k])
			end
		end
	end
	return ret
end