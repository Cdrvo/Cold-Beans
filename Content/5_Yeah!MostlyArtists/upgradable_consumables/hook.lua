
-- upgrade my consumables

local upgrading = false
local base_consumables = {
    "c_magician",
    "c_hermit",
    "c_wheel_of_fortune",
    "c_wraith",
    "c_chariot",
    "c_justice",
    "c_ectoplasm"
}
local level1_consumables = {
    "c_cbean_yma_magician_level1",
    "c_cbean_yma_hermit_level1",
    "c_cbean_yma_wheel_of_fortune_level1",
    "c_cbean_yma_wraith_level1",
    "c_cbean_yma_chariot_level1",
    "c_cbean_yma_justice_level1",
    "c_cbean_yma_ectoplasm_level1"
}
local level2_consumables = {
    "c_cbean_yma_magician_level2",
    "c_cbean_yma_hermit_level2",
    "c_cbean_yma_wheel_of_fortune_level2",
    "c_cbean_yma_wraith_level2",
    "c_cbean_yma_chariot_level2",
    "c_cbean_yma_justice_level2",
    "c_cbean_yma_ectoplasm_level2"
}
local level3_consumables = {
    "c_cbean_yma_magician_level3",
    "c_cbean_yma_hermit_level3",
    "c_cbean_yma_wheel_of_fortune_level3",
    "c_cbean_yma_wraith_level3",
    "c_cbean_yma_chariot_level3",
    "c_cbean_yma_justice_level3",
    "c_cbean_yma_ectoplasm_level3"
}
local level4_consumables = {
    "c_cbean_yma_magician_level4",
    "c_cbean_yma_hermit_level4",
    "c_cbean_yma_wheel_of_fortune_level4",
    "c_cbean_yma_wraith_level4",
    "c_cbean_yma_chariot_level4",
    "c_cbean_yma_justice_level4",
    "c_cbean_yma_ectoplasm_level4"
}
local level5_consumables = {
    "c_cbean_yma_magician_level5",
    "c_cbean_yma_hermit_level5",
    "c_cbean_yma_wheel_of_fortune_level5",
    "c_cbean_yma_wraith_level5",
    "c_cbean_yma_chariot_level5",
    "c_cbean_yma_justice_level5",
    "c_cbean_yma_ectoplasm_level5"
}

G.FUNCS.can_upgrade_from_consumeable_slot  = function(e)
    if to_big(G.GAME.dollars - G.GAME.bankrupt_at) >= to_big(5) and not upgrading and not G.CONTROLLER.locked then
        for i = 1, #base_consumables do
            if G.consumeables.highlighted[1].config.center.key == base_consumables[i]
            or G.consumeables.highlighted[1].config.center.key == level1_consumables[i]
            or G.consumeables.highlighted[1].config.center.key == level2_consumables[i]
            or G.consumeables.highlighted[1].config.center.key == level3_consumables[i]
            or G.consumeables.highlighted[1].config.center.key == level4_consumables[i] then
                e.config.colour = G.C.GREEN
                e.config.button = "upgrade_from_consumeable_slot"
                break
            else
                e.config.colour = G.C.UI.BACKGROUND_INACTIVE
                e.config.button = nil
            end
        end
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end


G.FUNCS.upgrade_from_consumeable_slot = function(e)
    local ref = e.config.ref_table
    --ease_dollars(-ref.ability.upgradecost)
    ease_dollars(-5)
    for i = 1, #base_consumables do
        if G.consumeables.highlighted[1].config.center.key == base_consumables[i] then
            SMODS.add_card({ set = 'Consumeable', key = level1_consumables[i] })
            break
        elseif G.consumeables.highlighted[1].config.center.key == level1_consumables[i] then
            SMODS.add_card({ set = 'Consumeable', key = level2_consumables[i] })
            break
        elseif G.consumeables.highlighted[1].config.center.key == level2_consumables[i] then
            SMODS.add_card({ set = 'Consumeable', key = level3_consumables[i] })
            break
        elseif G.consumeables.highlighted[1].config.center.key == level3_consumables[i] then
            SMODS.add_card({ set = 'Consumeable', key = level4_consumables[i] })
            break
        elseif G.consumeables.highlighted[1].config.center.key == level4_consumables[i] then
            SMODS.add_card({ set = 'Consumeable', key = level5_consumables[i] })
            break
        end
    end
    G.consumeables.highlighted[1]:start_dissolve(nil, true)
end

G.FUNCS.can_upgrade_from_dreamland  = function(e)
    G.GAME.yma_upgradecost_text = G.GAME.yma_upgradecost_text or 5
    if G.dreamlands_consumeable_card_holder and #G.dreamlands_consumeable_card_holder.highlighted == 1 and to_big(G.GAME.dollars - G.GAME.bankrupt_at) >= to_big(5) and not upgrading and not G.CONTROLLER.locked then
        local card = G.dreamlands_consumeable_card_holder.highlighted[1]
        for i = 1, #base_consumables do
            if card.config.center.key == base_consumables[i]
            or card.config.center.key == level1_consumables[i]
            or card.config.center.key == level2_consumables[i]
            or card.config.center.key == level3_consumables[i]
            or card.config.center.key == level4_consumables[i] then
                G.GAME.yma_upgradecost_text = (card.ability.yma_upgradecost or 5)
                e.config.colour = G.C.GREEN
                e.config.button = "upgrade_from_dreamland"
                break
            else
                e.config.colour = G.C.UI.BACKGROUND_INACTIVE
                e.config.button = nil
            end
        end
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end


G.FUNCS.upgrade_from_dreamland = function(e)
    local card = G.dreamlands_consumeable_card_holder.highlighted[1]
    ease_dollars(-(card.ability.yma_upgradecost or 5))
    for i = 1, #base_consumables do
        if card.config.center.key == base_consumables[i] then
            YMA_reroll_card(card, level1_consumables[i], nil, 'yma_dreamland_upgrade')
            break
        elseif card.config.center.key == level1_consumables[i] then
            YMA_reroll_card(card, level2_consumables[i], nil, 'yma_dreamland_upgrade')
            break
        elseif card.config.center.key == level2_consumables[i] then
            YMA_reroll_card(card, level3_consumables[i], nil, 'yma_dreamland_upgrade')
            break
        elseif card.config.center.key == level3_consumables[i] then
            YMA_reroll_card(card, level4_consumables[i], nil, 'yma_dreamland_upgrade')
            break
        elseif card.config.center.key == level4_consumables[i] then
            YMA_reroll_card(card, level5_consumables[i], nil, 'yma_dreamland_upgrade')
            break
        end
    end
end