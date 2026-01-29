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
  key = "plasma_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 3, y = 1 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 10,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_plasma"]
    return {}
  end,
  can_use = function(self, card)
    if not G.GAME.selected_back.ability.cbean_plasma then
      return true
    end
    return false
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        G.GAME.selected_back:nteam_apply_sticker("cbean_plasma")
        SMODS.calculate_effect({
          message = localize("cbean_plasma", "labels") .. "!",
          instant = true,
          colour = SMODS.Stickers["cbean_plasma"].badge_colour,
        }, G.deck.cards[1] or G.deck)
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "black_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 4, y = 1 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 10,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_black"]
    return {}
  end,
  can_use = function(self, card)
    if not G.GAME.selected_back.ability.cbean_black then
      return true
    end
    return false
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        G.GAME.selected_back:nteam_apply_sticker("cbean_black")
        SMODS.calculate_effect({
          message = localize("cbean_black", "labels") .. "!",
          instant = true,
          colour = SMODS.Stickers["cbean_black"].badge_colour,
        }, G.deck.cards[1] or G.deck)
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "painted_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 0, y = 2 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 10,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_painted"]
    return {}
  end,
  can_use = function(self, card)
    if not G.GAME.selected_back.ability.cbean_painted then
      return true
    end
    return false
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        G.GAME.selected_back:nteam_apply_sticker("cbean_painted")
        SMODS.calculate_effect({
          message = localize("cbean_painted", "labels") .. "!",
          instant = true,
          colour = SMODS.Stickers["cbean_painted"].badge_colour,
        }, G.deck.cards[1] or G.deck)
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "nebula_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 1, y = 2 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 10,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_nebula"]
    return {}
  end,
  can_use = function(self, card)
    if not G.GAME.selected_back.ability.cbean_nebula then
      return true
    end
    return false
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        G.GAME.selected_back:nteam_apply_sticker("cbean_nebula")
        SMODS.calculate_effect({
          message = localize("cbean_nebula", "labels") .. "!",
          instant = true,
          colour = SMODS.Stickers["cbean_nebula"].badge_colour,
        }, G.deck.cards[1] or G.deck)
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "green_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 2, y = 2 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 10,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_green"]
    return {}
  end,
  can_use = function(self, card)
    if not G.GAME.selected_back.ability.cbean_green then
      return true
    end
    return false
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        G.GAME.selected_back:nteam_apply_sticker("cbean_green")
        SMODS.calculate_effect({
          message = localize("cbean_green", "labels") .. "!",
          instant = true,
          colour = SMODS.Stickers["cbean_green"].badge_colour,
        }, G.deck.cards[1] or G.deck)
        return true
      end
    }))
    delay(0.6)
  end
}



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
  key = "hooking_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 1, y = 1 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  config = { extra = { no_of_golds = 2 } },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_hooking"]
    info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    return { vars = { card.ability.extra.no_of_golds } }
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_hooking then
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
        affected_card:add_sticker("cbean_hooking", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()

        local done = {}
        for i = 1, card.ability.extra.no_of_golds do
        local candidates = {}
        for _, v in ipairs(G.playing_cards) do
          if #SMODS.get_enhancements(v) <= 0 and v ~= affected_card then
            local is_valid = true
            for __, vv in ipairs(done) do
              if v == vv then
                is_valid = false
break
end
            end
            if is_valid then
              candidates[#candidates + 1] = v
            end
          end
        end

        if #candidates > 0 then
          pseudorandom_element(candidates, pseudoseed("hooking_sheet")):set_ability("m_gold")
        else break
end
      end
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

SMODS.Sound({
  key = "brainrot",
  path = "6_NameTeam/cbean_brainrot.ogg"
})

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "brainrot_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 0, y = 5 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_brainrot"]
    return {}
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_brainrot then
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
        play_sound("cbean_brainrot", 1, 0.65)
        affected_card:add_sticker("cbean_brainrot", true)
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
  key = "dangerous_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 4, y = 2 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_dangerous"]
    return {}
  end,
  can_use = function(self, card)
    return count_consumables() < G.consumeables.config.card_limit
  end,
  use = function(self, card, area, copier)
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
      play_sound('timpani')
      G.E_MANAGER:add_event(Event({
        delay = 0.3,
        blockable = false,
        func = function()
          local new_card = create_card("Spectral", G.consumables, nil, nil, nil, nil, nil, "dangeroussheet")
        play_sound("gold_seal", 1.5, 1)
        new_card:add_sticker("cbean_dangerous", true)
          new_card:add_to_deck()
          G.consumeables:emplace(new_card)
          G.GAME.consumeable_buffer = 0
          return true
        end
      }))
      SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral }, card)
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

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "misprinted_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 2, y = 5 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_misprinted"]
    info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    return {}
  end,
  can_use = function(self, card)
    if #G.jokers.highlighted == 1 then
      if not G.jokers.highlighted[1].ability.cbean_misprinted then
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
        affected_card:add_sticker("cbean_misprinted", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.2,
      func = function()
        card:set_edition("e_negative")
        return true
      end
    }))
    delay(0.6)
  end
}


SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "egg_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 1, y = 6 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_egg"]
    return {}
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.cbean_egg) then return true end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.cbean_egg) then candidates[#candidates + 1] = v end
    end
    if #candidates > 0 then
      local affected_card = pseudorandom_element(candidates, pseudoseed("egg_stickersheet"))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound("gold_seal", 2, 0.75)
          affected_card:add_sticker("cbean_egg", true)
          card:juice_up(0.3, 0.5)
          affected_card:juice_up()
          return true
        end
      }))
      delay(0.6)
    end
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "spore_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 1, y = 4 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  config = {extra = {money_per_sticker = 4}},
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_spore"]
    local sticker_keys = {}
    local sticker_amount = 0
    for k, v in pairs(SMODS.Stickers) do
        sticker_keys[#sticker_keys+1] = v.key
    end
    if G.jokers then
      sticker_amount = sticker_amount + 1 -- account for application of spore sticker
      for k, v in ipairs(G.jokers.cards) do
        for jk, jv in pairs(v.ability) do
          if NAMETEAM.contains(sticker_keys, jk) and jv then
              sticker_amount = sticker_amount + 1
          end
        end
      end
    end
    return {
      vars = {
        card.ability.extra.money_per_sticker,
        sticker_amount * card.ability.extra.money_per_sticker
      }
    }
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.cbean_spore) then return true end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.cbean_spore) then candidates[#candidates + 1] = v end
    end
    if #candidates > 0 then
      local affected_card = pseudorandom_element(candidates, pseudoseed("spore_stickersheet"))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound("gold_seal", 1.5, 1)
          affected_card:add_sticker("cbean_spore", true)
          card:juice_up(0.3, 0.5)
          affected_card:juice_up()
          local sticker_keys = {}
          local sticker_amount = 0
          for k, v in pairs(SMODS.Stickers) do
              sticker_keys[#sticker_keys+1] = v.key
          end
          for k, v in ipairs(G.jokers.cards) do
              for jk, jv in pairs(v.ability) do
                  if NAMETEAM.contains(sticker_keys, jk) and jv then
                      sticker_amount = sticker_amount + 1
                  end
              end
          end
          ease_dollars(sticker_amount * card.ability.extra.money_per_sticker)
          return true
        end
      }))
      delay(0.6)
    end
  end
}


SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "shuffle_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 2, y = 4 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_shuffle"]
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.cbean_shuffle) then return true end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.cbean_shuffle) then candidates[#candidates + 1] = v end
    end
    if #candidates > 0 then
      local affected_card = pseudorandom_element(candidates, pseudoseed("shuffle_sheet"))
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          play_sound("gold_seal", 1.5, 1)
          affected_card:add_sticker("cbean_shuffle", true)
          card:juice_up(0.3, 0.5)
          affected_card:juice_up()
          SMODS.debuff_card(affected_card, 'prevent_debuff', "shuffle_sheet")
          return true
        end
      }))
      delay(0.6)
    end
  end
}

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "minuscule_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 4, y = 4 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_minuscule"]
    return {}
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_minuscule then
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
        affected_card:add_sticker("cbean_minuscule", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable {
  set = "Spectral",
  key = "nteam_mitosis_sheet",
  hidden = true,
  soul_set = "cbean_StickerSheet",
  select_card = 'consumeables',
  pos = { x = 0, y = 0 }, pos_extra = { x = 1, y = 7 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  cost = 6,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_mitosis"]
    return {}
  end,
  can_use = function(self, card)
    if #G.hand.highlighted == 1 then
      if not G.hand.highlighted[1].ability.cbean_mitosis then
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
        affected_card:add_sticker("cbean_mitosis", true)
        card:juice_up(0.3, 0.5)
        affected_card:juice_up()
        return true
      end
    }))
    delay(0.6)
  end
}

SMODS.Consumable({
	set = "cbean_StickerSheet",
	key = "locked_sheet",
	pos = { x = 0, y = 0 },
	pos_extra = { x = 1, y = 5 },
	draw_extra = function(self, card, layer)
		if self.discovered or card.params.bypass_discovery_center then
			card.cbean_extra:draw_shader("booster", nil, card.ARGS.send_to_shader, nil, card.children.center)
		end
	end,
	config = { extra = { cards = 2 } },
	atlas = "NAMETEAM_StickerSheets",
	cost = 6,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = SMODS.Stickers["cbean_locked"]
		return {
			vars = { card.ability.extra.cards },
		}
	end,
	can_use = function(self, card)
		if #G.hand.highlighted == 1 then
			if not G.hand.highlighted[1].ability.cbean_locked then
				return true
			end
		end
		return false
	end,
	use = function(self, card, area, copier)
		local affected_card = G.hand.highlighted[1]
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("gold_seal", 2, 0.75)
				affected_card:add_sticker("cbean_locked", true)
				card:juice_up(0.3, 0.5)
				affected_card:juice_up()
				local _first_dissolve = nil
				local new_cards = {}
				for i = 1, card.ability.extra.cards do
					G.playing_card = (G.playing_card and G.playing_card + 1) or 1
					local _card = copy_card(affected_card, nil, nil, G.playing_card)
					_card:add_to_deck()
					G.deck.config.card_limit = G.deck.config.card_limit + 1
					table.insert(G.playing_cards, _card)
					G.hand:emplace(_card)
					_card:start_materialize(nil, _first_dissolve)
					_first_dissolve = true
					new_cards[#new_cards + 1] = _card
				end
				SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
				return true
			end,
		}))
		delay(0.6)
	end,
})

SMODS.Consumable({
	set = "cbean_StickerSheet",
	key = "healing_sheet",
	pos = { x = 0, y = 0 },
	pos_extra = { x = 2, y = 6 },
	draw_extra = function(self, card, layer)
		if self.discovered or card.params.bypass_discovery_center then
			card.cbean_extra:draw_shader("booster", nil, card.ARGS.send_to_shader, nil, card.children.center)
		end
	end,
	atlas = "NAMETEAM_StickerSheets",
	cost = 6,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = SMODS.Stickers["cbean_healing"]
	end,
	can_use = function(self, card)
		if #G.jokers.highlighted == 1 then
			if not G.jokers.highlighted[1].ability.cbean_healing then
        local stickers = NAMETEAM.get_all_stickers(G.jokers.highlighted[1])
        for _, key in ipairs(stickers) do
          if SMODS.Stickers[key].sticker_type == "Negative" then
            return true
          end
        end
			end
		end
		return false
	end,
	use = function(self, card, area, copier)
		local affected_card = G.jokers.highlighted[1]
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("gold_seal", 2, 0.75)
				affected_card:add_sticker("cbean_healing", true)
				card:juice_up(0.3, 0.5)
				affected_card:juice_up()
				return true
			end,
		}))
		delay(0.6)
	end,
})

