SMODS.Joker {
    key = "jbill_ante_lock",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 2 },
    rarity = 2,
    cost = 5,
    config = { extra = { xchips = 1, xchips_gain = 1, ante_beaten = 0, ante_to_beat = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips, card.ability.extra.xchips_gain, card.ability.extra.ante_beaten, card.ability.extra.ante_to_beat } }
    end,
    calculate = function(self, card, context)
        if context.modify_ante and context.modify_ante > 0 then
            card.ability.extra.ante_beaten = card.ability.extra.ante_beaten + context.modify_ante
        end
        if card.ability.extra.ante_beaten >= card.ability.extra.ante_to_beat then
            card.ability.extra.ante_beaten = card.ability.extra.ante_beaten - card.ability.extra.ante_to_beat
            card.ability.extra.ante_to_beat = card.ability.extra.ante_to_beat + 1
            SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xchips",
                    scalar_value = "xchips_gain",
                    scaling_message = {
                        message = localize("k_astro_upg"),
                        colour = G.C.CHIPS
                    }
            })
        end
        if context.joker_main and card.ability.extra.xchips ~= 1 then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "ZayDerg"
    }
}