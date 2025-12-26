SMODS.Joker{
    key = 'wgrop_scorched_hands',
    atlas = 'wgrop_joker_atlas',
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 4},
    config = {
        extra = {
            odds = 3,
            mfu = 4,
            mfe = 7
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.mfu,
                card.ability.extra.mfe
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard then
            if pseudorandom('riceshower') < G.GAME.probabilities.normal / card.ability.extra.odds then
                local moneyEarned = card.ability.extra.mfe
                if not next(SMODS.get_enhancements(context.other_card)) then
                    moneyEarned = card.ability.extra.mfu
                end
                local cardToBeDestroyed = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_dollars(moneyEarned)
                        cardToBeDestroyed:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end,
    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "AstraLuna",
    code = "Tje.tsu",
    }
}

