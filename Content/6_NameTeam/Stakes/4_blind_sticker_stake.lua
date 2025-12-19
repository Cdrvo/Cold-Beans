SMODS.Stake {
    key = "blind",
    colour = HEX("55c6d9"),
    atlas = "nteam_stakes",
    pos = {x=2,y=0},
    sticker_atlas = "NAMETEAM_Stickers",
    sticker_pos = {x=8,y=2},
    applied_stakes = {"cbean_deck"},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
        }
    },
    modifiers = function()
        for k, v in pairs(SMODS.Stickers) do
            if v.sets and v.sets["Blind"] then
                G.GAME.modifiers["enable_" .. k] = true
            end
        end
        G.GAME.modifiers.blind_stickers = true
    end,
}