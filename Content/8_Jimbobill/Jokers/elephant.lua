
SMODS.Keybind {
    key_pressed = "up",
    action = function (self)
        if G.GAME and G.GAME.konami_counter and G.GAME.konami_counter < 2 then
            G.GAME.konami_counter = G.GAME.konami_counter + 1

        end
    end
}

SMODS.Keybind {
    key_pressed = "down",
    action = function (self)
        if G.GAME.konami_counter and (1 < G.GAME.konami_counter) and (G.GAME.konami_counter < 4) then
            G.GAME.konami_counter = G.GAME.konami_counter + 1

        end
    end
}

SMODS.Keybind {
    key_pressed = "left",
    action = function (self)
        if G.GAME and G.GAME.konami_counter and G.GAME.konami_counter == 4 or G.GAME.konami_counter == 6 then
            G.GAME.konami_counter = G.GAME.konami_counter + 1

        end
    end
}

SMODS.Keybind {
    key_pressed = "right",
    action = function (self)
        if G.GAME and G.GAME.konami_counter and G.GAME.konami_counter == 5 or G.GAME.konami_counter == 7 then
            G.GAME.konami_counter = G.GAME.konami_counter + 1

        end
    end
}

SMODS.Keybind {
    key_pressed = "b",
    action = function (self)
        if G.GAME and G.GAME.konami_counter then
            if G.GAME.konami_counter == 8 then
                G.GAME.konami_counter = G.GAME.konami_counter + 1

            end
            G.GAME.b_pressed_lmao = true
        end
    end
}

SMODS.Keybind {
    key_pressed = "a",
    action = function (self)
        if G.GAME and G.GAME.konami_counter and G.GAME.konami_counter == 9 then
            G.GAME.konami_counter = G.GAME.konami_counter + 1

        end
    end
}

