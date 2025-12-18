SMODS.ConsumableType {
  key = "cbean_StickerSheet",
  primary_colour = HEX("677bb4"),
  secondary_colour = HEX("859ad7"),
  collection_rows = { 4, 4 },
  shop_rate = 0,
  default = "cbean_eternal_sheet",
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
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = SMODS.Stickers["eternal"]
    info_queue[#info_queue + 1] = G.P_TAGS["tag_voucher"]
    return {}
  end,
  can_use = function(self, card)
    local candidates = {}
    for _, v in ipairs(G.jokers.cards) do
      if not (v.ability and v.ability.eternal) then return true end
    end
    return false
  end,
  calculate = function(self, card, context)
    use = function(self, card, area, copier)
      local candidates = {}
      for _, v in ipairs(G.jokers.cards) do
        if not (v.ability and v.ability.eternal) then candidates[#candidates + 1] = v end
      end
      if #candidates > 0 then
        local affected_card = pseudorandom_element(candidates, pseudoseed("eternal_stickersheet"))
        G.E_MANAGER:add_event(Event({
          trigger = 'after',
          delay = 0.4,
          func = function()
            play_sound("gold_seal", 1.5, 1)
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
        delay(0.6)
      end
    end
  end
}
