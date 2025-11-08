SMODS.Atlas({
	key = "colon_CEOBlind",
	atlas_table = "ANIMATION_ATLAS",
	path = "1_ColonParenthesis/CEOBlind.png",
	px = 34,
	py = 34,
	frames = 21,
})

SMODS.Atlas({
	key = "colon_TeenyBlind",
	atlas_table = "ANIMATION_ATLAS",
	path = "1_ColonParenthesis/TeenyBlind.png",
	px = 34,
	py = 34,
	frames = 21,
})

SMODS.Atlas({
	key = "colon_LowercaseGreekBlind",
	atlas_table = "ANIMATION_ATLAS",
	path = "1_ColonParenthesis/LowercaseGreekBlind.png",
	px = 34,
	py = 34,
	frames = 21,
})

SMODS.Atlas({
	key = "colon_UppercaseGreekBlind",
	atlas_table = "ANIMATION_ATLAS",
	path = "1_ColonParenthesis/UppercaseGreekBlind.png",
	px = 34,
	py = 34,
	frames = 21,
})

-- Sounds also yes this is same file fuck you

SMODS.Sound {
	key = "TeenyMusic",
	path = "1_ColonParenthesis/teeny.ogg",
	select_music_track = function() return G.GAME.blind.config.blind.colonparen_blindtype == "Teeny" end
}

SMODS.Sound {
	key = "CeoMusic",
	path = "1_ColonParenthesis/ceo.ogg",
	select_music_track = function() return G.GAME.blind.config.blind.colonparen_blindtype == "CEO" end
}

SMODS.Sound {
	key = "low_greekMusic",
	path = "1_ColonParenthesis/lowercasegreek.ogg"
}
SMODS.Sound {
	key = "upper_greekMusic",
	path = "1_ColonParenthesis/uppercasegreek.ogg"
}