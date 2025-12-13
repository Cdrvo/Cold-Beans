SMODS.Sticker({
	key = "frowning",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 3,
		y = 0,
	},
	badge_colour = HEX("a84024"),
	config = {},
	rate = 0.04,
	needs_enable_flag = true,
    sets = {
        Default = true,
        Enhanced = true,
    },
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
	calculate = function(self,card,context)
       if context.before then
        local face_found = false
        for k, v in ipairs(G.play.cards) do
				if v:is_face() then
					face_found = true
				end
				return {
					message = localize("k_debuffed"),
				}
			end
        if face_found then SMODS.debuff_card(card, true, self.key) end
       end
    end
})