
combo_table = { --Lists all combo_types and what they can combo into
    starter = {starter=false, taunt=true, series=true, special=true, ultimate=false, finisher=true, universal=true},
    taunt = {starter=false, taunt=false, series=true, special=true, ultimate=false, finisher=false, universal=true},
    series = {starter=false, taunt=true, series=true, special=true, ultimate=false, finisher=true, universal=true},
    special = {starter=false, taunt=true, series=true, special=false, ultimate=true, finisher=true, universal=true},
    ultimate = {starter=false, taunt=false, series=false, special=false, ultimate=false, finisher=false, universal=true},
    finisher = {starter=false, taunt=false, series=false, special=false, ultimate=false, finisher=false, universal=true},
    universal = {starter=true, taunt=true, series=true, special=true, ultimate=true, finisher=true, universal=true},
    astral_projection = {starter=true, taunt=true, series=false, special=false, ultimate=false, finisher=false, universal=true},
    gaster_blaster = {starter=false, taunt=true, series=false, special=false, ultimate=false, finisher=false, universal=true}
}   --Universal type is for spectral

for k, v in pairs(combo_table) do
    if v.special then
        v['astral_projection'] = true
        v['gaster_blaster'] = true
    end
end

--[[
SMODS.current_mod.calculate = function(self,context)
    if context.after then
        G.GAME.cbean_combo_index = {}
        G.GAME.cbean_combo_unique_hand = {}
        G.GAME.cbean_combos_used_turn = 0
    end
    if context.end_of_round then
        G.GAME.cbean_combo_unique_round = {}
    end
end
]]--

---Functions (By MarioFan597)

--Checks if given hand has been used before
local function entry_scan(table, card_id)
    for i, entry in pairs(table) do
        if entry == card_id then
            return true
        end
    end
    return false
end




--Checks if the combo is unique and hasn't already been used
function ComboUniqueCheck(card)
    if not (card.ability.immutable.unique_hand or card.ability.immutable.unique_round) then -- Checks if combo is uniue in either way
        return true
    else
        if card.ability.immutable.unique_hand and not (entry_scan(G.GAME.cbean_combo_unique_hand,tostring(card.config.center.key))) then --checks if the card is unique per hand and not already used
            return true
        elseif card.ability.immutable.unique_round and not (entry_scan(G.GAME.cbean_combo_unique_round,tostring(card.config.center.key))) then --checks if the card is unique per round and not already used
            return true
        else
            return false
        end
    end
end

