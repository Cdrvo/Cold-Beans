SMODS.Joker {
    key = "colon_sophron",
    name = "Sophron",
    atlas = "colon_JokerAtlas",
    pos = { x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,

    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play and not context.end_of_round then
            local times = 0
            for i, other_card in pairs(G.play.cards) do
                if other_card == context.other_card then
                    times = i-1
                end
            end
            if times < 1 then
                return
            end
            return {
                repetitions = times
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "bitter",
        code = "bitter",
    }
}

SMODS.Joker {
    key = "colon_plato",
    name = "Plato",
    atlas = "colon_JokerAtlas",
    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {
                    HEX("87a365"), -- colour text formatted with {V:1}
                },
            }
        }
    end,
    add_to_deck = function (self, card, from_debuff)
        if not from_debuff then
            Colonparen.recalculateBlinds(card)
        end
    end,
    calculate = function(self, card, context)
        if context.cbean_colon_set_blind then
            if context.blind_type == "CEO" then
                return {
                    blind = Colonparen.get_new_blind("Lower_Greek")
                }
            end
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

SMODS.Joker {
    key = "colon_aristotle",
    name = "Aristotle",
    atlas = "colon_JokerAtlas",
    pos = { x = 2, y = 1 },
    soul_pos = { x = 3, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        code = "N/A",
    }
}

SMODS.Joker {
    key = "colon_aristoxenus",
    name = "Aristoxenus",
    atlas = "colon_JokerAtlas",
    pos = { x = 6, y = 1 },
    soul_pos = { x = 7, y = 1 },
    config = {
        extra = {
            xmult_mod = 0.1,
            xmult = 1
        }
    },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        code = "N/A",
    }
}

-- SMODS.Joker {
--     key = "colon_hippo",
--     config = {
--         extra = {
--             handsize = 0,
--             playing_cards = {}
--         }
--     },
--     atlas = "colon_JokerAtlas",
--     pos = { x = 0, y = 1 },
--     soul_pos = { x = 1, y = 1 },
--     rarity = 4,
--     cost = 20,
--     blueprint_compat = true,
--     loc_vars = function(self, info_queue, card)
--         return {
--             vars = {
--                 card.ability.extra.handsize,
--             }
--         }
--     end,

--     add_to_deck = function (self, card)
--         card.ability.extra.playing_cards = G.playing_cards
--     end,
--     calculate = function(self, card, context)
--         local handsize = card.ability.extra.handsize
--         if context.playing_card_added then
--             handsize = handsize + 1
--             print("yay!!!")
--             print(G.playing_card)
--             card.ability.extra.playing_cards = G.playing_cards
--         else
--             if card.ability.extra.playing_cards == G.playing_cards then return end
--             handsize = handsize - 1
--             print("Fuck you")
--             card.ability.extra.playing_cards = G.playing_cards
--         end
--     end,
--     beans_credits = {
--         team = ":(",
--         idea = "Glitchkat10",
--         code = "bitter",
--     }
-- }
