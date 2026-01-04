
Colonparen.Architecture {
    key = 'colon_stylobate',
    base_pos = { x = 0, y = 0 },
    progress_pos = { x = 1, y = 0 },
    done_pos = { x = 2, y = 0 },

    beans_credits = {
        team = ":(",
        idea = "Glitchkat10",
        art = "George The Rat",
        code = "jamirror",
    },
    greek_blind = "cbean_colon_omega",
    loc_vars = function(self, info_queue, card)
        local amount = -1;
        for i, card in ipairs(G.cbean_colon_arch.cards) do
            if card.ability.colonparen_state == 0 then
                amount = amount + 1
            end
        end

        return {
            vars = { amount }
        }
    end,
    calculate = function (self, card, context)
        if context.cbean_colonparen_gain_arch then
            local amount = -1;
            for i, card in ipairs(G.cbean_colon_arch.cards) do
                if card.ability.colonparen_state == 0 then
                    amount = amount + 1
                end
            end
            return {
                colonparen_complete = true
            }--[[
            if amount >= 5 then
                return {
                    colonparen_complete = true
                }
            elseif amount > 0 then
                return {
                    colonparen_in_progress = true
                }
            else
                return {
                    colonparen_base = true
                }
            end]]
        end
    end
}
