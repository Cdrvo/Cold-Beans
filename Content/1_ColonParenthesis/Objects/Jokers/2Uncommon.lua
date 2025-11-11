-- Career Ladder

SMODS.Joker {
    key = "colon_minnesang",
    name = "Minnesang",
    config = {
        extra = {
            discards = 2,
            dollars = 2
        }
    },
    -- atlas = "colon_JokerAtlas",
    -- pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.discards,
                card.ability.extra.dollars
            }
        }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        ease_discard(card.ability.extra.discards)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            return {
                dollars = -card.ability.extra.dollars,
                colour = G.C.RED
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        ease_discard(-card.ability.extra.discards)
    end,
    beans_credits = {
        team = ":(",
        idea = "bitter",
        code = "Glitchkat10",
    }
}

SMODS.Joker {
    key = "colon_mu_cube",
    name = "Mu Cube",
    config = {
        extra = {
            xmult4 = 4,
            req4 = 4,
            count4 = 0,
            xmult6 = 6,
            req6 = 6,
            count6 = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult4,
                card.ability.extra.req4,
                card.ability.extra.count4,
                card.ability.extra.xmult6,
                card.ability.extra.req6,
                card.ability.extra.count6,
            }
        }
    end,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.base.id == 4 then
                card.ability.extra.count4 = card.ability.extra.count4 + 1
                if card.ability.extra.count4 >= card.ability.extra.req4 then
                    card.ability.extra.count4 = 0
                    return {
                        xmult = card.ability.extra.xmult4
                    }
                end
            elseif context.other_card.base.id == 6 then
                card.ability.extra.count6 = card.ability.extra.count6 + 1
                if card.ability.extra.count6 >= card.ability.extra.req6 then
                    card.ability.extra.count6 = 0
                    return {
                        xmult = card.ability.extra.xmult6
                    }
                end
            end
        end 
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        code = "bitter",
    }
}

SMODS.Joker {
    key = "colon_rna",
    name = "RNA",
    pronouns = "it_its",
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local card_copied = SMODS.create_card({
                set = "Playing Card",
                rank = context.full_hand[1].base.id,
                suit = context.full_hand[1].base.suit,
                no_edition = true
            })
            card_copied:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, card_copied)
            G.hand:emplace(card_copied)
            card_copied.states.visible = nil
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_copied:start_materialize()
                    return true
                end
            }))
            return {
                message = "Copied!",
                colour = G.C.CHIPS,
                func = function() -- This is for timing purposes, it runs after the message
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                            return true
                        end
                    }))
                end
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = { "bitter", "George The Rat" },
        code = "bitter",
    }
}

-- Shadow

SMODS.Joker {
    key = "colon_sproinky",
    name = "Sproinky",
    rarity = 2,
    cost = 8,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_gold
    end,
    calculate = function(self, card, context)
        if context.before then
            local scored = {}
            for _, c in pairs(context.scoring_hand) do
                scored[c] = true
            end
            return {
                func = function()
                    for _, other_card in pairs(G.play.cards) do
                        if not scored[other_card] then 
                            other_card:set_ability("m_steel", nil, true)
                        elseif SMODS.has_enhancement(other_card, "m_steel") then
                            SMODS.debuff_card(other_card, true, "Sproinky")
                        end
                    end
                end
            }
        end
    end,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        code = "bitter",
    }
}

SMODS.Joker {
    key = "colon_trouvere",
    name = "Trouvere",
    config = {
        extra = {
            hands = 2,
            discards = 1
        }
    },
    -- atlas = "colon_JokerAtlas",
    -- pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.discards
            }
        }
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        ease_discard(-card.ability.extra.discards)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        ease_hands_played(-card.ability.extra.hands)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        ease_discard(card.ability.extra.discards)
    end,
    beans_credits = {
        team = ":(",
        idea = "bitter",
        code = "Glitchkat10",
    }
}

SMODS.Joker {
    key = "colon_orchestra",
    name = "Orchestra",
    config = {
        extra = {
            hands = 2,
            discards = 2,
            hand_size = 2 
        }
    },
    -- atlas = "",
    -- pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 12,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.ability.extra.discards,
                card.ability.extra.hand_size,
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
        ease_discard(card.ability.extra.discards)
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        G.hand:change_size(-card.ability.extra.hand_size)
    end,
	in_pool = function()
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_troubadour" and G.jokers.cards[i].config.center.key == "j_cbean_colon_minnesang" and G.jokers.cards[i].config.center.key == "j_cbean_colon_trouvere" then
				return true
			end
		end
		return false
	end,
    beans_credits = {
        team = ":( Team",
        idea = "bitter",
        code = { "bitter", "Glitchkat10" },
    }
}