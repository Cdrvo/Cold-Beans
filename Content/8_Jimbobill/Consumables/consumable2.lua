SMODS.ConsumableType{
    key = "Consumables2",
    primary_colour = HEX("FFD800"), 
    secondary_colour = HEX("FFD800"), 
    collection_rows = { 2, 1 },
    shop_rate = 0,
    loc_txt = {
        name = "Consumable^2",
        collection = "Consumable^2",
        undiscovered = {
            name = "Not Discovered^2",
            text = {
                "Purchase this card^2",
                "in an unseeded",
                "run^2 to learn",
                "what it does"
            }
        }
    },
}

SMODS.Consumable {
    key = "jbill_tarot",
    set = "Consumables2",
    atlas = "jbill_consume2",
    pos = { x = 0, y = 0 },
    config = { max_highlighted = 3, mod_conv = "m_cbean_jbill_bean" },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize{ type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}


SMODS.Consumable {
    key = "jbill_planet",
    set = "Consumables2",
    atlas = "jbill_consume2",
    cost = 3,
    pos = { x = 1, y = 0 },
    can_use = function(self, card)
        if G.GAME.last_hand_played ~= nil then
            return true
        end
    end,
    use = function (self, card, area)
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played then
                _played = hand.played
                _handname = hand_key
            end
        end
        local most_played = _handname --yes that is completely copied from vremade lol. I thought there was a global for that
        SMODS.smart_level_up_hand(card, most_played, nil, 1)
        SMODS.smart_level_up_hand(card, G.GAME.last_hand_played, nil, 1)
    end,
}

SMODS.Consumable {
    key = "jbill_spectral",
    set = "Consumables2",
    atlas = "jbill_consume2",
    cost = 3,
    pos = { x = 2, y = 0 },
    can_use = function(self, card)
        return true
    end,
    use = function (self, card, area)
        local cards = {}
        for k, v in pairs(G.hand.cards) do
            cards[#cards+1] = v
        end
        local amount = math.ceil(#cards/2)
        pseudoshuffle(cards)
        print(amount)
        for k, v in pairs(cards) do
            G.E_MANAGER:add_event(Event({
                trigger = "after", 
                delay = 1, 
                func = function() 
                    v:juice_up()
                    v:set_ability(SMODS.poll_enhancement({guaranteed = true})) 
                    return true 
                end
            }))
            if amount > 0 then
                SMODS.destroy_cards(v, nil, nil, true)
                amount = amount - 1
            end
        end
    end,
}
