SMODS.Joker {
	key = 'yma_born_salesman',

	rarity = 1,
	atlas = 'yma_joker_atlas',
	pos = { x = 2, y = 0 },
	cost = 4,
	blueprint_compat = false,
	config = {
        extra = {
            
        }
    },

	loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,

	calculate = function(self, card, context)
		if context.card_added then
            local keys = yma_get_keys_of_type('shops')
			local other_keys = yma_get_keys_of_type('packs')
			for k, v in pairs(other_keys) do
				keys[#keys] = v
			end
			for k, v in pairs(keys) do
				if context.card.config.center.key == v then
					context.card.ability.extra_slots_used = -1
				end
			end
        end
	end,
	add_to_deck = function(self, card, from_debuff)
        if G.consumeables then
			local keys = yma_get_keys_of_type('shops')
			local other_keys = yma_get_keys_of_type('packs')
			for k, v in pairs(other_keys) do
				keys[#keys] = v
			end
			for k, v in pairs(G.consumeables.cards) do
				for k_, v_ in pairs(keys) do
					if v.config.center.key == v_ then
						v.ability.extra_slots_used = -1
					end
				end
			end
		end
    end,
	remove_from_deck = function(self, card, from_debuff)
		if G.consumeables then
			local keys = yma_get_keys_of_type('shops')
			local other_keys = yma_get_keys_of_type('packs')
			for k, v in pairs(other_keys) do
				keys[#keys] = v
			end
			for k, v in pairs(G.consumeables.cards) do
				for k_, v_ in pairs(keys) do
					if v.config.center.key == v_ then
						v.ability.extra_slots_used = 0
					end
				end
			end
		end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "FirstTry",
        code = "RattlingSnow353",
    }
}