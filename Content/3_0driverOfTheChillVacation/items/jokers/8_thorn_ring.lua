SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "0chill_thorn_ring", 
    atlas = "0chill_thorn_ring_atlas",
    pos = { x = 0, y = 0 },
    rarity = 2,
    order = 1,
    blueprint_compat = true,
    cost = 3,
    config = { 
        extra = { 
            mult = 5.5,
        },
        immutable = {
            hand_size = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.mult,
                card.ability.immutable.hand_size,
            } 
        }
    end,

    update = function(self, card, dt) --Taken and modifed from Cryptid's Mask
        if G.deck and card.added_to_deck then
            for i, v in pairs(G.deck.cards) do
                if not v:is_suit("Hearts") then
                    v:set_debuff(true)
                end
            end
        end
        if G.hand and card.added_to_deck then
            for i, v in pairs(G.hand.cards) do
                if not v:is_suit("Hearts") then
                    v:set_debuff(true)
                end
            end
        end
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.mult
            }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        play_sound('cbean_0chill_thorn_ring_equip')
        card.children.center:set_sprite_pos({x = 1, y = 0})
        G.hand:change_size(-card.ability.immutable.hand_size)
    end,

    remove_from_deck = function(self, card, from_debuff)
        play_sound('cbean_0chill_thorn_ring_sell')
        G.hand:change_size(card.ability.immutable.hand_size)
    end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = {"CapitalChrip",
             "MarioFan597"
        },
        art =  "Monachrome",
        code = "MarioFan597",
    }
}