CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 0},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_desert",
    cards = {["j_greedy_joker"] = true, ["j_dusk"] = true, ["j_delayed_grat"] = true, ["j_obelisk"] = true, ["j_hallucination"] = true, ["j_fortune_teller"] = true, ["j_bull"] = true, ["j_cartomancer"] = true, ["j_bootstraps"] = true, ["j_cbean_wgrop_gunslinger"] = true, ["j_cbean_wgrop_oasis"] = true, ["j_cbean_wgrop_glass_spire"] = true, ["j_mystic_summit"] = true, ["j_rough_gem"] = true}, ["j_cbean_pboys_huythekiller"] = true,
    calculate = function(self, context)

    end,
    enter = function(self, calc)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(-1)
                return true
            end
        }))
        SMODS.change_booster_limit(2)
    end,
    exit = function(self, calc)
        G.E_MANAGER:add_event(Event({
            func = function()
                change_shop_size(1)
                return true
            end
        }))
        SMODS.change_booster_limit(-2)
    end
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 1},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_forest",
    cards = {["j_cbean_sdown_path"] = true, ["j_gluttenous_joker"] = true, ["j_stencil"] = true, ["j_ceremonial"] = true, ["j_marble"] = true, ["j_scary_face"] = true, ["j_gros_michel"] = true, ["j_egg"] = true, ["j_sixth_sense"] = true, ["j_hiker"] = true, ["j_faceless"] = true, ["j_green_joker"] = true, ["j_cavendish"] = true, ["j_midas_mask"] = true, ["j_erosion"] = true, ["j_ancient"] = true, ["j_campfire"] = true, ["j_flower_pot"] = true, ["j_idol"] = true, ["j_hit_the_road"] = true, ["j_cbean_colon_square_packing"] = true, ["j_cbean_pboys_watermelon"] = true, ["j_cbean_pboys_peashooter"] = true, ["j_cbean_nameteam_bottomofthebarrel"] = true, ["j_golden"] = true, ["j_arrowhead"] = true},
    calculate = function(self, context)
        if context.end_of_round and context.individual and context.cardarea == G.hand then
            local other_card = context.other_card
            context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + 5
            if SMODS.pseudorandom_probability(other_card, pseudoseed("forest"), 1, 3, 'forest') then
                assert(SMODS.modify_rank(other_card, 1))
            end
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
    end,
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 2},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_graveyard",
    cards = {["j_seance"] = true, ["j_wrathful_joker"] = true, ["j_four_fingers"] = true, ["j_mime"] = true, ["j_raised_fist"] = true, ["j_pareidolia"] = true, ["j_dna"] = true, ["j_vampire"] = true, ["j_photograph"] = true, ["j_mr_bones"] = true, ["j_seeing_double"] = true, ["j_invisible"] = true, ["j_cbean_colon_mu_cube"] = true, ["j_cbean_colon_rna"] = true, ["j_cbean_colon_modernity"] = true, ["j_cbean_colon_spectaro"] = true, ["j_cbean_pboys_coriolis"] = true, ["j_cbean_pboys_gfs"] = true, ["j_cbean_pboys_ihaveagun"] = true,  ["j_cbean_nameteam_ghostimage"] = true, ["j_cbean_wgrop_withering_memory"] = true, ["j_hallucination"] = true, ["j_ceremonial"] = true, ["j_marble"] = true, ["j_scary_face"] = true, ["j_sixth_sense"] = true, ["j_faceless"] = true, ["j_idol"] = true, ["j_bloodstone"] = true, ["j_madness"] = true, ["j_cbean_wgrop_jhett_the_poltergeist"] = true},
    calculate = function(self, context)
        if context.remove_playing_cards and not context.blueprint and G.GAME.blind and G.GAME.blind.in_blind then
            local cardsdestroyed = SMODS.shallow_copy(context.removed)
            if #cardsdestroyed > 0 then
                for i, v in ipairs(cardsdestroyed) do
                    if SMODS.pseudorandom_probability(v, pseudoseed("graveyard"), 1, 3, 'graveyard') then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            func = function()
                                    local copy = copy_card(v)
                                    G.hand:emplace(copy)
                                    copy:set_ability('m_cbean_wgrop_pale_remnant')
                                    card_eval_status_text(copy, 'extra', nil, nil, nil, {message =('!'), colour = G.C.ATTENTION})
                                    table.insert(G.playing_cards, copy)
                                return true
                            end
                        }))
                    end
                end
            end
        elseif context.remove_playing_cards and not context.blueprint then
            local cardsdestroyed = SMODS.shallow_copy(context.removed)
            if #cardsdestroyed > 0 then
                for i, v in ipairs(cardsdestroyed) do
                    if SMODS.pseudorandom_probability(v, pseudoseed("graveyard"), 1, 3, 'graveyard') then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            func = function()
                                    local copy = copy_card(v)
                                    G.deck:emplace(copy)
                                    copy:set_ability('m_cbean_wgrop_pale_remnant')
                                    card_eval_status_text(copy, 'extra', nil, nil, nil, {message =('!'), colour = G.C.ATTENTION})
                                    table.insert(G.playing_cards, copy)
                                return true
                            end
                        }))
                    end
                end
            end
        end
    end
}


CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 3},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_volcanic",
    cards = {["j_rough_gem"] = true, ["j_golden"] = true, ["j_arrowhead"] = true, ["j_onyx_agate"] = true, ["j_madness"] = true, ["j_bloodstone"] = true, ["j_lusty_joker"] = true, ["j_half"] = true, ["j_chaos"] = true, ["j_abstract"] = true, ["j_stone"] = true, ["j_glass"] = true, ["j_burnt"] = true, ["j_cbean_pboys_molotov"] = true, ["j_cbean_pboys_flame"] = true, ["j_cbean_yma_charred_fool"] = true,},
    calculate = function(self, context)
    end,
    enter = function(self, calc)
        G.GAME.modifiers.volcanic_no_money = true
        G.GAME.modifiers.volcanic_money = 2
    end,
    exit = function(self, calc)
        G.GAME.modifiers.volcanic_no_money = false
        G.GAME.modifiers.volcanic_money = 0
    end
}


CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 4},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_glaciers",
    cards = {["j_cbean_0chill_thorn_ring"] = true, ["j_cbean_0chill_noelle"] = true, ["j_cbean_0chill_cryostasis"] = true, ["j_cbean_0chill_permafrost"] = true, ["j_cbean_sd_overchilled"] = true, ["j_mystic_summit"] = true, ["j_supernova"] = true, ["j_space"] = true, ["j_ice_cream"] = true, ["j_splash"] = true, ["j_blue_joker"] = true, ["j_constellation"] = true, ["j_cloud_9"] = true, ["j_rocket"] = true, ["j_castle"] = true, ["j_satellite"] = true, ["j_astronomer"] = true, ["j_cbean_pboys_yellow_snow"] = true, ["j_cbean_pboys_nrio"] = true, ["j_cbean_yma_seeing_stars"] = true, ["j_cbean_yma_well_wrapped"] = true, ["j_cbean_nameteam_hollyjollyjoker"] = true, ["j_cbean_nameteam_tipoftheiceberg"] = true, ["j_onyx_agate"] = true},
    calculate = function(self, context)
    end,
    enter = function(self, calc)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
        if calc then
            ease_discard(-1)
            ease_hands_played(2)
        end
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
    end,
    exit = function(self, calc)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        if calc then
            ease_discard(1)
            ease_hands_played(-2)
        end
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - 2
    end
}

