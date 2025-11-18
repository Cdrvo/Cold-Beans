Colonparen.CEOBlind {
    key = "sdown_outgrowth",
    name = "The Outgrowth",
    pos = { x = 0, y = 22 },
    boss = { min = 1 },
    atlas = "colon_CEOBlind",
    mult = 3,
    boss_colour = HEX("5933BB"),
    debuff_hand = function(self, cards, hand, handname, check)
        local _,_,_,scoring_hand,_ = G.FUNCS.get_poker_hand_info(cards)
        local always_scores_count = 0
        for _, card in pairs(cards) do
            if SMODS.always_scores(card) then always_scores_count = always_scores_count + 1 end
        end
        if #scoring_hand + always_scores_count ~= (#cards - 1) then return true end
    end,

    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "Athebyne",
    }
}