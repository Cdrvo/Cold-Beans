SMODS.Joker { --Modifed from Vanilla Remade's example
    key = "pboys_vodka", 
    atlas = "pboys_joker_atlas",
    pos = { x = 1, y = 0 },
    rarity = 3,
    order = 1,
    blueprint_compat = false,
    cost = 9,
    config = {},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'tag_double', set = 'Tag' }
        return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_double' } } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
			if not(G.GAME.blind_on_deck ~= "CEO" and G.GAME.blind_on_deck ~= "Ceo") then
				add_tag(Tag('tag_double'))
			else
				local tag
				repeat
					tag = Tag(get_next_tag_key("vodka"))
				until tag.name ~= "Boss Tag" and tag.name ~= "Double Tag"
				if tag.name == "Orbital Tag" then
					local _poker_hands = {}
					for k, v in pairs(G.GAME.hands) do
						if v.visible then
							_poker_hands[#_poker_hands + 1] = k
						end
					end
					tag.ability.orbital_hand = pseudorandom_element(_poker_hands, pseudoseed("vodka"))
				end
				add_tag(tag)
			end
			
        end
    end,
    beans_credits = {
        team = {"Pissboys",
        },
        idea = "FlameThrowerFIM",
        art =  "FlameThrowerFIM",
        code = "Nrio_Modder",
    }
}