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
		or {}
	---@type integer
	G.GAME.stationery_num_rewards = G.GAME.stationery_num_rewards or 1
	---@type string[]
	G.GAME.stationery_rewards = G.GAME.stationery_rewards
		or {}
    -- initialize ability table where deck stickers are stored
	---@type string[]
    G.GAME.selected_back.ability = G.GAME.selected_back.ability or {}

	if pseudorandom("deck_sticker") < 1 / 4 and G.GAME.modifiers.deck_stickers then
		local ae = NAMETEAM.poll_sticker(true, G.GAME.selected_back, true, "Deck")
		if ae then
			G.GAME.selected_back:nteam_apply_sticker(ae)
		end
	end
	---@type integer
	G.GAME.round_resets.stationery_reroll_cost = G.GAME.round_resets.stationery_reroll_cost or 5
	---@type integer
	G.GAME.round_resets.free_stationery_rerolls = G.GAME.round_resets.free_stationery_rerolls or 0
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