SMODS.Stake {
    key = "nameteam",
    colour = HEX("55c6d9"),
    applied_stakes = {"gold"},
    atlas = "nteam_stakes",
    pos = {x=3,y=0},
    sticker_atlas = "NAMETEAM_Stickers",
    sticker_pos = {x=8,y=3},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
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