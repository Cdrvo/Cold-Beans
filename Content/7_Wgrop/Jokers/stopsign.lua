SMODS.Joker{
    key = 'wgrop_stop_sign',
    atlas = 'wgrop_joker_atlas',
    rarity = 3,
    cost = 12,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 3},
    config = {
        extra = {
            percentage = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.percentage/2,
                card.ability.extra.incper
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and G.GAME.current_round.hands_played == 0 and SMODS.calculate_round_score() then
            if SMODS.calculate_round_score() > G.GAME.blind.chips then
                card.ability.extra.percentage = math.abs(SMODS.calculate_round_score() - G.GAME.blind.chips) / ((SMODS.calculate_round_score() + G.GAME.blind.chips) / 2) * 100
                return {
                    message = "STOP!",
                    colour = G.C.RED
                }
            else
                card.ability.extra.percentage = 0
            end
        end
        if context.setting_blind and card.ability.extra.percentage ~= 0 then
            G.GAME.chips =  (G.GAME.blind.chips/100)*(card.ability.extra.percentage/2)
            return {
                message = "GO!",
                colour = G.C.GREEN
            }
        end
    end,
    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "Tje.tsu",
    code = "Tje.tsu",
    }
}

