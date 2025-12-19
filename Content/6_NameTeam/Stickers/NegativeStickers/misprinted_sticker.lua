local misprint_gradient = SMODS.Gradient({
	key = "misprint_gradient",
	colours = {
		G.C.BLACK,
		G.C.RED,
		G.C.GREEN,
		G.C.DYN_UI.BOSS_PALE,
		G.C.ORANGE,
		G.C.PURPLE,
		G.C.DYN_UI.BOSS_DARK,
		G.C.WHITE,
		G.C.BLUE,
		G.C.YELLOW,
		G.C.ETERNAL,
	},
	cycle = 2,
})

SMODS.Sticker({
	key = "misprinted",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 6,
		y = 1,
	},
	badge_colour = misprint_gradient,
	config = { copied = nil },
	rate = 0.06,
	needs_enable_flag = true,
	sticker_type = "Negative",
	sets = {
		Default = true,
		Enhanced = true,
		Joker = true,
		Consumable = true,
		Deck = true,
	},
	loc_vars = function(self, info_queue, card)
		local text = "None"
		if self.config.copied then
			text = localize(self.config.copied, "labels")
		end
		return {
			vars = { text },
		}
	end,
	calculate = function(self, card, context)
		if self.config.copied then
		end
	end,
	NAMETEAM_applied = function (self, card)
        
    end,
    NAMETEAM_removed = function (self, card)
        
    end,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "GhostSalt",
	},
})
