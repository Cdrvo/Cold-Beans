SMODS.Stake {
    key = "consumable",
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
        name = "Consumale Stake",
        text = {"Consumables can spawn with certain stickers"},
        sticker = {
            name = "Consumable Sticker",
            text = {"Used this Joker", "to win on {C:attention}Consumable", "{C:attention}stake{} difficulty"}

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