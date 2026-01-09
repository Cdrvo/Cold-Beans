local click = Card.click
function Card:click()
    if self.edition and self.edition.type == "cbean_sd_frozen" then
        return nil
    end
    return click(self)
end

SMODS.Edition{
    key = "sd_frozen",
    shader = false,
    sound = {
        sound = "cbean_sd_frozen"
    },
    config = {
        extra = {
            odds = 3,
            h_chips = 15
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                self.config.extra.odds,
                self.config.extra.h_chips
            }
        }
    end,
    calculate = function (self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            return {
                chips = self.config.extra.h_chips
            }
        end
        
        if context.after then
            if SMODS.pseudorandom_probability(card, "cb_sd_frozen_thaw", 1, self.config.extra.odds) then
                card:set_edition()
            end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "mys. minty",
        art =  "TBA",
        code = "mys. minty",
    }
}