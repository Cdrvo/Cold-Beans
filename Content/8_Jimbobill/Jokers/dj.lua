SMODS.Joker {
    key = "jbill_dj",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 3, y = 4 },
    rarity = 1,
    cost = 4,
    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
    calculate = function(self, card, context)
        if context.modify_hand then
            for i = 1, #context.scoring_hand do
                context.scoring_hand[i].dj = false
            end
            context.scoring_hand[#context.scoring_hand].dj = true
            if #context.scoring_hand > 1 then
                context.scoring_hand[#context.scoring_hand-1].dj = true
                table.remove(context.scoring_hand, 2)
            end
            table.remove(context.scoring_hand, 1)
        end
        if context.repetition and context.cardarea == G.play and context.other_card.dj then
            return {
                repetitions = 1
            }
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "None Yet!"
    }
}