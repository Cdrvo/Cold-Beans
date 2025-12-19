SMODS.Sound({
  key = "flashcardreroll",
  path = "6_NameTeam/cbean_flashcard.ogg"
})

SMODS.Sticker({
	key = "flashcard",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 6,
		y = 3,
	},
	badge_colour = HEX("5fc79d"),
	config = {},
	rate = 0.06,
	needs_enable_flag = true,
    sets = {
        Joker = true
    },
	sticker_type = "Negative",
	loc_vars = function(self, info_queue, card)
	return {
		vars = {},
	}
	end,
	calculate = function(self,card,context)
        if context.reroll_shop then
			play_sound("cbean_flashcardreroll", 1, 0.2)
            NAMETEAM.replacecards(card)
        end
    end,
    beans_credits = {
        code = "Revo",
        art = "Doggfly",
        team = "Name Team"
    }
})
