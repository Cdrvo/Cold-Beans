--[[SMODS.Joker({           didn't know this existd in yahimod 
	pvz_plant = true,
    in_pool = NAMETEAM.plant_in_pool,
    key = "cob_cannon_OG",
    atlas = 'NAMETEAM_PlantPlaceholder',
    cost = 3,
    beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "N/A",
	},
    rarity = 4,
    blueprint_compat = true,
    config = {
        extra = {
            xmult = 1
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return{vars={cae.xmult}}
    end,
    calculate = function(self,card,context)
        local cae = card.ability.extra
        if context.post_trigger and context.other_ret then
            if G.GAME.current_round.hands_left >0 then
                if context.other_ret then
                    for k, v in pairs(context.other_ret) do
                        if type(v) == "table" then
                            for k, v in pairs(v) do
                                local a = string.upper(tostring(k))
                                if string.find(a,"XMULT") or string.find(a,"X_MULT") then
                                    cae.xmult = cae.xmult * v
                                end
                            end
                        end
                    end
                end
            else 
                -- 
            end
        end
        if context.joker_main and not context.blueprint and G.GAME.current_round.hands_left <= 0 and cae.xmult > 1 then
            return{
                xmult = cae.xmult
            }
        end
    end
})]]

SMODS.Joker({
	pvz_plant = true,
	in_pool = NAMETEAM.plant_in_pool,
	key = "mega_gattling_pea",
	atlas = "NAMETEAM_PlantJokers",
	pos = { x = 0, y = 10 },
	cost = 10,
	beans_credits = {
		code = "Revo",
		team = { "Name Team/",
            "0 Drivers of",
            "The Chill Vaction" },
		art = "cmykl",
	},
	rarity = 4,
	blueprint_compat = true,
	config = {
		extra = {
			rep = 4,
			odds = 10,
		},
	},
	pools = {
		cbean_electric = true,
	},
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		local num, den = SMODS.get_probability_vars(card, 1, cae.odds, "gattlingit")
		return { vars = { cae.rep, num, den } }
	end,
	calculate = function(self, card, context)
		local cae = card.ability.extra
		if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
			return {
				repetitions = cae.rep,
			}
		end
		if context.before and not context.blueprint then
			if SMODS.pseudorandom_probability(card, "gattlingit", 1, cae.odds) then
				cae.rep = cae.rep + 1
				NAMETEAM.msg(card, localize("k_upgrade_ex"))
			end
		end
	end,
})


SMODS.Joker({
	pvz_plant = true,
	in_pool = NAMETEAM.plant_in_pool,
	key = "gloom_shroom",
	atlas = "NAMETEAM_PlantJokers",
	pos = { x = 5, y = 6 },
	cost = 10,
	beans_credits = {
		code = "Revo",
		team = "Name Team",
		art = "Crazy Dave",
	},
	rarity = 4,
	blueprint_compat = false,
	config = {
		extra = {
			xmukt = 1.5,
		},
	},
	loc_vars = function(self, info_queue, card)
		local cae = card.ability.extra
		return { vars = { cae.xmukt } }
	end,
	calculate = function(self, card, context)
		local cae = card.ability.extra
		if
			context.post_trigger
			and not context.blueprint
			and (context.other_context.joker_main or context.other_context.individual or NAMETEAM.during_scoring)
		then
			if
				(card:on_the("right") and context.other_card == card:on_the("right"))
				or (card:on_the("left") and context.other_card == card:on_the("left"))
			then
				-- print("KILL YOURSELF")
				context.other_card.ability.gloomy_shroomy = true
			end
		end
		if context.other_joker and context.other_joker.ability.gloomy_shroomy then
			context.other_joker.ability.gloomy_shroomy = false
			return {
				xmult = cae.xmukt,
				message_card = context.other_joker,
			}
		end

		if context.individual and not context.repetition and context.cardarea == G.play then
			return { xmult = card.ability.extra.xmult }
		end
	end,
})