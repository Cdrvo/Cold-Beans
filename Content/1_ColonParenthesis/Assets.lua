-- Joker Atlas(es?)
SMODS.Atlas({
	key = "colon_JokerAtlas",
	path = "1_ColonParenthesis/Jokers.png",
	px = 71,
	py = 95,
})

-- Blind Atlases
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

SMODS.Atlas({
	key = "colon_CEshOwdown",
	atlas_table = "ANIMATION_ATLAS",
	path = "1_ColonParenthesis/CEOShowdown.png",
	px = 34,
	py = 34,
	frames = 21,
})

SMODS.Atlas({
	key = "colon_Architecture",
	path = "1_ColonParenthesis/Architecture.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "colon_Boosters",
	path = "1_ColonParenthesis/Boosters.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "colon_Tags",
	path = "1_ColonParenthesis/Tags.png",
    px = 34,
    py = 34
})


SMODS.Atlas({
	key = "colon_WingsOfACEO",
	path = "1_ColonParenthesis/WingsOfACEO.png",
    px = 48,
    py = 48,
	inject = function (...)
		local value = SMODS.Atlas.inject(...);
		G.cbean_colon_shared_WINGS = Sprite(0, 0, G.CARD_W, G.CARD_H, G.ASSET_ATLAS["cbean_colon_WingsOfACEO"], { x = 0, y = 0 })
		return value
	end
})


-- Sounds also yes this is same file fuck you

SMODS.Sound ({
	volume = 1.2,
    pitch = 0.71805851185,
	key = "teeny_music",
	path = "1_ColonParenthesis/teeny.ogg",
	select_music_track = function(self)
		return (G.GAME.blind and G.GAME.blind.config.blind.colonparen_blindtype == "Teeny") and 15 or nil
	end
})

SMODS.Sound ({
	volume = 1.2,
    pitch = 0.71805851185,
	key = "ceo_music",
	path = "1_ColonParenthesis/ceo.ogg",
	select_music_track = function(self)
		return (G.GAME.blind and G.GAME.blind.config.blind.colonparen_blindtype == "CEO") and 16 or nil
	end
})

SMODS.Sound {
	key = "zodiac_music",
	path = "1_ColonParenthesis/chinesefixed.ogg",
}

SMODS.Sound {
	key = "low_greekMusic",
	path = "1_ColonParenthesis/lowercasegreek.ogg"
}
SMODS.Sound {
	key = "upper_greekMusic",
	path = "1_ColonParenthesis/uppercasegreek.ogg"
}

-- fonts because fuck you again

SMODS.Font {
	key = 'ewfontassetthing',
	path = 'enchantfiont.ttf',
	render_scale = 200,             -- Base size in pixels (default: 200)
	TEXT_HEIGHT_SCALE = 0.83,       -- Line spacing (default: 0.83)
	TEXT_OFFSET = { x = 0, y = 0 }, -- Alignment tweak (default: {0,0})
	FONTSCALE = 0.1,           	    -- Scale multiplier (default: 0.1)
	squish = 1,                 	-- Horizontal stretch (default: 1)
	DESCSCALE = 1               	-- Description scale (default: 1)
}

-- object types because fuck you again again

SMODS.ConsumableType({
    key = "colon_Architecture",
    primary_colour = HEX('a6b48b'),
    secondary_colour = HEX('e8dfc4'),
    text_colour = HEX('4f6367'), --0chill here. Making the text black for readabiity
    collection_rows = { 4, 4 },
    shop_rate = 0,
    default = "c_cbean_colon_stylobate"
})