SMODS.Atlas({
    key = "NAMETEAM_Jokers",
    path = "6_NameTeam/ColdBeansJokers.png",
    px = 71,
    py = 95,
})

SMODS.Joker {
    key = "nameteam_stachenscarfen",
    rarity = 3,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 3, y = 0 },
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    }
}

local create_card_ref = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    local staches = SMODS.find_card("j_cbean_nameteam_stachenscarfen")
    if next(staches) and not (forced_key and G.P_CENTERS[forced_key] and G.P_CENTERS[forced_key].rarity == 2) then
        legendary = nil
        _rarity = 0.71
        forced_key = nil
    end
    return create_card_ref(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end

local smods_create_card_ref = SMODS.create_card
function SMODS:create_card(t)
    local staches = SMODS.find_card("j_cbean_nameteam_stachenscarfen")
    if next(staches) and not (t and t.forced_key and G.P_CENTERS[t.forced_key] and G.P_CENTERS[t.forced_key].rarity == 2) then
        if not t then t = {} end
        t.legendary = nil
        t.rarity = 0.71
        t.forced_key = nil
    end
    return smods_create_card_ref(self, t)
end


SMODS.Joker {
    key = "nameteam_alecwatson",
    rarity = 1,
    atlas = 'NAMETEAM_Jokers',
    pos = { x = 6, y = 0 },
    cbean_anim = {
        { xrange = { first = 6, last = 8 }, y = 0, t = 0.1 },
        { x = 7, y = 0, t = 0.1 }
    },
    cost = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pronouns = "he_him",
    hpot_unbreedable = true,

    beans_credits = {
        team = "Name Team",
        idea = "GhostSalt",
        art = "GhostSalt",
        code = "GhostSalt",
    }
}