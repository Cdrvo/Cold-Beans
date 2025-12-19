SMODS.ConsumableType {
  key = "cbean_StickerSheet",
  primary_colour = HEX("677bb4"),
  secondary_colour = HEX("859ad7"),
  collection_rows = { 4, 4 },
  shop_rate = 1,
  default = "c_cbean_eternal_sheet",
  can_stack = true,
  can_divide = true
}

SMODS.Atlas({
  key = "NAMETEAM_StickerSheets",
  path = "6_NameTeam/ColdBeansStickerConsumables.png",
  px = 71,
  py = 95,
})

SMODS.UndiscoveredSprite({
  key = "cbean_StickerSheet",
  atlas = "NAMETEAM_StickerSheets",
  path = "6_NameTeam/ColdBeansStickerSheets.png",
  pos = { x = 1, y = 0 },
  px = 71,
  py = 95,
  no_overlay = true
})







SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "eternal_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 2, y = 0 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["eternal"]
    info_queue[#info_queue + 1] = G.P_TAGS["tag_voucher"]
    return {}
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.eternal) and v.config and v.config.center and v.config.center.eternal_compat then return true end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.eternal) and v.config and v.config.center and v.config.center.eternal_compat then candidates[#candidates + 1] = v end
    end
    if #candidates > 0 then
      local affected_card = pseudorandom_element(candidates, pseudoseed("eternal_stickersheet"))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound("gold_seal", 2, 0.75)
          affected_card:add_sticker("eternal", true)
          card:juice_up(0.3, 0.5)
          affected_card:juice_up()
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = (function()
          add_tag(Tag('tag_voucher'))
          play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
          play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
          card:juice_up()
          return true
        end)
      }))
    end
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "perishable_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 3, y = 0 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    sticker_info = SMODS.Stickers["perishable"]
    sticker_info.loc_vars = function(self, info_queue, card)
      return { vars = { 5, 5 } }
    end
    info_queue[#info_queue + 1] = sticker_info
    return {}
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.perishable) and v.config and v.config.center and v.config.center.perishable_compat then return true end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.perishable) and v.config and v.config.center and v.config.center.perishable_compat then candidates[#candidates + 1] = v end
    end
    if #candidates > 0 then
      local affected_card = pseudorandom_element(candidates, pseudoseed("perishable_stickersheet"))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound("gold_seal", 2, 0.75)
          affected_card:add_sticker("perishable", true)
          card:juice_up(0.3, 0.5)
          affected_card:juice_up()
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = (function()
          affected_card:set_edition({ negative = true }, true)
          return true
        end)
      }))
    end
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "rental_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 4, y = 0 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["rental"]
    return {}
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.rental) then return true end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.rental) then candidates[#candidates + 1] = v end
    end
    if #candidates > 0 then
      local affected_card = pseudorandom_element(candidates, pseudoseed("rental_stickersheet"))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound("gold_seal", 2, 0.75)
          affected_card:add_sticker("rental", true)
          card:juice_up(0.3, 0.5)
          affected_card:juice_up()
          return true
        end
      }))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = (function()
          ease_dollars(20, true)
          return true
        end)
      }))
      delay(0.6)
    end
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "mailed_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 0, y = 1 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_mailed"]
    info_queue[#info_queue + 1] = G.P_SEALS["Purple"]
    return {}
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_mailed then
        return true
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local affected_card = G.hand.highlighted[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 2, 0.75)
        affected_card:add_sticker("cbean_mailed", true)
        affected_card:set_seal("Purple")
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "flashcard_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 0, y = 6 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_flashcard"]
    return {}
  end,
  can_use = function(self, card)
    if #G.jokers.highlighted == 1 then
      if not G.jokers.highlighted[1].ability.cbean_flashcard then
        return true
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local affected_card = G.jokers.highlighted[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 2, 0.75)
        affected_card:add_sticker("cbean_flashcard", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = (function()
        G.GAME.cbean_nteam_rerolls_cost = 3
        if G.GAME.cbean_nteam_rerolls_left then
          G.GAME.cbean_nteam_rerolls_left = G.GAME.cbean_nteam_rerolls_left + 5
        else
          G.GAME.cbean_nteam_rerolls_left = 5
        end
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + G.GAME.cbean_nteam_rerolls_cost
        calculate_reroll_cost(true)
        return true
      end)
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "frowning_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 2, y = 1 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_frowning"]
    return {}
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_frowning then
        return true
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local affected_card = G.hand.highlighted[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 2, 0.75)
        play_sound("cbean_frowning", 1, 0.65)
        affected_card:add_sticker("cbean_frowning", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        local cards = {}
        local faces = {}
        for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
            local rank = SMODS.Ranks[rank_key]
            if rank.face then table.insert(faces, rank) end
        end
        local _rank = pseudorandom_element(faces, 'familiar_create').card_key
        local cen_pool = {}
        for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
            if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                cen_pool[#cen_pool + 1] = enhancement_center
            end
        end
        local enhancement = pseudorandom_element(cen_pool, 'spe_card')
        cards[#cards+1] = SMODS.add_card { set = "Base", rank = _rank, enhancement = enhancement.key }
        SMODS.calculate_context({ playing_card_added = true, cards = cards })
        return true
      end
    }))
    delay(0.6)
  end
}



SMODS.Sound({
  key = "shield",
  path = "6_NameTeam/cbean_shield.ogg"
})

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "shield_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 3, y = 4 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_shield"]
    return {}
  end,
  can_use = function(self, card)
    if #G.jokers.highlighted == 1 then
      if not G.jokers.highlighted[1].ability.cbean_shield then
        return true
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local affected_card = G.jokers.highlighted[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 2, 0.75)
        play_sound("cbean_shield", 1, 0.65)
        affected_card:add_sticker("cbean_shield", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "heavy_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 3, y = 2 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_heavy"]
    info_queue[#info_queue + 1] = G.P_CENTERS.e_foil
    info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
    info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
    return {}
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_heavy then
        return true
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local affected_card = G.hand.highlighted[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        affected_card:add_sticker("cbean_heavy", true)
        local edition = poll_edition('heavy_sheet', nil, true, true)
        affected_card:set_edition(edition, true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = (function()
        return true
      end)
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "hungry_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 2, y = 3 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_hungry"]
    return {}
  end,
  can_use = function(self, card)
    if #G.jokers.highlighted == 1 then
      if not G.jokers.highlighted[1].ability.cbean_hungry then
        return true
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local affected_card = G.jokers.highlighted[1]
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        affected_card:add_sticker("cbean_hungry", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        affected_card.ability = NAMETEAM.mult_value(affected_card.ability, 1.5)
        return true
      end
    }))
    delay(0.6)
  end
}