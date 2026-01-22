
SMODS.Joker {
    key = "jbill_schneider",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 2 },
    rarity = 2,
    cost = 6,
    config = { extra = { xmult_gain = 1, compatible = "" } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain } }
    end,
    calculate = function(self, card, context)
        local right = nil
        local compatible = false
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                if G.jokers.cards[i+1] then
                    right = G.jokers.cards[i+1]
                end
            end
        end
        if right then
            if right.ability.extra then
                for k, v in pairs(G.GAME.xmult_in_extra) do
                    if right.config.center.key == v then
                        compatible = true
                    end
                end
                if context.ante_change and compatible then
                    right.ability.extra = right.ability.extra + card.ability.extra.xmult_gain
                end
                if tonumber(right.ability.extra) == nil and compatible == false and context.ante_change then
                    return {
                        colour = G.C.PURPLE,
                        message = localize("k_nope")
                    }
                end
            elseif right.ability.Xmult then
                if context.ante_change then
                    right.ability.Xmult = right.ability.Xmult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.extra and right.ability.extra.Xmult then
                if context.ante_change then
                    right.ability.extra.Xmult = right.ability.extra.Xmult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.xmult then
                if context.ante_change then
                    right.ability.xmult = right.ability.xmult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.extra and right.ability.extra.xmult then
                if context.ante_change then
                    right.ability.extra.xmult = right.ability.extra.xmult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.X_mult then
                if context.ante_change then
                    right.ability.X_mult = right.ability.X_mult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.extra and right.ability.extra.X_mult then
                if context.ante_change then
                    right.ability.extra.X_mult = right.ability.extra.X_mult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.x_mult then
                if context.ante_change then
                    right.ability.x_mult = right.ability.x_mult + card.ability.extra.xmult_gain
                end
                compatible = true
            elseif right.ability.extra and right.ability.extra.x_mult then
                if context.ante_change then
                    right.ability.extra.x_mult = right.ability.extra.x_mult + card.ability.extra.xmult_gain
                end
                compatible = true
            else
                return {colour = G.C.PURPLE, message = localize("k_nope")}
            end
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Bluepoch"
    }
}