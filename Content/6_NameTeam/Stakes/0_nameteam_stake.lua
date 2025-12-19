SMODS.Stake {
    key = "nameteam",
    colour = HEX("55c6d9"),
    applied_stakes = {"gold"},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
        }
    },
    loc_txt = {
        name = "NTeam Stake",
        text = {"Ton of stickers added by Name Team"},
        sticker = {
            name = "NTeam Sticker",
            text = {"Used this Joker", "to win on {C:attention}NTeam", "{C:attention}stake{} difficulty"}

        }
    },
    modifiers = function()
        for k, v in pairs(SMODS.Stickers) do
            if v.sets and v.sets["Joker"] and string.find(v.key, "cbean") then
                G.GAME.modifiers["enable_" .. k] = true
            end
        end
    end,
}