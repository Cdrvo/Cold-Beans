YMA = YMA or {}


YMA.SideQuests = { quest = {} }

SMODS.Atlas({
    key = "yma_quest_atlas",
    path = "5_Yeah!MostlyArtists/side_quests.png",
    px = 65,
    py = 65,
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
        { key = 'Common',    weight = 60 },
        { key = 'Uncommon',  weight = 25 },
        { key = 'Rare',      weight = 12 },
        { key = 'Legendary', weight = 3 },
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
        table.insert(SMODS.ObjectTypes['yma_quest'].rarity_pools[self.rarity], self)
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

YMA.add_random_quest = function()
    if G.side_quests and #G.side_quests.cards == 0 then
        SMODS.add_card { set = "yma_quest", area = G.side_quests }
    end
end

YMA.complete_quest = function(card, set, key, add_card)
    add_card = (add_card == nil) and true or add_card
    G.GAME.cbean.completed_quests[#G.GAME.cbean.completed_quests + 1] = card.config.center.key
    if add_card then
        SMODS.add_card { set = set, key = key }
    end
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
