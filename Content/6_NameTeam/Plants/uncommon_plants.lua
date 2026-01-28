
SMODS.Joker({
    key = "doom_shroom",
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    config = {
        extra = {
            blind = 2
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.mult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.selling_self then
            SMODS.add_card{key="j_cbean_crater",area=G.jokers}
            if not NAMETEAM.reduce then NAMETEAM.reduce = 0 end
            if G.GAME.blind and G.GAME.blind.in_blind then
                NAMETEAM.reduce = NAMETEAM.reduce + 2
                if G.GAME.blind.boss then
                    G.GAME.blind.chips = G.GAME.blind.chips/cae.blind
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                else
                    G.GAME.blind.chips = 0
                    G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                end
                NAMETEAM.msg(card, "Doom!")
            else
                NAMETEAM.reduce = NAMETEAM.reduce + 3
            end
        end
    end,
})