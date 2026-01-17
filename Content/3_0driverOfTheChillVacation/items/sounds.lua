SMODS.Sound{
    key = "0chill_thorn_ring_equip",
    path = "3_0driverOfTheChillVacation/thorn_ring_equip.ogg"
}

SMODS.Sound{
    key = "0chill_thorn_ring_sell",
    path = "3_0driverOfTheChillVacation/thorn_ring_sell.ogg"
}

SMODS.Sound{
    key = "0chill_asgore",
    path = "3_0driverOfTheChillVacation/asgore.ogg"
}
SMODS.Sound{
    key = "0chill_chum_infect",
    path = "3_0driverOfTheChillVacation/chum.ogg"
}

SMODS.Sound{
    key = "0chill_ominous",
    path = "3_0driverOfTheChillVacation/snd_ominous.ogg"
}

SMODS.Sound{
    key = "0chill_snowgrave",
    path = "3_0driverOfTheChillVacation/snd_snowgrave.ogg"
}

--Music by Cmykl
SMODS.Sound ({
    volume = 1,
    pitch = 1,
    key = "music_combo_pack",
    path = "3_0driverOfTheChillVacation/music_combo_pack.ogg",
    select_music_track = function(self)
        return (G.booster_pack
                    and not G.booster_pack.REMOVED
                    and SMODS.OPENED_BOOSTER
                    and SMODS.OPENED_BOOSTER.config.center.kind == "0chill_combo") and 100
    end
})
