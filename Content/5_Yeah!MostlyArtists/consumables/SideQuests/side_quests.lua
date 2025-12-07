SMODS.Consumable {
    set = "yma_quest",
    key = "yma_credit_card",

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
        idea = "",
        art = "",
        code = "cloudzXIII",
    }
}

SMODS.Consumable {
    set = "yma_quest",
    key = "yma_burglar",
    rarity = 2,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_burglar
        return {
            vars = {
                card.ability.extra.diamonds
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 0, y = 0 },
    display_size = { w = 65, h = 65 },

    config = {
        extra = {
            diamonds = 2
        }
    },

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_suit("Diamonds") then
                    SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)
                    card.ability.extra.diamonds = card.ability.extra.diamonds - 1
                end
            end

            if card.ability.extra.diamonds <= 0 then
                card.ability.extra.diamonds = 2
                YMA.complete_quest(card, "Joker", "j_burglar")
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Flynn",
        art = "",
        code = "cloudzXIII",
    }
}

SMODS.Consumable {
    set = "yma_quest",
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
    pos = { x = 0, y = 0 },
    display_size = { w = 65, h = 65 },

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
        if context.end_of_round and not context.blueprint and not context.repetition then
            card.ability.extra.discards_remaining = card.ability.extra.discards
            SMODS.calculate_effect({ message = localize('k_reset') }, card)
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Flynn",
        art = "",
        code = "cloudzXIII",
    }
}
