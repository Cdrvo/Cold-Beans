SMODS.Sticker({
	key = "brainrot",
    atlas = "NAMETEAM_Stickers",
	pos = {
		x = 6,
		y = 0,
	},
    sets = {
        Joker = true,
    },
    config = {
        six = false,
        seven = false,
        triggers = 1,
    },
    sticker_type = "Positive",
	badge_colour = HEX("e0bb21"),
    needs_enable_flag = true,
	rate = 0.04,
	calculate = function(self, card, context)
        local s = self.config
		if context.before then
            s.six = false
            s.seven = false
            for k, v in pairs(context.scoring_hand) do
                if v:get_id() == 6 then
                    s.six = true
                elseif v:get_id() == 7 then
                    s.seven = true
                end
            end
        end
        if
			context.other_card == card
			and not card.debuff
			and (context.repetition or (context.retrigger_joker_check and not context.retrigger_joker))
            and s.six and s.seven
		then
            s.six = false
            s.seven = false
			return {
				repetitions = s.triggers,
			}
		end
	end,
	beans_credits = {
        code = "Revo",
		art = "Inky" ,
		team = "Name Team"
	},
})