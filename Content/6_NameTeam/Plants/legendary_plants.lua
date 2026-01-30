--[[SMODS.Joker({           didn't know this existd in yahimod 
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cob_cannon_OG",
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 4,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.post_trigger and context.other_ret then
            if G.GAME.current_round.hands_left >0 then
                if context.other_ret then
                    for k, v in pairs(context.other_ret) do
                        if type(v) == "table" then
                            for k, v in pairs(v) do
                                local a = string.upper(tostring(k))
                                if string.find(a,"XMULT") or string.find(a,"X_MULT") then
                                    cae.xmult = cae.xmult * v
                                end
                            end
                        end
                    end
                end
            else 
                -- 
            end
        end
        if context.joker_main and not context.blueprint and G.GAME.current_round.hands_left <= 0 and cae.xmult > 1 then
            return{
                xmult = cae.xmult
            }
        end
    end
})]]