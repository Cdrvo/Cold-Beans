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
    sticker_table:apply_to_deck(self, val)
end

function Back:nteam_remove_sticker(key)
	local sticker_table = SMODS.Stickers[key]
    if type(sticker_table.apply_to_deck) ~= "function" then
		return
	end
	sticker_table:apply_to_deck(self, false)
end

--[[
Lengthy note about deck stickers:
Unlike the apply function given by SMODS for regular stickers,
apply_to_deck is not automatically defined. This is to prevent
regular stickers from being added to decks. If you are making
a sticker that is intended to go on a deck, the function should
start as follows:
apply_to_deck = function(self, back, val)
    back.ability[self.key] = val
end

]]
