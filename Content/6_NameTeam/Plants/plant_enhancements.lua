SMODS.Enhancement({
	key = "basic_zomboid",
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	overrides_base_rank = false,
	any_suit = false,
	always_scores = false,
	weight = 0,
	config = { extra = { mult = 6 } },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.mult } }
	end,
	calculate = function(self, card, context)
        local cae = card.ability.extra
		if context.main_scoring and context.cardarea == G.play then
			return {
				mult = cae.mult,
			}
		end
	end,
	in_pool = function(self)
		return false
	end,
})

SMODS.Enhancement({
	key = "carrot_zomboid",
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	overrides_base_rank = false,
	any_suit = false,
	always_scores = false,
	weight = 0,
	config = { extra = { chips = 40 } },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.chips } }
	end,
	calculate = function(self, card, context)
        local cae = card.ability.extra
		if context.main_scoring and context.cardarea == G.play then
			return {
				chips = cae.chips,
			}
		end
	end,
	in_pool = function(self)
		return false
	end,
})

SMODS.Enhancement({
	key = "melon_zomboid",
	discovered = true,
	unlocked = true,
	replace_base_card = false,
	no_rank = false,
	no_suit = false,
	overrides_base_rank = false,
	any_suit = false,
	always_scores = false,
	weight = 0,
	config = { extra = { xmult = 1.5 } },
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.xmult } }
	end,
	calculate = function(self, card, context)
        local cae = card.ability.extra
		if context.main_scoring and context.cardarea == G.play then
			return {
				xmult = cae.xmult,
			}
		end
	end,
	in_pool = function(self)
		return false
	end,
})