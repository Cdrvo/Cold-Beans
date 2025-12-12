SMODS.Joker {
	key = 'yma_joker_vision',

	rarity = 1,
	atlas = 'yma_joker_atlas',
	pos = { x = 1, y = 2 },
	cost = 4,
	blueprint_compat = true,
	config = {
        extra = {
            retrigger = 2
        }
    },

	loc_vars = function(self, info_queue, card)
		
	end,
    calculate = function(self, card, context) 
        local next_card = nil
        if G.consumeables then
            for k, v in ipairs(G.consumeables.cards) do
                if v.config.center.set == 'Combo' then
                    next_card = v
                    break
                end
            end
        end
        if (context.repetition_only or (context.retrigger_joker_check)) and next_card and context.other_card == next_card then
            return {
                repetitions = card.ability.extra.retrigger,
                card = context.other_card,
                message = localize('k_again_ex')
            }
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}