SMODS.Joker { 
    key = "0chill_mad_mailer", 
    atlas = "0chill_joker_atlas",
    pos = { x = 0, y = 3 },
    rarity = 1,
    order = 1,
    blueprint_compat = true,
    cost = 7,
    config = { 
        extra = { 
            money = 20,
        },
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = SMODS.Stickers["cbean_mailed"]
        info_queue[#info_queue + 1] = SMODS.Stickers["cbean_hooking"]
        return { 
            vars = { 
                card.ability.extra.money,
            } 
        }
    end,

    calculate = function(self, card, context) --This is in part modifed from vanilla remade's trading card
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.pre_discard and not context.blueprint and
            G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 and not G.hand.highlighted[1].ability.cbean_mailed then
            context.full_hand[1]:add_sticker("cbean_mailed", true)
            context.full_hand[1]:add_sticker("cbean_hooking", true)
            return {
                dollars = card.ability.extra.money,
                delay = 0.45
            }
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"restruct",
             "MarioFan597"
        },
        art =  "MarioFan597",
        code = "MarioFan597",
    }
}