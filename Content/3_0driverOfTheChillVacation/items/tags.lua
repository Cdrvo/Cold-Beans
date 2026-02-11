
SMODS.Tag {
    key = '0chill_combo',
    atlas = '0chill_tag_atlas',
    pos = { x = 0, y = 0 },
    discovered = false,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_cbean_combo_booster_ultimate1
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "MarioFan597",
        code = "MarioFan597",
    },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.GREEN, function()
                local key = 'p_cbean_combo_booster_ultimate1'
                local card = Card(
                        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                        G.P_CENTERS[key],
                        { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = '0chill_squared',
    atlas = '0chill_tag_atlas',
    pos = { x = 1, y = 0 },
    discovered = false,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_cbean_meta_mega
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "MarioFan597",
        code = "MarioFan597",
    },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.GREEN, function()
                local key = 'p_cbean_meta_mega'
                local card = Card(
                        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                        G.P_CENTERS[key],
                        { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = '0chill_key',
    atlas = '0chill_tag_atlas',
    pos = { x = 2, y = 0 },
    discovered = false,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_cbean_yma_key_mega2
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "MarioFan597",
        code = "MarioFan597",
    },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.GREEN, function()
                local key = 'p_cbean_yma_key_mega2'
                local card = Card(
                        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                        G.P_CENTERS[key],
                        { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}

SMODS.Tag {
    key = '0chill_sticker',
    atlas = '0chill_tag_atlas',
    pos = { x = 3, y = 0 },
    discovered = false,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_cbean_nameteam_stickersheet_jumbo1
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "MarioFan597",
        code = "MarioFan597",
    },
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.GREEN, function()
                local key = 'p_cbean_nameteam_stickersheet_mega1'
                local card = Card(
                        G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
                        G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
                        G.CARD_W * 1.27, G.CARD_H * 1.27, G.P_CARDS.empty,
                        G.P_CENTERS[key],
                        { bypass_discovery_center = true, bypass_discovery_ui = true }
                )
                card.cost = 0
                card.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = card } })
                card:start_materialize()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}