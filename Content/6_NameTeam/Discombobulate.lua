SMODS.Atlas({
    key = "NAMETEAM_OtherConsumables",
    path = "6_NameTeam/ColdBeansOtherConsumables.png",
    px = 71,
    py = 95
})

SMODS.Consumable {
    key = 'nameteam_discombobulate',
    set = "Combo",
    atlas = "NAMETEAM_OtherConsumables",
    cost = 5,
    config = {
        immutable = {
            combo_type = "special",
            sequence = 0
        },
        extra = {
            retrigger = 1
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.retrigger } }
    end,
    pos = { x = 0, y = 0 },
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier)
        if G.GAME.blind.in_blind and CanCombo(card)
        then
            SelectCombo(card)
        elseif G.GAME.blind.in_blind and CanUncombo(card) then
            UnselectCombo(card)
        else
            return nil
        end
    end,
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card ~= context.scoring_hand[1] and context.other_card ~= context.scoring_hand[#context.scoring_hand] and card.ability.immutable.sequence > 0 then
            return {
                repetitions = card.ability.extra.retrigger
            }
        end
        if context.after and card.ability.immutable.sequence > 0 then
            SMODS.destroy_cards(card, nil, nil, true)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if CanUncombo(card) and card.ability.immutable.sequence > 0 then
            UnselectCombo(card)
        end
    end,
    beans_credits = {
        team = { "Name Team" },
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt"
    }
}
