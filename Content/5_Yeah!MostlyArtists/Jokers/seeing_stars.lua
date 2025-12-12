SMODS.Joker {
	key = 'yma_seeing_stars',

	loc_vars = function(self, info_queue, card)
	end,

	rarity = 2,
	atlas = 'yma_joker_atlas',
	pos = { x = 3, y = 2 },
	cost = 6,
	blueprint_compat = false,

	calculate = function(self, card, context)
        
	end,
	add_to_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_cbean_yma_seeing_stars") <= 0 then
            for k, joker in pairs(G.P_CENTER_POOLS['Joker']) do
                local joker_temp = G.P_CENTER_POOLS['Joker'][k]
                local key = joker_temp.key
                local text = yma_retrieve_joker_text(joker_temp, true)
                if text == "" then
                    G.GAME.banned_keys[key] = "j_cbean_yma_seeing_stars"
                else
                    local text_has_planet= text:find('Planet') or text:find('planet') or text:find('level') or text:find('Level') or text:find('levels') or text:find('Levels')
                    if not G.GAME.banned_keys[key] and not text_has_planet then
                        G.GAME.banned_keys[key] = "j_cbean_yma_seeing_stars"
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if #SMODS.find_card("j_cbean_yma_seeing_stars") <= 0 then
            for key, value in pairs(G.GAME.banned_keys) do
                if value == "j_cbean_yma_seeing_stars" then
                    G.GAME.banned_keys[key] = nil
                end
            end
        end
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}