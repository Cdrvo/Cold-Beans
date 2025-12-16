SMODS.Joker({
    key = "nameteam_stickerbomb",

    loc_vars = function(self, info_queue, card)
                return {
                    vars = {
                        card.ability.extra.add_mult,
                        card.ability.extra.current_mult
                    }
                }
    end,
    cost = 1,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    -- atlas = 'jokers',
    -- pos = {
    --     x = 4,
    --     y = 0
    -- },
	config = {
        extra = {
            add_mult = 2,
            current_mult = 0
        }
    },

    set_ability = function(self, card, initial, delay_sprites)
        if G.deck ~= nil then
            card.ability.extra.current_mult = cbean_nteam_get_amount_of_stickers() * card.ability.extra.add_mult
        end
    end,

    calculate = function(self, card, context)
        -- Recalculating stickers whenever anything happens
        -- Should probably like, add a context for "on adding a sticker" or something??? How does that even work
        card.ability.extra.current_mult = cbean_nteam_get_amount_of_stickers() * card.ability.extra.add_mult
        if context.joker_main and context.cardarea == G.jokers then
            return {
                mult = card.ability.extra.current_mult
            }
        end
    end,

    beans_credit = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "",
    }
})

function cbean_nteam_get_amount_of_stickers()
    -- Starting by listing all sticker keys
    sticker_keys = {}
    sticker_amount = 0
    for k, v in pairs(SMODS.Stickers) do
        sticker_keys[#sticker_keys+1] = v.key
    end
    sendDebugMessage("Found "..#sticker_keys.." stickers in game in total", "cbean_nteam_stickerbomb")
    for k, v in ipairs(G.jokers.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) then
                sticker_amount = sticker_amount + 1
            end
        end
    end
    for k, v in ipairs(G.deck.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) then
                sticker_amount = sticker_amount + 1
            end
        end
    end
    for k, v in ipairs(G.consumeables.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) then
                sticker_amount = sticker_amount + 1
            end
        end
    end
    -- Do something for the deck sticker
    return sticker_amount
end