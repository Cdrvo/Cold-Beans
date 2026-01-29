SMODS.Tag {
    key = "sunbean",
    pos = { x = 2, y = 1 },
    config = {},
    loc_vars = function(self, info_queue, tag)
        return { vars = { (NAMETEAM.sunbean_bonus or 0) } }
    end,
    apply = function(self, tag, context)
        if context.type == 'eval' then
            if G.GAME.last_blind then
                local a = NAMETEAM.sunbean_bonus
                tag:yep('+', G.C.GOLD, function()
                    return true
                end)
                tag.triggered = true
                local a = NAMETEAM.sunbean_bonus
                NAMETEAM.sunbean_tagged = false
                NAMETEAM.sunbean_bonus = 0
                return {
                    dollars = a,
                    condition = "Sell Sun Bean",
                    pos = tag.pos,
                    tag = tag
                }
            end
        end
    end,
    in_pool = function(self,card)
        return false
    end,
    cbean_credits = {
        code = "Revo",
        art = "N/A",
        team = "Name Team"
    }
}