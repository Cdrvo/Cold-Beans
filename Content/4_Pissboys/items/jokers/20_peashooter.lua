SMODS.Joker {
    key = "pboys_peashooter",
    atlas = "pboys_joker_atlas",
    pos = { x = 0, y = 2 },
    rarity = 2,
    order = 20,
    blueprint_compat = true,
    cost = 7,
    config = {extra = {}},
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
            end
            local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }
            return { vars = { (other_joker and other_joker.peashooter_life) or compatible and 3 or "???" }, main_end = main_end }
        end
    end,
    calculate = function(self, card, context)
        local other_joker = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
        end
		if other_joker and not other_joker.peashooter_life then
			other_joker.peashooter_life = 3
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and other_joker and other_joker.peashooter_life then
			other_joker.peashooter_life = other_joker.peashooter_life - 1
			if other_joker.peashooter_life >= 2 then
				return {
						message = localize('k_cbean_peashooter_1'),
						message_card = other_joker
				}
			elseif other_joker.peashooter_life == 1 then
				return {
						message = localize('k_cbean_peashooter_2'),
						message_card = other_joker
				}
			else
				SMODS.destroy_cards(other_joker, nil, nil, true)
				return {
						message = localize('k_cbean_peashooter_3'),
						message_card = other_joker
				}
			end
		end
        local ret = SMODS.blueprint_effect(card, other_joker, context)
        if ret then
            ret.colour = G.C.BLUE
        end
        return ret
    end,
	joker_display_def = function(JokerDisplay)
        return {
			reminder_text = {
				{ text = "(" },
				{ ref_table = "card.joker_display_values", ref_value = "blueprint_compat", colour = G.C.RED },
				{ text = ")" }
			},
			calc_function = function(card)
				local copied_joker, copied_debuff = JokerDisplay.calculate_blueprint_copy(card)
				card.joker_display_values.blueprint_compat = localize('k_incompatible')
				JokerDisplay.copy_display(card, copied_joker, copied_debuff)
			end,
			get_blueprint_joker = function(card)
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] == card then
						return G.jokers.cards[i + 1]
					end
				end
				return nil
			end
        }
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "Pumpkin man",
        art = "Pumpkin man",
        code = "Nrio_Modder",
    }
}