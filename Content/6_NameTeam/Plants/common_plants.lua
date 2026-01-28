SMODS.Joker({
    key = "peashooter",
    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            blind = 0.9
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{
            vars={cae.blind}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.first_hand_drawn and not context.blueprint and G.GAME.blind and G.GAME.blind.chips then
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.3,
            func=function()
                G.GAME.blind.chips = G.GAME.blind.chips*cae.blind
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                NAMETEAM.msg(card, "X"..cae.blind)
                return true
            end
        }))
        end
    end
})


SMODS.Joker({
    key = "sunflower",
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    config = {
        extra = {
            dollars = 8,
            odds = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        local num,den = SMDOS.get_probability_vars(card,1,cae.odds,"sunflower_seedssomething")
        return{
            vars={num,den,cae.dollars}
        }
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    calc_dollar_bonus = function(self,card)
        if SMODS.pseudorandom_probability(card,"sunflower_seedsomething",1,card.ability.extra.odds) then
            return card.ability.extra.dollars
        end
    end
})
