SMODS.Joker {  -- Modified from Cryptid's Cotton Candy
    key = "0chill_cryostasis", 
    atlas = "0chill_joker_atlas",
    pos = { x = 3, y = 3 },
    rarity = 2,
    order = 3,
    blueprint_compat = true,
    cost = 4,
    config = { },
    loc_vars = function(self, info_queue, card)
        if not (card.edition and card.edition.cbean_sd_frozen) then
            info_queue[#info_queue+1] = G.P_CENTERS.e_cbean_sd_frozen
        end
    end,
    calculate = function(self, card, context)
		if
			(context.selling_self and not context.retrigger_joker and not context.blueprint_card)
		then
			for i = 1, #G.jokers.cards do
                local j = G.jokers.cards[i]
                if j ~= card and j.edition ~= "e_cbean_sd_frozen" then
                    j:set_edition("e_cbean_sd_frozen")
                end
            end
		end
	end,
    beans_credits = {
        team = {"0 Driver Of",
            "The Chill Vacation"
        },
        idea = "Inspector_B",
        art =  "MarioFan597",
        code = "Inspector_B",
    }
}