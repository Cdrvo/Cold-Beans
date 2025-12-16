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
	-- G.GAME.stationery_num_accepted = G.GAME.stationery_num_accepted or 2
	-- G.GAME.stationery_accepted = G.GAME.stationery_accepted
	-- 	or NAMETEAM.get_unique_pseudorandom_elements(
	-- 		SMODS.Sticker.obj_buffer,
	-- 		G.GAME.stationery_num_accepted,
	-- 		"stationery_accepted" .. G.GAME.round_resets.ante
	-- 	)
	-- G.GAME.stationery_num_given = G.GAME.stationery_num_given or 1
	-- G.GAME.stationery_given = G.GAME.stationery_given
	-- 	or NAMETEAM.get_unique_pseudorandom_elements(
	-- 		SMODS.Sticker.obj_buffer,
	-- 		G.GAME.stationery_num_given,
	-- 		"stationery_given" .. G.GAME.round_resets.ante
	-- 	)
    -- initialize ability table where deck stickers are stored
    G.GAME.selected_back.ability = G.GAME.selected_back.ability or {}
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