SMODS.Booster {
    key = "colon_architecture_normal_1",
    weight = 0.3,
    kind = 'colon_Architecture',
    cost = 4,
    pos = { x = 0, y = 0 },
    config = { extra = 2, choose = 1 },
    group_key = "k_colon_architecture_pack", 
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), 
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "colon_Architecture",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "colon_Architecture"
        }
    end,
}


SMODS.Booster {
    key = "colon_architecture_normal_2",
    weight = 0.3,
    kind = 'colon_Architecture', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 4,
    pos = { x = 1, y = 0 },
    config = { extra = 2, choose = 1 },
    group_key = "k_colon_architecture_pack", 
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), 
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "colon_Architecture",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "colon_Architecture"
        }
    end,
}


SMODS.Booster {
    key = "colon_architecture_jumbo_1",
    weight = 0.3,
    kind = 'colon_Architecture', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 6,
    pos = { x = 2, y = 0 },
    config = { extra = 4, choose = 1 },
    group_key = "k_colon_architecture_pack", 
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), 
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "colon_Architecture",
            skip_materialize = true,
            soulable = true,
            key_append =
            "colon_Architecture"
        }
    end,
}


SMODS.Booster {
    key = "colon_architecture_mega_1",
    weight = 0.07,
    kind = 'colon_Architecture', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 8,
    pos = { x = 3, y = 0 },
    config = { extra = 4, choose = 2 },
    group_key = "k_colon_architecture_pack", 
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), 
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "colon_Architecture",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append =
            "colon_Architecture"
        }
    end,
}

local old_get_current_pool = get_current_pool
function get_current_pool(_type, ...)
    if _type == 'colon_Architecture' then
        -- fix weird ass issue and add arch deprio
        local _pool, _pool_key = old_get_current_pool(_type, ...);
        local _new_pool = {}
        local banned = {}
        for i, k in ipairs(G.GAME.cbean_colon_banned_arch or {}) do
            banned[k] = true
        end
        for i = 1, #_pool do
            if G.P_CENTERS[_pool[i]] and (G.P_CENTERS[_pool[i]].set == 'colon_Architecture') then
                if not banned[_pool[i]] then
                    _new_pool[#_new_pool+1] = _pool[i]
                end
            end
        end
        return _new_pool, _pool_key
    end
    return old_get_current_pool(_type, ...);
end