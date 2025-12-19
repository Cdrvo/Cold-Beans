SMODS.Stake {
    key = "consumable",
    colour = HEX("55c6d9"),
    atlas = "nteam_stakes",
    pos = {x=0,y=0},
    sticker_atlas = "NAMETEAM_Stickers",
    sticker_pos = {x=8,y=0},
    applied_stakes = {"cbean_nameteam"},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
        }
    },
    modifiers = function()
        for k, v in pairs(SMODS.Stickers) do
            if v.sets and v.sets["Consumable"] then
                G.GAME.modifiers["enable_" .. k] = true
            end
        end
        G.GAME.modifiers.consumable_stickers = true
    end,
}