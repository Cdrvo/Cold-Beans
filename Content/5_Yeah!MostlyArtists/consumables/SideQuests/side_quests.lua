YMA.SideQuests.quest {
    key = "yma_credit_card",
    order = 1,
    rarity = 1,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_credit_card
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.money_remaining
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 0, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },

    config = {
        extra = {
            money = 20,
            money_remaining = 20
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.extra.money_remaining = card.ability.extra.money
            SMODS.calculate_effect({ message = localize('k_reset') }, card)
        end
        if context.money_altered and context.amount < 0 then
            card.ability.extra.money_remaining = card.ability.extra.money_remaining + context.amount
            SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)
        end

        if card.ability.extra.money_remaining <= 0 then
            card.ability.extra.money_remaining = card.ability.extra.money
            YMA.complete_quest(card, "Joker", "j_credit_card")
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "cloudzXIII",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}


YMA.SideQuests.quest {
    order = 2,
    key = "yma_delayed_grat",
    rarity = 1,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_delayed_grat
        return {
            vars = {
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 0, y = 1 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
        }
    },

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.main_eval and G.GAME.current_round.discards_used == 0 then
            YMA.complete_quest(card, "Joker", "j_delayed_grat")
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "cloudzXIII",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}

YMA.SideQuests.quest {
    order = 3,
    key = "yma_burglar",
    rarity = 2,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_burglar
        return {
            vars = {
                card.ability.extra.diamonds,
                card.ability.extra.diamonds_left
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 1, y = 1 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
            diamonds = 2,
            diamonds_left = 2
        }
    },

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_suit("Diamonds") then
                    SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)
                    card.ability.extra.diamonds_left = card.ability.extra.diamonds_left - 1
                end
            end

            if card.ability.extra.diamonds_left <= 0 then
                card.ability.extra.diamonds_left = card.ability.extra.diamonds
                YMA.complete_quest(card, "Joker", "j_burglar")
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Flynn",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}



YMA.SideQuests.quest {
    order = 4,
    key = "yma_vampire",
    rarity = 2,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_vampire
        return {
            vars = {
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 1, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
        }
    },

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local enhanced = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) then
                    enhanced = enhanced + 1
                end
            end
            if enhanced >= 5 then
                enhanced = 0
                YMA.complete_quest(card, "Joker", "j_vampire")
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "cloudzXIII",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}

YMA.SideQuests.quest {
    order = 5,
    key = "yma_vagabond",
    rarity = 3,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_vagabond
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.hands_remaining
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 2, y = 1 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
            hands = 3,
            hands_remaining = 3,
        }
    },

    calculate = function(self, card, context)
        if context.before and G.GAME.dollars <= 4 then
            card.ability.extra.hands_remaining = card.ability.extra.hands_remaining - 1
            SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)

            if card.ability.extra.hands_remaining <= 0 then
                card.ability.extra.hands_remaining = card.ability.extra.hands
                YMA.complete_quest(card, "Joker", "j_vagabond")
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "cloudzXIII",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}

YMA.SideQuests.quest {
    order = 5,
    key = "yma_invisible",
    rarity = 3,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 2, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
            cup_won = false
        }
    },
    
    calculate = function(self, card, context)
        if G.num and G.MODE and G.cups and #G.cups and G.GAME then
            if G.MODE >= 3 and G.STATE_CHOOSEBALL then
                for key, ad in pairs(G.cups) do
                    if G.cups[key].states.collide.is then
                        if G.cups[key].ball then
                            card.ability.extra.cup_won = true
                        end
                    end
                end
            end
        end
        if card.ability.extra.cup_won then
            card.ability.extra.cup_won = false
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                    local leg = create_card('Joker',G.jokers, true, nil, nil, nil, nil, 'yma_ghost')
                    leg:set_edition({ negative = true })
                    leg:add_to_deck()
                    leg.ability = leg.ability or {}
                    leg.ability.yma_quest_temporary = true
                    G.jokers:emplace(leg)
                return true
                end)
            }))
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "cloudzXIII",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}


YMA.SideQuests.quest {
    order = 7,
    key = "yma_yorick",
    rarity = 4,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_yorick
        return {
            vars = {
                card.ability.extra.discards,
                card.ability.extra.discards_remaining
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 3, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
            discards = 23,
            discards_remaining = 23
        }
    },

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if card.ability.extra.discards_remaining <= 1 then
                YMA.complete_quest(card, "Joker", "j_yorick")
            else
                card.ability.extra.discards_remaining = card.ability.extra.discards_remaining - 1
                return nil, true
            end
        end
        if context.end_of_round and not context.blueprint and context.main_eval then
            card.ability.extra.discards_remaining = card.ability.extra.discards
            SMODS.calculate_effect({ message = localize('k_reset') }, card)
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Flynn",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}

YMA.SideQuests.quest {
    order = 8,
    key = "yma_wheel",
    rarity = 2,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_wheel_of_fortune
        return {
            vars = {
                card.ability.extra.rounds_remaining
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 1, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    config = {
        extra = {
            rounds_remaining = 3,
            rounds = 3
        }
    },

    calculate = function(self, card, context)
        if card.ability.extra.rounds_remaining > 0 and context.pseudorandom_result and context.result and context.identifier == "wheel_of_fortune" then
            card.ability.extra.rounds_remaining = card.ability.extra.rounds
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = function()
                    local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
                    local eligible_card = pseudorandom_element(editionless_jokers, 'yma_wheel_of_fortune')
                    eligible_card:set_edition('e_negative', true)
                    return true
                end
            }))
            YMA.complete_quest(card, nil, nil, false)
        end
        if card.ability.extra.rounds_remaining <= 0 then
            YMA.complete_quest(card, nil, nil, false)
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.rounds_remaining = card.ability.extra.rounds_remaining - 1
            return {
                message = (card.ability.extra.rounds_remaining .. "!"),
                colour = G.C.FILTER
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "cloudzXIII",
        art = "FirstTry",
        code = "cloudzXIII",
    }
}
-- note: if you're planning on making new ones, you have to add `order = number`, the number being the next one in the sequence (in this case 9)
