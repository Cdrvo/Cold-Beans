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
                card.ability.extra.money_remaining
            }
        }
    end,

    --atlas = '',
    pos = { x = 0, y = 0 },
    display_size = { w = 64, h = 64 },

    loc_txt = {
        name = "credit card quest?!",
        text = {
            "Spend {C:money}$20{} {C:inactive}(#1#){}",
            "in a single {C:attention}shop{}",
            "to create {C:attention}Credit Card{}",
        }
    },

    config = {
        extra = {
            money_remaining = 20
        }
    },

    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.extra.money_remaining = 0
            SMODS.calculate_effect({ message = localize('k_reset') }, card)
        end

        -- Buying a card
        if context.buying_card and context.card and context.card.cost then
            card.ability.extra.money_remaining = card.ability.extra.money_remaining - context.card.cost
            context.card.cost = 0
            SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)
        end

        --Buying a booster pack
        if context.open_booster and context.card and context.card.cost then
            card.ability.extra.money_remaining = card.ability.extra.money_remaining - context.card.cost
            context.card.cost = 0
            SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)
        end

        -- Rerolling the shop
        if context.reroll_shop then
            card.ability.extra.money_remaining = card.ability.extra.money_remaining -
            (G.GAME.current_round.reroll_cost - 1)
            SMODS.calculate_effect({ message = localize('k_upgrade_ex') }, card)
        end

        if card.ability.extra.money_remaining <= 0 then
            card.ability.extra.money_remaining = 20
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

    --atlas = '',
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
