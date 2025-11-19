Colonparen.CEOBlind {
    key = "sdown_astro",
    name = "The Astro",
    pos = { x = 0, y = 5 },
    boss = { min = 1 },
    atlas = "sdown_blinds_atlas",
    mult = 3,
    boss_colour = HEX("00E5FF"),
    loc_txt = {
        name = 'The Astro',
        text = {
            "Spades held in hand or played",
            "Give ^^0.95 Chips"
        }
    },
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.final_scoring_step then
                for _, playing_card in ipairs(context.full_hand) do
                    if(playing_card:is_suit("Spades")) then
                        blind.triggered = true
                        playing_card:juice_up()
                        SMODS.calculate_effect({message = '^^0.95',colour = G.C.CHIPS }, playing_card)
                        hand_chips = mod_chips(hand_chips^0.95)
                        update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips})
                    end
                end
                for _, playing_card in ipairs(G.hand.cards) do
                    if(playing_card:is_suit("Spades")) then
                        blind.triggered = true
                        playing_card:juice_up()
                        SMODS.calculate_effect({message = '^^0.95',colour = G.C.CHIPS }, playing_card)
                        hand_chips = mod_chips(hand_chips^0.95)
                        update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips})
                    end
                end
            end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "N/A",
        code = "Athebyne",
    }
}