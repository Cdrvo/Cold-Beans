G.P_CENTER_POOLS.Biome = {}

SMODS.Atlas({
    key = "wgrop_biomes",
    path = "7_Wgrop/biomes.png",
    px = 113,
    py = 57
})

G['P_BIOMES'] = {}
G['P_BIOME_POOLS'] = {}
G['P_BIOME_POOLS']['default'] = {}
G.P_CENTER_POOLS['default'] = {}

CBWG.ColdBeans_Biomes = {}

---@type SMODS.Center
CBWG.ColdBeans_Biome = SMODS.ObjectType:extend{
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'wgrop_biomes',
    class_prefix = 'biome',
    required_params = {'key'},
    inject = function(self)
        SMODS.ObjectType.inject(self)
        G['P_BIOMES'][self.key] = true
        G['P_BIOME_POOLS'][self.key] = copy_table(G['P_BIOME_POOLS']['default'])
        if self.blinds then
            for k, v in pairs(G.P_BLINDS) do
                if self.blinds[k] then self:inject_blind(k) end
            end
            print(tprint(G.P_CEO_BLINDS))
            for k, v in pairs(G.P_CEO_BLINDS) do
                if self.blinds[k] then self:inject_blind(k) end
                print(k)
            end
        end
        CBWG.ColdBeans_Biomes[self.key] = self
    end,
    inject_blind = function(self, blind)
        if blind.set ~= self.key then
            table.insert(G.P_BIOME_POOLS[self.key], blind)
        end
    end,
    delete_blind = function(self, blind)
        if blind.set ~= self.key then
            table.remove(G.P_BIOME_POOLS[self.key], blind)
        end
        if blind.pools then blind.pools[self.key] = nil end
    end
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_desert",
    blinds = {["bl_wheel"] = true, ["bl_mark"] = true, ["bl_hook"] = true, ["bl_manacle"] = true, ["bl_window"] = true, ["bl_final_acorn"] = true, ["bl_cbean_colon_pot"] = true},
    cards = {["j_greedy_joker"] = true, ["j_dusk"] = true, ["j_delayed_grat"] = true, ["j_obelisk"] = true, ["j_hallucination"] = true, ["j_fortune_teller"] = true, ["j_bull"] = true, ["j_cartomancer"] = true, ["j_bootstraps"] = true, ["j_cbean_wgrop_gunslinger"] = true, ["j_cbean_wgrop_oasis"] = true, ["j_cbean_wgrop_glass_spire"] = true, ["j_mystic_summit"] = true, ["j_rough_gem"] = true}
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 1},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_forest",
    blinds = {["bl_ox"] = true, ["bl_plant"] = true, ["bl_club"] = true,  ["bl_serpent"] = true, ["bl_final_leaf"] = true, ["bl_cbean_colon_treasure"] = true, ["bl_cbean_colon_seed"] = true, ["bl_cbean_colon_compass"] = true, ["bl_cbean_colon_outcrop"] = true},
    cards = {["j_gluttenous_joker"] = true, ["j_stencil"] = true, ["j_ceremonial"] = true, ["j_marble"] = true, ["j_scary_face"] = true, ["j_gros_michel"] = true, ["j_egg"] = true, ["j_sixth_sense"] = true, ["j_hiker"] = true, ["j_faceless"] = true, ["j_green_joker"] = true, ["j_cavendish"] = true, ["j_midas_mask"] = true, ["j_erosion"] = true, ["j_ancient"] = true, ["j_campfire"] = true, ["j_flower_pot"] = true, ["j_idol"] = true, ["j_hit_the_road"] = true, ["j_cbean_colon_square_packing"] = true, ["j_cbean_pboys_watermelon"] = true, ["j_cbean_nameteam_bottomofthebarrel"] = true, ["j_golden"] = true, ["j_arrowhead"] = true}
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 2},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_graveyard",
    blinds = {["bl_eye"] = true, ["bl_final_vessel"] = true, ["bl_cbean_colon_assassination"] = true, ["bl_cbean_colon_hole"] = true, ["bl_cbean_colon_curse"] = true, ["bl_cbean_colon_regression"] = true},
    cards = {["j_seance"] = true, ["j_wrathful_joker"] = true, ["j_four_fingers"] = true, ["j_mime"] = true, ["j_raised_fist"] = true, ["j_pareidolia"] = true, ["j_dna"] = true, ["j_vampire"] = true, ["j_photograph"] = true, ["j_mr_bones"] = true, ["j_seeing_double"] = true, ["j_invisible"] = true, ["j_cbean_colon_mu_cube"] = true, ["j_cbean_colon_rna"] = true, ["j_cbean_colon_modernity"] = true, ["j_cbean_colon_spectaro"] = true, ["j_cbean_pboys_coriolis"] = true, ["j_cbean_nameteam_ghostimage"] = true, ["j_cbean_wgrop_withering_memory"] = true, ["j_hallucination"] = true, ["j_ceremonial"] = true, ["j_marble"] = true, ["j_scary_face"] = true, ["j_sixth_sense"] = true, ["j_faceless"] = true, ["j_idol"] = true, ["j_bloodstone"] = true, ["j_madness"] = true}
}


CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 3},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_volcanic",
    blinds = {["bl_needle"] = true, ["bl_flint"] = true,["bl_mouth"] = true,["bl_head"] = true, ["bl_final_heart"] = true, ["bl_cbean_colon_folly"] = true},
    cards = {["j_rough_gem"] = true, ["j_golden"] = true, ["j_arrowhead"] = true, ["j_onyx_agate"] = true, ["j_madness"] = true, ["j_bloodstone"] = true, ["j_lusty"] = true, ["j_half"] = true, ["j_chaos"] = true, ["j_abstract"] = true, ["j_stone"] = true, ["j_glass"] = true, ["j_burnt"] = true, ["j_cbean_pboys_molotov"] = true, ["j_cbean_yma_charred_fool"] = true,}
}


CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 4},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_glaciers",
    blinds = {["bl_arm"] = true, ["bl_fish"] = true, ["bl_water"] = true, ["bl_final_bell"] = true,["bl_cbean_colon_island"] = true, ["bl_cbean_colon_astro"] = true, ["bl_cbean_colon_sinker"] = true},
    cards = {["j_cbean_0chill_thorn_ring"] = true, ["j_mystic_summit"] = true, ["j_supernova"] = true, ["j_space"] = true, ["j_ice_cream"] = true, ["j_splash"] = true, ["j_blue_joker"] = true, ["j_constellation"] = true, ["j_cloud_9"] = true, ["j_rocket"] = true, ["j_castle"] = true, ["j_satellite"] = true, ["j_astronomer"] = true, ["j_cbean_pboys_yellow_snow"] = true, ["j_cbean_yma_seeing_stars"] = true, ["j_cbean_yma_well_wrapped"] = true, ["j_cbean_nameteam_hollyjollyjoker"] = true, ["j_cbean_nameteam_tipoftheiceberg"] = true, ["j_onyx_agate"] = true},
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 5},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_city",
    blinds = {["bl_house"] = true, ["bl_wall"] = true, ["bl_cbean_colon_gate"] = true,  ["bl_final_bell"] = true, ["bl_cbean_colon_stamp"] = true, ["bl_cbean_colon_salesman"] = true, ["bl_cbean_colon_factory"] = true, ["bl_cbean_colon_pipeline"] = true, ["bl_cbean_colon_rebellion"] = true, ["bl_cbean_sdown_estrogen"] = true},
    cards = {["j_cbean_0chill_thorn_ring"] = true, ["j_seance"] = true, ["j_credit_card"] = true, ["j_loyalty_card"] = true, ["j_steel_joker"] = true, ["j_hack"] = true, ["j_scholar"] = true, ["j_business"] = true, ["j_ride_the_bus"] = true, ["j_burglar"] = true, ["j_blackboard"] = true, ["j_runner"] = true, ["j_card_sharp"] = true, ["j_red_card"] = true, ["j_shortcut"] = true, ["j_vagabond"] = true, ["j_luchador"] = true, ["j_gift"] = true, ["j_reserved_parking"] = true, ["j_baseball"] = true, ["j_diet_cola"] = true, ["j_trading"] = true, ["j_flash"] = true, ["j_ramen"] = true, ["j_walkie_talkie"] = true, ["j_certificate"] = true, ["j_throwback"] = true, ["j_blueprint"] = true, ["j_drivers_license"] = true, ["j_cbean_colon_chalk"] = true, ["j_cbean_colon_loan_shark"] = true, ["j_cbean_colon_sproinky"] = true, ["j_cbean_colon_big_shot"] = true, ["j_cbean_sdown_billboard"] = true, ["j_cbean_sdown_bisexual"] = true, ["j_cbean_0chill_lone_warrior"] = true, ["j_cbean_0chill_driving_in_my_truck"] = true, ["j_cbean_pboys_vodka"] = true, ["j_cbean_pboys_hydrant"] = true, ["j_cbean_pboys_flag_japan"] = true, ["j_cbean_pboys_restroom_closed"] = true, ["j_cbean_yma_born_salesman"] = true, ["j_cbean_yma_the_jest_around"] = true, ["j_cbean_nameteam_bettercreditcard"] = true, ["j_cbean_nameteam_alecwatson"] = true, ["j_cbean_nameteam_giveway"] = true, ["j_cbean_nameteam_presidenthathaway"] = true, ["j_cbean_nameteam_coffeemug"] = true, ["j_cbean_nameteam_giveway"] = true, ["j_cbean_nameteam_chuckmcgill"] = true,  },
}
-- ante 1 blinds have been removed as they get ignored and only the wall appears on ante 1
-- all biomes should have a finisher blind or they get the wall
-- wall is beautiful wall is beautiful wall is beautiful


