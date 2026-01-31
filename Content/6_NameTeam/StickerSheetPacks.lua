if not G.C.NAMETEAM_STICKERSHEETPACK then
    G.C.NAMETEAM_STICKERSHEETPACK = {
        StickerSheet = HEX("859AD7"),
        StickerSheetAlt = HEX("D490A7")
    }
end

SMODS.Atlas {
    key = "NAMETEAM_StickerSheetPacks",
    path = "6_NameTeam/ColdBeansStickerSheetPacks.png",
    px = 71,
    py = 95
}

SMODS.Sound({
  vol = 1,
  key = "sticker_sheet_music",
  path = "6_NameTeam/cbean_stickersheetmusic.ogg",
  select_music_track = function()
    if G.booster_pack and SMODS.OPENED_BOOSTER and
        (SMODS.OPENED_BOOSTER.config.center.key == 'p_cbean_nameteam_stickersheet_normal1'
          or SMODS.OPENED_BOOSTER.config.center.key == 'p_cbean_nameteam_stickersheet_normal2'
          or SMODS.OPENED_BOOSTER.config.center.key == 'p_cbean_nameteam_stickersheet_jumbo1'
          or SMODS.OPENED_BOOSTER.config.center.key == 'p_cbean_nameteam_stickersheet_mega1') then
      return true
    end
    return false
  end
})



SMODS.Booster {
    key = "nameteam_stickersheet_normal1",
    kind = "cbean_StickerSheet",
    atlas = "NAMETEAM_StickerSheetPacks",
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },
    cost = 4,
    weight = 0.5,
    create_card = function(self, card)
        return create_card("cbean_StickerSheet", G.pack_cards, nil, nil, true, true, nil, "nameteam_stickersheet_normal1")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet)
        ease_background_colour({ new_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet, special_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheetAlt, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_cbean_stickersheetpack",
    draw_hand = true
}

SMODS.Booster {
    key = "nameteam_stickersheet_normal2",
    kind = "cbean_StickerSheet",
    atlas = "NAMETEAM_StickerSheetPacks",
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    cost = 4,
    weight = 0.5,
    create_card = function(self, card)
        return create_card("cbean_StickerSheet", G.pack_cards, nil, nil, true, true, nil, "nameteam_stickersheet_normal1")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet)
        ease_background_colour({ new_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet, special_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheetAlt, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_cbean_stickersheetpack",
    draw_hand = true
}

SMODS.Booster {
    key = "nameteam_stickersheet_jumbo1",
    kind = "cbean_StickerSheet",
    atlas = "NAMETEAM_StickerSheetPacks",
    pos = { x = 2, y = 0 },
    config = { extra = 5, choose = 1 },
    cost = 6,
    weight = 0.25,
    create_card = function(self, card)
        return create_card("cbean_StickerSheet", G.pack_cards, nil, nil, true, true, nil, "nameteam_stickersheet_normal1")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet)
        ease_background_colour({ new_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet, special_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheetAlt, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_cbean_stickersheetpack",
    draw_hand = true
}

SMODS.Booster {
    key = "nameteam_stickersheet_mega1",
    kind = "cbean_StickerSheet",
    atlas = "NAMETEAM_StickerSheetPacks",
    pos = { x = 3, y = 0 },
    config = { extra = 5, choose = 2 },
    cost = 8,
    weight = 0.125,
    create_card = function(self, card)
        return create_card("cbean_StickerSheet", G.pack_cards, nil, nil, true, true, nil, "nameteam_stickersheet_normal1")
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet)
        ease_background_colour({ new_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheet, special_colour = G.C.NAMETEAM_STICKERSHEETPACK.StickerSheetAlt, contrast = 2 })
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
    group_key = "k_cbean_stickersheetpack",
    draw_hand = true
}
