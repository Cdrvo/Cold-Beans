--TODO: this name kinda sucks can we get a better one
SMODS.Tag {
    key = 'hongbao',
    atlas = 'sdown_other_atlas',
    pos = { x = 0, y = 0 },
    discovered = false,
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_cbean_czodiac_mega1
    end,
    loc_txt = {
        name = 'Hongbao Tag',
        text = {
            "Gives a free",
            "{C:attention}Mega Zodiac Pack"
        }
    },

    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:yep('+', G.C.GREEN, function()
                local key = 'p_cbean_czodiac_mega1'
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