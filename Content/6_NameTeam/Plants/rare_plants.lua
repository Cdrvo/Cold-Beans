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

SMODS.Joker({
    key = "garlic",
    cost = 5,
    rarity = 3,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 3
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.joker_main then
            return{
                xmult = cae.xmult,
            }
        end
        if context.cbean_first and context.cardarea == G.jokers and G.jokers.cards and #G.jokers.cards>0 then
            local j1_pos_old = -1
            local j1_pos_new = -1

            local j2_pos_old = -1
            local j2_pos_new = -1

            local joker1, joker2 = pseudorandom_element(G.jokers.cards,pseudoseed("AE")), pseudorandom_element(G.jokers.cards,pseudoseed("AE"))

            for k, v in pairs(G.jokers.cards) do
                if v == joker1 then
                    j1_pos_old = k
                end
                if v == joker2 then
                    j2_pos_old = k
                end
            end

            j1_pos_new = math.random(1, #G.jokers.cards)
            j2_pos_new = math.random(1, #G.jokers.cards)

            while j1_pos_old == j1_pos_new do
                j1_pos_new = math.random(1, #G.jokers.cards)
            end
            while j2_pos_old == j2_pos_new do
                j2_pos_new = math.random(1, #G.jokers.cards)
            end
            while j2_pos_new == j1_pos_new do
                j2_pos_new = math.random(1, #G.jokers.cards)
            end
            G.E_MANAGER:add_event(Event({ 
                trigger = "before",
                blockable = "false",
                func = function() 
                    table.insert(G.jokers.cards, j1_pos_new, table.remove(G.jokers.cards,j1_pos_old))
                    play_sound('cardSlide1', 0.85)
                    table.insert(G.jokers.cards, j2_pos_new, table.remove(G.jokers.cards,j2_pos_old))
                    play_sound('cardSlide1', 0.85)
                    return true
                end 
            })) 
            
        end
    end,
})

SMODS.Joker({
    key = "umbrella_leaf",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 2,
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
        local rr = nil
        if card and card.area and card.area.cards and card.added_to_deck then
            for i = 1, #card.area.cards do 
                if card.area.cards[i] == card then
                    rr = i
                end
            end
            if rr and card.area.cards[rr+1] then
                if card.area.cards[rr+1].debuff then card.area.cards[rr+1].debuff = nil end
                if card.area.cards[rr+1].facing and card.area.cards[rr+1].facing == "back" then card.area.cards[rr+1]:flip() end
            end
            if rr and card.area.cards[rr-1] then
                if card.area.cards[rr-1].debuff then card.area.cards[rr-1].debuff = nil end
                if card.area.cards[rr-1].facing and card.area.cards[rr-1].facing == "back" then card.area.cards[rr-1]:flip() end
            end
        end
    end
})