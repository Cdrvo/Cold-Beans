SMODS.Voucher({
    key = "nameteam_more_choices",
    cost = 10,
    atlas = 'NAMETEAM_Vouchers',
    pos = {x=0, y=0},
    unlocked = true,
    discovered = false,
    available = true,
    config = {extra = {choices = 1, rewards = 1}},
    beans_credits = {
        team = "Name Team",
        idea = "TheAltDoc",
        art = "N/A",
        code = "TheAltDoc",
    },
    in_pool = function()
        return G.GAME.nteam_sticker_obtained
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.choices,card.ability.extra.rewards}}
    end,
    redeem = function(self, card)
        G.GAME.stationery_num_accepted = G.GAME.stationery_num_accepted + card.ability.extra.choices
        G.GAME.stationery_num_rewards = G.GAME.stationery_num_rewards + card.ability.extra.rewards
    end
})

SMODS.Voucher({
    key = "nameteam_free_sample",
    cost = 10,
    atlas = 'NAMETEAM_Vouchers',
    pos = {x=1, y=0},
    unlocked = true,
    discovered = false,
    available = true,
    requires = {'v_cbean_nameteam_more_choices'},
    config = {extra = {odds_low = 1, odds_high = 4, new_round = true}},
    beans_credits = {
        team = "Name Team",
        idea = "TheAltDoc",
        art = "N/A",
        code = "TheAltDoc",
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.odds_low,card.ability.extra.odds_high}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.new_round = true
        end
        if context.cbean_entered_stationery and card.ability.extra.new_round then
            card.ability.extra.new_round = false
            local create_card = pseudorandom('nteam_free_sample') < (G.GAME.probabilities.normal*card.ability.extra.odds_low)/card.ability.extra.odds_high
            if create_card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.consumeables then
                            local card = SMODS.add_card({
                                set = "cbean_StickerSheet",
                                area = G.consumeables,
                                no_edition = true,
                            })
                            return true
                        end
                    end,
                }))
            end
        end
    end
})