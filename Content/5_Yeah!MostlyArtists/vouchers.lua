SMODS.Voucher {
    key = "yma_krater",
    atlas = "yma_voucher_atlas",
    pos = { x = 2, y = 0 },
    requires = {
        'v_cbean_sdown_amphora'
    },
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    redeem = function(self, card)
        
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}

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
SMODS.Voucher {
    key = "yma_grand_theft",
    atlas = "yma_voucher_atlas",
    pos = { x = 1, y = 0 },
    requires = {
        'v_cbean_yma_special_deal'
    },
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    redeem = function(self, card)
        
    end,
    beans_credits = {
        team = { "Yeah! Mostly Artists" },
        idea = "RattlingSnow353",
        art = "RattlingSnow353",
        code = "RattlingSnow353",
    }
}

