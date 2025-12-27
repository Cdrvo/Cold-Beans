SMODS.Enhancement {
    object_type = "Enhancement",
    key = 'wgrop_magma',
    pos = { x = 0, y = 4 },
    atlas = 'wgrop_enhancement_atlas',
    config = { cards = 1 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.cards }
        }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local card_pool = SMODS.shallow_copy(G.hand.cards)
            local chosen_cards = {}
            local attempts = 0

            while #chosen_cards < card.ability.cards and #card_pool > 0 do
                attempts = attempts + 1

                local chosen, chosen_index =
                    pseudorandom_element(card_pool, pseudoseed("wgrop_magma_" .. attempts))

                if chosen and not next(SMODS.get_enhancements(chosen)) then
                    table.insert(chosen_cards, chosen)
                end


                table.remove(card_pool, chosen_index)
            end

            if #chosen_cards > 0 then
                for _, target in ipairs(chosen_cards) do
                    local enh_table = {
                        'm_stone',
                        'm_glass',
                        'm_steel'
                    }

                    local selected =
                        pseudorandom_element(enh_table, pseudoseed("wgrop_magma_enh"))

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            play_sound('cardSlide1')
                            play_sound('tarot1')
                            G.hand:add_to_highlighted(target)
                            target:juice_up()
                            target:set_ability(selected)
                            return true
                        end
                    }))

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            G.hand:remove_from_highlighted(target)
                            play_sound('cardSlide2')
                            return true
                        end
                    }))
                end
            end
        end

        if context.after and context.cardarea == G.play then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = function()
                    card:start_dissolve({ G.C.RED }, nil, 1.6)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
    end,

    beans_credits = {
        team = { "wgrop" },
        idea = "Tje.tsu",
        art = "Tje.tsu",
        code = "Tje.tsu",
    }
}
