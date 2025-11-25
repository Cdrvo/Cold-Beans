SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_house_rules", 
    atlas = "0chill_joker_atlas",
    pos = { x = 2, y = 0 },
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
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art =  "cmykl",
        code = "MarioFan597",
    }
}