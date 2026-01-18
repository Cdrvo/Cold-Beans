

SMODS.ConsumableType {
    key = 'sdown_czodiac',
    default = 'c_cbean_sdown_dragon',
    primary_colour = HEX('F1C100'),
    secondary_colour = HEX('BA000E'),
    text_colour = HEX('F1C100'),
    collection_rows = { 6, 6 },
    shop_rate = 2,
    loc_txt = {
        name = "Chinese Zodiac",
        collection = "Chinese Zodiacs",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase or use",
                "this card in an",
                "unseeded run to",
                "learn what it does"
            }
        }
    },
}

-- uh how does this work again
-- don't worry, I got your back ;P (HuyTheKiller from Pissboys)
SMODS.UndiscoveredSprite {
    key = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    pos = { x = 0, y = 3 },
    no_overlay = true
}

function CZodiacUse(card, rank1, rank2, rank3)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
            return true
        end
    }))
    for i=1, #G.hand.highlighted do
        local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.highlighted[i]:flip();play_sound('card1', percent);G.hand.highlighted[i]:juice_up(0.3, 0.3);return true end }))
    end
    delay(0.2)

    local highlighted_table = {}
    table.insert(highlighted_table, {card = G.hand.highlighted[1], placement = G.hand.highlighted[1].T.x})
    table.insert(highlighted_table, {card = G.hand.highlighted[2], placement = G.hand.highlighted[2].T.x})
    table.insert(highlighted_table, {card = G.hand.highlighted[3], placement = G.hand.highlighted[3].T.x})
    table.sort(highlighted_table, function(a, b) return a.placement < b.placement end)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            SMODS.change_base(highlighted_table[1].card, nil, rank1)
            SMODS.change_base(highlighted_table[2].card, nil, rank2)
            SMODS.change_base(highlighted_table[3].card, nil, rank3)
            return true
        end
    }))
    for i = 1, #G.hand.highlighted do
        local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                G.hand.highlighted[i]:flip()
                play_sound('tarot2', percent, 0.6)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
                return true
            end
        }))
    end
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.2,
        func = function()
            G.hand:unhighlight_all()
            return true
        end
    }))
    delay(0.5)
end

SMODS.Consumable {
    key = 'sdown_rat',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Rat',
        text = {
            "Turn {C:attention}3{} selected cards into an",
            "{C:attention}Ace{}, {C:attention}2{}, and a {C:attention}3{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = 'Ace',
        rank2 = '2',
        rank3 = '3'
    },
    pos = { x = 1, y = 2},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "L'",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_ox',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Ox',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}2{}, {C:attention}3{}, and a {C:attention}4{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '2',
        rank2 = '3',
        rank3 = '4'
    },
    pos = { x = 2, y = 0},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_tiger',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Tiger',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}3{}, {C:attention}4{}, and a {C:attention}5{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '3',
        rank2 = '4',
        rank3 = '5'
    },
    pos = { x = 0, y = 0},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_rabbit',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Rabbit',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}4{}, {C:attention}5{}, and a {C:attention}6{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '4',
        rank2 = '5',
        rank3 = '6'
    },
    pos = { x = 0, y = 2},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_dragon',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Dragon',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}5{}, {C:attention}6{}, and a {C:attention}7{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '5',
        rank2 = '6',
        rank3 = '7'
    },
    pos = { x = 0, y = 1},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_snake',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Snake',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}6{}, {C:attention}7{}, and an {C:attention}8{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '6',
        rank2 = '7',
        rank3 = '8'
    },
    pos = { x = 3, y = 1},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "L'",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_horse',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Horse',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}7{}, {C:attention}8{}, and a {C:attention}9{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '7',
        rank2 = '8',
        rank3 = '9'
    },
    pos = { x = 3, y = 2},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_goat',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Goat',
        text = {
            "Turn {C:attention}3{} selected cards into an",
            "{C:attention}8{}, {C:attention}9{}, and a {C:attention}10{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '8',
        rank2 = '9',
        rank3 = '10'
    },
    pos = { x = 2, y = 2},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_monkey',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Monkey',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}9{}, {C:attention}10{}, and a {C:attention}Jack{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '9',
        rank2 = '10',
        rank3 = 'Jack'
    },
    pos = { x = 3, y = 0},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "L'",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_rooster',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Rooster',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}10{}, {C:attention}Jack{}, and a {C:attention}Queen{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = '10',
        rank2 = 'Jack',
        rank3 = 'Queen'
    },
    pos = { x = 1, y = 0},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "L'",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_dog',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Dog',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}Jack{}, {C:attention}Queen{}, and a {C:attention}King{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = 'Jack',
        rank2 = 'Queen',
        rank3 = 'King'
    },
    pos = { x = 2, y = 1},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

SMODS.Consumable {
    key = 'sdown_pig',
    set = 'sdown_czodiac',
    atlas = 'czodiac_atlas',
    cost = 2,
    loc_txt = {
        name = 'The Pig',
        text = {
            "Turn {C:attention}3{} selected cards into a",
            "{C:attention}Queen{}, {C:attention}King{}, and an {C:attention}Ace{}, respectively",
            "{C:inactive}(Drag to rearrange)"
        }
    },
    config = {
        rank1 = 'Queen',
        rank2 = 'King',
        rank3 = 'Ace'
    },
    pos = { x = 1, y = 1},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "Slipstream",
        code = "Athebyne",
    },
    use = function(self, card, area, copier)
        CZodiacUse(card,card.ability.rank1,card.ability.rank2,card.ability.rank3)
    end,
    can_use = function(self, card)
        if G.hand and #G.hand.highlighted == 3 then
            for i = 1, #G.hand.highlighted do
                if SMODS.has_no_rank(G.hand.highlighted[i]) then
                    return false
                end
            end
            return true
        end
    end
}

