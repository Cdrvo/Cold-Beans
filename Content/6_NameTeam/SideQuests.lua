YMA.SideQuests.quest {
    key = "nteam_square",
    order = 14,
    rarity = 1,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_square
        return {
            vars = {
                5,
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 1, y = 2 },
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },

    config = {
        extra = {
            failed = false
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