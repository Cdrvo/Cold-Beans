-- note from glitchkat10: weights have been readjusted due to some kind of error; they are now the same as the arcana pack weights (may be adjusted if wanted), as they all used to be quadruple that of normal arcana packs

SMODS.Booster {
    key = "combo_booster_standard1",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "cmykl",
        art = "cmykl", 
        code = "Inspector_B"
    },
    group_key = "k_cbean_0chill_combopack",
    cost = 4,
    atlas = "0chill_combo_booster_atlas",
    weight = 1,
    pos = { x = 0, y = 0 },
    draw_hand = false,
    kind = "0chill_combo",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "Combo",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('E91E63'), special_colour = HEX("4f6367"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "combo_booster_standard2",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "cmykl",
        art = "cmykl", 
        code = "Inspector_B"
    },
    group_key = "k_cbean_0chill_combopack",
    cost = 4,
    atlas = "0chill_combo_booster_atlas",
    weight = 1,
    pos = { x = 1, y = 0 },
    draw_hand = false,
    kind = "0chill_combo",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "Combo",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('E91E63'), special_colour = HEX("4f6367"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "combo_booster_special1",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "cmykl",
        art = "cmykl", 
        code = "Inspector_B"
    },
    group_key = "k_cbean_0chill_combopack",
    cost = 4,
    atlas = "0chill_combo_booster_atlas",
    weight = 1,
    pos = { x = 2, y = 0 },
    draw_hand = false,
    kind = "0chill_combo",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "Combo",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('E91E63'), special_colour = HEX("4f6367"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "combo_booster_ultimate1",
    config = { extra = 9, choose = 3 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "cmykl",
        art = "cmykl", 
        code = "Inspector_B"
    },
    group_key = "k_cbean_0chill_combopack",
    cost = 4,
    atlas = "0chill_combo_booster_atlas",
    weight = 0.25,
    pos = { x = 3, y = 0 },
    draw_hand = false,
    kind = "0chill_combo",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "Combo",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('E91E63'), special_colour = HEX("4f6367"), contrast = 2 })
    end
}