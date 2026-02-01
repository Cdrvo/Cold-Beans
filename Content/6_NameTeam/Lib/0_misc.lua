SMODS.Atlas({
	key = "NAMETEAM_Stickers",
	path = "6_NameTeam/ColdBeansStickers.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_Stickers_boss",
	path = "6_NameTeam/ColdBeansBossStickers.png",
	px = 71,
	py = 95,
})
SMODS.Atlas({
	key = "NAMETEAM_stationery",
	px = 113,
	py = 57,
	path = "6_NameTeam/stationery.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 4,
})

SMODS.Atlas({
	key = "NAMETEAM_street",
	px = 113,
	py = 57,
	path = "6_NameTeam/ColdBeansStreet.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 4,
})

SMODS.Atlas({
	key = "NAMETEAM_closed",
	px = 113,
	py = 57,
	path = "6_NameTeam/stationery_closed.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 4,
})

SMODS.Atlas({
	key = "NAMETEAM_Jokers",
	path = "6_NameTeam/ColdBeansJokers.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_Jokers2",
	path = "6_NameTeam/ColdBeansJokers2.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_Jokers3",
	path = "6_NameTeam/ColdBeansJokers3.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_Markiplier",
	path = "6_NameTeam/ColdBeansMarkiplier.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_PlantJokers",
	path = "6_NameTeam/ColdBeansPlantJokers.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_PlantPlaceholder",
	path = "6_NameTeam/ColdBeansPlantPlaceholder.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "NAMETEAM_Vouchers",
	path = "6_NameTeam/ColdBeansVouchers.png",
	px = 71,
	py = 95,
})

SMODS.Atlas({
	key = "nteam_stakes",
	path = "6_NameTeam/ColdBeansStakes.png",
	px = 29,
	py = 29,
})

SMODS.ObjectType({
	key = "cbean_shadow"
})
SMODS.ObjectType({
	key = "cbean_pea"
})
SMODS.ObjectType({
	key = "cbean_electric"
})

SMODS.Sound({
  key = "adapaige_heal",
  path = "6_NameTeam/cbean_adapaige_heal.ogg"
})

SMODS.Sound({
  key = "edega_debuff",
  path = "6_NameTeam/cbean_edega_debuff.ogg"
})

SMODS.Sound({
  key = "greatest_plan",
  path = "6_NameTeam/cbean_greatest_plan.ogg"
})

SMODS.Sound({
	key = "wayne_death",
	path = "6_NameTeam/cbean_wayne_death.ogg",
})

SMODS.Sound({
	key = "nteam_music_silence",
	path = "6_NameTeam/cbean_silence.ogg",
	select_music_track = function(self)
		if NAMETEAM.secret_video:isPlaying() then
			return 123456789
		end
	end,
})

SMODS.Atlas({
	key = "nteam_blinds",
	path = "6_NameTeam/ColdBeansBlinds.png",
	atlas_table = "ANIMATION_ATLAS",
	px = 34,
	py = 34,
	frames = 21,
})

SMODS.Atlas({
	key = "nteam_sidequests",
	path = "6_NameTeam/ColdBeansNTSide.png",
	px = 65,
	py = 65,
})

SMODS.Atlas({
	key = "nteam_enh",
	path = "6_NameTeam/enhancements.png",
	px = 71,
	py = 95,
})