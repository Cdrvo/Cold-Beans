Colonparen.CEOBlind{
    key = "colon_eclipse",
    name = "Entrepreneur of the Eclipse",
    pos = { x = 0, y = 2 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 5,
	boss_colour = HEX("fd7857"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}

local old_update = CardArea.update;
function CardArea:update(...)
    old_update(self, ...)
    if (self == G.deck) and SMODS.is_active_blind('bl_cbean_colon_eclipse') then
        local new_limit = math.floor((self.config.card_limits.total_slots / 4));
        self.config.card_count = (#self.cards) - self.config.card_limits.total_slots + new_limit;
        self.config.card_limits.total_slots = new_limit;
    end
end

local old_handle_card_limit = CardArea.handle_card_limit;
local function screw_with_cards()
    if SMODS.is_active_blind('bl_cbean_colon_eclipse') then
        local new_cards = {}
        for i = 1, math.max(0, G.deck.config.card_count) do
            new_cards[#new_cards+1] = G.deck.cards[i]
        end
        G.deck.SCREWED_CARDS_COLONBEAN = G.deck.cards;
        G.deck.cards = new_cards
    end
end
local function unscrew_with_cards()
    if SMODS.is_active_blind('bl_cbean_colon_eclipse') and G.deck.SCREWED_CARDS_COLONBEAN then
        G.deck.cards = G.deck.SCREWED_CARDS_COLONBEAN;
        G.deck.SCREWED_CARDS_COLONBEAN = nil;
    end
end
function CardArea:handle_card_limit()
    if G.deck then
        if (G.deck.GASLIGHT or 0) <= 0 then
            G.deck.GASLIGHT = 0;
            screw_with_cards()
        end
        G.deck.GASLIGHT = (G.deck.GASLIGHT or 0) + 1;
    end
    local value = old_handle_card_limit(self)
    if G.deck then
        G.deck.GASLIGHT = (G.deck.GASLIGHT or 0) - 1;
        if (G.deck.GASLIGHT or 0) <= 0 then
            G.deck.GASLIGHT = 0;
            unscrew_with_cards()
        end
    end
    return value
end

local old_draw_from_deck_to_hand = G.FUNCS.draw_from_deck_to_hand;
function G.FUNCS.draw_from_deck_to_hand(...)
    if G.deck then
        if (G.deck.GASLIGHT or 0) <= 0 then
            G.deck.GASLIGHT = 0;
            screw_with_cards()
        end
        G.deck.GASLIGHT = (G.deck.GASLIGHT or 0) + 1;
    end
    if SMODS.is_active_blind('bl_cbean_colon_eclipse') then
        if not (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
            (#G.hand.cards == 0) and (#G.deck.cards == 0) then 
            G.STATE = G.STATES.GAME_OVER; G.STATE_COMPLETE = false 
            return true
        end
    end
    local value = old_draw_from_deck_to_hand(...)
    if G.deck then
        G.deck.GASLIGHT = (G.deck.GASLIGHT or 0) - 1;
        if (G.deck.GASLIGHT or 0) <= 0 then
            G.deck.GASLIGHT = 0;
            unscrew_with_cards()
        end
    end
    return value
end

Colonparen.CEOBlind{
    key = "colon_magnetar",
    name = "Monopolist of the Magnetar",
    pos = { x = 0, y = 1 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 4,
	boss_colour = HEX("d271e1"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    in_pool = function (self, startofante)
        return startofante
    end
}

function Colonparen.GainBlindBase(amount)
    if not G.GAME.blind then return end;
    G.GAME.blind.mult = G.GAME.blind.mult + amount;
    G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    G.GAME.blind:juice_up()
end

Colonparen.IZAR_GRADIENT = SMODS.Gradient{
    key = "COLON_IZAR_GRADIENT",
    colours = {
        HEX('81cefd'), 
        HEX('fd7857')
    },
    cycle = 10
}

Colonparen.CEOBlind{
    key = "colon_izar",
    name = "Investor of the Izar",
    pos = { x = 0, y = 4 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 4,
	boss_colour = Colonparen.IZAR_GRADIENT,
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    calculate = function (self, blind, context)
        if context.before then
            Colonparen.GainBlindBase(((G.GAME.hands[context.scoring_name] or {}).played or 0) / 10)
        end
    end
}

Colonparen.CEOBlind{
    key = "colon_corona",
    name = "Capitalist of the Corona",
    pos = { x = 0, y = 3 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 4,
	boss_colour = HEX("6b8084"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
	recalc_debuff = function(self, card, from_blind)
        if G.GAME.blind.disabled then return false end
		return card.ability.cbean_colon_corona
	end,
    set_blind = function(self, reset, silent)
        if reset then return end
		for i, v in pairs(G.jokers.cards) do
            v.ability.cbean_colon_corona = true
            v:set_debuff(true)
        end
    end,
    disable = function (self, reset, silent)
		for i, v in pairs(G.jokers.cards) do
            v.ability.cbean_colon_corona = nil;
            v:set_debuff(false)
        end
    end,
    defeat = function (self, reset, silent)
		for i, v in pairs(G.jokers.cards) do
            v.ability.cbean_colon_corona = nil;
            v:set_debuff(false)
        end
    end,
    calculate = function (self, blind, context)
        if context.after then

            local options = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.cbean_colon_corona and (G.jokers.cards[i].debuff) then
                    options[#options+1] = G.jokers.cards[i]
                end
            end
            if #options > 0 then
                local card = pseudorandom_element(options, pseudoseed('colon_corona'));
                card.ability.cbean_colon_corona = nil
                G.E_MANAGER:add_event(Event({ -- Lower
                    trigger = 'immediate',
                    func = function()
                        card:set_debuff(false)
                        return true
                end}))
            end
        end
    end
}

Colonparen.CEOBlind{
    key = "colon_satellite",
    name = "Speculator of the Satellite",
    pos = { x = 0, y = 0 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 10,
	boss_colour = HEX("008be3"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    },
    loc_vars = function (self)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 3, "bl_cbean_colon_satellite")
        return {
            vars = {
                numerator, denominator
            }
        }
    end,
    collection_loc_vars = function (self)
        return {
            vars = {
                1, 3
            }
        }
    end,
    calculate = function (self, blind, context)
        if context.before or context.pre_discard then
            if SMODS.pseudorandom_probability(self, 'bl_cbean_colon_satellite', 1, 3) then
                Colonparen.GainBlindBase(-1)
            end
        end
    end
}