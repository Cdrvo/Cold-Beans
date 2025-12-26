SMODS.Joker{
    key = 'wgrop_starry_reflection',
    atlas = 'wgrop_joker_atlas',
    rarity = 2,
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 2},
    config = {
        extra = {
            percentage = 50,
            incper = 5
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.incper
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = (G.GAME.hands[context.scoring_name].chips/100)*card.ability.extra.percentage
            }
        end
        if context.selling_card and context.card.config.center.set == "Planet" then
            card.ability.extra.percentage = card.ability.extra.percentage+card.ability.extra.incper
            return {
                message = "Upgrade!",
                colour = G.C.BLUE
            }
        end
    end,
    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "AstralLuna",
    code = "Tje.tsu",
    }
}

