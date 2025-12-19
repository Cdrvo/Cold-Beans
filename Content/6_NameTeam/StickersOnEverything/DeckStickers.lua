function Back:nteam_apply_sticker(key)
	---@type boolean | table
	local val = true
	local sticker_table = SMODS.Stickers[key]
	if not sticker_table or type(sticker_table.apply_to_deck) ~= "function" then
		return
	end
	if sticker_table.config and next(sticker_table.config) then
		val = {}
		for k, v in pairs(sticker_table.config) do
			if type(v) == "table" then
				val[k] = copy_table(v)
			else
				val[k] = v
			end
		end
	end
	local trigger_add = false
	if not G.GAME.selected_back.ability[key] then
		trigger_add = true
	end
	sticker_table:apply_to_deck(self, val)
	if trigger_add then
		if sticker_table.NAMETEAM_applied then sticker_table:NAMETEAM_applied(G.GAME.selected_back) end
		SMODS.calculate_context({sticker_applied = true, other_sticker = sticker_table, other_card = self})
	end
end

function Back:nteam_remove_sticker(key)
	local sticker_table = SMODS.Stickers[key]
	if type(sticker_table.apply_to_deck) ~= "function" then
		return
	end
	local trigger_remove = false
	if G.GAME.selected_back.ability[key] then
		trigger_remove = true
	end
	sticker_table:apply_to_deck(self, false)
	if trigger_remove then
		if sticker_table.NAMETEAM_removed then sticker_table:NAMETEAM_removed(G.GAME.selected_back) end
		SMODS.calculate_context({sticker_removed = true, other_sticker = sticker_table, other_card = self})
	end
end

--[[
Lengthy note about deck stickers:
Unlike the apply function given by SMODS for regular stickers,
apply_to_deck is not automatically defined. This is to prevent
regular stickers from being added to decks. If you are making
a sticker that is intended to go on a deck, the function should
start as follows:
apply_to_deck = function(self, back, val)
    NAMETEAM.simple_apply(self, back, val)
end
Optionally, you can add 2 functions to NAMETEAM.simple_apply.
The first function will trigger when the sticker is applied,
and the second function will trigger when sticker is removed.
]]
