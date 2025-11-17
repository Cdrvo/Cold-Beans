Colonparen.CEOBlind {
    key = "sdown_sinker",
    name = "The Sinker",
    pos = { x = 0, y = 22 },
    boss = { min = 1 },
    atlas = "colon_CEOBlind",
    mult = 3,
    boss_colour = HEX("5933BB"),
    in_pool = function()
        if (G.GAME.modifiers.no_shop_jokers)then
            return false
        end
        if G.jokers then
            if G.jokers.cards then
                if #G.jokers.cards <= 1 then
                    return false
                end
            end
        end
        return true
    end,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                if #G.jokers.cards > 1 then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.jokers:shuffle('aajk')
                                    play_sound('cardSlide1', 0.85)
                                    return true
                                end,
                            }))
                            delay(0.15)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.jokers:shuffle('aajk')
                                    play_sound('cardSlide1', 1.15)
                                    return true
                                end
                            }))
                            delay(0.15)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.jokers:shuffle('aajk')
                                    play_sound('cardSlide1', 1)
                                    return true
                                end
                            }))
                            delay(0.5)
                            return true
                        end
                    }))
                end
            end
        end
    end,
    --if this ends up being rightmost after everything i do just change the text and make it always have been rightmost all along idk
    recalc_debuff = function(self, card, from_blind)
        if G.GAME.blind.disabled then return false end
        if card.area == G.jokers and #G.jokers > 0 and card == G.jokers[#G.jokers] then
            SMODS.debuff_card(card, true, 'the_sinker')
            return true
        end
        return false
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "Athebyne",
    }
}