
-- uh how does this work again
-- don't worry, I got your back ;P (HuyTheKiller from Pissboys)
SMODS.UndiscoveredSprite {
    key = 'colon_Architecture',
    atlas = "colon_Architecture",
    pos = { x = 12, y = 0 },
    no_overlay = true
}

Colonparen.Architecture {
    key = 'colon_parthenon',
    done_pos = { x = 6, y = 6 },
    set = "Spectral",
    hidden = true,
    soul_set = "colon_Architecture",

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },

    evaluate_completion = function ()
        return {
            colonparen_complete = true
        }
    end,
    spawn = function (self, card)
        local greek = pseudorandom_element(Colonparen.GreekBlinds, pseudoseed("colon_parthenon"))
        Colonparen.spawnGreekBlind(greek.key)
    end,
    loc_vars = function (self, info_queue, card)
        if card.ability.colonparen_archid then
            if G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] ~= card.ability.colonparen_archid then
                for i, ID in ipairs(G.GAME.cbean_colonparen_queue) do
                    if ID == card.ability.colonparen_archid then
                        local amount_away = #G.GAME.cbean_colonparen_queue - i + 1;
                        return {
                            key = "c_cbean_colon_parthenon_queued",
                            vars = {
                                number_format(amount_away)
                            }
                        }
                    end
                end
                return {
                    key = "c_cbean_architecture_BUGBUG"
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_crepidoma',
    base_pos = { x = 9, y = 0 },
    progress_pos = { x = 10, y = 0 },
    done_pos = { x = 11, y = 0 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_omega",
    progress = function (self)
        if not G.cbean_colon_arch then
            return 0
        end

        local amount = 0;
        for i, card in ipairs(G.cbean_colon_arch.cards) do
            if (card.config.center.key ~= "c_cbean_colon_crepidoma") and (card.ability.colonparen_state == 0) then
                amount = amount + 1
            end
        end

        return amount
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { self:progress() }
        }
    end,
    evaluate_completion = function (self, card)
        local amount = self:progress();
        if amount >= 3 then
            return {
                colonparen_complete = true
            }
        elseif amount > 0 then
            return {
                colonparen_in_progress = true
            }
        else
            return {
                colonparen_base = true
            }
        end
    end,
    calculate = function (self, card, context)
        if context.cbean_colonparen_gain_arch then
            return self:evaluate_completion(card)
        end
    end
}


