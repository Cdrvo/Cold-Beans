SMODS.Joker {
    key = "jbill_wee_bottle",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 3, y = 2 },
    soul_pos = {
        x = 2, y = 2,
        draw = function (card, scale_mod, rotate_mod)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, card.children.center, 1.6, nil, nil, -0.4)
        end
    },
    display_size = { w = 71 * 0.5, h = 95 * 0.5 },
    rarity = 2,
    cost = 6,
    config = { extra = {  } },
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        if context.before then
            for k, v in pairs(context.scoring_hand) do
                if v:get_id() == 2 then
                    v:juice_up()
                    v:set_ability("m_glass")
                end
            end
        end
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "None Yet!"
    }
}