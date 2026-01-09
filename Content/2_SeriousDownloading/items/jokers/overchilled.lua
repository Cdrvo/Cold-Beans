SMODS.Joker {
    key = "sd_overchilled",
    name = "Overchilled Beans",
    atlas = 'sdown_joker_atlas',
    pos = {
        x = 3,
        y = 0
    },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = false,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    demicoloncompat = true,
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self, info_queue, card)
        local key = self.key
        info_queue[#info_queue+1] = G.P_CENTERS.e_cbean_sd_frozen
        info_queue[#info_queue+1] = G.P_CENTERS.m_cbean_jbill_bean
        return {
            key = key,
            vars = {
                
            }
        }
    end,
    in_pool = function (self, args)
        --Conditions?
        return true
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn or context.forcetrigger then
            SMODS.add_card{
                set = "Playing Card",
                enhancement = "m_cbean_jbill_bean",
                edition = "e_cbean_sd_frozen",
                area = G.hand
            }
        end
    end,
    beans_credits = {
        team = "SeriousDownloading",
        idea = "mys. minty",
        art =  "TBA",
        code = "mys. minty",
    }
}