SMODS.Atlas({
	key = "NAMETEAM_Decks",
	path = "6_NameTeam/ColdBeansBacks.png",
	px = 71,
	py = 95,
})

SMODS.Back({
	key = "nameteam_urine",
	atlas = "NAMETEAM_Decks",
	pos = { x = 0, y = 0 },
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				local chosen_id = pseudorandom_element(G.playing_cards, pseudoseed("nameteam_urine")):get_id() or 14
				for i = 1, #G.playing_cards do
					if G.playing_cards[i]:get_id() == chosen_id then
						G.playing_cards[i]:set_ability(G.P_CENTERS["m_cbean_pboys_piss"])
					end
				end
				return true
			end,
		}))
	end,

	beans_credits = {
		team = "Name Team",
		idea = "GhostSalt",
		art = "GhostSalt",
		code = "GhostSalt",
	},
})

SMODS.Back({
	key = "nameteam_happy",
	atlas = "NAMETEAM_Decks",
	pos = { x = 2, y = 0 },
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = SMODS.create_card({
						set = "Joker",
						area = G.jokers,
						key = "j_smiley",
						no_edition = true,
					})
					card:add_to_deck()
					card:start_materialize()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,

	beans_credits = {
		team = "Name Team",
		idea = "GhostSalt",
		art = "GhostSalt",
		code = "GhostSalt",
	},
})

SMODS.Back({
	key = "nameteam_sticky",
	atlas = "NAMETEAM_Decks",
	pos = { x = 3, y = 0 },
	apply = function(self, back)
		G.GAME.cbean_stickersheet_rate = (G.GAME.cbean_stickersheet_rate or 0) + 1
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.consumeables then
					local card = SMODS.add_card({
						key = "c_cbean_eternal_sheet",
						area = G.consumeables,
						no_edition = true,
					})
					return true
				end
			end,
		}))
	end,

	beans_credits = {
		team = "Name Team",
		idea = "GhostSalt",
		art = "GhostSalt",
		code = "ThunderEdge",
	},
})

SMODS.draw_ignore_keys["nteam_sticky_back"] = true

local back_draw_hook = SMODS.DrawSteps["back"].func
SMODS.DrawSteps["back"].func = function(card, layer)
	back_draw_hook(card, layer)
	if
		card.children.back
		and card.children.back.atlas.key == "cbean_NAMETEAM_Decks"
        and card.children.back.sprite_pos.x == 3
        and card.children.back.sprite_pos.y == 0
        and card.children.nteam_sticky_back
	then
		local overlay = G.C.WHITE
		if card.area and card.area.config.type == "deck" and card.rank > 3 then
			card.back_overlay = card.back_overlay or {}
			card.back_overlay[1] = 0.5 + ((#card.area.cards - card.rank) % 7) / 50
			card.back_overlay[2] = 0.5 + ((#card.area.cards - card.rank) % 7) / 50
			card.back_overlay[3] = 0.5 + ((#card.area.cards - card.rank) % 7) / 50
			card.back_overlay[4] = 1
			overlay = card.back_overlay
		end

		if card.area and card.area.config.type == "deck" then
			card.children.nteam_sticky_back:draw(overlay)
		else
			card.children.nteam_sticky_back:draw_shader("dissolve")
		end
		card.children.nteam_sticky_back:draw_shader(
		"booster",
			nil,
			card.ARGS.send_to_shader,
			true,
			card.children.center
		)
	end
end

SMODS.Back({
	key = "nameteam_graveyard",
	atlas = "NAMETEAM_Decks",
	pos = { x = 0, y = 1 },
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local eligible_jokers = {}
					for k, v in pairs(G.P_CENTERS) do
						if string.find(k, "j_") == 1 then
							if v.pvz_plant then
								eligible_jokers[#eligible_jokers + 1] = k
							end
						end
					end
					for i = 1, 5 do
						if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
							local joker = pseudorandom_element(eligible_jokers, "nameteam_graveyard")
							local joker_index = NAMETEAM.find(eligible_jokers, joker)
							table.remove(eligible_jokers, joker_index)
							local card = SMODS.create_card({
								set = "Joker",
								area = G.jokers,
								key = joker,
								no_edition = true,
							})
							card:add_to_deck()
							card:start_materialize()
							G.jokers:emplace(card)
						end
					end
					return true
				end
			end,
		}))
	end,

	beans_credits = {
		team = "Name Team",
		idea = "Revo",
		art = "Inky",
		code = "TheAltDoc",
	},
})
