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
                print(k .. " enabled")
            end
        end
        G.GAME.modifiers.blind_stickers = true
    end,
    calculate = function(self,card,context)
        if context.end_of_round and G.GAME.modifiers.blind_stickers and G.GAME.blind.boss then
            local tab = {}
            local ae = NAMETEAM.poll_sticker(true, G.GAME.selected_back, true, "Blind")
            print(ae)
            
            for k, v in pairs(SMODS.Stickers) do
                if v.sets and v.sets["Blind"] then
                    tab[#tab+1] = tab
                end
            end

            for k, v in pairs(tab) do
                if G.GAME.selected_back.ability[v] then
                    G.GAME.selected_back:nteam_remove_sticker(v)
                    break
                end
            end

            G.GAME.selected_back:nteam_apply_sticker(ae)
        end
    end
}