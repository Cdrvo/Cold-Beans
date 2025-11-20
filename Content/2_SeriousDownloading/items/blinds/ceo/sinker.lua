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
                            G.E_MANAGER:add_event(Event({
                                func = function ()
                                    if #G.jokers.cards > 0 then
                                        SMODS.debuff_card(G.jokers.cards[1], true, 'the_sinker')
                                    end
                                    return true
                                end
                            }))
                            return true
                        end
                    }))
                end
            end
        end
    end,
    defeat = function (self)
        if #G.jokers.cards > 0 then
            SMODS.debuff_card(G.jokers.cards[1], false, 'the_sinker')
        end
    end,
    disable = function (self)
        if #G.jokers.cards > 0 then
            SMODS.debuff_card(G.jokers.cards[1], false, 'the_sinker')
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    }
}

--Ty Paperback!
local move_ref = Moveable.drag
function Moveable.drag(self, offset)
    if self.is and type(self.is) == "function" and self:is(Card) and self.ability.set == 'Joker' then
        if G and G.GAME and G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.config.blind.key == 'bl_cbean_sdown_sinker' then
            return
        end
    end
    return move_ref(self, offset)
end