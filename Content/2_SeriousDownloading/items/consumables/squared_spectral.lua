SMODS.Consumable {
    key = '0chill_for_all',
    set = "Spectral",
    hidden = true,
    soul_set = "Consumables2",
    atlas = '0chill_spectral_atlas',
    cost = 8,
    pos = { x = 3, y = 0},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = "cbean_combo_starter", set = "Other" }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, context)
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_charm'))
                    add_tag(Tag('tag_meteor'))
                    add_tag(Tag('tag_ethereal'))
                    add_tag(Tag('tag_cbean_colon_construction'))
                    add_tag(Tag('tag_cbean_olympus'))
                    add_tag(Tag('tag_cbean_hongbao'))
                    add_tag(Tag('tag_cbean_0chill_combo'))
                    add_tag(Tag('tag_cbean_0chill_key'))
                    add_tag(Tag('tag_cbean_0chill_squared'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
    end,                       
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = {"MarioFan597"},
        art = "MarioFan597",
        code = "MarioFan597",
    },
}