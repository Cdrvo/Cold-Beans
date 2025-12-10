--Key Boosters
SMODS.Booster {
    key = "yma_key_normal1",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 4,
    atlas = "yma_key_packs_atlas",
    weight = 0.9,
    pos = { x = 0, y = 0 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_normal2",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 4,
    atlas = "yma_key_packs_atlas",
    weight = 0.9,
    pos = { x = 1, y = 0 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_normal3",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 4,
    atlas = "yma_key_packs_atlas",
    weight = 0.9,
    pos = { x = 2, y = 0 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_normal4",
    config = { extra = 3, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 4,
    atlas = "yma_key_packs_atlas",
    weight = 0.9,
    pos = { x = 3, y = 0 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_jumbo1",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 6,
    atlas = "yma_key_packs_atlas",
    weight = 0.45,
    pos = { x = 0, y = 1 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_jumbo2",
    config = { extra = 5, choose = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 6,
    atlas = "yma_key_packs_atlas",
    weight = 0.45,
    pos = { x = 1, y = 1 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_mega1",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 8,
    atlas = "yma_key_packs_atlas",
    weight = 0.225,
    pos = { x = 2, y = 1 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}
SMODS.Booster {
    key = "yma_key_mega2",
    config = { extra = 5, choose = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra, colours = {HEX("9e8662")} } }
    end,
    beans_credits = {
        team = "Yeah! Mostly Artists",
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    },
    group_key = "k_cbean_yma_keypack",
    cost = 8,
    atlas = "yma_key_packs_atlas",
    weight = 0.225,
    pos = { x = 3, y = 1 },
    kind = "yma_keys",
    select_card = "consumeables",
    create_card = function(self, card, i)
        return {
            set = "yma_keys",
            skip_materialize = true,
            area = G.pack_cards,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("9e8662"))
        ease_background_colour({ new_colour = HEX('9e8662'), special_colour = HEX("ba9e74"), contrast = 2 })
    end
}