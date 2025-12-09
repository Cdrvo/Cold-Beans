YMA = YMA or {}


YMA.SideQuests = { quest = {} }

SMODS.Atlas({
    key = "yma_quest_atlas",
    path = "5_Yeah!MostlyArtists/side_quests.png",
    px = 67,
    py = 67,
})

SMODS.ObjectType {
    key = "yma_quest",
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
    -- Rarities don't seem to work
    rarities = {
        { key = 1, weight = 50 },
        { key = 2, weight = 30 },
        { key = 3, weight = 15 },
        { key = 4, weight = 5 },
    },
    
};
YMA.SideQuests.quest = SMODS.Center:extend({
    class_prefix = "q",
    set = "yma_quest",
    atlas = "yma_quest_atlas",
    pos = { x = 0, y = 0 },
    rarity = 1,
    discovered = true, -- for some reason when a side quest is undiscovered it looks kinda weird in a run
    display_size = { w = 65, h = 65 },
    pixel_size = { w = 65, h = 65 },
    required_params = {
        "key",
    },
    set_card_type_badge = function(self, card, badges)
        local display_info = {
            [1] = { name = localize('k_common'), colour = G.C.BLUE },
            [2] = { name = localize('k_uncommon'), colour = G.C.GREEN },
            [3] = { name = localize('k_rare'), colour = G.C.RED },
            [4] = { name = localize('k_legendary'), colour = G.C.PURPLE },
        }

        local r = self.rarity or 1
        local rarity = display_info[r]

        badges[#badges + 1] = create_badge(rarity.name, rarity.colour, nil, 1.2)
    end,
    inject = function(self)
        SMODS.Center.inject(self)
    end,
})

local set_sprites_ref = Card.set_sprites
function Card:set_sprites(center, front)
    set_sprites_ref(self, center, front)
    if center and center.set == 'yma_quest' then
        self.children.center.atlas = G.ASSET_ATLAS.cbean_yma_quest_atlas
        self.children.center.scale = {
            x = G.ASSET_ATLAS.cbean_yma_quest_atlas.px,
            y = G.ASSET_ATLAS.cbean_yma_quest_atlas.py
        }
    end
end

local set_screen_positions_ref = set_screen_positions
function set_screen_positions()
    set_screen_positions_ref()

    if G.STAGE == G.STAGES.RUN and G.side_quests then
        G.side_quests.T.x = G.TILE_W - G.side_quests.T.w - 0.3
        G.side_quests.T.y = 3
        G.side_quests:hard_set_VT()
    end
end

-- note: no_card_count only works on latest smods
local start_run_ref = Game.start_run
function Game:start_run(args)
    self.side_quests = CardArea(
        0, 0,
        2, 2,
        {
            card_limit = 1,
            type = 'joker',
            highlight_limit = 1,
            no_card_count = true,
        }
    )

    start_run_ref(self, args)
    set_screen_positions()
    YMA.add_random_quest()
end

local add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
    if prototype_obj.set == "yma_quest" and #G.GAME.cbean.completed_quests > 0 then
        --print("Completed Quests: ", #G.GAME.cbean.completed_quests)

        for _, completed_quest in ipairs(G.GAME.cbean.completed_quests) do
            if completed_quest == prototype_obj.key then
                --print("removed: ",prototype_obj.key, " key from pool")
                return false  
            end
        end
    end
    
    return add_to_pool_ref(prototype_obj, args)
end

YMA.add_random_quest = function()
    if G.side_quests and #G.side_quests.cards == 0 then
        SMODS.add_card { set = "yma_quest", area = G.side_quests }
    end
end

YMA.complete_quest = function(card, set, key)
    G.GAME.cbean.completed_quests[#G.GAME.cbean.completed_quests+1] = card.config.center.key
    SMODS.add_card { set = set, key = key }
    SMODS.calculate_effect({ message = "Complete!", colour = G.C.GREEN }, card)
    SMODS.destroy_cards(card)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
            G.GAME.cbean_quest_complete = true
            return true
        end
    }))
end
