YMA.SideQuests.quest {
    key = "nteam_square",
    order = 14,
    rarity = 1,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_square
        return {
            vars = {
                card.ability.extra.fail_condition,
            }
        }
    end,

    atlas = 'nteam_sidequests',
    pos = { x = 0, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },

    config = {
        extra = {
            failed = false,
            fail_condition = 5
        }
    },

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.failed = false
        end
        if context.before then
            if #context.full_hand >= 5 then
                card.ability.extra.failed = true
                return {
                    message = localize("k_failed_ex")
                }
            end
        end
        if context.end_of_round and context.main_eval and not context.game_over and not card.ability.extra.failed then
            YMA.complete_quest(card, "Joker", "j_square")
        end
    end,
    beans_credits = {
        team = { "Name Team" },
        idea = "Inky",
        art = "Inky",
        code = "ThunderEdge",
    }
}

YMA.SideQuests.quest {
    key = "nteam_scholar",
    order = 15,
    rarity = 1,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_scholar
    end,

    atlas = 'nteam_sidequests',
    pos = { x = 1, y = 0 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },

    config = {},

    calculate = function(self, card, context)
        if context.sticker_applied and not context.is_deck_sticker and context.other_card:get_rank() == 14 then
            YMA.complete_quest(card, "Joker", "j_scholar")
        end
    end,
    beans_credits = {
        team = { "Name Team" },
        idea = "Inky",
        art = "Inky",
        code = "ThunderEdge",
    }
}