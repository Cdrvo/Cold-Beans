SMODS.Sticker({
	key = "targeted",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 6,
		y = 4,
	},
    sets = {
        Joker = true,
        Default = true,
        Enhanced = true,
    },
	badge_colour = HEX("ac3232"),
    needs_enable_flag = true,
	rate = 0.03,
	sticker_type = "Positive",
	calculate = function(self, card, context)
		if card.ability.set == "Joker" then
            if context.retrigger_joker_check and context.other_card == card then
                card.ability.target_triggered = true
                return{
                    repetitions = 1
                }
            end
        else
            if context.repetition and context.other_card == card then
                card.ability.target_triggered = true
                return{
                    repetitions = 1
                }
            end
        end
        if context.after then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0.1,
                func = function()
                    if card.ability.target_triggered then
                        local a = nil
                        if card.ability.set == "Joker" then
                            a = NAMETEAM.random_joker(G.jokers.cards, card)
                            NAMETEAM.msg(card, "Moved!")
                            a:add_sticker("cbean_targeted", true)
                            card:remove_sticker("cbean_targeted", true)
                        else
                            a = NAMETEAM.random_joker(G.playing_cards, card)
                            NAMETEAM.msg(card, "Moved!")
                            a:add_sticker("cbean_targeted", true)
                            card:remove_sticker("cbean_targeted", true)
                        end
                    end   
                    return true
                end
            }))
        end
	end,
	beans_credits = {
        code = "Revo",
		art = "Inky",
		team = "Name Team"
	},
})