SMODS.Consumable({
	set = "cbean_StickerSheet",
	key = "barren_sheet",
	pos = { x = 0, y = 0 },
	pos_extra = { x = 3, y = 6 },
	draw_extra = function(self, card, layer)
		if self.discovered or card.params.bypass_discovery_center then
			card.cbean_extra:draw_shader("booster", nil, card.ARGS.send_to_shader, nil, card.children.center)
		end
	end,
	config = { extra = { perma_x_mult = 0.25 } },
	atlas = "NAMETEAM_StickerSheets",
	cost = 6,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = SMODS.Stickers["cbean_barren"]
		return {
			vars = { card.ability.extra.perma_x_mult },
		}
	end,
	can_use = function(self, card)
		if #G.hand.highlighted == 1 then
			if not G.hand.highlighted[1].ability.cbean_barren then
				return true
			end
		end
		return false
	end,
	use = function(self, card, area, copier)
		local affected_card = G.hand.highlighted[1]
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("gold_seal", 2, 0.75)
				affected_card:add_sticker("cbean_barren", true)
				card:juice_up(0.3, 0.5)
				affected_card:juice_up()
				affected_card.ability.perma_x_mult = (affected_card.ability.perma_x_mult or 1) + card.ability.extra.perma_x_mult
				return true
			end,
		}))
		delay(0.6)
	end,
})

SMODS.Consumable({
	set = "cbean_StickerSheet",
	key = "square_sheet",
	pos = { x = 0, y = 0 },
	pos_extra = { x = 4, y = 6 },
	draw_extra = function(self, card, layer)
		if self.discovered or card.params.bypass_discovery_center then
			card.cbean_extra:draw_shader("booster", nil, card.ARGS.send_to_shader, nil, card.children.center)
		end
	end,
	atlas = "NAMETEAM_StickerSheets",
	cost = 6,
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = SMODS.Stickers["cbean_square"]
	end,
	can_use = function(self, card)
		if #G.jokers.highlighted == 1 then
			if not G.jokers.highlighted[1].ability.cbean_square then
        return true
			end
		end
		return false
	end,
	use = function(self, card, area, copier)
		local affected_card = G.jokers.highlighted[1]
		G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("gold_seal", 2, 0.75)
				affected_card:add_sticker("cbean_square", true)
        NAMETEAM.values("*", affected_card, 2, true)
				card:juice_up(0.3, 0.5)
				affected_card:juice_up()
				return true
			end,
		}))
		delay(0.6)
	end,
})

SMODS.Consumable {
  set = "cbean_StickerSheet",
  key = "poor_sheet",
  pos = { x = 0, y = 0 }, pos_extra = { x = 0, y = 7 },
  draw_extra = function(self, card, layer)
    if self.discovered or card.params.bypass_discovery_center then
      card.cbean_extra:draw_shader('booster', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end
  end,
  atlas = "NAMETEAM_StickerSheets",
  config = {extra = {debt_limit = 30}},
  cost = 1,
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["cbean_poor"]
    return {}
  end,
  can_use = function(self, card)
    if not G.GAME.selected_back.ability.cbean_poor then
      return true
    end
    return false
  end,
  use = function(self, card, area, copier)
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.4,
      func = function()
        play_sound("gold_seal", 1.5, 1)
        G.GAME.selected_back:nteam_apply_sticker("cbean_poor")
        SMODS.calculate_effect({
          message = localize("cbean_poor", "labels") .. "!",
          instant = true,
          colour = SMODS.Stickers["cbean_poor"].badge_colour,
        }, G.deck.cards[1] or G.deck)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.debt_limit
        return true
      end
    }))
    delay(0.6)
  end
}