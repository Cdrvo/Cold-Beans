--Alpha Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_alpha",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            uses = 3,
            max_uses = 3,
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval then
            local vaild_jokers = {}
            for i = 1, #G.jokers.cards do
                local stickers = {}
                for key, value in pairs(G.jokers.cards[i].ability) do
                    if G.shared_stickers[key] and value == true then
                        stickers[#stickers+1] = key
                        vaild_jokers[i] = {joker = G.jokers.cards[i]}
                    end
                end
                if vaild_jokers[i] then 
                    vaild_jokers[i] = {joker = G.jokers.cards[i], stickers = stickers}
                end
            end
            if #vaild_jokers > 0 then
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                local ran_selection = pseudorandom_element(vaild_jokers, pseudoseed('yma_alpha'))
                local sticker = pseudorandom_element(ran_selection.stickers, pseudoseed('yma_alpha'))
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        ran_selection.joker:juice_up(0.3, 0.5)
                        ran_selection.joker:remove_sticker(sticker)
                        return true
                    end)
                }))
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)

        -- Check vanilla stickers
        if G.GAME.modifiers.enable_eternals_in_shop or G.GAME.modifiers.enable_perishables_in_shop or G.GAME.modifiers.enable_rentals_in_shop then
            return true
        end

        -- Check non-vanilla stickers
        local fake_card = SMODS.Joker:create_fake_card()
        local fake_center = SMODS.Center:create_fake_card()
        fake_center.set = "Joker"
        for _, v in ipairs(SMODS.Sticker.obj_buffer) do
            local sticker = SMODS.Stickers[v]
            if sticker.should_apply and type(sticker.should_apply) == 'function' and sticker:should_apply(fake_card, fake_center, nil, true) then
                return true
            end
        end

        return false
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Rainstar",
        art = "",
        code = "RattlingSnow353",
    }
}
--Angel Key
SMODS.Consumable {
    set = "yma_keys",
    key = "yma_angel",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.consumeable.extra.uses,
                card.ability.consumeable.extra.max_uses,
            }
        }
    end,

    atlas = 'yea_art_key_atlas',
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            uses = 2,
            max_uses = 2,
        }
    },

    calculate = function(self, card, context)
        if context.open_booster then 
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                card.ability.consumeable.extra.uses = card.ability.consumeable.extra.uses - 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local cardd = create_card('sdown_blessing',G.consumeables, nil, nil, nil, nil, nil, 'for')
                        if cardd.ability.extra.times_left == 5 then
                            cardd.ability.extra.times_left = cardd.ability.extra.times_left - 1 
                        end
                        cardd.ability.extra.times_left = cardd.ability.extra.times_left - 1 
                        cardd:add_to_deck()
                        G.consumeables:emplace(cardd)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                if card.ability.consumeable.extra.uses <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    SMODS.calculate_effect({message = localize('k_yma_key_broke') }, card)
                else
                    return {
                        message = (card.ability.consumeable.extra.uses).."/"..(card.ability.consumeable.extra.max_uses)
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return true
    end,

    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "",
        code = "RattlingSnow353",
    }
}
--Animal Key
--Anywhere Key
--Biety Key
--Chain Key
--Creation Key
--Demon Key
--Echo Key
--Enigma Key
--Gender Key
--Ghost Key
--Giant Key
--Harlequin Key
--Head Key
--Hercules Key
--Identity Key
--Key to Hell
--Matchstick Key
--Mending Key
--Mirror Key
--Moon Key
--Music Box Key
--Omega Key (this one is a spectral)
--Orchestra Key
--Reali Key
--Shadow Key
--Stamp Key
--Sword Key
--Teddy Key
--Tempus Fugit Key
--Thorn Key
--Timeshift Key
--Undertree Key