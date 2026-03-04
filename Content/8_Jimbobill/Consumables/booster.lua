SMODS.Booster {
    key = "meta_pack1",
    atlas = "jbill_booster",
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1},
    cost = 4,
    weight = 0.5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } } 
    end,
    kind = "Consumables2",
    group_key = "k_jbill_metapack",
    draw_hand = true,
    select_card = "consumeables",
    create_card = function(self, card)
        local newCard = SMODS.create_card({set = "Consumables2", area = G.pack_cards, skip_materialize = true })
        return newCard
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffd800"))
        ease_background_colour({ new_colour = HEX('ffd800'), special_colour = HEX("ff218c"), contrast = 1 })
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Booster {
    key = "meta_pack2",
    atlas = "jbill_booster",
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1},
    cost = 4,
    draw_hand = true,
    weight = 0.5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } } 
    end,
    kind = "Consumables2",
    group_key = "k_jbill_metapack",
    select_card = "consumeables",
    create_card = function(self, card)
        local newCard = SMODS.create_card({set = "Consumables2", area = G.pack_cards, skip_materialize = true })
        return newCard
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffd800"))
        ease_background_colour({ new_colour = HEX('ffd800'), special_colour = HEX("ff218c"), contrast = 1 })
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Booster {
    key = "meta_jumbo",
    atlas = "jbill_booster",
    pos = { x = 2, y = 0 },
    config = { extra = 5, choose = 1},
    cost = 4,
    draw_hand = true,
    weight = 0.5,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } } 
    end,
    kind = "Consumables2",
    group_key = "k_jbill_metapack",
    select_card = "consumeables",
    create_card = function(self, card)
        local newCard = SMODS.create_card({set = "Consumables2", area = G.pack_cards, skip_materialize = true })
        return newCard
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffd800"))
        ease_background_colour({ new_colour = HEX('ffd800'), special_colour = HEX("ff218c"), contrast = 1 })
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Booster {
    key = "meta_mega",
    atlas = "jbill_booster",
    pos = { x = 3, y = 0 },
    config = { extra = 5, choose = 2},
    cost = 4,
    draw_hand = true,
    weight = 0.1,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } } 
    end,
    kind = "Consumables2",
    group_key = "k_jbill_metapack",
    select_card = "consumeables",
    create_card = function(self, card)
        local newCard = SMODS.create_card({set = "Consumables2", area = G.pack_cards, skip_materialize = true })
        return newCard
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("ffd800"))
        ease_background_colour({ new_colour = HEX('ffd800'), special_colour = HEX("ff218c"), contrast = 1 })
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

