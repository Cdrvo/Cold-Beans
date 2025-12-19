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
