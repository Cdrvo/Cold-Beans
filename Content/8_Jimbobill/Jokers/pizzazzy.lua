SMODS.Joker {
    key = "jbill_pizzazzy",
    blueprint_compat = true,
    atlas = "jbill_jokers",
    pos = { x = 3, y = 0 },
    rarity = 2,
    cost = 5,
    in_pool = function(self, args)
        if not G.pizzazy then
            return false
        end
        if G.pizzazy then
            return true
        end
    end,
    config = { extra = { mult = 0 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_a"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_b"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_c"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_d"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_e"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_f"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_g"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_h"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_i"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_j"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_k"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_l"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_m"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_n"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_o"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_p"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_q"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_r"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_s"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_t"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_u"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_v"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_w"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_x"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_y"}
        info_queue[#info_queue+1] = {set = "Other", key = "cbean_pizzazzy_z"}
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        local joker_name = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                if G.jokers.cards[i-1] then
                    joker_name = localize{set = "Joker", key = G.jokers.cards[i-1].config.center.key, type = "name_text" }
                end
			end
		end
        if joker_name and context.joker_main then
            local farted = {}
            for i = 1, #joker_name do
                local mult = nil
                local charreal = string.sub(joker_name, i, i)
                local char = charreal
                if char == "a" then
                    mult = 1
                elseif char == "b" then
                    mult = 3
                elseif char == "c" then
                    mult = 3
                elseif char == "d" then
                    mult = 2
                elseif char == "e" then
                    mult = 1
                elseif char == "f" then
                    mult = 4
                elseif char == "g" then
                    mult = 2
                elseif char == "h" then
                    mult = 4
                elseif char == "i" then
                    mult = 1
                elseif char == "j" then
                    mult = 8
                elseif char == "k" then
                    mult = 5
                elseif char == "l" then
                    mult = 1
                elseif char == "m" then
                    mult = 3
                elseif char == "n" then
                    mult = 1
                elseif char == "o" then
                    mult = 1
                elseif char == "p" then
                    mult = 3
                elseif char == "q" then
                    mult = 10
                elseif char == "r" then
                    mult = 1
                elseif char == "s" then
                    mult = 1
                elseif char == "t" then
                    mult = 1
                elseif char == "u" then
                    mult = 1
                elseif char == "v" then
                    mult = 4
                elseif char == "w" then
                    mult = 4
                elseif char == "x" then
                    mult = 8
                elseif char == "y" then
                    mult = 4
                elseif char == "z" then
                    mult = 10
                elseif char == " " then
                    mult = 0
                end
                SMODS.calculate_effect({message = char, mult = mult}, card)
            end
        end
    end,
    beans_credits = {
        idea = "D.J.",
        code = "Evgast",
        team = "Jimbobill",
        art = "ZayDerg"
    }
}
print(localize{ key = 'j_jolly', set = "Joker", type = "name_text" })