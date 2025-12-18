SMODS.Stake {
    key = "deck",
    colour = HEX("55c6d9"),
    applied_stakes = {"cbean_consumable"},
    shiny = true,
    unlocked = false,
    prefix_config = {
        applied_stakes = {
            mod = false
        }
    },
    loc_txt = {
        name = "Deck Stake",
        text = {"Decks has a 1/4 chance to gain a sticker after leaving the shop"},
        sticker = {
            name = "Deck Sticker",
            text = {"Used this Joker", "to win on {C:attention}Deck", "{C:attention}Stake{} difficulty"}

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