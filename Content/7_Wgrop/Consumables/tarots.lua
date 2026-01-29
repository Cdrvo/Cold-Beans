 CBWG.BiomeConsumables = {
  wgrop_desert = 'm_cbean_wgrop_coarse',
  wgrop_forest = 'm_cbean_wgrop_grapevine',
  wgrop_graveyard = 'm_cbean_wgrop_thistled',
  wgrop_volcanic = 'm_cbean_wgrop_magma',
  wgrop_glaciers = 'm_cbean_wgrop_ice',
  wgrop_city = 'm_cbean_wgrop_graffiti',
 }
 
 SMODS.Consumable {
    key = 'journey',
    set = 'Tarot',
    loc_txt = {
      name = 'The Journey',
      text = {
        "Enhances {C:attention}#1#",
        "selected cards to",
        "{C:attention}#2#s",
        "{C:inactive,s:0.8}(Enhancement changes based on current Biome)"
      }
    },
  
    atlas = 'wgrop_tarot_atlas', pos = { x = 0, y = 0 },
      config = { max_highlighted = 2, extra = "m_cbean_wgrop_thistled", cbean_banned_by_aldus = true},
      update = function(self, card, dt)
        if card.ability.extra ~= CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome] then
          card.ability.extra = CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome]
        end
      end,
      use = function(self, card, area)
          G.E_MANAGER:add_event(Event({func = function()
              play_sound('tarot1')
              card:juice_up(0.3, 0.5)
              return true end }))
          for i=1, #G.hand.highlighted do
              local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
              G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
          end
          delay(0.2)
          for i=1, #G.hand.highlighted do
              G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(card.ability.extra);return true end }))
          end 
          for i=1, #G.hand.highlighted do
              local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
              G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
          end
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
          delay(0.5)
      end,
      loc_vars = function(self, info_queue, card)
          info_queue[#info_queue+1] = G.P_CENTERS[CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome]]
          return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra } or 'Biome Card' }}
      end,
  
  }