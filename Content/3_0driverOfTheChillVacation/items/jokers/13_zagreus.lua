SMODS.Joker {
    key = "0chill_zagreus",
    name = "Zagreus",
    atlas = "0chill_joker_atlas",
    pos = { x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,

    calculate = function(self,card,context)
        if context.blind_defeated then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_cbean_olympus'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    return true
                end)
            }))
        end
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "MarioFan597",
        art =  "cmykl",
        code = "Inspector_B",
    }
}