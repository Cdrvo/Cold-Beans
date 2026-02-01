SMODS.Tag {
    key = "sunbean",
    atlas = "nteam_tag",
    pos = { x = 0, y = 0 },
    config = {},
    loc_vars = function(self, info_queue, tag)
        return { vars = { (G.GAME.NAMETEAM.sunbean_bonus or 0) } }
    end,
    apply = function(self, tag, context)
        if context.type == 'eval' then
            if G.GAME.last_blind then
                local a = G.GAME.NAMETEAM.sunbean_bonus
                tag:yep('+', G.C.GOLD, function()
                    return true
                end)
                tag.triggered = true
                local a = G.GAME.NAMETEAM.sunbean_bonus
                G.GAME.NAMETEAM.sunbean_tagged = false
                G.GAME.NAMETEAM.sunbean_bonus = 0
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
    beans_credits = {
        code = "Revo",
        art = "GhostSalt",
        team = "Name Team"
    }
}