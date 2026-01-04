
Colonparen.Architecture {
    key = 'colon_stylobate',
    base_pos = { x = 0, y = 0 },
    progress_pos = { x = 1, y = 0 },
    done_pos = { x = 2, y = 0 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_omega",
    loc_vars = function(self, info_queue, card)
        if not G.cbean_colon_arch then
            return {
                vars = { 0 }
            }
        end

        local amount = 0;
        for i, card in ipairs(G.cbean_colon_arch.cards) do
            if (card.config.center.key ~= "c_cbean_colon_stylobate") and (card.ability.colonparen_state == 0) then
                amount = amount + 1
            end
        end

        return {
            vars = { amount }
        }
    end,
    calculate = function (self, card, context)
        if context.cbean_colonparen_gain_arch then

            local amount = 0;
            for i, card in ipairs(G.cbean_colon_arch.cards) do
                if (card.config.center.key ~= "c_cbean_colon_stylobate") and (card.ability.colonparen_state == 0) then
                    amount = amount + 1
                end
            end
            if amount >= 5 then
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
        end
    end
}


Colonparen.Architecture {
    key = 'colon_stereobate',
    done_pos = { x = 2, y = 0 },
    set = "Spectral",
    hidden = true,
    soul_set = "colon_Architecture",

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    immediate_complete = true,
    spawn = function (self, card)
        local greek = pseudorandom_element(Colonparen.GreekBlinds, pseudoseed("colon_stereobate"))
        Colonparen.spawnGreekBlind(greek.key)
    end,
    loc_vars = function (self, info_queue, card)
        if card.ability.colonparen_archid then
            if G.GAME.cbean_colonparen_queue[#G.GAME.cbean_colonparen_queue] ~= card.ability.colonparen_archid then
                for i, ID in ipairs(G.GAME.cbean_colonparen_queue) do
                    if ID == card.ability.colonparen_archid then
                        local amount_away = #G.GAME.cbean_colonparen_queue - i + 1;
                        return {
                            key = "c_cbean_colon_stereobate_queued",
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