CBWG.ColdBeans_Biome {
    pos = {x = 0, y = 5},
    config = {},
    atlas = 'wgrop_biomes',
    key = "wgrop_city",
    cards = {["j_cbean_0chill_thorn_ring"] = true,  ["j_seance"] = true, ["j_credit_card"] = true, ["j_loyalty_card"] = true, ["j_steel_joker"] = true, ["j_hack"] = true, ["j_scholar"] = true, ["j_business"] = true, ["j_ride_the_bus"] = true, ["j_burglar"] = true, ["j_blackboard"] = true, ["j_runner"] = true, ["j_card_sharp"] = true, ["j_red_card"] = true, ["j_shortcut"] = true, ["j_vagabond"] = true, ["j_luchador"] = true, ["j_gift"] = true, ["j_reserved_parking"] = true, ["j_baseball"] = true, ["j_diet_cola"] = true, ["j_trading"] = true, ["j_flash"] = true, ["j_ramen"] = true, ["j_walkie_talkie"] = true, ["j_certificate"] = true, ["j_throwback"] = true, ["j_blueprint"] = true, ["j_drivers_license"] = true, ["j_cbean_colon_chalk"] = true, ["j_cbean_colon_loan_shark"] = true, ["j_cbean_colon_sproinky"] = true, ["j_cbean_colon_big_shot"] = true, ["j_cbean_sdown_billboard"] = true, ["j_cbean_sdown_bisexual"] = true, ["j_cbean_0chill_lone_warrior"] = true, ["j_cbean_0chill_driving_in_my_truck"] = true, ["j_cbean_pboys_vodka"] = true, ["j_cbean_pboys_breuhh"] = true, ["j_cbean_pboys_streamer"] = true, ["j_cbean_pboys_hydrant"] = true, ["j_cbean_pboys_flag_japan"] = true, ["j_cbean_pboys_restroom_closed"] = true, ["j_cbean_yma_born_salesman"] = true, ["j_cbean_yma_the_jest_around"] = true, ["j_cbean_nameteam_bettercreditcard"] = true, ["j_cbean_nameteam_alecwatson"] = true, ["j_cbean_nameteam_giveway"] = true, ["j_cbean_nameteam_presidenthathaway"] = true, ["j_cbean_nameteam_coffeemug"] = true, ["j_cbean_nameteam_chuckmcgill"] = true,  },
    calculate = function(self, context)
        if context.after then
            ease_dollars(-1, true)
        end
    end,
    enter = function(self)
        change_shop_size(1)
    end,
    exit = function(self)
        change_shop_size(-1)
    end
}
-- ante 1 blinds have been removed as they get ignored and only the wall appears on ante 1
-- all biomes should have a finisher blind or they get the wall
-- wall is beautiful wall is beautiful wall is beautiful


-- Function that gets a new biome
-- Hello from Name Team!
function CBWG.get_new_biome(new_biome, already_polled)
    local eligible_biomes = {}
    local blacklist = already_polled or {}
    for k, v in pairs(CBWG.ColdBeans_Biomes) do
        if new_biome then
            if k ~= G.GAME.round_resets.blind_biome and v.in_pool and v.in_pool() and not blacklist[k] then
                eligible_biomes[k] = G.P_BIOMES[k]
            end
        elseif v.in_pool and v.in_pool() then 
            eligible_biomes[k] = G.P_BIOMES[k]
        elseif not v.in_pool then
            eligible_biomes[k] = G.P_BIOMES[k]
        end
    end

    local _, biome = pseudorandom_element(eligible_biomes, pseudoseed('biome'))
    biome = biome or "wgrop_city"
    return biome
end

function CBWG.in_pool(key)
    for k, v in ipairs(G.P_CENTER_POOLS[G.GAME.round_resets.blind_biome]) do
        if v.key == key then return true end
    end
    for k, v in ipairs(G.P_CENTER_POOLS['default']) do
        if v.key == key then return true end
    end
end

local injectitems_ref = SMODS.injectItems

SMODS.injectItems = function()

    injectitems_ref()
    
    if not G.P_CENTER_POOLS['default'] then G.P_CENTER_POOLS['default'] = {} end

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
        ::continue::
    end
end

