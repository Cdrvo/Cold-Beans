G.xmult_in_extra = { "j_acrobat", "j_ancient", "j_baron", "j_baseball", "j_blackboard", "j_drivers_license", "j_flower_pot", "j_photograph", "j_seeing_double", "j_triboulet"}

schneider_xmult_get = function(card)
    local valid = {
        xmult = true,
        Xmult = true,
        XMult = true,
        X_mult = true,
        X_Mult = true,
    }
    if card.ability.extra then
        local extrax = false
        for k, v in pairs(G.xmult_in_extra) do
            if card.config.center.key == v then
                extrax = true
            end
        end
        if extrax then
            return card.ability.extra
        end
        if not extrax and type(card.ability.extra) == "table" then
            for k, v in pairs(card.ability.extra) do
                if valid[k] and v ~= nil then
                    return v
                end
            end
            if card.ability.extra.x_mult then
                return card.ability.extra.x_mult
            end
        end
    end
    if card.ability then
        for k, v in pairs(card.ability) do
            if valid[k] and v ~= nil then
                return v
            end
            if card.ability.x_mult then
                return card.ability.x_mult
            end
        end
    end
end


SMODS.Joker {
    key = "jbill_schneider",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 2 },
    rarity = 3,
    cost = 7,
    config = { extra = { xmult = 1, xmult_require = 1, xmult_right = "None!", right_card = nil } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_require, card.ability.extra.xmult_right } }
    end,
    update = function(self, card, dt) 
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    if G.jokers.cards[i+1] then
                        card.ability.extra.right_card = G.jokers.cards[i+1]
                    else
                        card.ability.extra.right_card = nil
                    end
                end
            end
        else
            card.ability.extra.right_card = nil
        end
        if card.ability.extra.right_card then 
            if schneider_xmult_get(card.ability.extra.right_card) > card.ability.extra.xmult_require then
                card.ability.extra.xmult_right = schneider_xmult_get(card.ability.extra.right_card) * 2
            else
                card.ability.extra.xmult_right = "Not Enough"
            end
        else
            card.ability.extra.xmult_right = "None!"
        end
    end,
    calculate = function(self, card, context)
        if context.ante_change then
            if type(card.ability.extra.xmult_right) == "number" then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "xmult",
                    scalar_value = "xmult_right",
                    scaling_message = {
                        message = localize("k_schneider_upg"),
                        colour = G.C.MULT
                    }
                })
                card.ability.extra.right_card:start_dissolve()
            end
        end
        if context.joker_main and card.ability.extra.xmult ~= 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Bluepoch"
    }
}
