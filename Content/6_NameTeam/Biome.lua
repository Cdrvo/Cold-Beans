
SMODS.Atlas({
    key = "NAMETEAM_Biomes",
    path = "6_NameTeam/ColdBeansBiomes.png",
    px = 113,
    py = 57
})

local main_menu_ref = Game.main_menu
Game.main_menu = function(change_context)
    local ret = main_menu_ref(change_context)

    if not CBWG.ColdBeans_Biomes.nameteam_davelawn then
        CBWG.ColdBeans_Biome.inject(CBWG.ColdBeans_Biome {
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
        })
        -- Replaces in_pool for all jokers which simply checks for the biome
        for k, v in pairs(G.P_CENTERS) do
            if string.find(k, "j_") == 1 then
                if not v.pvz_plant or k ~= "j_bones" then
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

    return ret
end

G.C.BLIND['nameteam_davelawn'] = HEX("2A9462")