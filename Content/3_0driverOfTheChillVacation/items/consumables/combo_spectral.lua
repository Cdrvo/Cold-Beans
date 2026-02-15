SMODS.Consumable {
    key = '0chill_nope_from_above',
    set = "Spectral",
    hidden = true,
    soul_set = "Combo",
    atlas = '0chill_spectral_atlas',
    cost = 8,
    pos = { x = 2, y = 0},
    config = { 
         immutable = {
            ---------------------- What every combo card needs
            combo_type = "universal",
            sequence = 0,
            ----------------------
        },
        extra = {
            combo_size = 20, --Needed to say how big it is
            chance_num = 3,
            chance_denom = 4,
            chips = 50,
            mult = 10,
            xmult = 1.5,
            tarrot_min = 1,
            --tarrot_max = 3,
        },
        extra_slots_used = -0.75
    },
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.chance_num, card.ability.extra.chance_denom, "Nope!")
        info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        info_queue[#info_queue + 1] = { set = "Edition", key = "e_negative_consumable", config = G.P_CENTERS.e_negative.config }
        return { vars = { 
            card.ability.extra.combo_size,
            num,
            denom,
            card.ability.extra.chips,
            card.ability.extra.mult,
            card.ability.extra.xmult,
            card.ability.extra.tarrot_min,
            --card.ability.extra.tarrot_max
        }}
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area, copier) --Each card will have two uses. The first is when it is selected  and the second is when it is de-selected
        if G.GAME.blind.in_blind and CanCombo(card) --Selecting Card
        then
            SelectCombo(card)
        elseif G.GAME.blind.in_blind and CanUncombo(card) then --Deselecting Card
            UnselectCombo(card)
        else
            return nil
        end              
    end,
    calculate = function(self, card, context)
        if context.joker_main and card.ability.immutable.sequence > 0 then
            if SMODS.pseudorandom_probability(card, "Nope!", card.ability.extra.chance_num, card.ability.extra.chance_denom, "Nope!") then
                local effect = math.random(1, 3) --Effect 1
                if effect == 1 then
                    return {
                        chips = (card.ability.extra.chips * (1 + (#G.GAME.cbean_combo_index - 1)/100 )),
                        mult = (card.ability.extra.mult * (1 + (#G.GAME.cbean_combo_index - 1)/100 )),
                        xmult = (card.ability.extra.xmult * (1 + (#G.GAME.cbean_combo_index - 1)/100 ))
                    }
                elseif effect == 2 then --Effect 2
                    --Kinda modifed from Cryptid's Kalidescope which was made by Jevonn
                    local eligiblejokers = {}
                        for k, v in pairs(G.jokers.cards) do
                            if v.ability.set == "Joker" and not v.edition and v ~= card then
                                table.insert(eligiblejokers, v)
                            end
                        end
                        if #eligiblejokers > 0 then
                            local eligible_card = pseudorandom_element(eligiblejokers, pseudoseed("Nope!"))
                            local edition = { polychrome = true }
                            eligible_card:set_edition(edition, true)
                        else
                            G.E_MANAGER:add_event(Event({
                                trigger = 'before',
                                delay = 0.4,
                                func = function()
                                    attention_text({
                                        text = localize('k_no_other_jokers'),
                                        scale = 1,
                                        hold = 1.4,
                                        major = card,
                                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                                            'tm' or 'cm',
                                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                                        silent = true
                                    })
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'before',
                                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                                        blockable = false,
                                        blocking = false,
                                        func = function()
                                            play_sound('tarot2', 0.76, 0.4)
                                            return true
                                        end
                                    }))
                                    play_sound('tarot2', 1, 0.4)
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                else --Effect 3
                    --for i = card.ability.extra.tarrot_min, math.random(card.ability.extra.tarrot_min, card.ability.extra.tarrot_max) do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                play_sound('timpani')
                                SMODS.add_card({ set = 'Tarot', edition = 'e_negative'})
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    --end
                end
            else
                G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            end
        end
        if context.after and card.ability.immutable.sequence > 0 then
            SMODS.destroy_cards(card, nil, nil, true)
        end
    end,                       
    keep_on_use = function(self, card) --Needed for every combo card
        return true
    end,
    remove_from_deck = function(self, card, from_debuff)
        if CanUncombo(card) and card.ability.immutable.sequence > 0 then 
            UnselectCombo(card)
        end
    end,
    select_card = "consumeables",
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = {"MarioFan597",
                "CapitalChirp"},
        art = "cmykl",
        code = "MarioFan597",
    },
}