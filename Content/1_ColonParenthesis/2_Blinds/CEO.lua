local old_ease_dollars = ease_dollars;
function ease_dollars(...)
    local stuff = old_ease_dollars(...)
    if G.GAME and G.GAME.blind and G.GAME.blind.name == "cbean-colon-treasure" then
        G.GAME.blind.mult = G.GAME.blind.mult + 0.2;
        G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante)*G.GAME.blind.mult*G.GAME.starting_params.ante_scaling
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        G.GAME.blind:juice_up()
    end
    return stuff
end

Colonparen.CEOBlind{
    key = "colon_treasure",
    name = "cbean-colon-treasure",
    pos = { x = 0, y = 0 },
	boss = {},
	atlas = "colon_CEOBlind",
    mult = 3,
	boss_colour = HEX("2b62a7")
}