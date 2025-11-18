Colonparen.TeenyBlind{
    key = "colon_wee",
    pos = { x = 0, y = 0 },
	atlas = "colon_TeenyBlind",
    mult = 0.5,
    dollars = 2,
	boss_colour = HEX("f58610"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}

Colonparen.TeenyBlind{
    key = "colon_handsy",
    pos = { x = 0, y = 1 },
	atlas = "colon_TeenyBlind",
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("009cfd"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },        
    set_blind = function(self, reset, silent)
        if not reset then
            ease_hands_played(1)
        end
    end,
    disable = function(self)
        ease_hands_played(-1)
    end
}

Colonparen.TeenyBlind{
    key = "colon_clumsy",
    pos = { x = 0, y = 2 },
	atlas = "colon_TeenyBlind",
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("658e7f"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },        
    set_blind = function(self, reset, silent)
        if not reset then
            ease_discard(1)
        end
    end,
    disable = function(self)
        ease_discard(-1)
    end
}

-- soo if you want to make this properly X2
-- and deal with the To The Moon disaster have fun
-- -candycane
Colonparen.TeenyBlind{
    key = "colon_charitable",
    boss = {min = 2},
    pos = { x = 0, y = 3 },
	atlas = "colon_TeenyBlind",
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("94e5c4"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },

   set_blind = function(self)
       G.GAME.interest_amount = G.GAME.interest_amount + 1
   end,

   defeat = function(self)
       G.E_MANAGER:add_event(Event({
           blocking = false,
           func = function()
               if G.STATE == G.STATES.ROUND_EVAL then return false end
               G.GAME.interest_amount = G.GAME.interest_amount - 1
               return true
           end
       }))
   end,

}

Colonparen.TeenyBlind{
    key = "colon_jolly",
    pos = { x = 0, y = 4 },
	atlas = "colon_TeenyBlind",
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("3e276b"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    calculate = function (self, blind, context)
        if context.before and next(context.poker_hands["Pair"]) then
            SMODS.add_card {
                set = "Enhanced"
            }
        end
    end
}

Colonparen.TeenyBlind{
    key = "colon_cutesy",
    pos = { x = 0, y = 5 },
	atlas = "colon_TeenyBlind",
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("e7aac7"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    calculate = function (self, blind, context)
        if context.before and next(context.poker_hands["Flush"]) and (#G.hand.cards > 0) then
            if #G.hand.cards < 3 then
                for i, card in ipairs(G.hand.cards) do
                    card:set_ability(G.P_CENTERS.m_wild, nil, true)
                end
            else
                local cards = {};
                for i, card in ipairs(G.hand.cards) do
                    cards[#cards+1] = card
                end
                local first, to_remove = pseudorandom_element(cards, pseudoseed('cutesy'))
                first:set_ability(G.P_CENTERS.m_wild, nil, true)
                table.remove(cards, to_remove)
                local second, _ = pseudorandom_element(cards, pseudoseed('cutesy'))
                second:set_ability(G.P_CENTERS.m_wild, nil, true)
            end
        end
    end
}

Colonparen.TeenyBlind{
    key = "colon_pretty",
    pos = { x = 0, y = 6 },
	atlas = "colon_TeenyBlind",
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("f03c61"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    calculate = function (self, blind, context)
        if context.before and next(context.poker_hands["Straight"]) and (#G.hand.cards > 0) then
            local _mostplayed, _mptally = nil, -1
            local _leastplayed, _lptally = nil, math.huge
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _mptally then
                    _mostplayed = v
                    _mptally = G.GAME.hands[v].played
                end
                if G.GAME.hands[v].visible and G.GAME.hands[v].played < _lptally then
                    _leastplayed = v
                    _lptally = G.GAME.hands[v].played
                end
            end
            G.GAME.hands[_mostplayed].tmcmirror_dualorbit = G.GAME.hands[_mostplayed].tmcmirror_dualorbit or {};
            G.GAME.hands[_leastplayed].tmcmirror_dualorbit = G.GAME.hands[_leastplayed].tmcmirror_dualorbit or {};
            G.GAME.hands[_mostplayed].tmcmirror_dualorbit[#G.GAME.hands[_mostplayed].tmcmirror_dualorbit+1] = _leastplayed;
            G.GAME.hands[_leastplayed].tmcmirror_dualorbit[#G.GAME.hands[_leastplayed].tmcmirror_dualorbit+1] = _mostplayed;
            local _mostplayedplanet;
            local _leastplayedplanet;
            for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                if v.config.hand_type == _leastplayed then
                    _leastplayedplanet = v.key
                end
                if v.config.hand_type == _mostplayed then
                    _mostplayedplanet = v.key
                end
                if _mostplayedplanet and _leastplayedplanet then
                    break
                end
            end
            SMODS.add_card{
                key = _mostplayedplanet,
                edition = "e_negative"
            }
            SMODS.add_card{
                key = _leastplayedplanet,
                edition = "e_negative"
            }
        end
    end
}

Colonparen.TeenyBlind{
    key = "colon_thirsty",
    name = "Thirsty Blind",
    config = {
        dollars = 1
    },
    atlas = "colon_TeenyBlind",
    pos = { x = 0, y = 7 },
    mult = 0.75,
    dollars = 2,
	boss_colour = HEX("817ea7"),
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.dollars
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                self.config.dollars
            }
        }
    end,
    calculate = function (self, blind, context)
        if context.individual and context.cardarea == G.play then
            return {
                dollars = self.config.dollars
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "Glitchkat10",
    }
}

-- Colonparen.TeenyBlind{
--     key = "colon_sleepy",
--     name = "Sleepy Blind",
--     config = {
--         odds = 2
--     },
--     atlas = "colon_TeenyBlind",
--     pos = { x = 0, y = 8 },
--     mult = 0.75,
-- 	boss_colour = HEX("817ea7"),
--     loc_vars = function(self, info_queue, card)
--         local numerator, denominator = SMODS.get_probability_vars(card, 1, self.config.odds, "bl_cbeans_colon_sleepy")
--         return {
--             vars = {
--                 numerator,
--                 denominator
--             }
--         }
--     end,
--     collection_loc_vars = function(self, info_queue, card)
--         local numerator, denominator = SMODS.get_probability_vars(card, 1, self.config.odds, "bl_cbeans_colon_sleepy")
--         return {
--             vars = {
--                 numerator,
--                 denominator
--             }
--         }
--     end,
--     set_blind = function(self, reset, silent)
--         if true then
--             G.E_MANAGER:add_event(Event({
--                 trigger = "after",
--                 delay = 1,
--                 func = function()
--                     G.E_MANAGER:add_event(Event({
--                         trigger = "after",
--                         delay = 1,
--                         func = function()
--                             G.GAME.chips = G.GAME.blind.chips
--                             G.STATE = G.STATES.HAND_PLAYED
--                             G.STATE_COMPLETE = true
--                             end_round()
--                             return true
--                         end
--                     }))
--                     return true
--                 end
--             }))
--         end
--     end,
--     beans_credits = {
--         team = ":(",
--         idea = "Glitchkat10",
--         art = "George The Rat",
--         code = "Glitchkat10",
--     }
-- }
