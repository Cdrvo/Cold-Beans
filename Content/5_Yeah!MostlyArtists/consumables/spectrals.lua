--Spectral cards
--Archive
SMODS.Consumable {
    key = "yma_archive",
    set = 'Spectral',
    atlas = 'yea_art_key_atlas',
	pos = { x = 6, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    config = { extra = { mod_conv = 'cbean_yma_cipher',}, max_highlighted = 2 },
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.mod_conv]
		return {
			vars = {
				card.ability.max_highlighted,
				localize { type = 'name_text', set = 'Other', key = card.ability.extra.mod_conv..'_seal' },
                colours = {
                    HEX("e1cb8b"),
                }
			}
		}
	end,
	use = function(self, card)
        for k, v in pairs(G.hand.highlighted) do
            local conv_card = v
            G.E_MANAGER:add_event(Event({func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true end }))
        
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                conv_card:set_seal(card.ability.extra.mod_conv, nil, true)
                return true end }))
        
            delay(0.5)
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
        end
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}