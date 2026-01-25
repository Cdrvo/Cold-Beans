--[[SMODS.Scoring_Parameter({
 key = 'yma_flerp',
 default_value = 0,
 colour = mix_colours(G.C.BLUE, G.C.BLUE, 0.5),
 calculation_keys = {'flerp', 'xflerp'},
 hands = {
    ['Pair'] = {["cbean_yma_flerp"] = 10, ["l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ['Four of a Kind'] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Flush Five"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Flush House"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Five of a Kind"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Straight Flush"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Full House"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Flush"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Straight"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Three of a Kind"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["Two Pair"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
    ["High Card"] = {["cbean_yma_flerp"] = 10, [ "l_cbean_yma_flerp"] = 5, [ "s_cbean_yma_flerp"] = 10},
  },
  calc_effect = function(self, effect, scored_card, key, amount, from_edition)
		if not SMODS.Calculation_Controls.chips then return end
	  if key == 'flerp' and amount then
	    if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
	    self:modify(amount)
	    card_eval_status_text(scored_card, 'extra', nil, percent, nil,
	      {message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {amount}}, colour = self.colour})
	    return true
    end
    if key == 'xflerp' and amount then
      if effect.card and effect.card ~= scored_card then juice_card(effect.card) end
      self:modify(self.current * (amount - 1))
      card_eval_status_text(scored_card, 'extra', nil, percent, nil,
        {message = localize{type = 'variable', key = amount > 0 and 'a_chips' or 'a_chips_minus', vars = {'X'..amount}}, colour = self.colour})
      return true
    end
  end
})

SMODS.Scoring_Calculation({
  key = "yma_flerp_window",
  func = function(self, chips, mult, flames)
	  return (((chips * SMODS.get_scoring_parameter('flerp', flames)) * mult) + (SMODS.get_scoring_parameter('flerp', flames)) ^ 0.5)
	end,
  parameters = {'chips', 'mult', "flerp"},
  replace_ui = function(self)
    local scale = 0.3
		return
		{n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.1}, nodes={
			{n=G.UIT.C, config={align = 'cm', id = 'hand_chips'}, nodes = {
				SMODS.GUI.score_container({
					type = 'chips',
					text = 'chip_text',
					align = 'cr',
					w = 1.1,
					scale = scale
				})
			}},
			SMODS.GUI.operator(scale*0.75),
			{n=G.UIT.C, config={align = 'cm', id = 'hand_yma_flerp'}, nodes = {
				SMODS.GUI.score_container({
					type = 'yma_flerp',
					align = 'cl',
					w = 1.1,
					scale = scale
				})
			}},
			SMODS.GUI.operator(scale*0.75),
			{n=G.UIT.C, config={align = 'cm', id = 'hand_mult'}, nodes = {
				SMODS.GUI.score_container({
					type = 'mult',
					align = 'cm',
					w = 1.1,
					scale = scale
				})
			}},
		}}
	end
})]]--