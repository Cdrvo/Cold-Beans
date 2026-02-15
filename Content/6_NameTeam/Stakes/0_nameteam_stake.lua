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
    loc_vars = function(self, info_queue, card)
        return { vars = { colours = { HEX("2ecc71") } } }
    end,
    modifiers = function()
        for k, v in pairs(SMODS.Stickers) do
            if v.sets and v.sets["Joker"] and v.beans_credits and (v.beans_credits.team == "Name Team") then
                G.GAME.modifiers["enable_" .. k] = true
            end
        end
    end,
}