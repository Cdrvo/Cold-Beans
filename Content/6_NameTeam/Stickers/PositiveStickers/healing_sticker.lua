SMODS.Sticker({ --overcomplicated
	key = "healing",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 7,
		y = 1,
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
		if context.setting_blind then
            local rr 
            local negative_tab = {}
            local negative_tab2 = {}

            for k, v in pairs(SMODS.Stickers) do
                if v.sticker_type and v.sticker_type == "Negative" then
                    negative_tab[#negative_tab+1] = k
                end
            end

            local _card = NAMETEAM.random_joker(card.area.cards, card)

            if _card and _card.ability then
                for k, v in pairs(negative_tab) do
                    if _card.ability[v] then
                        negative_tab2[#negative_tab2+1] = v
                    end
                end

                local _ae = pseudorandom_element(negative_tab2)
                _card:remove_sticker(_ae)
            end
        end
	end,
	beans_credits = {
        code = "Revo",
		art = "GhostSalt" ,
		team = "Name Team"
	},
})