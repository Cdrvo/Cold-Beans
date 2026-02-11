SMODS.Joker { 
    key = "0chill_permafrost", 
    atlas = "0chill_joker_atlas",
    pos = { x = 3, y = 2},
    rarity = 1,
    blueprint_compat = true,
    cost = 3,
    loc_vars = function(self, info_queue, card)
        if not (card.edition and card.edition.cbean_sd_frozen) then
            info_queue[#info_queue+1] = G.P_CENTERS.e_cbean_sd_frozen
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "Inspector_B",
        art =  "MarioFan597",
        code = "Inspector_B",
    }
}