SMODS.Joker {
    key = "jbill_elephant",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 1, y = 0 },
    rarity = 2,
    cost = 6,
    config = { extra = { mult = 0, yorick_num = 23, rolls = 0, clicks = 0, beaten = 0,
            highlight = false, highlight2 = false, highlight3 = false, highlight4 = false, highlight5 = false,
            play = false, play1 = false, play2 = false, play3 = false, play4 = false, play5 = false,
            discard = false, discard2 = false, discard3 = false, discard4 = false, discard5 = false,
            playhigh = false, playpair = false, playtwopair = false, playthree = false, playfour = false, playflush = false,
            playstraight = false, playfstraight = false, playgay = false, playfgay = false, playbob = false, playhouse = false, playsecret = false,
            yorick = false, 
            playunscoring = false, playunscoring2 = false, playunscoring3 = false, playunscoring4 = false,
            six7 = false, meaning = false, nice = false, nine10 = false, leet = false, boob = false, four20 = false, pi = false,
            sparta = false, math = false, math2 = false, homestuck = false, nend = false, bhack = false, konami = false, teeny_blind = false,
            small_blind = false, big_blind = false, boss_blind = false, ceo_blind = false,
            beaten1 = false, beaten3 = false, beaten6 = false,
            tenprocent = false, thirtyprocent = false, halfway_mark = false, seventyprocent = false, ninetyprocent = false,
            slot1 = false, slot2 = false, slot3 = false, slot4 = false,
            tarot = false, planet = false, spectral = false, consumesquared = false, combo = false, blessing = false, sticker_sheet = false, zodiac = false, keys = false,
            mutemusic = false, maxmusic = false, contrast = false,
            consumefull = false, jokerfull = false, ante = false,
            dollars5 = false, dollars10 = false, dollars25 = false, dollars40 = false,
            reroll = false, reroll5 = false, reroll10 = false,
            click = false, click5 = false, click10 = false, click20= false, click35 = false,
            scoring1000 = false, scoring10000 = false, scoring50000 = false, scoring100000 = false, scoring200000 = false,
            complete = false,
            } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if G.hand and #G.hand.highlighted > 0 and not card.ability.extra.highlight then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.highlight = true
            unlock_achievement("ach_cbean_highlight")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.hand and #G.hand.highlighted > 1 and not card.ability.extra.highlight2 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.highlight2 = true
            unlock_achievement("ach_cbean_highlight2")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.hand and #G.hand.highlighted > 2 and not card.ability.extra.highlight3 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.highlight3 = true
            unlock_achievement("ach_cbean_highlight3")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.hand and #G.hand.highlighted > 3 and not card.ability.extra.highlight4 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.highlight4 = true
            unlock_achievement("ach_cbean_highlight4")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.hand and #G.hand.highlighted > 4 and not card.ability.extra.highlight5 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.highlight5 = true
            unlock_achievement("ach_cbean_highlight5")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.STATE == G.STATES.HAND_PLAYED and not card.ability.extra.play then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.play = true
            unlock_achievement("ach_cbean_play")
            return {
                message = localize("k_jbill_ach")
            }
            
        end
        if context.before and #context.full_hand == 1 and not card.ability.extra.play1 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.play1 = true
            unlock_achievement("ach_cbean_play1")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.before and #context.full_hand == 2 and not card.ability.extra.play2 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.play2 = true
            unlock_achievement("ach_cbean_play2")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.before and #context.full_hand == 3 and not card.ability.extra.play3 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.play3 = true
            unlock_achievement("ach_cbean_play3")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.before and #context.full_hand == 4 and not card.ability.extra.play4 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.play4 = true
            unlock_achievement("ach_cbean_play4")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.before and #context.full_hand == 5 and not card.ability.extra.play5 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.play5 = true
            unlock_achievement("ach_cbean_play5")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.pre_discard and #G.hand.highlighted == 1 and not card.ability.extra.discard then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.discard = true
            unlock_achievement("ach_cbean_discard")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.pre_discard and #G.hand.highlighted == 2 and not card.ability.extra.discard2 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.discard2 = true
            unlock_achievement("ach_cbean_discard2")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.pre_discard and #G.hand.highlighted == 3 and not card.ability.extra.discard3 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.discard3 = true
            unlock_achievement("ach_cbean_discard3")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.pre_discard and #G.hand.highlighted == 4 and not card.ability.extra.discard4 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.discard4 = true
            unlock_achievement("ach_cbean_discard4")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.pre_discard and #G.hand.highlighted == 5 and not card.ability.extra.discard5 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.discard5 = true
            unlock_achievement("ach_cbean_discard5")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.discard and not card.ability.extra.yorick then
            card.ability.extra.yorick_num = card.ability.extra.yorick_num - 1
            card.ability.extra.mult = card.ability.extra.mult + 1
            if card.ability.extra.yorick_num <= 0 then
                unlock_achievement("ach_cbean_yorick")
                return {
                    message = localize("k_jbill_ach")
                }    
            end
        end
        if G.STATE == G.STATES.HAND_PLAYED and context.scoring_hand and context.full_hand and #context.scoring_hand < (#context.full_hand - 1) and not card.ability.extra.playunscoring then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.playunscoring = true
            unlock_achievement("ach_cbean_playunscoring")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.STATE == G.STATES.HAND_PLAYED and context.scoring_hand and context.full_hand and #context.scoring_hand < (#context.full_hand - 2) and not card.ability.extra.playunscoring2 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.playunscoring2 = true
            unlock_achievement("ach_cbean_playunscoring2")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.STATE == G.STATES.HAND_PLAYED and context.scoring_hand and context.full_hand and #context.scoring_hand < (#context.full_hand - 3) and not card.ability.extra.playunscoring3 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.playunscoring3 = true
            unlock_achievement("ach_cbean_playunscoring3")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.STATE == G.STATES.HAND_PLAYED and context.scoring_hand and context.full_hand and #context.scoring_hand < (#context.full_hand - 4) and not card.ability.extra.playunscoring4 then
            card.ability.extra.mult = card.ability.extra.mult + 1
            card.ability.extra.playunscoring4 = true
            unlock_achievement("ach_cbean_playunscoring4")
            return {
                message = localize("k_jbill_ach")
            }
        end
        --I didn't really sort handtypes sorgy :з
        if context.joker_main and context.scoring_name == "High Card" and not card.ability.extra.playhigh then
            card.ability.extra.playhigh = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playhigh")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Pair" and not card.ability.extra.playpair then
            card.ability.extra.playpair = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playpair")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Two Pair" and not card.ability.extra.playtwopair then
            card.ability.extra.playtwopair = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playtwopair")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Three of a Kind" and not card.ability.extra.playthree then
            card.ability.extra.playthree = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playthree")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Four of a Kind" and not card.ability.extra.playfour then
            card.ability.extra.playfour = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playfour")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Full House" and not card.ability.extra.playhouse then
            card.ability.extra.playhouse = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playhouse")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Flush"  and not card.ability.extra.playflush then
            card.ability.extra.playflush = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playflush")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "cbean_sdown_bobtail" and not card.ability.extra.playbob then
            card.ability.extra.playbob = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playbob")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end 
        if context.joker_main and context.scoring_name == "Straight" and not card.ability.extra.playstraight then
            card.ability.extra.playstraight = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playstraight")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "cbean_sdown_antistraight" and not card.ability.extra.playgay then
            card.ability.extra.playgay = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playgay")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        if context.joker_main and context.scoring_name == "Straight Flush" and not card.ability.extra.playfstraight then
            card.ability.extra.playfstraight = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playfstraight")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end 
        if context.joker_main and context.scoring_name == "cbean_sdown_antistraight_flush" and not card.ability.extra.playfgay then
            card.ability.extra.playfgay = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playfgay")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end 
        --Not incuding the house rules because including them as a separate category would be an asshole move and they aren't exactly treated as secret hands
        if context.joker_main and context.scoring_name == "Flush Five" or context.scoring_name == 'Flush House' or context.scoring_name == 'Five of a Kind' and not card.ability.extra.playfstraight then
            card.ability.extra.playfstraight = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_playsecret")
            return {
                mult = card.ability.extra.mult,
                message = localize("k_jbill_ach")
            }
        end
        --HANDS TYPES ARE OVER
        --I wanted number references to trigger when played at first but honestly that would suck
        if context.full_hand and #context.full_hand == 2 and context.full_hand[1]:get_id() == 6 and context.full_hand[2]:get_id() == 7 and not card.ability.extra.six7 then
            card.ability.extra.six7 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_six7")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 2 and context.full_hand[1]:get_id() == 6 and context.full_hand[2]:get_id() == 9 and not card.ability.extra.nice then
            card.ability.extra.nice = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_nice")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 2 and context.full_hand[1]:get_id() == 4 and context.full_hand[2]:get_id() == 2 and not card.ability.extra.meaning then
            card.ability.extra.meaning = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_meaning")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 2 and context.full_hand[1]:get_id() == 2 and context.full_hand[2]:get_id() == 1 and not card.ability.extra.nine10 then
            card.ability.extra.nine10 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_nine10")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 4 and context.full_hand[1]:get_id() == 1 and context.full_hand[2]:get_id() == 3 and context.full_hand[2]:get_id() == 3 and context.full_hand[2]:get_id() == 7 and not card.ability.extra.leet then
            card.ability.extra.leet = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_leet")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 4 and context.full_hand[1]:get_id() == 8 and context.full_hand[2]:get_id() == 14 and context.full_hand[2]:get_id() == 14 and context.full_hand[2]:get_id() == 8 and not card.ability.extra.boob then
            card.ability.extra.boob = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_boob")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 3 and context.full_hand[1]:get_id() == 4 and context.full_hand[2]:get_id() == 2 and context.full_hand[2]:get_id() == 14 and not card.ability.extra.four20 then
            card.ability.extra.four20 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_four20")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 3 and context.full_hand[1]:get_id() == 3 and context.full_hand[2]:get_id() == 1 and context.full_hand[2]:get_id() == 4 and not card.ability.extra.pi then
            card.ability.extra.pi = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_pi")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 3 and context.full_hand[1]:get_id() == 3 and context.full_hand[2]:get_id() == 14 and context.full_hand[3]:get_id() == 14 and not card.ability.extra.sparta then
            card.ability.extra.sparta = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_sparta")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 3 and context.full_hand[1]:get_id() == 2 and context.full_hand[2]:get_id() == 5 and context.full_hand[3]:get_id() == 3 and not card.ability.extra.math then
            card.ability.extra.math = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_math")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 2 and context.full_hand[1]:get_id() == 4 and context.full_hand[2]:get_id() == 5 and not card.ability.extra.math2 then
            card.ability.extra.math2 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_math2")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 3 and context.full_hand[1]:get_id() == 4 and context.full_hand[2]:get_id() == 1 and context.full_hand[4]:get_id() == 3 and not card.ability.extra.homestuck then
            card.ability.extra.homestuck = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_homestuck")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.full_hand and #context.full_hand == 3 and context.full_hand[1]:get_id() == 8 and context.full_hand[2]:get_id() == 8 and context.full_hand[3]:get_id() == 8 and not card.ability.extra.nend then
            card.ability.extra.nend = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_nend")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.b_pressed_lmao and not card.ability.extra.bhack then
            card.ability.extra.bhack = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_bhack")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.konami_counter == 10 and not card.ability.extra.konami then
            card.ability.extra.konami = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_konami")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.beaten = card.ability.extra.beaten + 1
            if G.GAME.blind_on_deck == "Teeny" and not card.ability.extra.teeny_blind then
                card.ability.extra.teeny_blind = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_teeny_blind")
                return {
                    message = localize("k_jbill_ach")
                }
            end
            if G.GAME.blind_on_deck == "Small" and not card.ability.extra.small_blind then
                card.ability.extra.small_blind = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_small_blind")
                return {
                    message = localize("k_jbill_ach")
                }
            end
            if G.GAME.blind_on_deck == "Big" and not card.ability.extra.big_blind then
                card.ability.extra.big_blind = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_big_blind")
                return {
                    message = localize("k_jbill_ach")
                }
            end
            if G.GAME.blind_on_deck == "Boss" and not card.ability.extra.boss_blind then
                card.ability.extra.boss_blind = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_boss_blind")
                return {
                    message =  localize("k_jbill_ach")
                }
            end
        end
        if card.ability.extra.beaten > 0 and not card.ability.extra.beaten1 then
            card.ability.extra.beaten1 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_beaten1")
            return {
                message =  localize("k_jbill_ach")
            }
        end
        if card.ability.extra.beaten > 2 and not card.ability.extra.beaten3 then
            card.ability.extra.beaten3 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_beaten3")
            return {
                message =  localize("k_jbill_ach")
            }
        end
        if card.ability.extra.beaten > 2 and not card.ability.extra.beaten6 then
            card.ability.extra.beaten6 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_beaten6")
            return {
                message =  localize("k_jbill_ach")
            }
        end
        --The team :( did that thing with "CEO" and "Ceo" themselves, i'm not testing that out either lol
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind_on_deck == "CEO" or G.GAME.blind_on_deck == "Ceo" and not card.ability.extra.ceo_blind then
            card.ability.extra.ceo_blind = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_ceo_blind")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.mult >= 10 and not card.ability.extra.tenprocent then
            card.ability.extra.tenprocent = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_tenprocent")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.mult >= 30 and not card.ability.extra.thirtyprocent then
            card.ability.extra.thirtyprocent = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_thirtyprocent")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.mult >= 50 and not card.ability.extra.halfway_mark then
            card.ability.extra.halfway_mark = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_halfway_mark")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.mult >= 70 and not card.ability.extra.seventyprocent then
            card.ability.extra.seventyprocent = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_seventyprocent")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.mult >= 90 and not card.ability.extra.ninetyprocent then
            card.ability.extra.ninetyprocent = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_ninetyprocent")
            return {
                message = localize("k_jbill_ach")
            }
        end
            if card == G.jokers.cards[1] and not card.ability.extra.slot1 then
                card.ability.extra.slot1 = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_slot1")
                return {
                    message = localize("k_jbill_ach")
                }
            end
            if card == G.jokers.cards[2] and not card.ability.extra.slot2 then
                card.ability.extra.slot2 = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_slot2")
                return {
                    message = localize("k_jbill_ach")
                }
            end
            if card == G.jokers.cards[3] and not card.ability.extra.slot3 then
                card.ability.extra.slot3 = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_slot3")
                return {
                    message = localize("k_jbill_ach")
                }
            end
            if card == G.jokers.cards[4] and not card.ability.extra.slot4 then
                card.ability.extra.slot4 = true
                card.ability.extra.mult = card.ability.extra.mult + 1
                unlock_achievement("ach_cbean_slot4")
                return {
                    message = localize("k_jbill_ach")
                }
            end
        if context.using_consumeable and context.consumeable.ability.set == 'Tarot' and not card.ability.extra.tarot then
            card.ability.extra.tarot = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_tarot")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.using_consumeable and context.consumeable.ability.set == 'Planet' and not card.ability.extra.planet then
            card.ability.extra.planet = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_planet")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.using_consumeable and context.consumeable.ability.set == 'Spectral' and not card.ability.extra.spectral then
            card.ability.extra.spectral = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_spectral")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.using_consumeable and context.consumeable.ability.set == 'Combo' and not card.ability.extra.combo then
            card.ability.extra.combo = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_combo")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.using_consumeable and context.consumeable.ability.set == 'Consumable2' and not card.ability.extra.consumesquared then
            card.ability.extra.consumesquared = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_consumesquared")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.using_consumeable and context.consumeable.ability.set == 'sdown_czodiac' and not card.ability.extra.zodiac then
            card.ability.extra.consumesquared = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_zodiac")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.using_consumeable and context.consumeable.ability.set == 'cbean_StickerSheet' and not card.ability.extra.stickersheet then
            card.ability.extra.stickersheet = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_sticker_sheet")
            return {
               message = localize("k_jbill_ach")
            }
        end
        if context.other_consumeable and context.other_consumeable.ability.set == "sdown_blessing" and not card.ability.extra.blessing then
            card.ability.extra.blessing = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_blessing")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.other_consumeable and context.other_consumeable.ability.set == "yma_keys" and not card.ability.extra.keys then
            card.ability.extra.keys = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_keys")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.SETTINGS.SOUND.music_volume == 0 and not card.ability.extra.mutemusic then
            card.ability.extra.mutemusic = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_mutemusic")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.SETTINGS.SOUND.music_volume == 100 and not card.ability.extra.maxmusic then
            card.ability.extra.maxmusic = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_maxmusic")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.SETTINGS.colourblind_option == true and not card.ability.extra.contrast then
            card.ability.extra.contrast = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_contrast")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.consumeables and #G.consumeables.cards >= G.consumeables.config.card_limit and not card.ability.extra.consumefull then
            card.ability.extra.consumefull = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_consumefull")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.consumeables and #G.jokers.cards >= G.jokers.config.card_limit and not card.ability.extra.jokerfull then
            card.ability.extra.jokerfull = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_jokerfull")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.ante_change and not card.ability.extra.ante then
            card.ability.extra.ante = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_ante")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.dollars >= 5 and not card.ability.extra.dollars5 then
            card.ability.extra.dollars5 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_dollars5")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.dollars >= 10 and not card.ability.extra.dollars10 then
            card.ability.extra.dollars10 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_dollars10")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.dollars >= 25 and not card.ability.extra.dollars25 then
            card.ability.extra.dollars25 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_dollars25")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.dollars >= 40 and not card.ability.extra.dollars40 then
            card.ability.extra.dollars40 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_dollars40")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.reroll_shop then
            card.ability.extra.rolls = card.ability.extra.rolls + 1
        end
        if card.ability.extra.rolls > 0 and not card.ability.extra.reroll then
            card.ability.extra.reroll = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_reroll")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.rolls > 4 and not card.ability.extra.reroll5 then
            card.ability.extra.reroll = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_reroll5")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.rolls > 9 and not card.ability.extra.reroll10 then
            card.ability.extra.reroll = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_reroll10")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.jbill_clicked and card.ability.extra.clicks > 0 and not card.ability.extra.click1 then
            card.ability.extra.click1 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_click1")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.jbill_clicked and card.ability.extra.clicks > 4 and not card.ability.extra.click5 then
            card.ability.extra.click5 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_click5")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.jbill_clicked and card.ability.extra.clicks > 9 and not card.ability.extra.click10 then
            card.ability.extra.click10 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_click10")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.jbill_clicked and card.ability.extra.clicks > 19 and not card.ability.extra.click20 then
            card.ability.extra.click20 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_click20")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if context.jbill_clicked and card.ability.extra.clicks > 34 and not card.ability.extra.click35 then
            card.ability.extra.click35 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_click35")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.chips >= 1000 and not card.ability.extra.scoring1000 then
            card.ability.extra.scoring1000 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_scoring1000")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.chips >= 10000 and not card.ability.extra.scoring10000 then
            card.ability.extra.scoring10000 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_scoring10000")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.chips >= 50000 and not card.ability.extra.scoring50000 then
            card.ability.extra.scoring50000 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_scoring50000")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.chips >= 100000 and not card.ability.extra.scoring100000 then
            card.ability.extra.scoring100000 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_scoring100000")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if G.GAME.chips >= 200000 and not card.ability.extra.scoring200000 then
            card.ability.extra.scoring200000 = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_scoring200000")
            return {
                message = localize("k_jbill_ach")
            }
        end
        if card.ability.extra.mult >= 99 and not card.ability.extra.complete then
            card.ability.extra.complete = true
            card.ability.extra.mult = card.ability.extra.mult + 1
            unlock_achievement("ach_cbean_complete")
            return {
                message = localize("k_jbill_ach")
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.mult = card.ability.extra.mult + 1
        unlock_achievement("ach_cbean_address_me")
        return {
            message = localize("k_jbill_ach")
        }
    end,
    beans_credits = {
        idea = "Evgast",
        code = "Evgast",
        team = "Jimbobill",
        art = "Shinku"
    }
}

--Now to more bullshittery, I'm putting achievements HERE

SMODS.Atlas({
    key = "cbean_elephant",
    path = "3_0driverOfTheChillVacation/elephant_achievment.png",
    px = 66,
    py = 66,
})

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "address_me",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "highlight",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "highlight2",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "highlight3",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "highlight4",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "highlight5",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "play",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "play1",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "play2",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "play3",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "play4",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "play5",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playhigh",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playpair",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playtwopair",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playthree",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playfour",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playflush",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playstraight",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playfstraight",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playgay",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playfgay",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playhouse",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playbob",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playsecret",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playunscoring",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playunscoring2",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playunscoring3",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "playunscoring4",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "discard",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "discard2",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "discard3",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "discard4",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "discard5",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "yorick",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "six7",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "meaning",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "nice",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "nine10",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "leet",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "boob",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "four20",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "pi",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "sparta",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "math",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "math2",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "homestuck",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "nend",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "bhack",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "konami",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "teeny_blind",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "small_blind",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "big_blind",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "boss_blind",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "ceo_blind",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "beaten1",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "beaten3",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "beaten6",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "tenprocent",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "thirtyprocent",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "halfway_mark",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "seventyprocent",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "ninetyprocent",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "slot1",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "slot2",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "slot3",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "slot4",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "tarot",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "planet",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "spectral",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "consumesquared",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "blessing",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "combo",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "sticker_sheet",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "zodiac",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "keys",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "mutemusic",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "maxmusic",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "contrast",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "consumefull",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "jokerfull",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "ante",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "dollars5",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "dollars10",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "dollars25",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "dollars40",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "reroll",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "reroll5",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "reroll10",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "click1",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "click5",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "click10",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "click20",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "click35",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "scoring1000",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "scoring10000",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "scoring50000",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "scoring100000",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "scoring200000",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

SMODS.Achievement {
    atlas = "cbean_elephant",
    key = "complete",
    unlock_condition = function(self, args) 
    end,
    hidden_name = false,
    hidden_text = true,
    bypass_all_unlocked = true
}

