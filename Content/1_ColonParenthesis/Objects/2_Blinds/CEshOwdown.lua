function Colonparen.isBlind(key)
    return G.GAME and G.GAME.blind and G.GAME.blind.config and G.GAME.blind.config.blind and (G.GAME.blind.config.blind.key == key)
end

Colonparen.CEOBlind{
    key = "colon_eclipse",
    name = "Entrepreneur of the Eclipse",
    pos = { x = 0, y = 0 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 5,
	boss_colour = HEX("459373"),
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
    if (self == G.deck) and Colonparen.isBlind('bl_cbean_colon_eclipse') then
        local new_limit = math.floor((self.config.card_limits.total_slots / 4));
        self.config.card_count = (#self.cards) - self.config.card_limits.total_slots + new_limit;
        self.config.card_limits.total_slots = new_limit;
    end
end

local old_handle_card_limit = CardArea.handle_card_limit;
local function screw_with_cards()
    if Colonparen.isBlind('bl_cbean_colon_eclipse') then
        local new_cards = {}
        for i = 1, math.max(0, G.deck.config.card_count) do
            new_cards[#new_cards+1] = G.deck.cards[i]
        end
        G.deck.SCREWED_CARDS_COLONBEAN = G.deck.cards;
        G.deck.cards = new_cards
    end
end
local function unscrew_with_cards()
    if Colonparen.isBlind('bl_cbean_colon_eclipse') and G.deck.SCREWED_CARDS_COLONBEAN then
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
    if Colonparen.isBlind('bl_cbean_colon_eclipse') then
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
	boss_colour = HEX("459373"),
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

Colonparen.CEOBlind{
    key = "colon_izar",
    name = "Investor of the Izar",
    pos = { x = 0, y = 2 },
    boss = { showdown = true },
	atlas = "colon_CEshOwdown",
    mult = 4,
	boss_colour = HEX("459373"),
    beans_credits = {
        team = ":(",
        idea = "George The Rat",
        art = "George The Rat",
        code = "jamirror",
    }
}