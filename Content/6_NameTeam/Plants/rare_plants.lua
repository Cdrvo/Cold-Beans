SMODS.Joker({
    key = "tallnut",
    cost = 5,
    rarity = 3,
    blueprint_compat = false,
    config = {
        extra = {
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
    end,
    update = function(self,card)
        if card and card.area and card.area.cards and card.added_to_deck then
            for k, v in pairs(card.area.cards) do
                if v.debuff then v.debuff = false end
            end
        end
    end
})

SMODS.Joker({
    key = "split_pea",
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 2,
            mult = 25
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult,cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            if card:closer_to() == "left" then
                return{
                    xmult = cae.xmult
                }
            else
                return{
                    mult = cae.mult
                }
            end
        end
    end,
})