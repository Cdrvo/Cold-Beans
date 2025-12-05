SMODS.Consumable {
    key = 'pboys_river',
    set = 'Tarot',
	atlas = "pboys_tarots_atlas",
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 2, mod_conv = 'm_cbean_pboys_piss' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
	beans_credits = {
        team = {"Pissboys",
        },
        idea = "HuyTheKiller",
        art =  "Gfsgfs",
        code = "Nrio_Modder",
    }
}