SMODS.Joker {
    key = "colon_sophron",
    name = "Sophron",
    atlas = "colon_JokerAtlas",
    pos = { x = 4, y = 1 },
    soul_pos = { x = 5, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,

    calculate = function(self,card,context)
        if context.repetition and context.cardarea == G.play and not context.end_of_round then
            local times = 0
            for i, other_card in pairs(G.play.cards) do
                if other_card == context.other_card then
                    times = i-1
                end
            end
            if times < 1 then
                return
            end
            return {
                repetitions = times
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "bitter",
        code = "bitter",
        art = "George The Rat",
    }
}

SMODS.Joker {
    key = "colon_plato",
    name = "Plato",
    atlas = "colon_JokerAtlas",
    pos = { x = 0, y = 1 },
    soul_pos = { x = 1, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {
                    HEX("87a365"), -- colour text formatted with {V:1}
                },
            }
        }
    end,
    add_to_deck = function (self, card, from_debuff)
        if not from_debuff then
            Colonparen.recalculateBlinds(card)
        end
    end,
    calculate = function(self, card, context)
        if context.cbean_colon_set_blind then
            if context.blind_type == "CEO" then
                return {
                    blind = Colonparen.get_new_blind("Lower_Greek")
                }
            end
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    }
}

--Commented out because it doesn't do anything. Team :( go finish this in lap 2
--[[
SMODS.Joker {
    key = "colon_aristotle",
    name = "Hippocrates",
    atlas = "colon_JokerAtlas",
    pos = { x = 2, y = 1 },
    soul_pos = { x = 3, y = 1 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end,
    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        code = "N/A",
    }
}]]--

SMODS.Joker {
    key = "colon_aristoxenus",
    name = "Aristoxenus",
    atlas = "colon_JokerAtlas",
    pos = { x = 6, y = 1 },
    soul_pos = { x = 7, y = 1 },
    config = {
        extra = {
            xmult_mod = 0.1,
            xmult = 1,
        },
        immutable = {
            last_track = "",
            laster_track = "", --The track before the last track

        }
    },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        card.ability.immutable.last_track = tostring(SMODS.previous_track) --Checks if the song is not the same as the last
        if (card.ability.immutable.last_track ~= card.ability.immutable.laster_track) and (card.ability.immutable.laster_track ~= "") then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "xmult",
                        scalar_value = "xmult_mod",
                        message_key = "a_xmult",
                        message_colour = G.C.MULT,
                    })
                    return true
                end,
            }))
            card.ability.immutable.laster_track = card.ability.immutable.last_track
                                                                            --This is here to prevent a boost when first aquired
        elseif  (card.ability.immutable.last_track ~= card.ability.immutable.laster_track) and (card.ability.immutable.laster_track == "") then
            card.ability.immutable.laster_track = card.ability.immutable.last_track
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = { ":(/",
            "0 Drivers of",
            "The Chill Vaction" },
        idea = "Glitchkat10",
        code = "MarioFan597",
        art = "George The Rat",
    }
}








SMODS.Joker {
    key = "coldbean",
    name = "Cold Bean",
    atlas = "colon_JokerAtlas",
    pos = { x = 0, y = 8 },
    discovered = true,

    config = {
        extra = {
            xmult = 80085 -- b00bz
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    rarity = 4,
    cost = 199.99,
    blueprint_compat = true,
    in_pool = function()
        return false
    end,
    no_collection = true,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    beans_credits = {
        team = "yo mama",
    }
}