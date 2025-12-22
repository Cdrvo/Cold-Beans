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
            xchips = 3.5,
            xmult = 2.5,
            lastsuit = "uni",
            lastwild = "mult"
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
        if not (context.individual and context.cardarea == G.play) then return end

        local scard = context.other_card
        local extra = card.ability.extra

        if SMODS.has_enhancement(scard, "m_stone") then
            extra.lastsuit = "stoned"
            return
        end

        if SMODS.has_enhancement(scard, "m_wild") then
            extra.lastsuit = "uni"

            if extra.lastwild == "mult" then
                extra.lastwild = "chips"
                return { xmult = extra.xmult }
            else
                extra.lastwild = "mult"
                return { xchips = extra.xchips }
            end
        end

        local is_light = (scard.base.suit == "Hearts" or scard.base.suit == "Diamonds")
        local is_dark  = (scard.base.suit == "Spades" or scard.base.suit == "Clubs")

        if is_light then
            if extra.lastsuit == "darksuit" or extra.lastsuit == "uni" then
                extra.lastsuit = "lightsuit"
                return { xmult = extra.xmult }
            end
            extra.lastsuit = "lightsuit"
            return
        end

        if is_dark then
            if extra.lastsuit == "lightsuit" or extra.lastsuit == "uni" then
                extra.lastsuit = "darksuit"
                return { xchips = extra.xchips }
            end
            extra.lastsuit = "darksuit"
            return
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

