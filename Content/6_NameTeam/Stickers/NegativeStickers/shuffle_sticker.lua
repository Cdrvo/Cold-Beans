SMODS.Sticker({
	key = "shuffle",
	atlas = "NAMETEAM_Stickers",
	pos = {
		x = 3,
		y = 3
	},
	badge_colour = HEX("4cb09d"),
	config = {},
	rate = 0,
	needs_enable_flag = false,
	sets = {
        Joker = true
	},
	sticker_type = "Negative",
	loc_vars = function(self, info_queue, card)
		return {
			vars = {},
		}
	end,
    sticker_type = "Negative",
    calculate = function(self, card, context)
        if context.yma_before_before and context.cardarea == G.jokers then
            old_pos = -1
            new_pos = -1
            for k, v in ipairs(G.jokers.cards) do
                if v == card then
                    old_pos = k
                end
            end
            new_pos = math.random(1, #G.jokers.cards)
            while old_pos == new_pos do
                new_pos = math.random(1, #G.jokers.cards)
            end
            G.E_MANAGER:add_event(Event({ 
                trigger = "before",
                blockable = "false",
                func = function() 
                    table.insert(G.jokers.cards, new_pos, table.remove(G.jokers.cards,old_pos))
                    play_sound('cardSlide1', 0.85)
                    return true
                end 
            })) 
            
        end
    end,
	beans_credits = {
		code = "TheAlternateDoctor",
		team = "Name Team",
		art = "GhostSalt",
	},
})
