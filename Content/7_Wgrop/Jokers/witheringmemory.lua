SMODS.Joker{
    key = 'wgrop_withering_memory',
    atlas = 'wgrop_joker_atlas',
    wgrop_biometype = "wgrop_rosygraveyard",
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 0, y = 0},
    config = {
        extra = {
            xchips = 2.5,
            xmult = 2,
            lastsuit = "none",
            lastmixed = "none"
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local scard = context.other_card
            local extra = card.ability.extra
            local is_light = (scard:is_suit("Hearts") or scard:is_suit("Diamonds"))
            local is_dark  = (scard:is_suit("Spades") or scard:is_suit("Clubs"))
            local is_mixed = is_light and is_dark
            print(is_light, is_dark, is_mixed)

            if is_mixed then
                if extra.lastsuit == "mixed" then
                    return { xchips = extra.xchips, xmult = extra.xmult}
                elseif extra.lastsuit == "lightsuit" then

                    extra.lastsuit = "mixed"
                    extra.lastmixed = "xchips"
                    return { xchips = extra.xchips}
                elseif extra.lastsuit == "darksuit" then

                    extra.lastsuit = "mixed"
                    extra.lastmixed = "xmult"
                    return { xmult = extra.xmult}

                end
                extra.lastsuit = "mixed"
                return
            end
            if is_light then
                if extra.lastsuit == "darksuit" or extra.lastsuit == "mixed" then
                    extra.lastsuit = "lightsuit"
                    extra.lastmixed = 'xmult'
                    return { xmult = extra.xmult }
                end
                extra.lastsuit = "lightsuit"
                return
            end
            if is_dark then
                if extra.lastsuit == "lightsuit" or extra.lastsuit == "mixed" then
                    extra.lastsuit = "darksuit"
                    extra.lastmixed = "xchips"
                    return { xchips = extra.xchips }
                end
                extra.lastsuit = "darksuit"
                return
            end
        end
    end,
    beans_credits = {
    team = {"wgrop"
    },
    idea = "Tje.tsu",
    art =  "Tje.tsu",
    code = "Tje.tsu",
    }
}
