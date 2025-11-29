

SMODS.Enhancement {
    key = 'pboys_piss',
    pos = { x = 0, y = 0 },
    atlas = "pboys_enchantment_atlas",
	config = { extra = { count_chips = 4 } },
    loc_vars = function(self, info_queue, card)
		local piss_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_cbean_pboys_piss') then piss_tally = piss_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.count_chips, (card.ability.extra.count_chips + (G.GAME.PISS_COUND_ADD or 0)) * (piss_tally + (G.GAME.PISS_CHIPS_MULT or 0)) + (G.GAME.PISS_CHIPS_ADD or 0) } }
    end,
    beans_credits = {
        team = "Pissboys",
        idea = "Gfsgfs",
        art = "Gfsgfs",
        code = "Nrio_Modder",
    },
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local ret = {}
			local piss_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_cbean_pboys_piss') then piss_tally = piss_tally + 1 end
				end
			end
            ret.chips = (card.ability.extra.count_chips + (G.GAME.PISS_COUND_ADD or 0)) * (piss_tally + (G.GAME.PISS_CHIPS_MULT or 0)) + (G.GAME.PISS_CHIPS_ADD or 0)
			return ret
        end
    end
}