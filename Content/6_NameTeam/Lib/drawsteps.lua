SMODS.DrawStep({
	key = "deck_stickers",
	order = 41,
	func = function(card, layer)
		if G.deck then
			if card == G.deck.cards[1] then
				for k, v in pairs(SMODS.Stickers) do
					if G.GAME.selected_back.ability[v.key] then
						if v and v.draw and type(v.draw) == "function" then
							v:draw(card, layer)
						else
							G.shared_stickers[v.key].role.draw_major = card
							G.shared_stickers[v.key].states.hover.can = false
							G.shared_stickers[v.key]:draw_shader("dissolve", nil, nil, true, card.children.center)
							G.shared_stickers[v.key]:draw_shader(
								"voucher",
								nil,
								card.ARGS.send_to_shader,
								true,
								card.children.center
							)
						end
					end
				end
			end
		end
	end,
	conditions = { vortex = false, facing = "back" },
})
