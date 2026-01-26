function create_yma_quest_reroll_UIBox()
    return {
        n = G.UIT.ROOT,
        config = {
            colour = G.C.CLEAR,
            align = "cm",
            padding = 0.2,
            r = 0.1
        },
        nodes = {
            UIBox_button {
                colour = G.C.GREEN,
                align = "cm",
                padding = 0.2,
                r = 0.1,
                minw = 1.4,
                minh = 0.5,
                emboss = 0.1,
                button = "yma_reroll_quest",
                func = "yma_can_reroll_quest",
                label = { "REROLL: $5" },
                scale = 0.5,
            }
        }
    }
end

G.FUNCS.yma_can_reroll_quest = function(e)
    local can_afford = G.GAME.dollars >= G.GAME.cbean.quest_reroll_cost
    if can_afford then
        e.config.colour = G.C.GREEN
        e.config.button = 'yma_reroll_quest'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

function G.FUNCS.yma_reroll_quest()
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
            if G.side_quests and G.side_quests.cards and #G.side_quests.cards > 0 then
                SMODS.destroy_cards(G.side_quests.cards)
            end
            ease_dollars(-G.GAME.cbean.quest_reroll_cost)
            SMODS.add_card { set = "yma_quest", area = G.side_quests }
            return true
        end
    }))
end
