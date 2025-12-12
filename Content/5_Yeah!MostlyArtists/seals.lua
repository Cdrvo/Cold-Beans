SMODS.Seal {
    key = 'yma_cipher',
    config = {
        extra = {
            odds = 3
        },
    },
    atlas = 'yma_seals_atlas',
    pos = { x = 0, y = 0 },
    badge_colour = HEX("e1cb8b"),
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.seal.extra.odds, 'yma_cipher')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if G.consumeables then
                local keys = {}
                for k, v in pairs(G.consumeables.cards) do
                    local temp, set = yma_improveable_consumable(v)
                    if temp and set == 'yma_keys' then
                        keys[#keys+1] = v
                    end
                end
                if #keys >= 1 and SMODS.pseudorandom_probability(card, 'yma_cipher', 1, card.ability.seal.extra.odds, nil) then
                    local other_card = pseudorandom_element(keys, pseudoseed('yma_cipher'))
                    if other_card.ability.consumeable.extra.type == 'cards' then
                        other_card.ability.consumeable.extra.uses = other_card.ability.consumeable.extra.uses + 2
                        other_card.ability.consumeable.extra.max_uses = other_card.ability.consumeable.extra.max_uses + 2 
                    end
                    other_card.ability.consumeable.extra.uses = other_card.ability.consumeable.extra.uses + 1 
                    other_card.ability.consumeable.extra.max_uses = other_card.ability.consumeable.extra.max_uses + 1 
                    card_eval_status_text(other_card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                elseif #keys >= 1 then
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_nope_ex')})
                end
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}

