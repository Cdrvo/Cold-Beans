
SMODS.Joker {
    key = "jbill_98",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 3, y = 1 },
    rarity = 1,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Blind", key = "bl_cbean_sdown_estrogen"}
    end,
    calculate = function(self, card, context)
        if G.GAME.round_resets.blind_choices.Teeny ~= "bl_cbean_sdown_estrogen" then
            G.GAME.round_resets.blind_choices.Teeny = "bl_cbean_sdown_estrogen"
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "Microsoft Paint"
    }
}