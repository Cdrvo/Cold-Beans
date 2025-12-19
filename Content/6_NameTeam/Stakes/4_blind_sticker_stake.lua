SMODS.Stake {
    key = "blind",
    colour = HEX("55c6d9"),
    applied_stakes = {"cbean_deck"},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
        }
    },
    loc_txt = {
        name = "Blind Stake",
        text = {"After every boss blind, apply a random blind sticker to the deck"},
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