SMODS.Voucher {
    key = "yma_special_deal",
    atlas = "yma_voucher_atlas",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            size = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.size,
            }
        }
    end,

    redeem = function(self, card)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) + self.config.extra.size
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "Lyre",
        art = "RattlingSnow353",
        code = "cloudzXIII",
    }
}

