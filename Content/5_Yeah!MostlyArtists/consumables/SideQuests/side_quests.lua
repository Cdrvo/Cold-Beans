SMODS.Consumable {
    set = "yma_quest",
    key = "yma_credit_card",

    -- need to prolly add this to some pool (this is just cosmetic as of now)
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge("Common", G.C.BLUE, G.C.WHITE, 1.2)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.money_remaining
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 0, y = 0 },
    display_size = { w = 64, h = 64 },

    loc_txt = {
        name = "credit card quest?!",
        text = {
            "Spend {C:money}$#1#{} {C:inactive}(#2#){}",
            "in a single {C:attention}shop{}",
            "to create {C:attention}Credit Card{}",
        }
    },

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

    -- need to prolly add this to some pool (this is just cosmetic as of now)
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge("Uncommon", G.C.GREEN, G.C.WHITE, 1.2) -- need to prolly add this to some pool
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.diamonds
            }
        }
    end,

    atlas = 'yma_quest_atlas',
    pos = { x = 0, y = 0 },
    display_size = { w = 64, h = 64 },

    config = {
        extra = {
            diamonds = 2
        }
    },

    loc_txt = {
        name = "burglar side quest?!",
        text = {
            "Destroy {C:attention}2{} {C:inactive}(#1#){} cards with",
            "a {C:diamonds}Diamond{} suit",
            "to create {C:attention}Burglar{}",
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
