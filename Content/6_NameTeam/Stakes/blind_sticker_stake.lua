SMODS.Stake {
    key = "blind",
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
        name = "Blind Stake",
        text = {"Blind stickers can be applied to decks"},
        sticker = {
            name = "Blind Sticker",
            text = {"Used this Joker", "to win on {C:attention}Blind", "{C:attention}Stake{} difficulty"}
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