SMODS.Enhancement {
    key = "jbill_banknote",
    atlas = "jbill_enhance",
    pos = { x = 0, y = 0 },
    config = { extra = { dollars = 1 } },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
            trigger = "after", 
            delay = 0, 
            func = function()
                if card:get_id() == 2 then
                    card:start_dissolve()
                else
                    SMODS.modify_rank(card, -1)
                end
                return true 
            end
            }))
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end,
    beans_credits = {
        idea = "Evgast, D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}

SMODS.Enhancement {
    key = "jbill_bean",
    atlas = "jbill_enhance",
    pos = { x = 1, y = 0 },
    config = { card_limit = 1 },
    shatters = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.card_limit } }
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "D.J."
    }
}