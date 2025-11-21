
--Note: The Tier 2 voucher does not exist... but could! Future teams, you are fully allowed to make the T2 Voucher of this!
SMODS.Voucher({
    key = "sdown_amphora",
    atlas = "sdown_vouchers",
    pos = {x = 1, y = 0},
    cost = 10,
    unlocked = true,
    discovered = false,
    available = true,
    config = {extra = {increase = 1}},
    beans_credits = {
        team = "SeriousDownloading",
        idea = "athebyne",
        art = "mys. minty (placeholder)",
        code = "athebyne",
    },
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.increase}}
    end,
    loc_txt = {
        name = 'Amphora',
        text = {
            "When CEO Blind is defeated,",
            "add {C:attention}#1#{} charge to",
            "all held {C:attention}Blessings{}"
        }
    },
    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.main_eval and G.GAME.blind.colonparen_blindtype == 'CEO' then
            for _,consumeable in ipairs(G.consumeables.cards) do
                if consumeable.ability.set == 'sdown_blessing' and consumeable.ability.extra.times_left > 0 then
                    consumeable.ability.extra.times_left = consumeable.ability.extra.times_left + 1
                    consumeable:juice_up()
                    SMODS.calculate_effect({message = localize('k_strengthened_ex')}, consumeable)
                end
            end
        end
    end
})