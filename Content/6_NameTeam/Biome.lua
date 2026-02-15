
SMODS.Atlas({
    key = "NAMETEAM_Biomes",
    path = "6_NameTeam/ColdBeansBiomes.png",
    px = 113,
    py = 57
})

G.FUNCS.switch_biome = function(biome)
    CBWG.ColdBeans_Biomes[G.GAME.round_resets.blind_biome]:exit(true)
    if not G.GAME.current_round.biomes_visited[biome] then
        G.GAME.current_round.biomes_visited[biome] = true
        G.GAME.current_round.amount_biomes_visited = G.GAME.current_round.amount_biomes_visited + 1
    end
    G.GAME.round_resets.blind_biome = biome 
        CBWG.ColdBeans_Biomes[G.GAME.round_resets.blind_biome]:enter(true)
        G.VIBRATION = G.VIBRATION + 1
end

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'cbean_NAMETEAM_Biomes',
    key = "nameteam_davelawn",
    calculate = function(self, context)
    end,
    enter = function(self, calc)
    end,
    exit = function(self, calc)
    end
}

CBWG.ColdBeans_Biome {
    pos = {x = 1, y = 0},
    config = {},
    atlas = 'cbean_NAMETEAM_Biomes',
    key = "nameteam_afterlife",
    in_pool = function() return false end,
    calculate = function(self, context)
    end,
    enter = function(self, calc)
        G.GAME.standard_shop_size = G.GAME.shop.joker_max
        G.GAME.standard_shop_booster_size = (G.GAME.modifiers.extra_boosters or 0) + 2
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(G.GAME.shop.joker_max * -1)
                return true
            end
        }))
        SMODS.change_booster_limit((G.GAME.modifiers.extra_boosters or 0) * -1 - 2)
    end,
    exit = function(self, calc)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(G.GAME.standard_shop_size)
                return true
            end
        }))
        SMODS.change_booster_limit(G.GAME.standard_shop_booster_size)
    end
}

local main_menu_ref = Game.main_menu
Game.main_menu = function(change_context)
    local ret = main_menu_ref(change_context)

    -- Adding Dave's Lawn yard
    if not CBWG.ColdBeans_Biomes.nameteam_davelawn then
        -- Replaces in_pool for all jokers which simply checks for the biome
        for k, v in pairs(G.P_CENTERS) do
            if string.find(k, "j_") == 1 then
                if not v.pvz_plant and k ~= "j_mr_bones" then
                    local old_in_pool = nil
                    if v.in_pool then
                        sendDebugMessage("Setting new pool for "..k, "nameteam_davelawn")
                        old_in_pool = v.in_pool
                        v.in_pool = function()
                            if G.GAME.round_resets.blind_biome == "nameteam_davelawn" then
                                return false
                            else
                                return old_in_pool()
                            end
                        end
                    else
                        sendDebugMessage("Setting non existant pool for "..k, "nameteam_davelawn")
                        v.in_pool = function()
                            if G.GAME.round_resets.blind_biome == "nameteam_davelawn" then
                                return false
                            else
                                return true
                            end
                        end
                    end
                end
            end
        end
    end

    -- Adding The Afterlife
    -- if not CBWG.ColdBeans_Biomes.nameteam_afterlife then
    --     CBWG.ColdBeans_Biome.inject()
    -- end

    return ret
end

G.C.BLIND['nameteam_davelawn'] = HEX("2A9462")
G.C.BLIND['nameteam_afterlife'] = HEX("FF9594")