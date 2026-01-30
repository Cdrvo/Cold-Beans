SMODS.Sound({
  key = "shielddefend",
  path = "6_NameTeam/cbean_shielddefend.ogg"
})

SMODS.Sticker({
	key = "shield",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 4,
		y = 3,
	},
    sets = {
        Joker = true,
        Consumable = true,
    },
	badge_colour = HEX("866b54"),
    needs_enable_flag = true,
	rate = 0.03,
	sticker_type = "Positive",
	calculate = function(self, card, context)
		-- if context.cbean_destroyed and context.cbean_destroyed_card == card then
        --     local area

        --     if context.cbean_destroyed and context.cbean_destroyed_card.area then
		-- 		area = context.cbean_destroyed_card.area
		-- 	end

		-- 	local ccard = copy_card(card)
		-- 	ccard:add_to_deck()
		-- 	area:emplace(ccard)

		-- 	play_sound("cbean_shielddefend", 1, 0.5)
		-- 	SMODS.calculate_effect({ message = "Shielded!"}, ccard)

        --     SMODS.Stickers["cbean_shield"]:apply(ccard, false)
		-- end
	end,
	beans_credits = {
        code = "Revo",
		art = "GhostSalt",
		team = "Name Team"
	},
})