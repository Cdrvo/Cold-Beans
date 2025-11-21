--TODO: haven't decided how much of each we want yet so just added two of each for now.

SMODS.Booster {
    key = "czodiac_normal1",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_czodiacpack",
    cost = 4,
    atlas = "sdown_other_atlas",
    weight = 1,
    pos = { x = 4, y = 0 },
    draw_hand = true,
    kind = "sdown_czodiac",
    create_card = function(self, card, i)
        return {
            set = "sdown_czodiac",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('BA000E'), special_colour = HEX("F1C100"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "czodiac_normal2",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_czodiacpack",
    cost = 4,
    atlas = "sdown_other_atlas",
    weight = 1,
    pos = { x = 4, y = 0 },
    draw_hand = true,
    kind = "sdown_czodiac",
    create_card = function(self, card, i)
        return {
            set = "sdown_czodiac",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('BA000E'), special_colour = HEX("F1C100"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "czodiac_jumbo1",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_czodiacpack",
    cost = 6,
    atlas = "sdown_other_atlas",
    weight = 1,
    pos = { x = 4, y = 0 },
    draw_hand = true,
    kind = "sdown_czodiac",
    create_card = function(self, card, i)
        return {
            set = "sdown_czodiac",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('BA000E'), special_colour = HEX("F1C100"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "czodiac_jumbo2",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_czodiacpack",
    cost = 6,
    atlas = "sdown_other_atlas",
    weight = 1,
    pos = { x = 4, y = 0 },
    draw_hand = true,
    kind = "sdown_czodiac",
    create_card = function(self, card, i)
        return {
            set = "sdown_czodiac",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('BA000E'), special_colour = HEX("F1C100"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "czodiac_mega1",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_czodiacpack",
    cost = 8,
    atlas = "sdown_other_atlas",
    weight = 0.75,
    pos = { x = 4, y = 0 },
    draw_hand = true,
    kind = "sdown_czodiac",
    create_card = function(self, card, i)
        return {
            set = "sdown_czodiac",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('BA000E'), special_colour = HEX("F1C100"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "czodiac_mega2",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA000E")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_czodiacpack",
    cost = 8,
    atlas = "sdown_other_atlas",
    weight = 0.75,
    pos = { x = 4, y = 0 },
    draw_hand = true,
    kind = "sdown_czodiac",
    create_card = function(self, card, i)
        return {
            set = "sdown_czodiac",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("BA000E"))
        ease_background_colour({ new_colour = HEX('BA000E'), special_colour = HEX("F1C100"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "blessing_normal1",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA6900")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "kars",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_blessingpack",
    cost = 4,
    atlas = "blessingpack_atlas",
    weight = 1,
    pos = { x = 0, y = 0 },
    draw_hand = true,
    kind = "sdown_blessing",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "sdown_blessing",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("A04040"))
        ease_background_colour({ new_colour = HEX('A04040'), special_colour = HEX("E4AD76"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "blessing_normal2",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA6900")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "kars",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_blessingpack",
    cost = 4,
    atlas = "blessingpack_atlas",
    weight = 1,
    pos = { x = 1, y = 0 },
    draw_hand = true,
    kind = "sdown_blessing",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "sdown_blessing",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("A04040"))
        ease_background_colour({ new_colour = HEX('A04040'), special_colour = HEX("E4AD76"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "blessing_jumbo",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA6900")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "kars",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_blessingpack",
    cost = 6,
    atlas = "blessingpack_atlas",
    weight = 1,
    pos = { x = 0, y = 1 },
    draw_hand = true,
    kind = "sdown_blessing",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "sdown_blessing",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("A04040"))
        ease_background_colour({ new_colour = HEX('A04040'), special_colour = HEX("E4AD76"), contrast = 2 })
    end
}

SMODS.Booster {
    key = "blessing_mega",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("BA6900")} } }
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "kars",
        art = "kars",
        code = "Athebyne",
    },
    group_key = "k_cbean_sdown_blessingpack",
    cost = 8,
    atlas = "blessingpack_atlas",
    weight = 0.75,
    pos = { x = 1, y = 1 },
    draw_hand = true,
    kind = "sdown_blessing",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "sdown_blessing",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("A04040"))
        ease_background_colour({ new_colour = HEX('A04040'), special_colour = HEX("E4AD76"), contrast = 2 })
    end
}







