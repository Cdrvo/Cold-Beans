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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
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

SMODS.Joker({
    key = "starfruit",
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            mult = 10,
            chips = 15,
            xmult = 1.5,
            dollars = 1,
            discards = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.chips,cae.mult,cae.xmult,cae.dollars,cae.discards}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.setting_blind then
            ease_discard(cae.discards)
        end
        if context.joker_main then
            return{
                xmult = cae.xmult,
                chips = cae.chips,
                mult = cae.mult
            }
        end
    end,
    calc_dollar_bonus = function(self,card)
        return card.ability.extra.dollars
    end
})