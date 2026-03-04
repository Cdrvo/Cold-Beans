 CBWG.BiomeConsumables = {
  wgrop_desert = 'm_cbean_wgrop_coarse',
  wgrop_forest = 'm_cbean_wgrop_grapevine',
  wgrop_graveyard = 'm_cbean_wgrop_thistled',
  wgrop_volcanic = 'm_cbean_wgrop_magma',
  wgrop_glaciers = 'm_cbean_wgrop_ice',
  wgrop_city = 'm_cbean_wgrop_graffiti',
 }
 CBWG.LawnBiomeConsumables = {
  "m_cbean_basic_zomboid",
  "m_cbean_carrot_zomboid",
  "m_cbean_melon_zomboid"
 }
 
 SMODS.Consumable {
    key = 'journey',
    set = 'Tarot',
  
    atlas = 'wgrop_tarot_atlas', pos = { x = 0, y = 0 },
      config = { max_highlighted = 2, extra = "m_cbean_wgrop_thistled", cbean_banned_by_aldus = true, afterlife_mult = 8},
      update = function(self, card, dt)
        if card.ability.extra ~= CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome] then
          card.ability.extra = CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome]
        end
      end,
      use = function(self, card, area)
        if G.GAME.round_resets.blind_biome ~= "nameteam_afterlife" then
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
            if G.GAME.round_resets.blind_biome == "nameteam_davelawn" then
              local lawn_ability = pseudorandom_element(CBWG.LawnBiomeConsumables, pseudoseed("journey_lawn"))
              G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(lawn_ability);return true end }))
            else
              G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() G.hand.highlighted[i]:set_ability(card.ability.extra);return true end }))
            end
          end 
          for i=1, #G.hand.highlighted do
              local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
              G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
          end
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
          delay(0.5)
        else -- Afterlife effect
          delay(0.4)
          for i=1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
              trigger = 'after',
              delay = 0.1,
              func = function() 
                play_sound('multhit1', percent)
                G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult+card.ability.afterlife_mult
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
                attention_text({
                    text = localize('k_upgrade_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = G.hand.highlighted[i],
                    backdrop_colour = G.C.MULT,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
                    silent = true
                    })
                return true 
              end
            }))
          end 
          delay(0.4)
          G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
          delay(0.5)
        end
      end,
      loc_vars = function(self, info_queue, card)
        if G.GAME.round_resets.blind_biome ~= "nameteam_afterlife" then
          info_queue[#info_queue+1] = G.P_CENTERS[CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome]]
          local sentence_bit = ""
          local enhancement = (localize({ type = 'name_text', set = 'Enhanced', key = card.ability.extra }) or 'Biome Card')
          if G.GAME.round_resets.blind_biome == "nameteam_davelawn" then
            sentence_bit = localize("k_c_journey_zomboid")
            enhancement = localize("k_c_journey_m_zomboid")
          end
          return { vars = { card.ability.max_highlighted, sentence_bit, enhancement}}
        else
          return { key = "c_cbean_journey_afterlife", vars = { card.ability.max_highlighted, card.ability.afterlife_mult}}
        end
      end,
  
  }