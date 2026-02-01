SMODS.Joker {                   --Modifed from Vanilla Remade's example
    key = "0chill_house_rules",
    atlas = "NAMETEAM_Jokers3", -- NERDSSSSSS GET ABSOLUTELY ANIMATED YOU ABSOLUTE NERDS
    pos = { x = 6, y = 5 },
    cbean_anim = {
        { xrange = { first = 6, last = 11 }, y = 5, t = 0.1 },
        { xrange = { first = 0, last = 3 },  y = 6, t = 0.1 }
    },
    pos_extra = { x = 4, y = 6 },
    cbean_anim_extra = {
        { x = 4, y = 6, t = 0.05 },
        { x = 5, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },
        { xrange = { first = 4, last = 5 }, y = 6, t = 0.25 },

        { x = 6,                            y = 6, t = 0.5 * 0.01 },
        { x = 7,                            y = 6, t = 0.5 * 0.015 },
        { x = 8,                            y = 6, t = 0.5 * 0.02 },
        { x = 9,                            y = 6, t = 0.5 * 0.025 },
        { x = 10,                           y = 6, t = 0.5 * 0.03 },
        { x = 11,                           y = 6, t = 0.5 * 0.035 },
        { x = 0,                            y = 7, t = 0.5 * 0.04 },
        { x = 1,                            y = 7, t = 0.5 * 0.045 },
        { x = 2,                            y = 7, t = 0.5 * 0.05 },
        { x = 3,                            y = 7, t = 0.5 * 0.055 },
        { x = 4,                            y = 7, t = 0.5 * 0.06 },
        { x = 5,                            y = 7, t = 0.5 * 0.065 },
        { x = 6,                            y = 7, t = 0.5 * 0.07 },
        { x = 7,                            y = 7, t = 0.5 * 0.075 },
        { x = 8,                            y = 7, t = 0.5 * 0.08 },
        { x = 9,                            y = 7, t = 0.5 * 0.085 },
        { x = 10,                           y = 7, t = 0.5 * 0.09 },
        { x = 11,                           y = 7, t = 0.5 * 0.095 },
        { x = 0,                            y = 8, t = 0.5 * 0.1 },
        { x = 1,                            y = 8, t = 0.5 * 0.105 },
        { x = 2,                            y = 8, t = 2 },

        { x = 1,                            y = 8, t = 0.5 * 0.105 },
        { x = 0,                            y = 8, t = 0.5 * 0.1 },
        { x = 11,                           y = 7, t = 0.5 * 0.095 },
        { x = 10,                           y = 7, t = 0.5 * 0.09 },
        { x = 9,                            y = 7, t = 0.5 * 0.085 },
        { x = 8,                            y = 7, t = 0.5 * 0.08 },
        { x = 7,                            y = 7, t = 0.5 * 0.075 },
        { x = 6,                            y = 7, t = 0.5 * 0.07 },
        { x = 5,                            y = 7, t = 0.5 * 0.065 },
        { x = 4,                            y = 7, t = 0.5 * 0.06 },
        { x = 3,                            y = 7, t = 0.5 * 0.055 },
        { x = 2,                            y = 7, t = 0.5 * 0.05 },
        { x = 1,                            y = 7, t = 0.5 * 0.045 },
        { x = 0,                            y = 7, t = 0.5 * 0.04 },
        { x = 11,                           y = 6, t = 0.5 * 0.035 },
        { x = 10,                           y = 6, t = 0.5 * 0.03 },
        { x = 9,                            y = 6, t = 0.5 * 0.025 },
        { x = 8,                            y = 6, t = 0.5 * 0.02 },
        { x = 7,                            y = 6, t = 0.5 * 0.015 },
        { x = 6,                            y = 6, t = 0.5 * 0.01 },
        { xrange = { first = 3, last = 7 }, y = 8, t = 0.04 },
    },
    rarity = 3,
    blueprint_compat = true,
    cost = 8,
    --loc_vars = function(self, info_queue, card)
    --return { vars = { card.ability.extra.x_mult, localize(card.ability.extra.type, 'poker_hands') } }
    --end,
    --calculate = function(self, card, context)
    --if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
    --return {
    --x_mult = card.ability.extra.x_mult
    --}
    --end
    --end,
    add_to_deck = function(self, card, from_debuff)
        --G.GAME.hands["cbean_0chill_fibonacci"].discovered = true
        --G.GAME.hands["cbean_0chill_fibonacci_flush"].discovered = true
    end,
    beans_credits = {
        team = { "0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art = "cmykl",
        code = "MarioFan597",
    }
}

--heyo its me Athebyne. we're starting to get quite a few house rule hands (and i hope we get even more, i unfortunately
--didn't do as many as I wanted to..) might be a good idea to make all hands always visible if you can play them
--instead of that only happening to HR House Rules?
--also might be fun to have a challenge that makes you have every HR hand available, but regular hands no longer work

-- might also be fun to ANIMATE YOUR JOKER AHAHAHA GET RECK'D
