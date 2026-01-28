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



SMODS.Joker({
    key = "sun_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = false,
    config = {
        extra = {
            rounds = 0,
            rounds_max = 2,
            dollars = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.dollars,cae.rounds_max,cae.rounds}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.end_of_round and context.main_eval and not context.blueprint then
            if cae.rounds<cae.rounds_max then
                cae.rounds = cae.rounds + 1
            else
                card:set_ability("j_cbean_sunnier_shroom")
            end
        end
    end,
    calc_dollar_bonus = function(self,card)
        return card.ability.extra.dollars
    end
})

SMODS.Joker({ -- literally copypaste :D
    key = "sunnier_shroom",
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
    end,
    in_pool = function(self)
        return false
    end
})



SMODS.Joker({
    key = "grave_buster",
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1.25
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then 
            local card = pseudorandom_element(G.jokers.cards,pseudoseed("gravebustingggg"))
            for k, v in pairs(SMODS.Stickers) do
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    delay = 0.1, -- holy crash material man
                    func = function()
                        if card.ability[v.key] then
                            card:remove_sticker(v.key, true)
                        end
                        return true
                    end
                }))
            end
        end
    end,
})