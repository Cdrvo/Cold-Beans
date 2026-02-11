local function yma_quest_reroll_UIButton(card)
    return UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cl", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, button = "yma_reroll_quest", func = "yma_can_reroll_quest", },
                    nodes = {
                        {
                            n = G.UIT.R,
                            config = { align = "cm", maxw = 1.25 },
                            nodes = {
                                { n = G.UIT.T, config = { text = "REROLL", colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } }
                            }
                        },
                        {
                            n = G.UIT.R,
                            config = { align = "cm" },
                            nodes = {
                                { n = G.UIT.T, config = { text = "J" .. G.GAME.cbean.quest_reroll_cost, colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true } },
                            }
                        }
                    }
                }
            }
        },
        config = {
            align = 'cr',
            major = card,
            parent = card,
            offset = { x = -0.2, y = 0 }
        }
    }
end

SMODS.DrawStep {
    key = 'yma_quest_button',
    order = -30,
    func = function(card, layer)
        if card.children.yma_quest_button then
            card.children.yma_quest_button:draw()
        end
    end
}

SMODS.draw_ignore_keys.yma_quest_button = true

local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
    if is_highlighted and self.ability.set == "yma_quest" then
        self.children.yma_quest_button = yma_quest_reroll_UIButton(self)
    elseif self.children.yma_quest_button then
        self.children.yma_quest_button:remove()
        self.children.yma_quest_button = nil
    end

    return highlight_ref(self, is_highlighted)
end

G.FUNCS.yma_can_reroll_quest = function(e)
    local can_afford = G.GAME.jimbux >= G.GAME.cbean.quest_reroll_cost
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
            ease_jimbux(-G.GAME.cbean.quest_reroll_cost)
            SMODS.add_card { set = "yma_quest", area = G.side_quests }
            return true
        end
    }))
end
