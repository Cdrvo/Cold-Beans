YMA = {}

SMODS.Atlas({
    key = "yma_quest_atlas",
    path = "5_Yeah!MostlyArtists/side_quests.png",
    px = 67,
    py = 67,
})

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

local emplace_ref = CardArea.emplace
function CardArea:emplace(card, location, stay_flipped)
    if self == G.consumeables and card.ability.set == "yma_quest" and G.side_quests then
        G.side_quests:emplace(card, location, stay_flipped)
        return
    end

    emplace_ref(self, card, location, stay_flipped)
end

-- Remove Buttons from Side Quest cards
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local sell = G_UIDEF_use_and_sell_buttons_ref(card)
    if card.ability and card.ability.consumeable and card.ability.set == "yma_quest" then
        sell.nodes[1].nodes = {}
    end
    return sell
end

YMA.add_random_quest = function()
    if G.side_quests and #G.side_quests.cards == 0 then
        SMODS.add_card { set = "yma_quest", area = G.side_quests }
    end
end

YMA.complete_quest = function(card, set, key)
    SMODS.add_card { set = set, key = key }
    SMODS.calculate_effect({ message = "Complete!", colour = G.C.GREEN }, card)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
            SMODS.destroy_cards(card)
            G.GAME.cbean_quest_complete = true
            return true
        end
    }))
end

SMODS.ConsumableType {
    key = "yma_quest",
    collection_rows = { 5, 5 },
    primary_colour = HEX("4d7968"),
    secondary_colour = HEX("4d7968"),
    loc_txt = {
        collection = "Side Quests",
        label = "Side Quest",
        name = "Side Quest",
    },

    inject_card = function(self, center)
        if not self.default then self.default = center.key end
        SMODS.ConsumableType.inject_card(self, center)
        if self.rarity_pools[center.rarity] then
            table.insert(self.rarity_pools[center.rarity], center)
        end
    end,

    set_card_type_badge = function(self, _c, card, badges)
        if not _c.discovered then return end

        local quest_rarity = {
            [1] = { name = localize('k_common'), colour = G.C.BLUE },
            [2] = { name = localize('k_uncommon'), colour = G.C.GREEN },
            [3] = { name = localize('k_rare'), colour = G.C.RED },
            [4] = { name = localize('k_legendary'), colour = G.C.PURPLE },
        }

        local r = _c.rarity or 1
        local rarity = quest_rarity[r]

        table.insert(badges, create_badge(rarity.name, rarity.colour, nil, 1.2))
    end,

    rarities = {
        { key = 1, weight = 65 },
        { key = 2, weight = 30 },
        { key = 3, weight = 15 },
        { key = 4, weight = 1 },
    },
    shop_rate = 0,
}
