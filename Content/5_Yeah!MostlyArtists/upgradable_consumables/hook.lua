
-- upgrade my consumables

function yma_can_upgrade_consumable(card)
    local consumables_list = {
        base = {
            "magician",
            "hermit",
            "wheel_of_fortune",
            "wraith",
            "chariot",
            "justice",
            "ectoplasm"
        }
    }
    local levels = 5
    for k, v in pairs(consumables_list.base) do
        for i = 1, levels do
            consumables_list['lvl_'..i] = consumables_list['lvl_'..i] or {}
            consumables_list['lvl_'..i][#consumables_list['lvl_'..i]+1] = "cbean_yma_"..v.."_level"..i
        end
    end

    card.ability.yma_upgrade_lvl = card.ability.yma_upgrade_lvl or 0
    if card.ability.yma_upgrade_lvl ~= 5 then
        for _k, _v in pairs(consumables_list) do
            if 'lvl_'..card.ability.yma_upgrade_lvl+1 == _k then
                local card_key = card.config.center.key:sub(3)
                local compare_key = 'cbean_yma_'..card_key..'_level'..card.ability.yma_upgrade_lvl+1
                local other_compare_key = card_key:sub(1, -2)..card.ability.yma_upgrade_lvl+1
                for k, v in pairs(_v) do
                    if v == compare_key then 
                        return true, 'c_'..compare_key
                    end
                    if v == other_compare_key then 
                        return true, 'c_'..other_compare_key
                    end
                end
            end
        end
    end
    return false
end

function yma_upgrade_consumable(card)
    local can_upgrade, key = yma_can_upgrade_consumable(card)
    YMA_reroll_card(card, key, nil, 'yma_dreamland_upgrade')
    card.ability.yma_upgrade_lvl = card.ability.yma_upgrade_lvl + 1
end

G.FUNCS.can_upgrade_from_dreamland  = function(e)
    G.GAME.yma_upgradecost_text = G.GAME.yma_upgradecost_text or 5
    if G.dreamlands_consumeable_card_holder and #G.dreamlands_consumeable_card_holder.highlighted == 1 and to_big(G.GAME.dollars - G.GAME.bankrupt_at) >= to_big(5) and not upgrading and not G.CONTROLLER.locked then
        local card = G.dreamlands_consumeable_card_holder.highlighted[1]
        local can_upgrade = yma_can_upgrade_consumable(card)
        if can_upgrade then
            G.GAME.yma_upgradecost_text = (card.ability.yma_upgradecost or 5)
            e.config.colour = G.C.GREEN
            e.config.button = "upgrade_from_dreamland"
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.upgrade_from_dreamland = function(e)
    local card = G.dreamlands_consumeable_card_holder.highlighted[1]
    ease_dollars(-(card.ability.yma_upgradecost or 5))
    yma_upgrade_consumable(card)
end