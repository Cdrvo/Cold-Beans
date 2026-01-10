Colonparen.CEOBlind {
    key = "sdown_rebellion",
    name = "The Rebellion",
    pos = { x = 0, y = 2 },
    boss = { min = 1 },
    atlas = "sdown_blinds_atlas",
    mult = 3,
    boss_colour = HEX("A86B65"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.modify_hand and #G.hand.cards~=0 then
                for _, playing_card in ipairs(G.hand.cards) do
                    if(playing_card:get_chip_bonus() > 0) then
                        blind.triggered = true
                        playing_card:juice_up()
                        SMODS.calculate_effect({message = '-'..playing_card:get_chip_bonus(),colour = G.C.CHIPS }, playing_card)
                        hand_chips = mod_chips(hand_chips - playing_card:get_chip_bonus())
                        --no longer need to do this because of latest smods
                        --[[if hand_chips < 0 then
                            local neg_chips = hand_chips * -1
                            update_hand_text({ sound = 'chips2', modded = true }, { chips = '-​'..tostring(neg_chips)})
                        end
                        else update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips})--]]
                    end
                end
            end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    }
}