Colonparen.Architecture {
    key = 'colon_corinthian_capital',
    base_pos = { x = 3, y = 2 },
    progress_pos = { x = 4, y = 2 },
    done_pos = { x = 5, y = 2 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_alpha",
    
    progress = function (self)
        if not next(G.playing_cards or {}) then
            return 0
        end

        local amount = 0;
        for i, card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(card, 'm_lucky') then
                amount = amount + 1
            end
        end

        return math.ceil((amount * 100) / #G.playing_cards)
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { self:progress() }
        }
    end,
    evaluate_completion = function (self, card)
        local percent = self:progress()
        if percent >= 33 then
            return {
                colonparen_complete = true
            }
        elseif percent > 0 then
            return {
                colonparen_in_progress = true
            }
        else
            return {
                colonparen_base = true
            }
        end
    end,
    calculate = function (self, card, context)
        if context.cbean_colonparen_modify_deck then
            return self:evaluate_completion(card)
        end
    end
}

local old_start_dissolve = Card.start_dissolve;
function Card.start_dissolve(card, ...)
    if Colonparen.is_food(card) and (not card.ability.yma_sold_self) then
        SMODS.calculate_context{
            cbean_colon_eaten = true,
            card = card
        }
    end
    return old_start_dissolve(card, ...)
end

local old_start_shatter = Card.shatter;
function Card.shatter(card, ...)
    if Colonparen.is_food(card) and (not card.ability.yma_sold_self) then
        SMODS.calculate_context{
            cbean_colon_eaten = true,
            card = true
        }
    end
    return old_start_shatter(card, ...)
end

Colonparen.Architecture {
    key = 'colon_raking',
    base_pos = { x = 0, y = 6 },
    progress_pos = { x = 1, y = 6 },
    done_pos = { x = 2, y = 6 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_beta",
    
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.cbean_colon_eaten then
            return {
                colonparen_complete = true
            }
        end
    end
}

Colonparen.Architecture {
    key = 'colon_abacus',
    base_pos = { x = 3, y = 3 },
    progress_pos = { x = 4, y = 3 },
    done_pos = { x = 5, y = 3 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_gamma",
    config = {
        extra = 0
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra or 0
            }
        }
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.before and (#context.full_hand > 0) then -- this is not redundant. cryptid exists, people. i'm being proactive
            local unscoring = card.ability.extra;
            for i = 1, #context.full_hand do
                for q = 1, #context.scoring_hand do
                    if context.scoring_hand[q] == context.full_hand[i] then
                        goto continue
                    end
                end
                unscoring = unscoring + 1;
                ::continue::
            end
            card.ability.extra = unscoring;
            if unscoring >= 20 then
                return {
                    colonparen_complete = true
                }
            elseif unscoring > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_flute',
    base_pos = { x = 6, y = 1 },
    progress_pos = { x = 7, y = 1 },
    done_pos = { x = 8, y = 1 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_delta",
    config = {
        extra = 0
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra or 0
            }
        }
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.pre_discard then
            card.ability.extra = card.ability.extra + 1;
            if card.ability.extra >= 5 then
                return {
                    colonparen_complete = true
                }
            elseif card.ability.extra > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        elseif context.end_of_round then
            card.ability.extra = 0
            
            return {
                colonparen_base = true
            }
        end
    end
}

Colonparen.Architecture {
    key = 'colon_necking',
    base_pos = { x = 6, y = 0 },
    progress_pos = { x = 7, y = 0 },
    done_pos = { x = 8, y = 0 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_epsilon",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.end_of_round and (G.GAME.blind.chips) then
            local percentage = math.abs(((G.GAME.chips / G.GAME.blind.chips) - 1) * 100)

            if percentage <= 10 then
                return {
                    colonparen_complete = true
                }
            elseif percentage <= 30 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_volute',
    base_pos = { x = 3, y = 4 },
    progress_pos = { x = 4, y = 4 },
    done_pos = { x = 5, y = 4 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_zeta",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.pre_discard and (#context.full_hand >= 5) then
            local amount_of_glass = 0;
            for i = 1, #context.full_hand do
                if SMODS.has_enhancement(context.full_hand[i], 'm_glass') then
                    amount_of_glass = amount_of_glass + 1;
                    if amount_of_glass >= 5 then
                        return {
                            colonparen_complete = true
                        }
                    end
                end
            end
            
            if amount_of_glass > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_acanthus_leaf',
    base_pos = { x = 9, y = 6 },
    progress_pos = { x = 10, y = 6 },
    done_pos = { x = 11, y = 6 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            amount = 0
        }
    },
    greek_blind = "cbean_colon_eta",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    set_ability = function (self, card, initial, delay_sprites)
        if not card.ability.extra.rank then
            local options = {}
            for k, rank in pairs(SMODS.Ranks) do
                if rank.face then
                    options[#options+1] = k
                end
            end

            card.ability.extra.rank = pseudorandom_element(options, pseudoseed('colon_acanthus_leaf'))
        end
    end,
    loc_vars = function (self, info_queue, card)
        local rank_text;
        if card:in_collection() then
            rank_text = localize('cbean_colon_random_face')
        else
            rank_text = localize((card.ability.extra.rank or "King"), 'ranks')
        end
        return {
            vars = {
                card.ability.extra.amount,
                rank_text
            }
        }
    end,
    calculate = function (self, card, context)
        if context.remove_playing_cards then
            for i = 1, #context.removed do
                local other = context.removed[i];
                if (other.base.value == card.ability.extra.rank) and (not SMODS.has_no_rank(other)) then
                    card.ability.extra.amount = card.ability.extra.amount + 1;
                end
            end
            
            if card.ability.extra.amount >= 4 then
                return {
                    colonparen_complete = true
                }
            elseif card.ability.extra.amount > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_cornice',
    base_pos = { x = 3, y = 0 },
    progress_pos = { x = 4, y = 0 },
    done_pos = { x = 5, y = 0 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_theta",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.pre_discard and G.GAME.blind.chips then
            local score = SMODS.calculate_round_score(true);
            
            if score >= G.GAME.blind.chips then
                return {
                    colonparen_complete = true
                }
            elseif score > (G.GAME.blind.chips / 2) then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        end
    end
}


Colonparen.Architecture {
    key = 'colon_frieze',
    base_pos = { x = 0, y = 5 },
    progress_pos = { x = 1, y = 5 },
    done_pos = { x = 2, y = 5 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = 0,
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra or 0
            }
        }
    end,
    greek_blind = "cbean_colon_iota",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.buying_card and (not context.buying_self) then
            card.ability.extra = card.ability.extra + 1;
            
            if card.ability.extra >= 50 then
                return {
                    colonparen_complete = true
                }
            elseif card.ability.extra > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_fillet',
    base_pos = { x = 9, y = 6 },
    progress_pos = { x = 10, y = 6 },
    done_pos = { x = 11, y = 6 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = 0,
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra or 0
            }
        }
    end,
    greek_blind = "cbean_colon_kappa",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.joker_main and (G.GAME.current_round.hands_left == 0) then
            card.ability.extra = card.ability.extra + 1;

            if card.ability.extra >= 3 then
                return {
                    colonparen_complete = true
                }
            elseif card.ability.extra > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end
        elseif context.end_of_round and (G.GAME.current_round.hands_left ~= 0) then
            card.ability.extra = 0;
            return {
                colonparen_base = true
            }
        end
    end
}


Colonparen.Architecture {
    key = 'colon_boss',
    base_pos = { x = 9, y = 6 },
    progress_pos = { x = 10, y = 6 },
    done_pos = { x = 11, y = 6 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = nil,
    },
    loc_vars = function (self, info_queue, card)
        local voucher = (card.ability.extra or 'v_illusion');
        local voucher_name;
        if not card:in_collection() then
            if card.ability.colonparen_state ~= 2 then
                info_queue[#info_queue+1] = G.P_CENTERS[voucher]
            end
            voucher_name = localize{type = 'name_text', key = voucher, set = 'Voucher'}
        else
            voucher_name = localize('cbean_colon_random_achievable_tier2')
        end
        return {
            vars = {
                voucher_name
            }
        }
    end,
    greek_blind = "cbean_colon_lambda",
    set_ability = function (self, card, initial, delay_sprites)
        if (G.STAGE == G.STAGES.RUN) and (not card.ability.extra) then
            local raw_pool, _ = get_current_pool('Voucher', nil, nil, nil)
            local pool = {}
            for i = 1, #raw_pool do
                --print(G.P_CENTERS[raw_pool[i]])
                if (raw_pool[i] ~= 'UNAVAILABLE') and (G.P_CENTERS[raw_pool[i]] and G.P_CENTERS[raw_pool[i]].requires) then
                    pool[#pool+1] = raw_pool[i]
                end
            end

            card.ability.extra = pseudorandom_element(pool, pseudoseed('colon_boss')) or 'v_illusion'
        end
    end,
    in_pool = function ()
        local pool = {}

        for k,v in pairs(G.P_CENTERS) do
            if v.set == "Voucher" and v.requires and not next(SMODS.find_card(k)) then
                return true
            end
        end
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.buying_card and (context.card.ability.set == 'Voucher') then
            if (context.card.config.center.key == card.ability.extra) then
                return {
                    colonparen_complete = true
                }
            else
                return {
                    colonparen_in_progress = true
                }
            end
        end
    end
}


Colonparen.Architecture {
    key = 'colon_triglyph',
    base_pos = { x = 6, y = 3 },
    progress_pos = { x = 7, y = 3 },
    done_pos = { x = 8, y = 3 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            count = 0,
            rank = nil
        },
    },
    loc_vars = function (self, info_queue, card)
        local rank_text;
        if not card:in_collection() then
            rank_text = localize(card.ability.extra.rank or '2', 'ranks')
        else
            rank_text = localize('cbean_colon_most_rank_in_deck')
        end
        return {
            vars = {
                rank_text,
                card.ability.extra.count
            }
        }
    end,
    greek_blind = "cbean_colon_mu",
    set_ability = function (self, card, initial, delay_sprites)
        if next(G.playing_cards or {}) and (not card.ability.extra.rank) then
            local count = {}
            for i = 1, #G.playing_cards do
                local card = G.playing_cards[i];
                if not SMODS.has_no_rank(card) then
                    count[card.base.value] = (count[card.base.value] or 0) + 1;
                end
            end

            local newtable = {}
            for k, v in pairs(count) do
                newtable[#newtable+1] = { k, v }
            end
            table.sort(newtable, function (a, b) return a[2] > b[2] end)
            --print(newtable)

            card.ability.extra.rank = newtable[1][1]
        end
    end,
    in_pool = function ()
        local count = {}
        local literallynone = true;
        for i = 1, #G.playing_cards do
            local card = G.playing_cards[i];
            if not SMODS.has_no_rank(card) then
                count[card.base.value] = (count[card.base.value] or 0) + 1;
                literallynone = false;
            end
        end

        if literallynone then return false end;

        local newtable = {}
        for k, v in pairs(count) do
            newtable[#newtable+1] = { k, v }
        end
        table.sort(newtable, function (a, b) return a[2] > b[2] end)
        --print(newtable)

        local maximum = newtable[1][2];
        for i = 2, #newtable do
            if newtable[i][2] == maximum then
                return false
            end
        end

        return true
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.discard 
            and (not SMODS.has_no_rank(context.other_card))
            and (context.other_card.base.value == card.ability.extra.rank) then
            
            card.ability.extra.count = card.ability.extra.count + 1;

            if (card.ability.extra.count >= 10)  then
                return {
                    colonparen_complete = true,
                    colonparen_card = card
                }
            elseif (card.ability.extra.count > 0) then
                return {
                    colonparen_in_progress = true,
                    colonparen_card = card
                }
            else
                return {
                    colonparen_base = true,
                    colonparen_card = card
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_metope',
    base_pos = { x = 9, y = 1 },
    progress_pos = { x = 10, y = 1 },
    done_pos = { x = 11, y = 1 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            count = 0,
            suit = nil
        },
    },
    loc_vars = function (self, info_queue, card)
        local suit_text;
        local colour;
        if not card:in_collection() then
            suit_text = localize(card.ability.extra.suit or 'Hearts', 'suits_plural')
            colour = G.C.SUITS[card.ability.extra.suit or 'Hearts'];
        else
            suit_text = localize('cbean_colon_least_suit_in_deck')
            colour = G.C.FILTER;
        end
        return {
            vars = {
                suit_text,
                card.ability.extra.count,
                colours = {
                    colour, -- colour text formatted with {V:1}
                },
            }
        }
    end,
    greek_blind = "cbean_colon_nu",
    set_ability = function (self, card, initial, delay_sprites)
        if next(G.playing_cards or {}) and (not card.ability.extra.suit) then
            local count = {}
            for i = 1, #G.playing_cards do
                local card = G.playing_cards[i];
                if not SMODS.has_no_suit(card) then
                    count[card.base.suit] = (count[card.base.suit] or 0) + 1;
                end
            end

            local newtable = {}
            for k, v in pairs(count) do
                newtable[#newtable+1] = { k, v }
            end
            table.sort(newtable, function (a, b) return a[2] < b[2] end)
            --print(newtable)

            card.ability.extra.suit = newtable[1][1]
        end
    end,
    in_pool = function ()
        local count = {}
        local literallynone = true;
        for i = 1, #G.playing_cards do
            local card = G.playing_cards[i];
            if not SMODS.has_no_suit(card) then
                count[card.base.suit] = (count[card.base.suit] or 0) + 1;
                literallynone = false;
            end
        end

        if literallynone then return false end;

        local newtable = {}
        for k, v in pairs(count) do
            newtable[#newtable+1] = { k, v }
        end
        table.sort(newtable, function (a, b) return a[2] < b[2] end)

        local minimum = newtable[1][2];
        for i = 2, #newtable do
            if newtable[i][2] == minimum then
                return false
            end
        end

        return true
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.before and (context.scoring_name == 'Flush') and (#context.scoring_hand > 0) then
            for i = 1, #context.scoring_hand do
                if SMODS.has_no_suit(context.scoring_hand[i]) or (not context.scoring_hand[i]:is_suit(card.ability.extra.suit)) then
                    return;
                end
            end
            card.ability.extra.count = card.ability.extra.count + 1;

            if (card.ability.extra.count > 2) then
                return {
                    colonparen_complete = true,
                    colonparen_card = card
                }
            elseif (card.ability.extra.count > 0) then
                return {
                    colonparen_in_progress = true,
                    colonparen_card = card
                }
            else
                return {
                    colonparen_base = true,
                    colonparen_card = card
                }
            end
        end
    end
}


Colonparen.Architecture {
    key = 'colon_shaft',
    base_pos = { x = 0, y = 1 },
    progress_pos = { x = 1, y = 1 },
    done_pos = { x = 2, y = 1 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = nil,
    },
    loc_vars = function (self, info_queue, card)
        local hand_text;
        if not card:in_collection() then
            hand_text = localize(card.ability.extra or 'High Card', 'poker_hands')
        else
            hand_text = localize('cbean_colon_least_leveled')
        end
        return {
            vars = {
                hand_text,
            }
        }
    end,
    greek_blind = "cbean_colon_xi",
    set_ability = function (self, card, initial, delay_sprites)
        if (G.STAGE == G.STAGES.RUN) and (not card.ability.extra) then
            local least_level = 1e308;
            local least_leveled = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible then
                    if v.level < least_level then
                        least_level = v.level
                        least_leveled = {v.key}
                    elseif v.level == least_level then
                        least_leveled[#least_leveled+1] = v.key
                    end
                end
            end

            local least_score = 1e308;
            local least_scored = nil
            for k, v in pairs(G.GAME.hands) do
                if v.visible then
                    local score = v.mult * v.chips;
                    if score < least_score then
                        least_score = score
                        least_scored = v.key
                    end
                end
            end

            card.ability.extra = least_scored
        end
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.cbean_colon_level_up then
            local most_level = -1e308;
            for k, v in pairs(G.GAME.hands) do
                if v.level > most_level then
                    most_level = v.level
                end
            end

            if G.GAME.hands[card.ability.extra].level == most_level then
                return {
                    colonparen_complete = true,
                    colonparen_card = card
                }
            end
            for i = 1, #context.hands do
                if context.hands[i] == card.ability.extra then
                    return {
                        colonparen_in_progress = true,
                        colonparen_card = card
                    }
                end
            end
        end
    end
}


local old_level = SMODS.upgrade_poker_hands;

function SMODS.upgrade_poker_hands(args, ...)
    local value = old_level(args, ...);
    SMODS.calculate_context{
        cbean_colon_level_up = true,
        hands = args.hands
    }
    return value
end


Colonparen.Architecture {
    key = 'colon_rosette',
    base_pos = { x = 0, y = 2 },
    progress_pos = { x = 1, y = 2 },
    done_pos = { x = 2, y = 2 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            count = 0,
            reset = false
        },
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.count
            }
        }
    end,
    greek_blind = "cbean_colon_omicron",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.cbean_colonparen_modify_deck then
            card.ability.extra.count = 0;
            card.ability.extra.reset = true;
            return {
                colonparen_base = true
            }
        elseif context.ante_change and context.ante_end then
            if card.ability.extra.reset then
                card.ability.extra.reset = false;
            else
                card.ability.extra.count = card.ability.extra.count + 1;
                if card.ability.extra.count >= 3 then
                    return {
                        colonparen_complete = true,
                    }
                elseif card.ability.extra.count > 0 then
                    return {
                        colonparen_in_progress = true,
                    }
                end
            end
        end
    end
}


Colonparen.Architecture {
    key = 'colon_drum',
    base_pos = { x = 0, y = 0 },
    progress_pos = { x = 1, y = 0 },
    done_pos = { x = 2, y = 0 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            flush_house = 0,
            flush_five = 0,
            five_of_a_kind = 0,
        },
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.flush_house,
                card.ability.extra.five_of_a_kind,
                card.ability.extra.flush_five
            }
        }
    end,
    greek_blind = "cbean_colon_pi",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.pre_discard then
            local scoring_hand,_,_,_,_ = G.FUNCS.get_poker_hand_info(context.full_hand)

            if scoring_hand == "Flush House" then
                card.ability.extra.flush_house = card.ability.extra.flush_house + 1;
            elseif scoring_hand == "Five of a Kind" then
                card.ability.extra.five_of_a_kind = card.ability.extra.five_of_a_kind + 1;
            elseif scoring_hand == "Flush Five" then
                card.ability.extra.flush_five = card.ability.extra.flush_five + 1;
            end
            if  (card.ability.extra.flush_house > 0) 
                and (card.ability.extra.five_of_a_kind > 0)
                and (card.ability.extra.flush_five > 0)
            then
                return {
                    colonparen_complete = true,
                }
            elseif  (card.ability.extra.flush_house == 0) 
                and (card.ability.extra.five_of_a_kind == 0)
                and (card.ability.extra.flush_five == 0)
            then
                return {
                    colonparen_base = true
                }
            else
                return {
                    colonparen_in_progress = true
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_architrave',
    base_pos = { x = 0, y = 4 },
    progress_pos = { x = 1, y = 4 },
    done_pos = { x = 2, y = 4 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            hand = nil,
            count = 0
        },
    },
    loc_vars = function (self, info_queue, card)
        local hand_text;
        if not card:in_collection() then
            hand_text = localize(card.ability.extra.hand or 'High Card', 'poker_hands')
        else
            hand_text = localize('cbean_colon_most_played')
        end
        return {
            vars = {
                hand_text,
                card.ability.extra.count
            }
        }
    end,
    greek_blind = "cbean_colon_rho",
    set_ability = function (self, card, initial, delay_sprites)
        if (G.STAGE == G.STAGES.RUN) and (not card.ability.extra.hand) then
            local most = 'High Card';
            local mostamount = 0;
            for handname, values in pairs(G.GAME.hands) do
                if values.played > mostamount then
                    mostamount = values.played;
                    most = handname
                end
            end

            card.ability.extra.hand = most
        end
    end,
    in_pool = function (self) -- there cannot be more than one 'Most Played Hand' to select
        local mostamount = 0;
        for handname, values in pairs(G.GAME.hands) do
            if values.played > mostamount then
                mostamount = values.played;
            end
        end

        local good = true;
        for handname, values in pairs(G.GAME.hands) do
            if values.played == mostamount then
                if not good then
                    return false
                end
                good = false
            end
        end

        return true
    end,
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.before and (context.scoring_name ~= card.ability.extra.hand) then
            card.ability.extra.count = card.ability.extra.count + 1;

            if card.ability.extra.count >= 10 then
                return {
                    colonparen_complete = true,
                    colonparen_card = card
                }
            elseif card.ability.extra.count > 0 then
                return {
                    colonparen_in_progress = true,
                    colonparen_card = card
                }
            end
        end
    end
}

Colonparen.Architecture {
    key = 'colon_echinus',
    base_pos = { x = 9, y = 2 },
    progress_pos = { x = 10, y = 2 },
    done_pos = { x = 11, y = 2 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    get_applicable_count = function (self)
        if not next(G.playing_cards or {}) then
            return 0, {
                m_bonus = true,
                m_mult = true,
                m_wild = true,
                m_glass = true,
                m_steel = true,
                m_stone = true,
                m_gold = true,
                m_lucky = true
            }
        end

        local needed = {
            m_bonus = true,
            m_mult = true,
            m_wild = true,
            m_glass = true,
            m_steel = true,
            m_stone = true,
            m_gold = true,
            m_lucky = true
        }
        if next(G.playing_cards or {}) then
            for i = 1, #G.playing_cards do
                for q, _ in pairs(needed) do
                    if SMODS.has_enhancement(G.playing_cards[i], q) then
                        needed[q] = nil;
                    end
                end
            end
        end
        local tally = 8;
        for q, _ in pairs(needed) do
            tally = tally - 1;
        end
        return tally, needed
    end,
    loc_vars = function (self, info_queue, card)
        local _, needed = self:get_applicable_count()

        local list = {}
        for key, _ in pairs(needed) do
            local center = G.P_CENTERS[key]
            list[#list+1] = localize{type = 'name_text', key = key, set = center.set or "Enhanced"}
        end
        local text;
        local text2;
        if #list == 0 then
            return {
                key = 'c_cbean_colon_echinus_nil'
            }
        elseif #list == 1 then
            text = list[1]
        elseif #list == 2 then
            text = list[1];
            text2 = list[2];
        else
            text = ''
            for i = 1, (#list - 1) do
                text = text .. list[i];
                if i ~= (#list - 1) then
                    text = text .. ', '
                end
            end
            text2 = list[#list]
        end
        if text2 then
            return {
                key = "c_cbean_colon_echinus_multiple",
                vars = {
                    text,
                    text2
                }
            }
        else
            return {
                vars = {
                    text
                }
            }
        end
    end,
    greek_blind = "cbean_colon_sigma",
    evaluate_completion = function (self, card)
        local tally, needed = self:get_applicable_count()
        if tally == 8 then
            return {
                colonparen_complete = true
            }
        elseif tally > 0 then
            return {
                colonparen_in_progress = true
            }
        else
            return {
                colonparen_base = true
            }
        end
    end,
    calculate = function (self, card, context)
        if context.cbean_colonparen_modify_deck then
            return self:evaluate_completion()
        end
    end
}

Colonparen.Architecture {
    key = 'colon_molding',
    base_pos = { x = 9, y = 6 },
    progress_pos = { x = 10, y = 6 },
    done_pos = { x = 11, y = 6 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = 0,
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra
            }
        }
    end,
    greek_blind = "cbean_colon_tau",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.pseudorandom_result and (context.identifier == 'wheel_of_fortune') then
            if not context.result then
                card.ability.extra = card.ability.extra + 1;

                if card.ability.extra >= 4 then
                    return {
                        colonparen_complete = true,
                        colonparen_card = card
                    }
                elseif card.ability.extra > 0 then
                    return {
                        colonparen_in_progress = true,
                        colonparen_card = card
                    }
                end
            else
                card.ability.extra = 0;
                return {
                    colonparen_base = true
                }
            end
        end
    end
}


Colonparen.Architecture {
    key = 'colon_pediment',
    base_pos = { x = 9, y = 6 },
    progress_pos = { x = 10, y = 6 },
    done_pos = { x = 11, y = 6 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            count = 0,
            skipped = 0
        },
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.count
            }
        }
    end,
    greek_blind = "cbean_colon_upsilon",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.skip_blind then
            card.ability.extra.skipped = card.ability.extra.skipped + 1;
            if card.ability.extra.skipped >= 3 then
                card.ability.extra.skipped = 0;
                card.ability.extra.procced = true;
                card.ability.extra.count = card.ability.extra.count + 1;
                if card.ability.extra.count >= 3 then
                    return {
                        colonparen_complete = true
                    }
                elseif card.ability.extra.count > 0 then
                    return {
                        colonparen_in_progress = true
                    }
                end
            end
        elseif context.ante_change and context.ante_end then
            card.ability.extra.skipped = 0;
            if not card.ability.extra.procced then
                card.ability.extra.count = 0;
                return {
                    colonparen_base = true
                }
            else
                card.ability.extra.procced = nil;
            end
        end       
    end
}


Colonparen.Architecture {
    key = 'colon_base',
    base_pos = { x = 6, y = 2 },
    progress_pos = { x = 7, y = 2 },
    done_pos = { x = 8, y = 2 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = {
            count = 0,
            skipped = 0
        },
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.count
            }
        }
    end,
    greek_blind = "cbean_colon_phi",
    evaluate_completion = function (self, card)
        if (not G.jokers) or (#G.jokers.cards == 0) then
            return {
                colonparen_base = true
            }
        end
        local most = {

        }
        if card then
            most[card.config.center.key] = 1
        end
        for i = 1, #G.jokers.cards do
            local key = G.jokers.cards[i].config.center.key;
            most[key] = (most[key] or 0) + 1;
            if most[key] >= 2 then
                return {
                    colonparen_complete = true
                }
            end
        end

        return {
            colonparen_in_progress = true
        }
    end,
    calculate = function (self, card, context)
        if context.card_added then
            return self:evaluate_completion(context.card)
        end
    end
}



Colonparen.Architecture {
    key = 'colon_entablazure',
    base_pos = { x = 0, y = 3 },
    progress_pos = { x = 1, y = 3 },
    done_pos = { x = 2, y = 3 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    loc_vars = function (self, info_queue, card)
        local counts = self:get_counts()
        return {
            vars = {
                counts.Common,
                counts.Uncommon,
                counts.Rare
            }
        }
    end,
    get_counts = function (self, bias)
        local counts = {
            Uncommon = 0,
            Common = 0,
            Rare = 0,
        }
        if not G.jokers then
            return counts
        end
        local dontcount = false;
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i]:is_rarity('Common') then
                counts.Common = counts.Common + 1;
            end
            if G.jokers.cards[i]:is_rarity('Uncommon') then
                counts.Uncommon = counts.Uncommon + 1;
            end
            if G.jokers.cards[i]:is_rarity('Rare') then
                counts.Rare = counts.Rare + 1;
            end
            if G.jokers.cards[i] == bias then
                dontcount = true
            end
        end
        if (not dontcount) and bias then
            if bias:is_rarity('Common') then
                counts.Common = counts.Common + 1;
            end
            if bias:is_rarity('Uncommon') then
                counts.Uncommon = counts.Uncommon + 1;
            end
            if bias:is_rarity('Rare') then
                counts.Rare = counts.Rare + 1;
            end
        end
        return counts
    end,

    greek_blind = "cbean_colon_chi",
    evaluate_completion = function (self, card, bias)
        local counts = self:get_counts(bias);
        
        if  (counts.Common == 1)
            and (counts.Uncommon == 1)
            and (counts.Rare == 1)
        then
            return {
                colonparen_complete = true,
            }
        elseif (counts.Common == 1)
            or (counts.Uncommon == 1)
            or (counts.Rare == 1) 
        then
            return {
                colonparen_in_progress = true
            }
        else
            return {
                colonparen_base = true
            }
        end
    end,
    calculate = function (self, card, context)
        if context.card_added or context.joker_type_destroyed then
            return self:evaluate_completion(self, card, context.card)
        end
    end
}


Colonparen.Architecture {
    key = 'colon_ionic_captial',
    base_pos = { x = 3, y = 1 },
    progress_pos = { x = 4, y = 1 },
    done_pos = { x = 5, y = 1 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    config = {
        extra = 0,
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra
            }
        }
    end,
    greek_blind = "cbean_colon_psi",
    evaluate_completion = function (self, card)
        return; -- must happen while the card is active.
    end,
    calculate = function (self, card, context)
        if context.skipping_booster and (context.booster.kind == 'Spectral') then
            card.ability.extra = card.ability.extra + 1;

            if card.ability.extra >= 5 then
                return {
                    colonparen_complete = true,
                    colonparen_card = card
                }
            elseif card.ability.extra > 0 then
                return {
                    colonparen_in_progress = true,
                    colonparen_card = card
                }
            end
        end
    end
}