-- Function that gets a new biome
function CBWG.get_new_biome(new_biome)
    local eligible_biomes = {}
    for k, v in pairs(G.P_BIOMES) do
        if new_biome then
            if k ~= G.GAME.round_resets.blind_biome then
                eligible_biomes[k] = v
            end
        else
            eligible_biomes[k] = v
        end
    end
    local _, biome = pseudorandom_element(eligible_biomes, pseudoseed('biome'))
    biome = biome or "wgrop_city"
    return biome
end

function CBWG.get_new_boss()
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
    if G.GAME.perscribed_bosses and
        G.GAME.perscribed_bosses[G.GAME.round_resets.ante] then
        local ret_boss = G.GAME.perscribed_bosses[G.GAME.round_resets.ante]
        G.GAME.perscribed_bosses[G.GAME.round_resets.ante] = nil
        G.GAME.bosses_used[ret_boss] = G.GAME.bosses_used[ret_boss] + 1
        return ret_boss
    end
    if G.FORCE_BOSS then return G.FORCE_BOSS end

    local eligible_bosses = {}

    for key, value in pairs(G.P_BIOME_POOLS[G.GAME.round_resets.blind_biome]) do -- Hello from Wgrop!
        for k, v in pairs(G.P_BLINDS) do
            if k == value then
                local res, options = SMODS.add_to_pool(v)
                options = options or {}
                if not v.boss then

                elseif options.ignore_showdown_check then
                    eligible_bosses[k] = res and true or nil
                elseif v.in_pool and type(v.in_pool) == 'function' then
                    if (((G.GAME.round_resets.ante) % G.GAME.win_ante == 0 and
                        G.GAME.round_resets.ante >= 2) ==
                        (v.boss.showdown or false)) then
                        eligible_bosses[k] = res and true or nil
                    end
                elseif not v.boss.showdown and
                    (v.boss.min <= math.max(1, G.GAME.round_resets.ante) and
                        ((math.max(1, G.GAME.round_resets.ante)) %
                            G.GAME.win_ante ~= 0 or G.GAME.round_resets.ante < 2)) then
                    eligible_bosses[k] = res and true or nil
                elseif v.boss.showdown and (G.GAME.round_resets.ante) %
                    G.GAME.win_ante == 0 and G.GAME.round_resets.ante >= 2 then
                    eligible_bosses[k] = res and true or nil
                end
            end
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    local min_use = 100
    for k, v in pairs(G.GAME.bosses_used) do
        if eligible_bosses[k] then
            eligible_bosses[k] = v
            if eligible_bosses[k] <= min_use then
                min_use = eligible_bosses[k]
            end
        end
    end
    for k, v in pairs(eligible_bosses) do
        if eligible_bosses[k] then
            if eligible_bosses[k] > min_use then
                eligible_bosses[k] = nil
            end
        end
    end
    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))
    boss = boss or "bl_wall" -- Banner default
    G.GAME.bosses_used[boss] = G.GAME.bosses_used[boss] + 1

    return boss
end

function CBWG.in_pool(key)
    for k, v in ipairs(G.P_CENTER_POOLS[G.GAME.round_resets.blind_biome]) do
        if v.key == key then return true end
    end
end

local injectitems_ref = SMODS.injectItems

SMODS.injectItems = function()

    injectitems_ref()
    BLIND_MASTER = {}
    BIOME_BLINDS = {}

    for k, v in pairs(G['P_BIOME_POOLS']) do
        for _, w in pairs(v) do table.insert(BIOME_BLINDS, w) end
    end

    for k, v in pairs(SMODS.Blinds) do table.insert(BLIND_MASTER, v.key) end

    for k, v in pairs(G.P_BLINDS) do table.insert(BLIND_MASTER, v.key) end

    for k, v in pairs(BLIND_MASTER) do 
        for _, w in pairs(BIOME_BLINDS) do if w == v then goto continue end end
        table.insert(G['P_BIOME_POOLS']['default'], v)
        for key, value in pairs(G['P_BIOME_POOLS']) do
            table.insert(G['P_BIOME_POOLS'][key], v)
        end
        ::continue::
    end

    CARD_MASTER = {}
    BIOME_CARDS = {}

    for k, v in pairs(G['P_BIOMES']) do
        for _, w in pairs(G.P_CENTER_POOLS[k]) do
            table.insert(BIOME_CARDS, w)
        end
    end
    
    for k, v in pairs(G.P_CENTER_POOLS['Joker']) do table.insert(CARD_MASTER, v) end
    
    for k, v in pairs(CARD_MASTER) do 
        for _, w in pairs(BIOME_CARDS) do if w == v then goto continue end end
        table.insert(G.P_CENTER_POOLS['default'], v)
        for key, value in pairs(G['P_BIOMES']) do
            table.insert(G.P_CENTER_POOLS[key], v)
        end
        ::continue::
    end
end

