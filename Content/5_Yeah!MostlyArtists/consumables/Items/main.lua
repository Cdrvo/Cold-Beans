YMA = YMA or {}

YMA.TBOI_ITEMS = {}

SMODS.Atlas({
    key = "yma_tboi_atlas",
    path = "5_Yeah!MostlyArtists/tboi_item_consumables.png",
    px = 71,
    py = 95,
})

SMODS.ObjectType {
    key = "yma_tboi_items",
    primary_colour = G.C.WHITE,
    secondary_colour = HEX("466e96"),


    process_loc_text = function(self)
        SMODS.process_loc_text(G.localization.misc.dictionary, 'k_' .. string.lower(self.key), self.loc_txt, 'name')
        SMODS.process_loc_text(G.localization.misc.dictionary, 'b_' .. string.lower(self.key) .. '_cards',
            self.loc_txt, 'collection')
        SMODS.process_loc_text(G.localization.descriptions.Other, 'undiscovered_' .. string.lower(self.key),
            self.loc_txt, 'undiscovered')

        G.C.SECONDARY_SET[self.key] = self.secondary_colour
        G.C.SET[self.key] = self.primary_colour
    end,
};

YMA.TBOI_ITEMS = SMODS.Center:extend({
    set = 'yma_tboi_items',
    cost = 10,
    atlas = 'yma_tboi_atlas',
    discovered = false,
    unlocked = true,
    pos = { x = 0, y = 0 },
    config = {},
    class_prefix = 'ti',
    required_params = {
        'key',
    },
    inject = function(self)
        SMODS.Center.inject(self)
    end,
})
CM = SMODS.current_mod

CM.states = {
    slot_visible = 1,
    areas_moving = false
}

CM.custom_card_areas = function(game)
    game.tboi_items = CardArea(
        game.jokers.T.x, game.jokers.T.y - 4,
        game.jokers.T.w, game.jokers.T.h,
        { card_limit = 999999999, type = 'tboi_items_hide', highlight_limit = 1, no_card_count = true, }
    )
    
    CM.states.slot_visible = 1
    CM.animate_areas()
end

function CM.animate_areas(animate)
    CM.states.areas_moving = true
    if CM.states.slot_visible == -1 then
        ease_alignment('jokers', 0, -4, true, animate)
        ease_alignment('tboi_items', -4, 0, nil, animate)
    else
        ease_alignment('tboi_items', 0, -4, true, animate)
        ease_alignment('jokers', -4, 0, nil, animate)
    end
    G.E_MANAGER:add_event(Event({
        func = function()
            CM.states.areas_moving = false
            return true;
        end
    }))
end

function ease_alignment(area, from_value, to_value, hide, instant, type)
    type = type or 'y'
    if not G[area] then return end
    if instant then
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate', blocking = true, blockable = false,
            func = function()
                G[area].T[type] = to_value
                G[area].VT[type] = to_value
                G[area].config.type = hide and 'tboi_items_hide' or 'joker'
                return true;
            end
        }))
    else
        if not hide then
            G[area].VT[type] = from_value
            G[area].T[type] = from_value
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate', blocking = true, blockable = false,
                func = function()
                    G[area].config.type = 'joker'
                    return true
                end
            }))
        end
            G.E_MANAGER:add_event(Event({
                trigger = 'ease', delay = 0.7, blocking = false, blockable = false,
                ref_table = G[area].T, ref_value = type, ease_to = to_value,
                func = (function(t) return t end)
            }))
        if hide then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.7, blocking = true, blockable = false,
                func = function()
                    G[area].config.type = 'tboi_items_hide'
                    G[area].T[type] = to_value
                    return true
                end
            }))
        end
    end
end

local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
  SMODS.calculate_context({
    cashing_out = true
  })

  cash_out_ref(e)
end

local yma_card_area_emplace = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.consumeables and card.ability.set == "yma_tboi_items" then 
        card:remove_from_area()
        G.tboi_items:emplace(card, location, stay_flipped)
        return
    end
    if self == G.tboi_items then self:change_size(1) end
    if (self == G.jokers and CM.states.slot_visible ~= 1) or (self == G.tboi_items and CM.states.slot_visible ~= -1) then
        G.FUNCS.toggle_jokers_items()
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                yma_card_area_emplace(self, card, location, stay_flipped)
                return true
            end
        }))
        return
    end
    yma_card_area_emplace(self, card, location, stay_flipped)
end

G.FUNCS.toggle_jokers_items = function(e)
    CM.states.slot_visible = CM.states.slot_visible * -1
    play_sound('paper1')
    CM.animate_areas()
end

local yma_card_juice_up = Card.juice_up
function Card:juice_up(scale, rot)
    if self.area and not self.states.hover.is and ((self.area == G.jokers and CM.states.slot_visible ~= 1) or (self.area == G.tboi_items and CM.states.slot_visible ~= -1)) and not self.juicing_until then
        G.FUNCS.toggle_jokers_items()
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.7,
            func = function()
                return true
            end
        }), nil, true)
    end
    yma_card_juice_up(self, scale, rot)
end

local yma_card_start_dissolve = Card.start_dissolve
function Card:start_dissolve(...)
    if self.area and not self.states.hover.is and ((self.area == G.jokers and CM.states.slot_visible ~= 1) or (self.area == G.tboi_items and CM.states.slot_visible ~= -1)) then
        G.FUNCS.toggle_jokers_items()
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.7,
            func = function()
                return true
            end
        }), nil, true)
    end
    yma_card_start_dissolve(self, ...)
end

local yma_card_eval_status_text = card_eval_status_text
function card_eval_status_text(card, ...)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()  
            if ((card.area == G.jokers and CM.states.slot_visible ~= 1) or (card.area == G.tboi_items and CM.states.slot_visible ~= -1)) then
                G.FUNCS.toggle_jokers_items()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.7,
                    func = function()                
                        return true
                    end
                }), nil, true)
            end
            return true
        end
    }))
    yma_card_eval_status_text(card, ...)
end
