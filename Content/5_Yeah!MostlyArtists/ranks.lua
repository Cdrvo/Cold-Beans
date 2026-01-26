SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then
            return false
        else
            return true 
        end
    end,
    key = 'yma_s',
    shorthand = 'yma_s',
    card_key = 'yma_s',
    pos = { x = 0 },
    nominal = 11,
    suit_map = {
        Diamonds = 0,
        Clubs = 1,
        Spades = 2,
        Hearts = 3,
    },
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'cbean_yma_t' },
    lc_atlas = "yma_astro_ranks",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then
            return false
        else
            return true 
        end
    end,
    key = 'yma_t',
    shorthand = 'yma_t',
    card_key = 'yma_t',
    pos = { x = 1 },
    nominal = 11,
    suit_map = {
        Diamonds = 0,
        Clubs = 1,
        Spades = 2,
        Hearts = 3,
    },
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'cbean_yma_r' },
    lc_atlas = "yma_astro_ranks",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then
            return false
        else
            return true 
        end
    end,
    key = 'yma_r',
    shorthand = 'yma_r',
    card_key = 'yma_r',
    pos = { x = 2 },
    nominal = 11,
    suit_map = {
        Diamonds = 0,
        Clubs = 1,
        Spades = 2,
        Hearts = 3,
    },
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'cbean_yma_o' },
    lc_atlas = "yma_astro_ranks",
}

SMODS.Rank {
    in_pool = function(self, args)
        if args and ((args.suit == '') or (args.initial_deck)) then
            return false
        else
            return true 
        end
    end,
    key = 'yma_o',
    shorthand = 'yma_o',
    card_key = 'yma_o',
    pos = { x = 3 },
    nominal = 11,
    suit_map = {
        Diamonds = 0,
        Clubs = 1,
        Spades = 2,
        Hearts = 3,
    },
    strength_effect = {
        fixed = 1,
        random = false,
        ignore = false
    },
    next = { 'Ace' },
    lc_atlas = "yma_astro_ranks",
}
--Astro hand doesnt seem to work, just recognises it as a straight
--[[
SMODS.PokerHandPart {
    key = "yma_astro",
    func = function(hand)
        if #hand ~= 5 then return {} end
        
        local astro_ranks = {
            ["Ace"] = true,
            ["cbean_yma_s"] = true,
            ["cbean_yma_t"] = true,
            ["cbean_yma_r"] = true,
            ["cbean_yma_o"] = true
        }
        
        local found = {}
        local astro = {}
        
        for _, card in ipairs(hand) do
            if not astro_ranks[card.base.value] or found[card.base.value] then
                return {}
            end
            found[card.base.value] = true
            table.insert(astro, card)
        end
        
        if next(astro) == nil then return {} end
        return {astro}
    end
}

SMODS.PokerHand {
    key = "yma_astro",
    l_chips = 10,
    l_mult = 1,
    chips = 60,
    mult = 6,
    visible = true,
    example = {
        { "H_A", true },
        { "S_cbean_yma_s", true },
        { "H_cbean_yma_t", true },
        { "C_cbean_yma_r", true },
        { "D_cbean_yma_o", true },
    },
    evaluate = function(parts, hand)
        return parts.yma_astro
    end
}
--]]