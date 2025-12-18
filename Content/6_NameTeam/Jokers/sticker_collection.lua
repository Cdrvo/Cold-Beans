SMODS.Joker({
    key = "nameteam_sticker_collection",

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
    atlas = 'NAMETEAM_Jokers',
    pos = {
        x = 11,
        y = 1
    },
	config = {
        extra = {
            add_mult = 0.1,
            current_mult = 1
        }
    },

    set_ability = function(self, card, initial, delay_sprites)
        if G.deck ~= nil then
            card.ability.extra.current_mult = cbean_nteam_get_amount_of_unique_stickers() * card.ability.extra.add_mult +1
        end
    end,

    calculate = function(self, card, context)
        -- Recalculating stickers whenever anything happens
        -- Should probably like, add a context for "on adding a sticker" or something??? How does that even work
        card.ability.extra.current_mult = cbean_nteam_get_amount_of_unique_stickers() * card.ability.extra.add_mult +1
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = card.ability.extra.current_mult
            }
        end
    end,

    beans_credit = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "TheAlternateDoctor",
    }
})

function cbean_nteam_get_amount_of_unique_stickers()
    -- Starting by listing all sticker keys
    sticker_keys = {}
    sticker_gotten = {}
    unique_stickers = 0
    for k, v in pairs(SMODS.Stickers) do
        sticker_keys[#sticker_keys+1] = v.key
    end
    sendDebugMessage("Found "..#sticker_keys.." stickers in game in total", "cbean_nteam_sticker_collection")
    for k, v in ipairs(G.jokers.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) then
                sticker_gotten[jk] = true
            end
        end
    end
    for k, v in ipairs(G.deck.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) then
                sticker_gotten[jk] = true
            end
        end
    end
    for k, v in ipairs(G.consumeables.cards) do
        for jk, jv in pairs(v.ability) do
            if NAMETEAM.contains(sticker_keys, jk) then
                sticker_gotten[jk] = true
            end
        end
    end
    -- endDebugMessage(inspect(sticker_gotten), "cbean_nteam_sticker_collection")
    for _ in pairs(sticker_gotten) do
        unique_stickers = unique_stickers +1 
    end
    -- Do something for the deck sticker
    return unique_stickers
end