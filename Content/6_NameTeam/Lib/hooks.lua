local remove_old = Card.remove
function Card:remove()
	if not G.in_delete_run then
		if self.added_to_deck or (self.area and (self.area == G.hand or self.area == G.deck)) then
			SMODS.calculate_context({
				cbean_destroyed = true,
				cbean_destroyed_card = self
			})
		end
	end
    return remove_old(self)
end

local update_hook = Game.update
function Game:update(dt)
	update_hook(self, dt)
	if not G.GAME.nteam_sticker_obtained and G.jokers then
		for _, j in ipairs(G.jokers.cards) do
			for _, key in ipairs(SMODS.Sticker.obj_buffer) do
				if j.ability[key] then
					G.GAME.nteam_sticker_obtained = true
					break
				end
			end
		end
	end
	if G.jokers then
		for i, j in ipairs(G.jokers.cards) do
			if
				G.jokers.cards[i + 1]
				and G.jokers.cards[i + 1].config.center.key == "j_cbean_celery_stalker"
				and not G.jokers.cards[i + 1].debuff
			then
				if not j.ability.nteam_celery_left then
					NAMETEAM.values("/", j, 2, true)
				end
				j.ability.nteam_celery_left = true
			else
				if j.ability.nteam_celery_left then
					NAMETEAM.values("*", j, 2, true)
				end
				j.ability.nteam_celery_left = false
			end
			if
				G.jokers.cards[i - 1]
				and G.jokers.cards[i - 1].config.center.key == "j_cbean_celery_stalker"
				and not G.jokers.cards[i - 1].debuff
			then
				if not j.ability.nteam_celery_right then
					NAMETEAM.values("*", j, 2, true)
				end
				j.ability.nteam_celery_right = true
			else
				if j.ability.nteam_celery_right then
					NAMETEAM.values("/", j, 2, true)
				end
				j.ability.nteam_celery_right = false
			end
		end


		for i, j in ipairs(G.jokers.cards) do
			if (#SMODS.find_card("j_cbean_torchwood")>0) and
				NAMETEAM.all_on(j, G.jokers.cards, "right", nil, "j_cbean_torchwood")
			then
				if not j.ability.nteam_torchwood then
					NAMETEAM.values("*", j, 1.5, true)
				end
				j.ability.nteam_torchwood = true
			else
				if j.ability.nteam_torchwood then
					NAMETEAM.values("/", j, 1.5, true)
				end
				j.ability.nteam_torchwood = false
			end
		end

	end

	
end

local start_run_hook = Game.start_run
function Game:start_run(args)
	start_run_hook(self, args)
	if G.consumeables and G.consumeables.config.highlighted_limit < 2 then
		 G.consumeables.config.highlighted_limit =  G.consumeables.config.highlighted_limit + 1
	end
	---@type integer
	G.GAME.stationery_num_accepted = G.GAME.stationery_num_accepted or 2
	---@type string[]
	G.GAME.stationery_accepted = G.GAME.stationery_accepted
		or NAMETEAM.poll_stationery_accepted()
	---@type integer
	G.GAME.stationery_num_rewards = G.GAME.stationery_num_rewards or 1
	---@type string[]
	G.GAME.stationery_rewards = G.GAME.stationery_rewards
		or NAMETEAM.poll_stationery_rewards()
    -- initialize ability table where deck stickers are stored
	---@type string[]
    G.GAME.selected_back.ability = G.GAME.selected_back.ability or {}
	---@type integer
	G.GAME.round_resets.base_stationery_reroll_cost = G.GAME.round_resets.base_stationery_reroll_cost or 5
	---@type integer
	G.GAME.round_resets.free_stationery_rerolls = G.GAME.round_resets.free_stationery_rerolls or 0
	---@type integer
	G.GAME.stationery_reroll_cost = G.GAME.round_resets.base_stationery_reroll_cost or 5
	---@type integer
	G.GAME.stationery_reroll_cost_scaling = G.GAME.stationery_reroll_cost_scaling or 1
	---@type boolean
	G.GAME.seen_stationery_tutorial = G.GAME.seen_stationery_tutorial or false
	---@type boolean
	G.GAME.already_no_interest = G.GAME.already_no_interest or false
	---@type integer
	G.GAME.dangerous_mult = G.GAME.dangerous_mult or 1
	---@type integer
	G.GAME.nteam_locked_index = G.GAME.nteam_locked_index or 0
end

local apply_hook = Back.apply_to_run
function Back:apply_to_run()
	apply_hook(self)
	if G.GAME.modifiers.no_interest then
		G.GAME.already_no_interest = true
	end
end

-- Following 2 hooks are for storing and saving the stickers to the deck
local save_deck_hook = Back.save
function Back:save()
    local ret = save_deck_hook(self)
    ret.ability = self.ability
    return ret
end

local load_deck_hook = Back.load
function Back:load(backTable)
    load_deck_hook(self, backTable)
    self.ability = backTable.ability
end

local function transparent_helper(t)
	t.config.colour = G.C.CLEAR
	t.config.outline_colour = G.C.CLEAR
	t.config.no_fill = true
	if t.nodes then
		for i, child in ipairs(t.nodes) do
			transparent_helper(child)
		end
	end
end

local popup_hook = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
	local ret = popup_hook(card)
	if G.deck and G.deck.cards[1] == card then
		transparent_helper(ret)
	end
	return ret
end

local get_popup_offset_hook = Card.align_h_popup
function Card:align_h_popup()
	local ret = get_popup_offset_hook(self)
	if G.deck and self == G.deck.cards[1] then
		local d_sticker_count = 0
		for k, v in pairs(G.GAME.selected_back.ability) do
			if v and SMODS.Stickers[k] then
				d_sticker_count = d_sticker_count + 1
			end
		end
		local fac = 2.4 - math.max(0, d_sticker_count - 6) * 0.25
		ret.offset.y = ret.offset.y + fac
	end
	return ret
end

local apply_sticker_hook = Card.add_sticker
function Card:add_sticker(sticker, bypass_check) -- fuck me
	local already_had = self.ability[sticker]
	if not self.ability.NAMETEAM_sticker_count then self.ability.NAMETEAM_sticker_count = 0 end
	if ((#SMODS.find_card("j_cbean_tallnut")==0)) and not (self:on_the("right") and self:on_the("right").config.center.key == "j_cbean_wallnut") then
		apply_sticker_hook(self, sticker, bypass_check)
		if not already_had and self.ability[sticker] then
			if not self.ability.NAMETEAM_sticker_count then self.ability.NAMETEAM_sticker_count = 0 end
			self.ability.NAMETEAM_sticker_count = self.ability.NAMETEAM_sticker_count + 1
			self:NAMETEAM_apply_sticker_calc(SMODS.Stickers[sticker])
		end
	elseif self.ability.NAMETEAM_sticker_count==0 and not (self:on_the("right") and self:on_the("right").config.center.key == "j_cbean_wallnut") then
		apply_sticker_hook(self, sticker, bypass_check)
		if not already_had and self.ability[sticker] then
			if not self.ability.NAMETEAM_sticker_count then self.ability.NAMETEAM_sticker_count = 0 end
			self.ability.NAMETEAM_sticker_count = self.ability.NAMETEAM_sticker_count + 1
			self:NAMETEAM_apply_sticker_calc(SMODS.Stickers[sticker])
		end
	end
end

local remove_sticker_hook = Card.remove_sticker
function Card:remove_sticker(sticker)
	local already_had = self.ability[sticker]
	remove_sticker_hook(self, sticker)
	if already_had and not self.ability[sticker] then
		if self.ability.NAMETEAM_sticker_count then
			self.ability.NAMETEAM_sticker_count = self.ability.NAMETEAM_sticker_count - 1
		end
		self:NAMETEAM_remove_sticker_calc(SMODS.Stickers[sticker])
	end
end

local old_set_ability = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
	if self and self.ability and self.ability.set == "Default" then
		for k, v in pairs(G.P_CENTER_POOLS.Enhanced) do
			if not self.ability["cbean_barren"] then
				return old_set_ability(self, center, initial, delay_sprites)
			end
		end
	else
		return old_set_ability(self, center, initial, delay_sprites)
	end
end

local old_play_highlighted = G.FUNCS.play_cards_from_highlighted
function G.FUNCS.play_cards_from_highlighted(e)
	NAMETEAM.highlight_order = 0
	SMODS.calculate_context({cbean_first = true})
	if (#SMODS.find_card("j_cbean_draftodil")>0) or NAMETEAM.testing_discard then
		for i=1, #G.hand.highlighted do
			if SMODS.pseudorandom_probability(nil, "SEED", 1, G.hand.highlighted[i].base.id) then
				draw_card(G.hand, G.discard, i*100/#G.hand.highlighted, 'up', nil, G.hand.highlighted[i])
				SMODS.calculate_context({discard = true, other_card =  G.hand.highlighted[i], full_hand = G.hand.highlighted, ignore_other_debuff = true})
				G.hand.highlighted[i].cbean_discarded = true
			end
		end
	end
	if (#SMODS.find_card("j_cbean_rhubarbarian")>0) or NAMETEAM.testing_discard_2 then
		for i=1, #G.hand.cards do
			if not G.hand.cards[i].highlighted then
				draw_card(G.hand, G.discard, i*100/#G.hand.cards, 'up', nil, G.hand.cards[i])
				SMODS.calculate_context({discard = true, other_card =  G.hand.cards[i], full_hand = G.hand.cards, ignore_other_debuff = true})
				G.hand.cards[i].cbean_discarded = true
			end
		end
	end
	old_play_highlighted(e)
end

local add_to_deck_old = Card.add_to_deck
function Card:add_to_deck(from_debuff)
	local ret = add_to_deck_old(self, from_debuff)
	if self and self.ability then
		for k, v in pairs(SMODS.Stickers) do
			if self.ability[k] then
				print(k ..  " is added to the deck")
				self:NAMETEAM_apply_sticker_calc(SMODS.Stickers[k])
			end
		end
	end
	return ret
end

local debuff_old = Card.set_debuff
function Card:set_debuff(should_debuff)
	if self.ability then
		if not self.ability["cbean_man"] then
			return debuff_old(self, should_debuff)
		end
	else
		return debuff_old(self, should_debuff)
	end
end

local joker_calc_cold = Card.calculate_joker
function Card:calculate_joker(context)
    if self.ability then
		local trigger_defying_factors = 0
		if self.ability["cbean_square"] then
			if G.play and G.play.cards and #G.play.cards == 4 then
				-- ye
			else
				trigger_defying_factors = trigger_defying_factors + 1
			end
		end
		if self.ability["cbean_shroom"] then
			if G.jokers and (G.jokers.cards[1] == self or G.jokers.cards[2] == self) then
				-- ye
			else
				trigger_defying_factors = trigger_defying_factors + 1
			end
		end
		if trigger_defying_factors <= 0 and not self.ability.prevent_trigger and not ((G.GAME.NAMETEAM or {}).buduh_boomed_active and pseudorandom("crash?")<1/3) then
			return joker_calc_cold(self, context)
		end
	else
        return joker_calc_cold(self, context)
    end
end



local calculate_main_scoring_old = SMODS.calculate_main_scoring
function SMODS.calculate_main_scoring(context, scoring_hand)
	NAMETEAM.general_area = context.cardarea.cards
	NAMETEAM.scoring_area = context.scoring_hand
	if (#SMODS.find_card("j_cbean_cactus")>0) then
		local a,b,c,d = {},0,nil,0
		for i = 1, #NAMETEAM.scoring_area do
			a[#a+1] = i
		end
		b = pseudorandom_element(a,pseudoseed("j_cbean_cactiyessir")) 
		--[[for k, v in pairs(NAMETEAM.general_area) do
			if v == NAMETEAM.scoring_area[b] then
				c = v
			end
		end]]
		--[[for i = 1, #NAMETEAM.general_area do
			if NAMETEAM.general_area[i] == c then
				d = i
			end
		end]]
		if b ~= 0 and #NAMETEAM.scoring_area>1 then
			table.remove(NAMETEAM.scoring_area, b)
			if not G.GAME.NAMETEAM.cactus_number then G.GAME.NAMETEAM.cactus_number = 1 else G.GAME.NAMETEAM.cactus_number = G.GAME.NAMETEAM.cactus_number + 1 end
		end
		--[[if d ~= 0 then  -- YEETS the card lmao
			table.remove(NAMETEAM.general_area, d)
		end]]

	end

	if (#SMODS.find_card("j_cbean_cattail")>0) and #NAMETEAM.scoring_area>2 then
		table.remove(NAMETEAM.scoring_area, 1)
		table.remove(NAMETEAM.scoring_area,  #NAMETEAM.scoring_area)
		if not G.GAME.NAMETEAM.cattail_number then G.GAME.NAMETEAM.cattail_number = 1 else G.GAME.NAMETEAM.cattail_number = G.GAME.NAMETEAM.cattail_number + 1 end
	end
	
	if (#SMODS.find_card("j_cbean_sweet_potato")>0) then
		NAMETEAM.general_area = NAMETEAM.shuffle(NAMETEAM.general_area, "sweet_lil_potato")
	end

	if (#SMODS.find_card("j_cbean_hocus_crocus")>0) then
		NAMETEAM.general_area = NAMETEAM.reverse_table(NAMETEAM.general_area)
	end
    for _, card in ipairs(NAMETEAM.general_area) do
        local in_scoring = scoring_hand and SMODS.in_scoring(card, NAMETEAM.scoring_area)
        --add cards played to list
        if scoring_hand and not SMODS.has_no_rank(card) and in_scoring then
            G.GAME.cards_played[card.base.value].total = G.GAME.cards_played[card.base.value].total + 1
            if not SMODS.has_no_suit(card) then
                G.GAME.cards_played[card.base.value].suits[card.base.suit] = true
            end
        end

		for i = 1, #NAMETEAM.scoring_area do
			if i < 4 and NAMETEAM.scoring_area[i] and (#SMODS.find_card("j_cbean_stallia")>0) then
				NAMETEAM.scoring_area[i].mark_for_no_score = true
			end
		end
        --if card is debuffed
        if scoring_hand and card.debuff then
            if in_scoring then 
                G.GAME.blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function() SMODS.juice_up_blind() return true end)
                }))
                card_eval_status_text(card, 'debuff')
				if (#SMODS.find_card("j_cbean_EM_peach")>0) then
					SMODS.calculate_effect({xmult = 2.5}, card)
				end
            end
        elseif scoring_hand and (card.marked_by_mortar or card.mark_for_no_score or card.mark_for_perma_no_score) or G.GAME.NAMETEAM.cards_no_score then
			if in_scoring then 
                -- G.GAME.blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function() SMODS.juice_up_blind() return true end)
                }))
                NAMETEAM.msg(card, "No Score!")
				if card.no_score_effect then
					SMODS.calculate_effect({[card.no_score_effect.effect] = card.no_score_effect.amount}, card)
					card.no_score_effect.effect = nil
					card.no_score_effect.amount = nil
				end
				if card.no_score_mult then -- ignore this
					SMODS.calculate_effect({mult = card.no_score_mult}, card)
					card.no_score_mult = nil
				end
				if card.mark_for_no_score then
					card.mark_for_no_score = nil
				end
            end
		else
            if scoring_hand then
                if in_scoring then context.cardarea = G.play else context.cardarea = 'unscored' end
            end
			if (#SMODS.find_card("j_cbean_blover")>0) then
				G.GAME.NAMETEAM.blover_number = #context.scoring_hand
			else
				SMODS.score_card(card, context)
			end
        end
    end
	if not G.GAME.NAMETEAM.no_score_cards and not (#SMODS.find_card("j_cbean_blover")) then
		return calculate_main_scoring_old(context, scoring_hand)
	end
end


local gfep = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(e)
	G.E_MANAGER:add_event(Event({
		trigger = "before",
		delay = 0,
		func = function()
			NAMETEAM.during_scoring = true
			return true
		end
	}))
	gfep(e)
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.2,
		func = function()
			NAMETEAM.during_scoring = false
			return true
		end
	}))
end

local add_round_eval_row_old = add_round_eval_row
function add_round_eval_row(config)
	---Adds the check needed for Gold shroom
	local old_dollar =	(config.dollars or 0)
	config.dollars = (config.dollars or 0)
	if config.dollars and config.dollars>0 then
		config.dollars = (( (config.dollars or 0) / ((#SMODS.find_card("j_cbean_golden_magnet"))+1) ))
		G.GAME.NAMETEAM.goldenmagnet_number = old_dollar - config.dollars
	end
	
	return add_round_eval_row_old(config)
end

local cash_out_old = G.FUNCS.cash_out
function G.FUNCS.cash_out(e)
	SMODS.calculate_context({cbean_cashout = true})
	cash_out_old(e)
end

local buy_old = G.FUNCS.buy_from_shop
function G.FUNCS.buy_from_shop(e)
	local card = e.config.ref_table
	buy_old(e)
	if card and card.ability and card.ability.set and card.ability.set == "Joker" and card.config.center.key ~= "j_cbean_imitater" then
		G.GAME.last_bought_joker = card
		G.GAME.last_bought_joker_key = card.config.center.key
	end
end


function NAMETEAM.bean_spring_suit_check(card, suit)
    if not card then
		--check--print("no card")
        return false
    end

    if (#SMODS.find_card("j_cbean_spring_bean") > 0) and card.area == G.play and G.play.cards[1] == card then
		--print("inital check")
		local suits = {}
		for i = 1, #G.play.cards do
			local gp = G.play.cards
			if not suits[gp[i].base.suit] then 
				suits[gp[i].base.suit] = true 
				--print("inserting: " .. gp[i].base.suit)
			end
 		end

		for k, v in pairs(suits) do
			--print(k, suit)
			if k == suit then
				return true
			end
		end
	end
    return false
end

local is_suit_old = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)

	if (#SMODS.find_card("j_cbean_spring_bean") > 0) then
		if flush_calc then
			return is_suit_old(self, suit, bypass_debuff, flush_calc)
		else
			if self == G.play.cards[1] then
				return NAMETEAM.bean_spring_suit_check(self, suit)
			end
		end
	end
	return is_suit_old(self, suit, bypass_debuff, flush_calc)
end

local start_run_old = Game.start_run
function Game:start_run(args)
	start_run_old(self, args)
	if G.jokers and G.jokers.config then
		G.jokers.config.highlighted_limit = G.jokers.config.highlighted_limit + 4
	end
end


local check_for_buy_space_old = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.always_buyable then
        return true
    end
    return check_for_buy_space_old(card)
end

local click_old = Card.click
function Card:click()
	local ret = click_old(self)
	if self.added_to_deck and self.config.center.key == "j_cbean_magnifying_grass" then
		SMODS.calculate_context({cbean_clicked = true, card = self})
	end
	return ret
end

local sell_card_old = Card.sell_card
function Card:sell_card()
    sell_card_old(self)
	G.GAME.NAMETEAM_sold_jokers = G.GAME.NAMETEAM_sold_jokers or {}
	table.insert(G.GAME.NAMETEAM_sold_jokers, self.config.center.key)
end


local cardhighold = Card.highlight
function Card:highlight(is_highlighted)
	self.highlighted = is_highlighted
	if self.area == G.hand and self.highlighted and ((#SMDOS.find_card("j_cbean_missle_toe")>0) or (#SMDOS.find_card("j_cbean_boom_ballon_flower")>0) ) then
		if not NAMETEAM.highlight_order then NAMETEAM.highlight_order = 1 else NAMETEAM.highlight_order = NAMETEAM.highlight_order + 1 end
		self.highlight_order_cbean = NAMETEAM.highlight_order
		-- print("highlighted " .. self.highlight_order_cbean, NAMETEAM.highlight_order)
	else
		return cardhighold(self, is_highlighted)
	end
end


local calc_reps_old = SMODS.calculate_repetitions
function SMODS.calculate_repetitions(card,context,reps)
	if (#SMODS.find_card("j_cbean_power_vine")==0) and (#SMODS.find_card("j_cbean_sundew_tangler")==0) then
		calc_reps_old(card, context, reps)
	end
end

	
local get_boss_old = get_new_boss
function get_new_boss()
	if G.GAME.NAMETEAM.stored_boss then
		local boss = G.GAME.NAMETEAM.stored_boss
		G.GAME.NAMETEAM.stored_boss = nil
		return boss
	else
		return get_boss_old()
	end
end

local igo = Game.init_game_object
Game.init_game_object = function(self)
	local ret = igo(self)
	ret.NAMETEAM = {
		unique_consumables = {},
		HR_HANDS = {}
	}
	return ret
end

local add_to_deck_old = Card.add_to_deck
function Card:add_to_deck(from_debuff)
	local insert = true
	if #G.GAME.NAMETEAM.unique_consumables > 0 then
		for k, v in pairs(G.GAME.NAMETEAM.unique_consumables) do
			if v == self.config.center.key then
				insert = false
			end
		end
	end
	if insert and self:cbean_is_consumable() then
		G.GAME.NAMETEAM.unique_consumables[#G.GAME.NAMETEAM.unique_consumables+1] = self.config.center.key
	end
	return add_to_deck_old(self, from_debuff)
end

local eval_card_old = eval_card
function eval_card(card, context, ...)
	if card then
		return eval_card_old(card, context, ...)
	end
end