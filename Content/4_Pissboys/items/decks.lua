CBEAN_SESSION_DATE, CBEAN_DATE_TABLE = os.date("%d%m%Y"), os.date("*t")
math.randomseed(tonumber(CBEAN_SESSION_DATE))

function tableContains(table, element)
    for _, v in pairs(table) do
        if v == element then return true end
    end
    return false
end

-- for debugging purposes: Sunday is 1, Monday is 2, etc.
function set_dow(num)
    CBEAN_DATE_TABLE.wday = num
    G.P_CENTERS.b_cbean_pboys_daily.pos.y = CBEAN_DATE_TABLE.wday - 1
end

SMODS.Back {
    key = 'pboys_daily',
    atlas = 'pboys_daily_deck',
    pos = { x = math.random(0, 7), y = CBEAN_DATE_TABLE.wday - 1 },
    apply = function(self, back)
        if CBEAN_DATE_TABLE.wday == 1 then
            local _pool, _pool_key = get_current_pool('Voucher')
            _pool_key = 'daily_deck_voucher'
            local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
            local it = 1
            while center == 'UNAVAILABLE' do
                it = it + 1
                center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
            end
            G.GAME.used_vouchers[center] = true
            G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    Card.apply_to_run(nil, G.P_CENTERS[center])
                    return true
                end
            }))
        elseif CBEAN_DATE_TABLE.wday == 2 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    yma_add_tag(get_next_tag_key("daily_deck_tag"))
                    local card = SMODS.create_card{set = "Tarot", key_append = "daily_deck_tarot"}
                    card:add_to_deck()
                    G.consumeables:emplace(card)
                    return true
                end
            }))
        elseif CBEAN_DATE_TABLE.wday == 3 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selected_hand = pseudorandom_element(G.handlist, pseudoseed("daily_deck_poker_hand"))
                    while not G.GAME.hands[selected_hand].visible do
                        selected_hand = pseudorandom_element(G.handlist, pseudoseed("daily_deck_poker_hand_resample"))
                    end
                    level_up_hand(nil, selected_hand, true, 4)
                    return true
                end
            }))
        elseif CBEAN_DATE_TABLE.wday == 4 then
            G.E_MANAGER:add_event(Event({
			func = function()
                local selected_ranks = {}
                while #selected_ranks < 6 do
                    local rank = pseudorandom_element(SMODS.Rank.obj_buffer, pseudoseed("daily_deck_rank_removal"))
                    if not tableContains(selected_ranks, rank) then
                        table.insert(selected_ranks, rank)
                    end
                end
				for k, v in pairs(G.playing_cards) do
                    if tableContains(selected_ranks, v.base.value) then
                        v.to_remove = true
                    end
                end
                local i = 1
                while i <= #G.playing_cards do
                    if G.playing_cards[i].to_remove then
                        G.playing_cards[i]:remove()
                    else
                        i = i + 1
                    end
                end
				G.GAME.starting_deck_size = #G.playing_cards
                return true
			end
		}))
        elseif CBEAN_DATE_TABLE.wday == 5 then
            -- Check the hook to SMODS.add_to_pool in 0_shared/hooks.lua
        elseif CBEAN_DATE_TABLE.wday == 6 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local areas = {G.hand, G.jokers, G.consumeables}
                    local selected_area1 = pseudorandom_element(areas, pseudoseed("daily_deck_+2_area_slot"))
                    for i, v in ipairs(areas) do
                        if v == selected_area1 then
                            table.remove(areas, i)
                            break
                        end
                    end
                    local selected_area2 = pseudorandom_element(areas, pseudoseed("daily_deck_-1_area_slot"))
                    selected_area1:change_size(2)
                    selected_area2:change_size(-1)
                    return true
                end
            }))
        else--if CBEAN_DATE_TABLE.wday == 7 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card_rates = {}
                    for k, _ in pairs(G.GAME) do
                        if string.len(k) > 4 and string.find(k, "_rate")
                        and k ~= "edition_rate" then
                            G.GAME[k] = 1
                            table.insert(card_rates, k)
                        end
                    end
                    local num_types = pseudorandom("daily_deck_num_type", 1, 3)
                    local chosen_rates = {}
                    while #chosen_rates < num_types do -- choose 1 to 3 card types at random
                        local chosen_rate = pseudorandom_element(card_rates, pseudoseed("daily_deck_card_type"))
                        if not tableContains(chosen_rates, chosen_rate) then
                            table.insert(chosen_rates, chosen_rate)
                        end
                    end
                    for _, v in ipairs(card_rates) do -- set all card rates to oblivion
                        G.GAME[v] = G.GAME[v]/1e18
                    end
                    for _, v in ipairs(chosen_rates) do -- undo chosen rates
                        G.GAME[v] = G.GAME[v]*1e18
                    end
                    return true
                end
            }))
        end
        G.GAME.run_back_pos = self.pos
        G.GAME.run_wday = tostring(CBEAN_DATE_TABLE.wday)
    end,
    loc_vars = function(self, info_queue, back)
        local ret = {key = "b_cbean_pboys_daily"}
        ret.key = ret.key..(G.run_setup_overlay and CBEAN_DATE_TABLE.wday or G.GAME.run_wday or CBEAN_DATE_TABLE.wday)
        return ret
    end,
    beans_credits = {
        team = "Pissboys",
        idea = "Nrio_Modder",
        art = "Nrio_Modder",
        code = "HuyTheKiller",
    }
}

SMODS.Back{
    key = "pboys_athena",
    atlas = "pboys_decks",
    pos = {x = 0, y = 0},
    config = {vouchers = {'v_cbean_sdown_amphora', 'v_cbean_yma_krater'}},
    loc_vars = function(self, info_queue, back)
        return {
            vars = {localize{type = 'name_text', key = self.config.vouchers[1], set = 'Voucher'},
                localize { type = 'name_text', key = self.config.vouchers[2], set = 'Voucher'},
            }
        }
    end,
    beans_credits = {
        team = "Pissboys",
        idea = "FlameThrowerFIM",
        art = "FlameThrowerFIM",
        code = "HuyTheKiller",
    }
}