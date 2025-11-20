
SMODS.ConsumableType {
    key = 'sdown_blessing',
    default = 'c_cbean_sdown_ares',
    primary_colour = HEX('E89A35'),
    secondary_colour = HEX('BA6900'),
    -- text_colour = HEX('F1C100'),
    collection_rows = { 6, 6 },
    shop_rate = 1,
    loc_txt = {
        name = "Blessing",
        collection = "Blessing",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase this card",
                "in an unseeded",
                "run to learn",
                "what it does"
            }
        }
    },
}

SMODS.Consumable {
    key = 'sdown_ares',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Ares',
        text = {
            "Retrigger all played",
            "{C:attention}numbered cards{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        times_left = 3,
        should_tick_down = false,
    },
    pos = { x = 0, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "",
        art = "",
        code = "notmario",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.times_left } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and 
            ((not context.other_card:is_face()) and context.other_card:get_id() ~= 14) then
            card.should_tick_down = true
            return {
                repetitions = 1
            }
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.times_left = card.ability.times_left - 1
            if card.ability.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                return {
                    message = (card.ability.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_athena',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Athena',
        text = {
            "Retrigger all played",
            "{C:attention}Aces{} and {C:attention}face cards{}",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)"
        }
    },
    config = {
        times_left = 3,
        should_tick_down = false,
    },
    pos = { x = 1, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "",
        art = "",
        code = "notmario",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.times_left } }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and 
            (context.other_card:is_face() or context.other_card:get_id() == 14) then
            card.should_tick_down = true
            return {
                repetitions = 1
            }
        end
        if context.after and card.should_tick_down then
            card.should_tick_down = false
            card.ability.times_left = card.ability.times_left - 1
            if card.ability.times_left <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
            else
                return {
                    message = (card.ability.times_left).."/3"
                }
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

SMODS.Consumable {
    key = 'sdown_aphrodite',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Aphrodite',
        text = {
            "Add permanent copies",
            "of scored cards to deck",
            "{C:inactive}({C:attention}#1#{C:inactive} cards left)"
        }
    },
    config = {
        times_left = 5
    },
    pos = { x = 2, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "",
        art = "",
        code = "",
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.times_left } }
    end,
--TODO: actually get the cards inside of the deck instead of just kinda floating there :man_in_business_suit_levitating:
    calculate = function(self, card, context)
        if context.before then
            for i = 1, #context.scoring_hand do
                if card.ability.times_left > 0 then
                    local card_copied = copy_card(context.scoring_hand[i], nil, nil, G.playing_card)
                    G.deck:emplace(card_copied)
                    card_copied:add_to_deck()
                    card.ability.times_left = card.ability.times_left - 1
                    SMODS.calculate_effect({message = localize('k_copied_ex'),colour = G.C.CHIPS }, context.scoring_hand[i])
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                            return true
                        end
                    }))
                end
                if card.ability.times_left <= 0 then
                    SMODS.destroy_cards(card, nil, nil, true)
                    return
                else
                    SMODS.calculate_effect({message = (card.ability.times_left).."/5" }, card)
                end
            end
        end
    end,

    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}

--TODO: i'm not touching that somebody else whos better at me can do the on-spawn randomness lock in ive had enough
--nightmares from The Regression
SMODS.Consumable {
    key = 'sdown_demeter',
    set = 'sdown_blessing',
    atlas = 'blessing_atlas',
    cost = 3,
    loc_txt = {
        name = 'The Blessing of Demeter',
        text = {
            "{C:green}#2# in #3#{} chance for each",
            "played {C:attention}#4#{} to create a",
            "consumable card when scored",
            "{C:inactive}({C:attention}#1#{C:inactive} hands left)",
            "{C:red}NOT YET IMPLEMENTED{}"
        }
    },
    config = {
        times_left = 3,
        odds = 4
    },
    pos = { x = 3, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "",
        art = "",
        code = "",
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.odds, 'cbean_sdown_demeter')
        return { vars = { card.ability.times_left, numerator, denominator, localize('demeter_random_rank') } }
    end,
    collection_loc_vars = function (self)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.odds, 'cbean_sdown_demeter')
        return {
            vars = {
                card.ability.times_left,
                numerator,
                denominator,
                localize('demeter_random_rank')
            }
        }
    end,
    calculate = function(self, card, context)

    end,
    use = function(self, card, area, copier)
        return nil
    end,
    can_use = function(self, card)
        return false
    end
}