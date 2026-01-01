JBILL = {}
JBILL.Employed = SMODS.Center:extend {
        unlocked = true,
        discovered = true,
        pos = { x = 0, y = 0 },
        atlas = 'emplatlas',
        config = {},
        class_prefix = 'empl',
        set = 'Employed',
        required_params = {
            'key',
        },
        inject = function(self)
        if not G.P_CENTER_POOLS[self.set] then
            G.P_CENTER_POOLS[self.set] = {}
        end
            SMODS.Center.inject(self)
        end,
        set_card_type_badge = function(self, card, badges)
            badges[#badges + 1] = create_badge(card.config.center.set, G.C.MULT, G.C.WHITE, 1.2)
        end,
        generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
            SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        end
}

JBILL.Employed {
    key = "chicot",
    type = "chicot", --Okay I feel like I need to explain what the fuck is happening here. I tried to make these guys work the same way I did Flying Aces in my own mod... BUT for some reason these guys? They lose their ability field, I think? It works for lov_vars, but the game tells me that their ability field is a nil value. So i'm doing their functionality outside of them. I wanted it to be API-like, but... Fuck you. I meant me. I meant you. Sorry, oh my god, sorry. I'll never talk to you, comment reader, ever again
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    atlas = 'emplatlas',
    config = { extra = { jimbux = 5 } },
    loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.jimbux } }
    end,
}

JBILL.Employed {
    key = "perkeo",
    type = "perkeo",
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    atlas = 'emplatlas',
    config = { extra = { jimbux = 3 } },
    loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.jimbux } }
    end,
}

JBILL.Employed {
    key = "canio",
    type = "canio",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },
    atlas = 'emplatlas',
    config = { extra = { jimbux = 2 } },
    loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.jimbux } }
    end,
}

JBILL.Employed {
    key = "yorick",
    type = "yorick",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    atlas = 'emplatlas',
    config = { extra = { jimbux = 2 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_banished"}
        return { vars = { card.ability.extra.jimbux } }
    end,
}

JBILL.Employed {
    key = "triboulet",
    type = "triboulet",
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    atlas = 'emplatlas',
    config = { extra = { jimbux = 1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_jaded"}
        return { vars = { card.ability.extra.jimbux } }
    end,
}