function CanCombo(card) --Checks if the card can combo. Also makes the combo index which stores the sequence of moves used.

    --Creation of important indexes and values
    if not G.GAME.cbean_combo_index then --Stores the type of move used previously
        G.GAME.cbean_combo_index = {}
    end
    if not G.GAME.cbean_combo_unique_hand then --Stores the name of the card if it is unique of the hand
        G.GAME.cbean_combo_unique_hand = {}
    end
    if not G.GAME.cbean_combo_unique_round then --Stores the name of the card if it is unique for the round
        G.GAME.cbean_combo_unique_round = {}
    end
    if not G.GAME.cbean_combos_used_total then --Stores the number of combo cards used total Needed for Lone Warrior
        G.GAME.cbean_combos_used_total = 0
    end
    if not G.GAME.cbean_combos_used_turn then --Stores the number of combo cards used in a turn.
        G.GAME.cbean_combos_used_turn = 0
    end

    --Checking if it is compatable with current combo index.
    if next(G.GAME.cbean_combo_index) == nil and card.ability.immutable.sequence <= 0 then --If the list is empty and combo card isn't already in a combo
        if (card.ability.immutable.combo_type == "starter" or card.ability.immutable.combo_type == "taunt" or card.ability.immutable.combo_type == "universal") and ComboUniqueCheck(card) then
            return true
        else
            return false
        end
    elseif combo_table[G.GAME.cbean_combo_index[#G.GAME.cbean_combo_index]][card.ability.immutable.combo_type] --Checks combo table if the previous combo would allow the new combo card type
        and card.ability.immutable.sequence <= 0 and ComboUniqueCheck(card) then 
            return true
    else
        return false
    end
end

function CanUncombo(card) --Checks if the card can uncombo.
    if G.GAME.cbean_combo_index then
        if card.ability.immutable.sequence == #G.GAME.cbean_combo_index then
            return true
        else
            return false
        end
    else
        return false
    end
end

function SelectCombo(card)
    --Adds card to combo index and saves the position in card
    if card.ability.extra then
        if card.ability.extra.combo_size then
            for i=1, card.ability.extra.combo_size do
                table.insert(G.GAME.cbean_combo_index, card.ability.immutable.combo_type)
                G.GAME.cbean_combos_used_total = G.GAME.cbean_combos_used_total + 1
                G.GAME.cbean_combos_used_turn = G.GAME.cbean_combos_used_turn + 1
            end
        else
            table.insert(G.GAME.cbean_combo_index, card.ability.immutable.combo_type)
            G.GAME.cbean_combos_used_total = G.GAME.cbean_combos_used_total + 1
            G.GAME.cbean_combos_used_turn = G.GAME.cbean_combos_used_turn + 1
        end
    else
        table.insert(G.GAME.cbean_combo_index, card.ability.immutable.combo_type)
        G.GAME.cbean_combos_used_total = G.GAME.cbean_combos_used_total + 1
         G.GAME.cbean_combos_used_turn = G.GAME.cbean_combos_used_turn + 1
    end

    card.ability.immutable.sequence = #G.GAME.cbean_combo_index

    --Remove unique hands from lists so they can be reslected if needed
    if card.ability.immutable.unique_hand then --Adds card id to lists if they are unique
        table.insert(G.GAME.cbean_combo_unique_hand, tostring(card.config.center.key))
    elseif card.ability.immutable.unique_round then --Adds card id to lists if they are unique
        table.insert(G.GAME.cbean_combo_unique_round, tostring(card.config.center.key))
    end

    local eval = function(card) return (card.ability.immutable.sequence ~= 0) end
        juice_card_until(card, eval, true)
end

function UnselectCombo(card)
    if card.ability.extra then
        if card.ability.extra.combo_size then
            for i=1, card.ability.extra.combo_size do
                if G.GAME.cbean_combo_index then
                    G.GAME.cbean_combo_index[#G.GAME.cbean_combo_index] = nil
                end
                G.GAME.cbean_combos_used_total = G.GAME.cbean_combos_used_total - 1
                G.GAME.cbean_combos_used_turn = G.GAME.cbean_combos_used_turn - 1
            end
        else
            if G.GAME.cbean_combo_index then
                G.GAME.cbean_combo_index[#G.GAME.cbean_combo_index] = nil
            end
            G.GAME.cbean_combos_used_total = G.GAME.cbean_combos_used_total - 1
            G.GAME.cbean_combos_used_turn = G.GAME.cbean_combos_used_turn - 1
        end
    else
        if G.GAME.cbean_combo_index then
            G.GAME.cbean_combo_index[#G.GAME.cbean_combo_index] = nil
        end
        G.GAME.cbean_combos_used_total = G.GAME.cbean_combos_used_total - 1
        G.GAME.cbean_combos_used_turn = G.GAME.cbean_combos_used_turn - 1
    end

    card.ability.immutable.sequence = 0

    --Remove unique hands from lists so they can be reslected if needed
    if card.ability.immutable.unique_hand then
        table.remove(G.GAME.cbean_combo_unique_hand, #G.GAME.cbean_combo_unique_hand)
    elseif card.ability.immutable.unique_round then
        table.remove(G.GAME.cbean_combo_unique_round, #G.GAME.cbean_combo_unique_round)
    end
end





---Combo Cards Definition

SMODS.ConsumableType {
    key = 'Combo',
    default = 'c_cbean_0chill_standing_punch',
    primary_colour = HEX('E89A35'), --placeholder for now, we can update these once we know what we want to do.
    secondary_colour = HEX('E91E63'), --placeholder for now, we can update these once we know what we want to do.
    collection_rows = { 6, 6 },
    shop_rate = 1,
    loc_txt = {
        name = "Combo",
        collection = "Combo",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase this card",
                "in an unseeded",
                "run to learn",
                "what it does"
            }
        }
    },
}

-- Hi, HuyTheKiller from Pissboys here
-- I just don't like undiscovered sprites not being used or being used inappropriately ;p
SMODS.UndiscoveredSprite {
    key = 'Combo',
    atlas = "0chill_combo_atlas",
    pos = { x = 6, y = 4 },
    no_overlay = true
}