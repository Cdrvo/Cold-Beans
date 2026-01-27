function create_UIBox_quests()

    return SMODS.card_collection_UIBox(G.P_CENTER_POOLS["yma_quest"], { 5, 5 }, {
        snap_back = true,
        hide_single_page = true,
        collapse_single_page = true,
        h_mod = 1.03,
        back_func = 'your_collection_other_gameobjects',
        no_materialize = true,
        modify_card = function(card, center)
            card.T.h = card.T.w
        end,
    })
end

SMODS.current_mod.custom_collection_tabs = function()
    local side_quests = G.P_CENTER_POOLS["yma_quest"]
    local count = 0
    local total = #side_quests

    for _, quest in ipairs(side_quests) do
        if quest.discovered or (G.PROFILES[G.SETTINGS.profile] and G.PROFILES[G.SETTINGS.profile].all_unlocked) then
            count = count + 1
        end
    end

    return {
        UIBox_button({
            button = 'your_collection_quests',
            label = { 'Side Quests' },
            count = total > 0 and {
                tally = count,
                of = total
            } or nil,
            minw = 5,
            minh = 1,
            id = 'your_collection_quests',
            focus_args = { snap_to = true }
        }),
        UIBox_button({
            button = 'your_collection_tboi_items',
            label = { 'Items' },
            count = G.ACTIVE_MOD_UI and modsCollectionTally(G.P_CENTER_POOLS["yma_tboi_items"]),
            minw = 5,
            minh = 1,
            id = 'your_collection_tboi_items',
            focus_args = { snap_to = true }
        }),
        UIBox_button({
            button = 'your_collection_yma_medals',
            label = { 'Medals' },
            minw = 5,
            id = 'your_collection_yma_medals',
        })
    }
end

G.FUNCS.your_collection_quests = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_quests(),
    }
end

G.FUNCS.your_collection_tboi_items = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_tboi_items(),
    }
end

G.FUNCS.your_collection_yma_medals = function()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_yma_medals(),
    }
end

function create_UIBox_yma_medals()

    return SMODS.card_collection_UIBox(G.P_CENTER_POOLS["yma_medal"], { 4, 4 }, {
        snap_back = true,
        hide_single_page = true,
        collapse_single_page = true,
        no_materialize = true,
        center = 'j_joker',
        back_func = 'your_collection_other_gameobjects',
        modify_card = function(card, center)
            card:yma_set_medal(center.key)
        end,
    })
end

function create_UIBox_tboi_items()

    return SMODS.card_collection_UIBox(G.P_CENTER_POOLS["yma_tboi_items"], { 5, 6 }, {
        snap_back = true,
        hide_single_page = true,
        collapse_single_page = true,
        back_func = 'your_collection_other_gameobjects',
        no_materialize = true,
    })
end