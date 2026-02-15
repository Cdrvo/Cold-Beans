SMODS.Joker{
    key = 'wgrop_oasis',
    atlas = 'wgrop_joker_atlas',
    rarity = 2,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 1},
    config = {
        extra = {
            cardscale = 2,
            retrigger = 1,
            inhand = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cardscale,
                card.ability.extra.retrigger,
                card.ability.extra.inhand
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            local unenhancedtable = {}
            for i, v in ipairs(G.hand.cards) do
                if not next(SMODS.get_enhancements(v)) then
                    table.insert(unenhancedtable, v)
                end
            end
            card.ability.extra.inhand = #unenhancedtable
            --print(card.ability.extra.inhand)
        end
        if context.repetition and context.cardarea == G.play and next(SMODS.get_enhancements(context.other_card)) and card.ability.extra.inhand ~= 0 then
            return {
                repetitions = math.floor(card.ability.extra.retrigger*(card.ability.extra.inhand/card.ability.extra.cardscale))
            }
        end
    end,
    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "AstraLuna",
    code = "Tje.tsu",
    }
}


