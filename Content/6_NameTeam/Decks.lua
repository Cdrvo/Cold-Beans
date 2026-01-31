SMODS.Atlas({
    key = "NAMETEAM_Decks",
    path = "6_NameTeam/ColdBeansBacks.png",
    px = 71,
    py = 95,
})

SMODS.Back {
    key = 'nameteam_urine',
    atlas = 'NAMETEAM_Decks',
    pos = { x = 0, y = 0 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                local chosen_id = pseudorandom_element(G.playing_cards, pseudoseed('nameteam_urine')):get_id() or 14
                for i = 1, #G.playing_cards do
                    if G.playing_cards[i]:get_id() == chosen_id then
                        G.playing_cards[i]:set_ability(G.P_CENTERS["m_cbean_pboys_piss"])
                    end
                end
                return true
            end,
        }))
    end,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    }
}


SMODS.Back {
    key = 'nameteam_happy',
    atlas = 'NAMETEAM_Decks',
    pos = { x = 2, y = 0 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = SMODS.create_card({
                        set = "Joker",
                        area = G.jokers,
                        key = "j_smiley",
                        no_edition = true
                    })
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end
        }))
    end,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    }
}

SMODS.Back {
    key = 'nameteam_sticky',
    atlas = 'NAMETEAM_Decks',
    pos = { x = 0, y = 0 },
    apply = function(self, back)
        G.GAME.cbean_stickersheet_rate = (G.GAME.cbean_stickersheet_rate or 0) + 1
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.consumeables then
                    local card = SMODS.add_card({
                        key = "c_cbean_eternal_sheet",
                        area = G.consumeables,
                        no_edition = true
                    })
                    return true
                end
            end
        }))
    end,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "ThunderEdge",
    }
}

SMODS.Back {
    key = 'nameteam_graveyard',
    atlas = 'NAMETEAM_Decks',
    pos = { x = 0, y = 1 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local eligible_jokers = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if string.find(k, "j_") == 1 then
                            if v.pvz_plant then
                                eligible_jokers[#eligible_jokers+1] = k
                            end
                        end
                    end
                    for i=1,5 do
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            local joker = pseudorandom_element(eligible_jokers, "nameteam_graveyard")
                            local joker_index = NAMETEAM.find(eligible_jokers, joker)
                            table.remove(eligible_jokers, joker_index)
                            local card = SMODS.create_card({
                                set = "Joker",
                                area = G.jokers,
                                key = joker,
                                no_edition = true
                            })
                            card:add_to_deck()
                            card:start_materialize()
                            G.jokers:emplace(card)
                        end
                    end
                    return true
                end
            end
        }))
    end,

    beans_credits = {
        team = "Name Team",
        idea = "Revo",
        art = "Inky",
        code = "TheAltDoc",
    }
}