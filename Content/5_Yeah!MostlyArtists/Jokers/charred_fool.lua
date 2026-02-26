SMODS.Joker {
	key = 'yma_charred_fool',

	loc_vars = function(self, info_queue, card)
	end,

	rarity = 3,
	atlas = 'yma_joker_atlas',
	pos = { x = 3, y = 0 },
	cost = 7,
	blueprint_compat = false,

	calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint and G.consumeables.cards[1] then
            for _, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.set == "Tarot" and yma_can_upgrade_consumable(consumable) then
                    yma_upgrade_consumable(consumable)
                    return { message = localize('k_upgrade_ex') }
                end
            end
        end
	end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Flynn",
        art = "RattlingSnow353",
        code = "cloudzXIII",
    }
}