local click = Card.click
function Card:click()
    local allfrozencards = false --Checks if all cards are Frozen. Needed to prevent softlocks
    local frozen_count = 0
    for k, v in pairs(G.hand.cards) do
        if v.edition and v.edition.cbean_sd_frozen then
            frozen_count = frozen_count + 1
        end
    end
    if frozen_count == #G.hand.cards then
        allfrozencards = true
    else
        allfrozencards = false
    end

    if self.edition and self.edition.type == "cbean_sd_frozen" and not ((#SMODS.find_card('j_cbean_0chill_noelle') > 0) and (#SMODS.find_card('j_cbean_0chill_thorn_ring') > 0)) and not (allfrozencards and #G.hand.highlighted == 0) then
        if self.area and self.area == G.deck and self.area.cards[1] == self then 
            G.FUNCS.deck_info()
        end
        return nil
    end
    return click(self)
end

SMODS.Edition{
    key = "sd_frozen",
    shader = 'frozen',  --Inspector_B from the 0-drivers group here, I added a shader to frozen cause it look pretty. (RattlingSnow here, I modified the shader)
    sound = {
        sound = "cbean_sd_frozen"
    },
    config = {
        extra = {
            odds = 3,
            h_chips = 5
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
    on_apply = function (card)
        card.ability.perma_h_chips = (card.ability.perma_h_chips or 0) + 5
    end,
    calculate = function (self, card, context)
        if context.after then
            if SMODS.pseudorandom_probability(card, "cb_sd_frozen_thaw", 1, self.config.extra.odds) and (#SMODS.find_card('j_cbean_0chill_permafrost') < 1) then
                card:set_edition()
                return {
                    message = 'Thawed!',
                    colour = G.C.BLUE
                }  
            else
                card.ability.perma_h_chips = (card.ability.perma_h_chips or 0) + self.config.extra.h_chips
                return {
                    message = 'Still Chill!',
                    colour = G.C.BLUE
                }  
            end
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "mys. minty",
        art =  "RattlingSnow353",
        code = "mys. minty",
    }
}