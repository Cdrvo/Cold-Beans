SMODS.Joker {
    key = "sdown_billboard",
    name = "Billboard",
    config = {
        extra = { h_size = 0}
    },
    atlas = "sdown_joker_atlas",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, _, card)
        return {
            vars = {
                G.GAME.starting_deck_size,  math.max(0,(G.playing_cards and math.floor((#G.playing_cards - G.GAME.starting_deck_size)/10) or 0))
            }
        }
    end,
    loc_txt = {
        name = 'Billboard',
        text = {
            "{C:attention}+1{} hand size per",
            "{C:attention}10{} cards above {C:attention}#1#{}",
            "in your full deck",
            "{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size)"
        }
    },
    calculate = function(self, card, context)
        if (context.playing_card_added or context.remove_playing_cards) and not context.blueprint then
            --Occasionally double counts a card due to vanilla being inconsistent on when to add to #G.playing_cards, very minor issue though and i dont think
            --I can fix it without changes to smods to add a better context or fix the vanilla jank or something
            local added
            if(context.playing_card_added) then added = #context.cards
            else added = -#context.removed
            end
            if(math.max(0,(G.playing_cards and math.floor((#G.playing_cards + added - G.GAME.starting_deck_size)/10) or 0))~=card.ability.extra.h_size) then
                card:juice_up()
                G.hand:change_size(math.max(0,(G.playing_cards and math.floor((#G.playing_cards + added - G.GAME.starting_deck_size)/10) or 0)) - card.ability.extra.h_size)
                card.ability.extra.h_size = math.max(0,(G.playing_cards and math.floor((#G.playing_cards + added - G.GAME.starting_deck_size)/10) or 0))
            end
        end

    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(math.max(0,(G.playing_cards and math.floor((#G.playing_cards - G.GAME.starting_deck_size)/10) or 0)))
        card.ability.extra.h_size = math.max(0,(G.playing_cards and math.floor((#G.playing_cards - G.GAME.starting_deck_size)/10) or 0))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art =  "FlameThrowerFIM",
        code = "Athebyne",
    }
}