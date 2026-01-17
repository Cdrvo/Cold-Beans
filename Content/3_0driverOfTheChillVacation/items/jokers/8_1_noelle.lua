SMODS.Joker { 
    key = "0chill_noelle", 
    atlas = "0chill_joker_atlas",
    pos = { x = 0, y = 0 },
    rarity = 3,
    order = 1,
    blueprint_compat = true,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.e_cbean_sd_frozen
        info_queue[#info_queue+1] = G.P_CENTERS.m_cbean_wgrop_ice
        info_queue[#info_queue+1] = G.P_CENTERS.j_cbean_0chill_thorn_ring
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and (#G.hand.cards >= 1) then
            if (#SMODS.find_card('j_cbean_0chill_thorn_ring') > 0) then
                G.E_MANAGER:add_event(Event({
                        trigger = "before",
                        delay = 1.25,
                        func = function()
                            play_sound("cbean_0chill_snowgrave")
                            for k, v in pairs(G.hand.cards) do
                                v:set_ability("m_cbean_wgrop_ice")
                                v:set_edition("e_cbean_sd_frozen")
                                v:juice_up(0.5, 0.5)
                            end
                            return true
                        end,
                    }))
            else
                local eligiblecards = {} --Modifed from cryptid sus
                for k, v in pairs(G.hand.cards) do
                    if not v.edition then
                        table.insert(eligiblecards, v)
                    end
                end
                if #eligiblecards > 0 then
                    --you just lost the game
                    local eligible_card = pseudorandom_element(eligiblecards, pseudoseed("1997 Kromer"))
                    G.E_MANAGER:add_event(Event({
                        trigger = "before",
                        delay = 1.25,
                        func = function()
                            play_sound("cbean_sd_iceshock")
                            eligible_card:set_edition("e_cbean_sd_frozen")
                            card:juice_up(0.5, 0.5)
                            return true
                        end,
                    }))                    
                end
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if #SMODS.find_card('j_cbean_0chill_thorn_ring') > 0 then
            play_sound('cbean_0chill_ominous')
            --card.children.center:set_sprite_pos({x = 1, y = 0})
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"restruct",
             "MarioFan597"
        },
        art =  "Monachrome",
        code = "MarioFan597",
    }
}