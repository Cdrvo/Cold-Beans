SMODS.Stake {
    key = "playingcardstake",
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
        name = "Playing Card Stake",
        text = {"Playing Cards has a chance to gain stickers after played"},
        sticker = {
            name = "Playing Card Sticker",
            text = {"Used this Joker", "to win on {C:attention}Playing Card", "{C:attention}Stake{} difficulty"}

        }
    },
    modifiers = function()
        for k, v in pairs(SMODS.Stickers) do
            if v.sets and (v.sets["Default"] or v.sets["Enhanced"]) then
                G.GAME.modifiers["enable_" .. k] = true
            end
        end
        G.GAME.modifiers.playing_card_stickers = true
    end,
}