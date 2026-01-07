SMODS.Joker {
    key = "sdown_bisexual",
    name = "Bisexual Lighting",
    config = {
        extra = { mult = 0, mult_mod = 5 },
        last_hand_straight = false,
        last_hand_gay = false
    },
    atlas = "sdown_joker_atlas",
    pos = { x = 1, y = 0 },
    loc_vars = function(self, _, card)
        return {
            vars = {
                card.ability.extra.mult_mod, card.ability.extra.mult
            }
        }
    end,
    loc_txt = {
        name = 'Bisexual Lighting',
        text = {
            "This Joker gains {C:red}+#1#{} Mult when a",
            "{C:attention}Straight{} is played after a {C:attention}Gay{}",
            "or vice versa",
            "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)"
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then
            local scale = false
            if card.ability.last_hand_gay and next(context.poker_hands['Straight']) then scale = true end
            if card.ability.last_hand_straight and next(context.poker_hands['cbean_sdown_antistraight']) then scale = true end
            if scale then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "mult",
                    scalar_value = "mult_mod"
                })
            end
            if(next(context.poker_hands['cbean_sdown_antistraight'])) then card.ability.last_hand_gay = true else card.ability.last_hand_gay = false end
            if(next(context.poker_hands['Straight'])) then card.ability.last_hand_straight = true else card.ability.last_hand_straight = false end
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art =  "mys. minty (placeholder)",
        code = "Athebyne",
    }
}