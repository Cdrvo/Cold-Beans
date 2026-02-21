Colonparen.StreetStates = {'EMPLOY', 'BALLEY', 'MAIN_STREET', 'STATIONERY', 'GRAVEYARD', 'HELL', 'DREAMLAND', 'TBOI_CHEST', 'CASINO'}

local old_save_run = save_run;
function save_run()
    for i, name in ipairs(Colonparen.StreetStates) do
        if G.STATE == G.STATES[name] then
            G.STATE = G.STATES.SHOP
            local value = old_save_run()
            G.STATE = G.STATES[name]
            return value
        end
    end

    return old_save_run()
end

