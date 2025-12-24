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
  
    atlas = 'pboys_tarots_atlas', pos = { x = 0, y = 0 },
      config = { max_highlighted = 2, mod_conv = "m_cbean_wgrop_thistled" },
      update = function(self, card, dt)
        if card.ability.mod_conv ~= CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome] then
          card.ability.mod_conv = CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome]
        end
      end,
      loc_vars = function(self, info_queue, card)
          info_queue[#info_queue+1] = G.P_CENTERS[CBWG.BiomeConsumables[G.GAME.round_resets.blind_biome]]
          return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } or 'Biome Card' }}
      end,
  
  }