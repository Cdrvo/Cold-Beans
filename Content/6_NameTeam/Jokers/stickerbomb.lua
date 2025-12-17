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
    atlas = 'NAMETEAM_Jokers',
    pos_extra = {
        x = 0,
        y = 2
    },
	config = {
        extra = {
            add_mult = 2,
            current_mult = 0,
            current_back = "j_satellite"
        }
    },

    set_ability = function(self, card, initial, delay_sprites)
        if G.deck ~= nil then
            card.ability.extra.current_mult = cbean_nteam_get_amount_of_stickers() * card.ability.extra.add_mult
        end
        -- And removing it here as well
        card.ability.extra.current_back = G.GAME.cbean_nteam_stickerbomb_back
        G.GAME.cbean_nteam_stickerbomb_back = nil
    end,
    set_sprites = function(self, card, front)
        donor_joker = {}
        if not card.ability then
            -- First we cull the non Jokers off
            jokers = {}
            for k,v in pairs(G.P_CENTERS) do
                if string.find(k, "j_") == 1 then
                    jokers[#jokers+1] = v
                end
            end
            idx = pseudorandom('stickerbomb', 1, #jokers)
            donor_joker = jokers[idx]
            -- Temporarily storing it here because ability is not yet initialized
            G.GAME.cbean_nteam_stickerbomb_back = donor_joker.key
        else
            donor_joker = G.P_CENTERS[card.ability.extra.current_back]
        end
        sendDebugMessage("Setting joker to ", "cbean_nteam_stickerbomb")
        sendDebugMessage(donor_joker.key, "cbean_nteam_stickerbomb")
        if donor_joker.atlas then
            sendDebugMessage(donor_joker.atlas, "cbean_nteam_stickerbomb")
            card.children.center.atlas = G.ASSET_ATLAS[donor_joker.atlas]
        else
            sendDebugMessage("Joker", "cbean_nteam_stickerbomb")
            card.children.center.atlas = G.ASSET_ATLAS["Joker"]
        end
        sendDebugMessage(inspect(donor_joker.pos), "cbean_nteam_stickerbomb")
        card.children.center:set_sprite_pos(donor_joker.pos)
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
		art = "TheAlternateDoctor",
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

function test_shit()
    jokers = {}
    for k,v in pairs(G.P_CENTERS) do
        if string.find(k, "j_") == 1 and k ~= "j_cbean_nameteam_stickerbomb" then
            jokers[#jokers+1] = k
        end
    end
    return jokers
end