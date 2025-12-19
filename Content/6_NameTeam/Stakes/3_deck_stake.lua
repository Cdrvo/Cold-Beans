SMODS.Stake {
    key = "deck",
    colour = HEX("55c6d9"),
    atlas = "nteam_stakes",
    pos = {x=1,y=0},
    sticker_atlas = "NAMETEAM_Stickers",
    sticker_pos = {x=8,y=1},
    applied_stakes = {"cbean_playingcardstake"},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
        }
    },
    modifiers = function()
        for k, v in pairs(SMODS.Stickers) do
            if v.sets and v.sets["Deck"] then
                G.GAME.modifiers["enable_" .. k] = true
            end
        end
        G.GAME.modifiers.deck_stickers = true
    end,
}