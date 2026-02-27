-- Sorted by rarity and filtered alphabetically
-- Information goes: Suggestor | Art | Coder

return {
	descriptions = {
		Back = {
			b_cbean_nameteam_urine = {
				name = "Urine Deck",
				text = {
					"All cards of a",
					"random {C:attention}rank{} start",
					"as {C:money,T:m_cbean_pboys_piss}Piss{} cards",
				}
			},
			b_cbean_nameteam_sticky = {
				name = "Sticky Deck",
				text = {
					"Start with an",
					"{C:attention,T:c_cbean_eternal_sheet}Eternal{} {C:cbean_stickersheet}Sticker Sheet",
					"{C:cbean_stickersheet}Sticker Sheets{} appear",
					"{C:attention}2X{} more frequently",
					"in the {C:attention}Shop",
				}
			},
			b_cbean_nameteam_happy = {
				name = "Happy Deck",
				text = {
					"Start run with",
					"a copy of",
					"{C:attention,T:j_smiley}Smiley Face{}"
				}
			},
			b_cbean_nameteam_graveyard = {
				name = "Graveyard Deck",
				text = {
					"Start run with",
					"five {C:attention}Plant{} Jokers"
				}
			},
			b_cbean_pboys_daily = { -- crashes without, so this is here Ig
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Random {C:attention}deck effect{} based",
					"on day of the week",
				},
			},
			b_cbean_pboys_daily1 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect: Start with",
					"a random {C:attention}Voucher{}",
				},
			},
			b_cbean_pboys_daily2 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect: Start with a",
					"random {C:attention}Tag{} and {C:tarot}Tarot{} card",
				},
			},
			b_cbean_pboys_daily3 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect: A random visible",
					"{C:attention}poker hand{} starts at {C:attention}lvl.5",
				},
			},
			b_cbean_pboys_daily4 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect: Remove {C:attention}6{} random",
					"{C:attention}ranks{} from starting deck",
				},
			},
			b_cbean_pboys_daily5 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect:",
					"Only {C:attention}modded",
					"Jokers can appear",
				},
			},
			b_cbean_pboys_daily6 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect: {C:attention}+2{} and {C:red}-1{} to",
					"{C:attention}two{} of the following: hand size,",
					"joker slot, consumable slot",
				},
			},
			b_cbean_pboys_daily7 = {
				name = "Daily Deck",
				text = {
					"Seed is set to {C:attention}DDMMYYYY",
					"Today's effect: Only {C:attention}1{} to {C:attention}3",
					"{C:attention}card types{} can appear in shop",
					"at an equal rate",
					"{C:inactive}(excluding Booster Packs)",
				},
			},
			b_cbean_pboys_athena = {
				name = "Athena Deck",
				text = {
					"Start run with",
					"{C:sdown_blessing,T:v_cbean_sdown_amphora}#1#{} and {C:sdown_blessing,T:v_cbean_yma_krater}#2#{}",
				},
			},
		},
		Blind = {
			bl_cbean_colon_eclipse = {
				name = "Entrepreneur of the Eclipse",
				text = {
					"Three quarters of your",
					"deck are unable to be drawn"
				}
			},
			bl_cbean_colon_magnetar = {
				name = "Monopolist of the Magnetar",
				text = {
					"Only Blind this Ante"
				}
			},
			bl_cbean_colon_izar = {
				name = "Investor of the Izar",
				text = {
					"Gains X0.1 Base for",
					"each time played hand",
					"has been played this run"
				}
			},
			bl_cbean_colon_corona = {
				name = "Capitalist of the Corona",
				text = {
					"Debuff all Jokers when Blind selected",
					"Undebuff 1 Joker after a hand is played"
				}
			},
			bl_cbean_colon_satellite = {
				name = "Speculator of the Satellite",
				text = {
					"#1# in #2# chance to decrease Base",
					"by X1 when hand or discard is used"
				}
			},
			bl_cbean_colon_treasure = { -- George The Rat | George The Rat | N/A
				name = "The Treasure",
				text = {
					"When $ is earned, increase",
					"blind size by X0.2 base"
				}
			},
			bl_cbean_colon_gate = { -- George The Rat | George The Rat | Glitchkat10
				name = "The Gate",
				text = {
					"Moderately",
					"large blind"
				}
			},
			bl_cbean_colon_sheet = { -- George The Rat | George The Rat | jamirror
				name = "The Sheet",
				text = {
					"Debuff held #1#s",
					"and played #2#s"
				}
			},
			bl_cbean_colon_stamp = { -- George The Rat | George The Rat | jamirror
				name = "The Stamp",
				text = {
					"Debuff all cards",
					"with a seal"
				}
			},
			bl_cbean_colon_salesman = { -- George The Rat | George The Rat | jamirror
				name = "The Salesman",
				text = {
					"Next shop and blind",
					"select screen is skipped"
				}
			},
			bl_cbean_colon_assassination = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "The Assassination",
				text = {
					"Destroy leftmost Joker"
				}
			},
			bl_cbean_colon_factory = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Factory",
				text = {
					"When a hand is drawn permanently add",
					"a debuffed stone card to deck"
				}
			},
			bl_cbean_colon_promise = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Promise",
				text = {
					"If blind is defeated in 1 hand",
					"add polychrome to a random joker",
					"else, remove all non-Negative editions"
				}
			},
			bl_cbean_colon_seed = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Seed",
				text = {
					"+X0.05 Base for every",
					"card scored this round" -- I changed ante to round if changed change code
				}
			},
			bl_cbean_colon_pipeline = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "The Pipeline",
				text = {
					"All jokers give 1.2X mult but...", -- what a jd nightmare, actually take from baseball card
					"X0.1 mult less than the last"
				}
			},
			bl_cbean_colon_button = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "The Button",
				text = {
					"+5 hands"
				}
			},
			bl_cbean_colon_hole = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "The Hole",
				text = {
					"..."
				}
			},
			bl_cbean_colon_curse = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Curse",
				text = {
					"Next 3 fought blinds have",
					"X0.5 additional Base"
				}
			},
			bl_cbean_colon_pot = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Pot",
				text = {
					"Played cards with 2 or more",
					"modifications lose all when scored"
				}
			},
			bl_cbean_colon_compass = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Compass",
				text = {
					"{X:purple,C:white}+X1{} base when",
					"a hand is played"
				}
			},
			bl_cbean_colon_island = { -- Glitchkat10 | George The Rat | Bitter
				name = "The Island",
				text = {
					"All but 1 Joker is debuffed"
				}
			},
			bl_cbean_sdown_folly = { -- Athebyne | TBA | Athebyne
				name = "The Folly",
				text = {
					"If score exceeds requirements,",
					"permanently add excess score",
					"to all future blind requirements"
				}
			},
			bl_cbean_sdown_outgrowth = { -- Athebyne | TBA | TBA
				name = "The Outcrop",
				text = {
					"Must play exactly 1 unscoring card",
					"(Splash-like effects still count as unscoring)"
				}
			},
			bl_cbean_sdown_rebellion = { -- Athebyne | TBA | TBA
				name = "The Rebellion",
				text = {
					"Cards held in hand subtract",
					"their chip value from Chips"
				}
			},
			bl_cbean_sdown_regression = { -- Athebyne | TBA | TBA
				name = "The Regression",
				text = {
					"Played #1#s become #2#s and",
					"played #3# become #4#"
				}
			},
			bl_cbean_sdown_sinker = { -- Athebyne | TBA | TBA
				name = "The Sinker",
				text = {
					"Shuffle all joker cards",
					"then disable the Leftmost Joker",
					"Jokers can not be reordered"
				}
			},
			bl_cbean_lower_colon_alpha = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Alpha",
				text = {
					"Lucky cards' probabilities",
					"are tripled"
				}
			},
			bl_cbean_upper_colon_alpha = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Alpha",
				text = {
					"Played lucky cards are guaranteed",
					"to successfully trigger at least one",
					"of their probability effects when scored"
				}
			},
			bl_cbean_lower_colon_beta = { -- Glitchkat10 | George The Rat | jamirror
				name = "Beta",
				text = {
					"Multiply all Joker",
					"values by X1.1"
				}
			},
			bl_cbean_upper_colon_beta = { -- Glitchkat10 | George The Rat | jamirror
				name = "Beta",
				text = {
					"Multiply all Joker",
					"values by X1.2",
					"when hand is played"
				},
			},
			bl_cbean_lower_colon_gamma = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Gamma",
				text = {
					"Retrigger all played",
					"cards 2 times"
				}
			},
			bl_cbean_upper_colon_gamma = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Gamma",
				text = {
					"Retrigger all played",
					"and held in hand",
					"cards 3 times"
				}
			},
			bl_cbean_lower_colon_delta = { -- Glitchkat10 | George The Rat | N/A
				name = "Delta",
				text = {
					"Retrigger all on",
					"discard effects"
				}
			},
			bl_cbean_upper_colon_delta = { -- Glitchkat10 | George The Rat | N/A
				name = "Delta",
				text = {
					"Retrigger all",
					"discarded cards"
				},
			},
			bl_cbean_lower_colon_epsilon = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Epsilon",
				text = {
					"All discarded cards",
					"are destroyed"
				}
			},
			bl_cbean_upper_colon_epsilon = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Epsilon",
				text = {
					"Duplicate all played cards",
					"and add them to your hand",
					"on first hand of round"
				}
			},
			bl_cbean_lower_colon_zeta = { -- Glitchkat10 | George The Rat | N/A
				name = "Zeta",
				text = {
					"Played Glass Cards",
					"permanently gain X0.25 Mult",
					"when scored"
				},
			},
			bl_cbean_upper_colon_zeta = { -- Glitchkat10 | George The Rat | N/A
				name = "Zeta",
				text = {
					"Played Glass Cards permanently",
					"gain +1 denominator to their",
					"probability effects when scored",
				}
			},
			bl_cbean_lower_colon_eta = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Eta",
				text = {
					"Apply a random Enhancement,",
					"Edition, or Seal to played",
					"face cards when scored",
				}
			},
			bl_cbean_upper_colon_eta = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Eta",
				text = {
					"Apply a random Enhancement,",
					"Edition, and Seal to played",
					"face cards when scored",
				}
			},
			bl_cbean_lower_colon_theta = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Theta",
				text = {
					"Earn $10 per X1",
					"Blind requirement",
					"scored at end of round",
				}
			},
			bl_cbean_upper_colon_theta = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Theta",
				text = {
					"-1 Ante per X5",
					"Blind requirement",
					"scored at end of round",
				}
			},
			bl_cbean_lower_colon_iota = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Iota",
				text = {
					"Redeem 1 random Voucher,",
					"create 1 random Joker, and",
					"create 1 random consumable",
				}
			},
			bl_cbean_upper_colon_iota = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Iota",
				text = {
					"Redeem 2 random Vouchers,",
					"create 2 random Negative Jokers,",
					"and create 2 random",
					"Negative consumables",
				}
			},
			bl_cbean_lower_colon_kappa = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Kappa",
				text = {
					"Permanently gain",
					"+1 hand size",
				}
			},
			bl_cbean_upper_colon_kappa = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Kappa",
				text = {
					"Permanently gain +2 hands",
					"and +2 hand size",
				}
			},
			bl_cbean_lower_colon_lambda = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Lambda",
				text = {
					"Redeem 2 random",
					"Tier 1 Vouchers",
				}
			},
			bl_cbean_upper_colon_lambda = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Lambda",
				text = {
					"Redeem 3 random Tier 1",
					"Vouchers and their",
					"corresponding Tier 2s",
				}
			},
			bl_cbean_lower_colon_mu = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Mu",
				text = {
					"If played hand contains",
					"3 or more scoring cards",
					"of the same rank, each",
					"scoring card permanently",
					"gains +10 Mult",
				}
			},
			bl_cbean_upper_colon_mu = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Mu",
				text = {
					"If played hand contains",
					"3 or more scoring cards",
					"of the same rank, each",
					"scoring card permanently",
					"gains X1 Mult",
				}
			},
			bl_cbean_lower_colon_nu = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Nu",
				text = {
					"If played hand contains",
					"a Flush, each card",
					"permanently gains",
					"+50 Mult when scored"
				},
			},
			bl_cbean_upper_colon_nu = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Nu",
				text = {
					"If played hand contains",
					"a Flush, each card",
					"permanently gains",
					"X0.5 Mult when scored"
				}
			},
			bl_cbean_lower_colon_xi = { -- Glitchkat10 | George The Rat | N/A
				name = "Xi",
				text = {
					"Upgrade level of",
					"played poker hands"
				}
			},
			bl_cbean_upper_colon_xi = { -- Glitchkat10 | George The Rat | N/A
				name = "Xi",
				text = {
					"Upgrade level of most",
					"played poker hand 2 times",
					"when hand is played"
				}
			},
			bl_cbean_lower_colon_omicron = { -- Glitchkat10 | George The Rat | N/A
				name = "Omicron",
				text = {
					"Played cards with",
					"a modification",
					"permanently gain",
					"+5 Mult when scored"
				},
			},
			bl_cbean_upper_colon_omicron = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Omicron",
				text = {
					"Played Enhanced cards gain",
					"+30 Chips when scored,",
					"played cards with an Edition gain",
					"+10 Mult when scored, and",
					"played cards with a Seal gain",
					"X0.2 Mult when scored"
				},
			},
			bl_cbean_lower_colon_pi = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Pi",
				text = {
					"First scored card's",
					"suit is transferred",
					"to all scored cards",
					"(Drag to rearrange)"
				},
			},
			bl_cbean_upper_colon_pi = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Pi",
				text = {
					"First scored card's",
					"rank is transferred",
					"to all scored cards",
					"(Drag to rearrange)"
				},
			},
			bl_cbean_lower_colon_rho = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Rho",
				text = {
					"If played poker hand",
					"is most played, upgrade",
					"level of all poker hands",
				},
			},
			bl_cbean_upper_colon_rho = { -- Glitchkat10 | George The Rat | RattlingSnow353
				name = "Rho",
				text = {
					"Upgrade level of most played",
					"poker hand by number",
					"of times it's been played",
				},
			},
			bl_cbean_lower_colon_sigma = {
				name = "Sigma",
				text = {
					"Apply a random",
					"Enhancement to all",
					"played Unenhanced cards",
				},
			},
			bl_cbean_upper_colon_sigma = {
				name = "Sigma",
				text = {
					"Apply a random Enhancement,",
					"Edition, and Seal to all",
					"played Unenhanced cards",
				},
			},
			bl_cbean_lower_colon_tau = {
				name = "Tau",
				text = {
					"Create 5 Tauic Negative",
					"Wheel of Fortunes",
					"(They may apply Negative)"
				},
			},
			bl_cbean_upper_colon_tau = {
				name = "Tau",
				text = {
					"Create 5 Tauic Negative Wheel",
					"of Fortunes when hand played",
					"(They may apply Negative)"
				},
			},
			bl_cbean_lower_colon_upsilon = {
				name = "Upsilon",
				text = {
					"-1 Ante"
				},
			},
			bl_cbean_upper_colon_upsilon = {
				name = "Upsilon",
				text = {
					"-1 Ante per 3 Teeny Blinds",
					"selected this run",
				},
			},
			bl_cbean_lower_colon_phi = {
				name = "Phi",
				text = {
					"Duplicate one",
					"random Joker"
				},
			},
			bl_cbean_upper_colon_phi = {
				name = "Phi",
				text = {
					"Duplicate 2 random",
					"Jokers as Negative"
				},
			},
			bl_cbean_lower_colon_chi = { -- Glitchkat10 | George The Rat | SMG9000
				name = "Chi",
				text = {
					"Create 1 random",
					"Negative Common Joker",
					"and 1 random",
					"Negative Uncommon Joker"
				},
			},
			bl_cbean_upper_colon_chi = { -- Glitchkat10 | George The Rat | SMG9000
				name = "Chi",
				text = {
					"Create 2 random",
					"Negative Rare Jokers",
					"when hand is played"
				},
			},
			bl_cbean_lower_colon_psi = {
				name = "Psi",
				text = {
					"Create 5 Negative",
					"Spectral Cards"
				},
			},
			bl_cbean_upper_colon_psi = {
				name = "Psi",
				text = {
					"Duplicate all",
					"held consumables",
					"as Negative twice"
				},
			},
			bl_cbean_lower_colon_omega = {
				name = "Omega",
				text = {
					"Copies the effect of a random",
					"lowercase Greek Blind",
					"(Excluding Omega)"
				},
			},
			bl_cbean_upper_colon_omega = {
				name = "Omega",
				text = {
					"Copies the effect of the last",
					"uppercase Greek Blind encountered",
					"(Excluding Omega)",
					"Currently #1#"
				},
			},
			bl_cbean_upper_colon_omega_alternate = {
				name = "Omega",
				text = {
					"Copies the effect of a random",
					"uppercase Greek Blind",
					"(Excluding Omega)"
				},
			},
			bl_cbean_colon_wee = { -- George The Rat | George The Rat | jamirror
				name = "Wee Blind",
				text = {
					"Very small blind",
				},
			},
			bl_cbean_colon_handsy = { -- George The Rat | George The Rat | jamirror
				name = "Handsy Blind",
				text = {
					"+1 hand",
				},
			},
			bl_cbean_colon_clumsy = { -- George The Rat | George The Rat | jamirror
				name = "Clumsy Blind",
				text = {
					"+1 discard",
				},
			},
			bl_cbean_colon_charitable = { -- George The Rat | George The Rat | jamirror
				name = "Charitable Blind",
				text = {
					"+100% interest",
				},
			},
			bl_cbean_colon_jolly = { -- George The Rat | George The Rat | jamirror
				name = "Jolly Blind",
				text = {
					"If played hand contains a Pair,",
					"add an Enhanced card to hand",
				},
			},
			bl_cbean_colon_cutesy = { -- George The Rat | George The Rat | jamirror
				name = "Cutesy Blind",
				text = {
					"If played hand contains a Flush,",
					"make 2 cards held in hand Wild",
				},
			},
			bl_cbean_colon_pretty = { -- George The Rat | George The Rat | jamirror
				name = "Pretty Blind",
				text = {
					"If played hand contains a Straight,",
					"create Negative Planets of most played",
					"hand and least played hand",
				},
			},
			bl_cbean_colon_thirsty = { -- George The Rat | George The Rat | Glitchkat10
				name = "Thirsty Blind",
				text = {
					"Played cards earn",
					"$#1# when scored",
				},
			},
			bl_cbean_sdown_chaffed = { --Athebyne | Slipstream | wingedcatgirl
				name = "Chaffed Blind",
				text = {
					"Leftmost card in first",
					"discard is destroyed",
					"(Drag to rearrange)",
				},
			},
			bl_cbean_sdown_estrogen = { --Athebyne | Slipstream | wingedcatgirl
				name = "Estrogen",
				text = {
					"Discarded face cards",
					"become Queens",
				},
			},
			bl_cbean_sdown_fruity = { --Athebyne | Slipstream | Athebyne
				name = "Fruity Blind",
				text = {
					"If played hand contains a Gay,",
					"#1# in #2# chance to give a scored card Polychrome",
				},
			},
			bl_cbean_blank = {
				name = "Blank",
				text = {
					"Has no effect"
				},
			},
		},
		Combo = {
			c_cbean_0chill_raging_storm = {
				name = { "Raging Storm", "{X:red,C:white,s:0.7}Finisher{}" },
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
						"Boosted by current combo",
						"length when selected",
					},
					{
						"Combos Into:",
						"Nothing",
					},
				},
			},
			c_cbean_0chill_standing_punch = {
				name = { "Standing Punch", "{X:green,C:white,s:0.7}Starter{}" },
				text = {
					{
						"{C:chips}+#1#{} Chips for",
						"first card scored",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_standing_knee = {
				name = { "Standing Knee", "{X:green,C:white,s:0.7}Starter{}" },
				text = {
					{
						"{C:mult}+#1#{} Mult for",
						"first card scored",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_rose_throw = {
				name = {
					"Elegant Rose",
					"{X:cbean_taunt_name,C:white,s:0.7}Taunt{}",
				},
				text = {
					{
						"Either gain {C:blue}+#1#{} hand",
						"or {C:red}+#1#{} discard",
					},
					{
						"Can only be used",
						"{C:attention}once{} per round",
					},
					{
						"Combos Into:",
						"{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_victory_pose = {
				name = {
					"Victory Pose",
					"{X:cbean_taunt_name,C:white,s:0.7}Taunt{}",
				},
				text = {
					{
						"Reduces {C:attention}Blind{} requirement",
						"by {C:dark_edition}-#1#%{} when scored",
						"Boosted by current combo",
						"length when used",
					},
					{
						"Can only be used",
						"{C:attention}once{} per round",
					},
					{
						"Combos Into:",
						"{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_raging_demon = {
				name = { "Raging Demon", "{X:blue,C:white,s:0.7}Ultimate{}" },
				text = {
					{
						"{C:chips}+#1#{} Chips for",
						"every card scored",
						"Boosted by {C:attention}total{}",
						"combo length",
					},
					{
						"Combos Into:",
						"Nothing",
					},
				},
			},
			c_cbean_0chill_shoryuken = {
				name = { "Shoryuken", "{X:purple,C:white,s:0.7}Special{}" },
				text = {
					{
						"Retrigger {C:attention}first{} played",
						"card used in scoring",
						"{C:attention}#1#{} additional times",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:blue,C:white}Ultimate{}",
					},
				},
			},
			c_cbean_0chill_crouching_punch = {
				name = { "Crouching Punch", "{X:green,C:white,s:0.7}Starter{}" },
				text = {
					{
						"{C:chips}+#1#{} Chips if played",
						"hand contains a {C:attention}#2#",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_hadouken = {
				name = { "Hadouken", "{X:red,C:white,s:0.7}Finisher{}" },
				text = {
					{
						"{C:mult}+#1#{} Mult for every",
						"card in played hand",
						"Boosted by current combo",
						"length when used",
					},
					{
						"Combos Into:",
						"Nothing",
					},
				},
			},
			c_cbean_0chill_tatsumaki = {
				name = {
					"Tatsumaki Senpukyaku",
					"{X:red,C:white,s:0.7}Finisher{}",
				},
				text = {
					{
						"Retriggers all scoring",
						"cards up to an",
						"additional {C:attention}#1#{} times",
					},
					{
						"Combos Into:",
						"Nothing",
					},
				},
			},
			c_cbean_0chill_low_short = {
				name = { "Low Short", "{X:cbean_series,C:white,s:0.7}Series{}" },
				text = {
					{
						"Highest ranked card gives",
						"{X:mult,C:white}X#1#{} Mult when scored",
						"Boosted by current combo",
						"length when used",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_jump = {
				name = { "Jump", "{X:green,C:white,s:0.7}Starter{}" },
				text = {
					{
						"Every {C:attention}played card{}",
						"counts in scoring",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_aohana = {
				name = {
					"127 Shiki: Aohana",
					"{X:cbean_series,C:white,s:0.7}Series{}",
				},
				text = {
					{
						"Levels up {C:attention}played hand{}",
					},
					{
						"Can only be used",
						"{C:attention}once{} per round",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_crouching_launch = {
				name = { "Crouching Launch", "{X:green,C:white,s:0.7}Starter{}" },
				text = {
					{
						"First played {C:attention}card{}",
						"permanently gains",
						"{C:chips}+#1#{} Chips when scored",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_flash_kick = {
				name = { "Flash Kick", "{X:purple,C:white,s:0.7}Special{}" },
				text = {
					{
						"Retrigger {C:attention}last{} played",
						"card used in scoring",
						"{C:attention}#1#{} additional times",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:blue,C:white}Ultimate{}",
					},
				},
			},
			c_cbean_0chill_aegis_reflector = {
				name = { "Aegis Reflector", "{X:blue,C:white,s:0.7}Ultimate{}" },
				text = {
					{
						"Levels up {C:attention}played hand{}",
						"by length of {C:attention}total{} combo",
					},
					{
						"Can only be used",
						"{C:attention}once{} per round",
					},
					{
						"Combos Into:",
						"Nothing",
					},
				},
			},
			c_cbean_0chill_wryyyyyy = {
				name = {
					"WRYYYYYY!",
					"{X:cbean_taunt_name,C:white,s:0.7}Taunt{}",
				},
				text = {
					{
						"{C:green}#1# in #2#{} chance the",
						"next scored card",
						"is retriggered when",
						"a card is scored",
					},
					{
						"Combos Into:",
						"{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_torou_zan = {
				name = { "Torou Zan", "{X:cbean_series,C:white,s:0.7}Series{}" },
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult,",
						"but {C:attention}increases{}",
						"{C:attention}Blind{} size by {C:dark_edition}#2#%{}",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_joudan_sokuto_geri = {
				name = {
					"Joudan Sokuto Geri",
					"{X:cbean_series,C:white,s:0.7}Series{}",
				},
				text = {
					{
						"The lowest ranked card gives",
						"{X:mult,C:white}X#1#{} Mult when scored",
						"Gives an additional {X:mult,C:white}X#2#{} Mult",
						"for each scored card",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_god_fist = {
				name = {
					"Electric Wind God Fist",
					"{X:cbean_series,C:white,s:0.7}Series{}",
				},
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
						"{C:green}#2# in #3#{} chance to",
						"instead give {X:chips,C:white}XChips",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_0chill_fighting_stance = {
				name = {
					"Fighting Stance",
					"{X:cbean_taunt_name,C:white,s:0.7}Taunt{}",
				},
				text = {
					{
						"Counts as using {C:attention}#1#{}",
						"Combo cards in a combo",
					},
					{
						"Combos Into:",
						"{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_yma_neutral_special = {
				name = {
					"Neutral Special",
					"{X:cbean_series,C:white,s:0.7}Series{}",
				},
				text = {
					{
						"Retriggers the {C:attention}next{} Combo",
						"card in the {C:combo}Combo{} again",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},
			c_cbean_yma_astral_projection = {
				name = {
					"Astral Projection",
					"{X:purple,C:white,s:0.7}Special{}",
				},
				text = {
					{
						"The {C:attention}previous{} Combo card",
						"wont trigger or be {C:attention}used",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:green,C:white}Starter{}",
					},
				},
			},
			c_cbean_yma_za_warudo = {
				name = {
					"Za Warudo",
					"{X:blue,C:white,s:0.7}Ultimate{}",
				},
				text = {
					{
						"Reduces {C:attention}Blind{} requirement",
						"by {C:dark_edition}-#1#%{} when scored",
						"Boosted by current combo",
						"length when used",
					},
					{
						"Combos Into:",
						"Nothing",
					},
				},
			},
			c_cbean_wgrop_gaster_blaster = {
				name = {
					"Gaster Blaster",
					"{X:purple,C:white,s:0.7}Special{}",
				},
				text = {
					{
						"Turns the {C:attention}Lowest Ranking{} card",
						"in scoring hand into an {C:attention}Ace",
						"{C:mult}+#1#{} Mult for every {C:attention}Rank{}",
						"in between {C:attention}previous rank{}",
						"and {C:attention}Ace{} when a card is scored",
						"{C:inactive,s:0.8}[Counts Upward]{}"
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}",
					},
				},
			},
			c_cbean_wgrop_let_the_people_rejoice = {
				name = {
					"Let The People Rejoice",
					"{X:blue,C:white,s:0.7}Ultimate{}",
				},
				text = {
					{
						"{C:attention}After scoring{} all cards,",
						"for every {C:mult}#1# Mult{} of",
						"{C:attention}scored hand{} above its {C:chips}Chips{},",
						"{C:white,X:mult}X#2#{} Mult and {C:white,X:chips}X#3#{} Chips",
						"Boosted by current combo",
						"length when used"
					},
					{
						"Max of",
						"{C:white,X:red}X#4#{} {C:white,X:blue}X#5#{}"
					},
					{
						"Combos Into:",
						"Nothing"
					},
				},
			},
			c_cbean_wgrop_blue_rose_closer = {
				name = {
					"Blue Rose Closer",
					"{X:blue,C:white,s:0.7}Ultimate{}",
				},
				text = {
					{
						"Scored cards are",
						"retriggered {C:attention}#1#{} time{C:inactive}(s){}",
						"and give {C:white,X:chips}X#2#{} Chips",
						"Boosted by current combo",
						"length when used"
					},
					{
						"Combos Into:",
						"Nothing"
					},
				},
			},
			c_cbean_wgrop_party_poppers = {
				name = {
					"Party Poppers!",
					"{X:purple,C:white,s:0.7}Special{}",
				},
				text = {
					{
						"Scored cards either give",
						"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult,",
						"or {C:money}$#3#{} to {C:money}$#4#{}"
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:blue,C:white}Ultimate{}",
					},
				},
			},
			c_cbean_nameteam_discombobulate = {
				name = { "Discombobulate", "{X:purple,C:white,s:0.7}Special{}" },
				text = {
					{
						"Retrigger {C:attention}all{} played",
						"cards used in scoring",
						"except the {C:attention}first{} and",
						"{C:attention}last{} {C:attention}#1#{} additional time",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:blue,C:white}Ultimate{}",
					},
				},
			},
		},
		yma_keys = {
			c_cbean_yma_alpha = {
				name = "Alpha Key",
				text = {
					"{C:red}Removes{} a random {C:money}Sticker{}",
					"from a random {C:attention}Joker{} at",
					"the end of the {C:attention}round",
					"{C:inactive}(Uses #1#/#2#)",
				},
			},
			c_cbean_yma_angel = {
				name = "Angel Key",
				text = {
					"{C:attention}Creates{} a random {C:sdown_blessing}Blessing{}",
					"with a {C:red}lower{} expiry date when",
					"a {C:attention}Booster Pack{} is opened",
					"{C:inactive}(Uses #1#/#2# packs)",
				},
			},
			c_cbean_yma_animal = {
				name = "Animal Key",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:attention}create{} a random {C:dark_edition}Negative{}",
					"{C:sdown_czodiac}Chinese Zodiac{} card",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_anywhere = {
				name = "Anywhere Key",
				text = {
					"{C:attention}Allows{} access to any",
					"{C:attention}location{} otherwise {C:red}blocked{}",
					"off by another {C:yma_keys}Key",
					"{C:inactive}(Uses #1#/#2# shops)",
				},
			},
			c_cbean_yma_bitey = {
				name = "Bitey Key",
				text = {
					"Played cards {C:attention}permanently{}",
					"gain {C:mult}+#3#{} Mult when scored",
					"but lose all {C:attention}enhancements{}",
					"{C:inactive}(Uses #1#/#2# cards)",
				},
			},
			c_cbean_yma_chain = {
				name = "Chain Key",
				text = {
					"When the {C:yma_keys}Key{} to the left",
					"{C:attention}triggers{}, add an {C:attention}additional",
					"use to the {C:yma_keys}Key{} to the right",
					"{C:inactive}(Uses #1#/#2#)",
				},
			},
			c_cbean_yma_creation = {
				name = "Creation Key",
				text = {
					"Creates a {C:attention}random{} free",
					"{C:attention}Booster Pack{} in the {C:money}shop",
					"{C:inactive}(Uses #1#/#2# shops)",
				},
			},
			c_cbean_yma_demon = {
				name = "Demon Key",
				text = {
					{
						"{C:green}#3# in #4#{} chance to {C:attention}apply{} a",
						"random {C:edition}edition{} to the two",
						"{C:attention}leftmost{} cards in scoring hand",
					},
					{
						"{C:attention}Shuffles{} played {C:attention}cards",
						"{C:inactive}(Uses #1#/#2# hands)",
					},
				},
			},
			c_cbean_yma_echo = {
				name = "Echo Key",
				text = {
					"When hand is {C:attention}played{},",
					"{C:attention}mimics{} {C:tarot}Tarot{} to the left",
					"{C:inactive}(Uses #1#/#2# hands)",
				},
			},
			c_cbean_yma_enigma = {
				name = "Enigma Key",
				text = {
					"{C:attention}Consumable{} pool",
					"is randomized",
					"{C:inactive}(Uses ?/? blinds)",
				},
			},
			c_cbean_yma_gender = {
				name = "Gender Key",
				text = {
					"{C:attention}Played{} face cards",
					"change {C:attention}gender{} when scored",
					"{C:inactive}(Uses #1#/#2# cards)",
				},
			},
			c_cbean_yma_ghost = {
				name = "Ghost Key",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:attention}creates{} two temporary",
					"{C:dark_edition}Negative{} {C:attention}Jokers{}",
					"{C:inactive}(Uses #1#/#2# shops)",
				},
			},
			c_cbean_yma_giant = {
				name = "Giant Key",
				text = {
					"Create a {X:red,C:white}Finisher{} or",
					"{X:blue,C:white}Ultimate{} {C:combo}Combo{} card at",
					"the end of the {C:attention}round",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_harlequin = {
				name = "Harlequin Key",
				text = {
					"{C:attention}Mimics{} leftmost {C:attention}Joker",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_head = {
				name = "Head Key",
				text = {
					"{C:green}#3# in #4#{} chance to",
					"create a {C:yma_keys}Key{} when any",
					"{C:attention}Boss{} Blind is {C:attention}defeated",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_hercules = {
				name = "Hercules Key",
				text = {
					{
						"When {C:attention}Blind{} is selected,",
						"create two {C:dark_edition}Negative",
						"{C:sdown_blessing}Blessing{} cards",
					},
					{
						"All {C:sdown_blessing}Blessings{} are {C:red}destroyed",
						"at the end of the {C:attention}round",
						"{C:inactive}(Uses #1#/#2# Blinds)",
					},
				},
			},
			c_cbean_yma_identity = {
				name = "Identity Key",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:attention}temporarily{} becomes a",
					"random {X:cbean_series,C:white}Series{} or {X:purple,C:white}Special{}",
					"{C:combo}Combo{} card",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_key_to_hell = {
				name = "Key to Hell",
				text = {
					"{C:attention}Grants{} access to {C:red}Hell",
					"in the {C:attention}Street{}",
					"{C:inactive}(Uses #1#/#2# shops)",
				},
			},
			c_cbean_yma_matchstick = {
				name = "Matchstick Key",
				text = {
					"If played hand scores above",
					"the {C:attention}Blind{} requirement,",
					"create a random {C:attention}Tag",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_mending = {
				name = "Mending Key",
				text = {
					"{C:attention}Restores{} one use of {C:yma_keys}Key{} to",
					"the left when it {C:attention}triggers",
					"{C:inactive}(Uses #1#/#2#)",
				},
			},
			c_cbean_yma_small_world = {
				name = "Small World Key",
				text = {
					"{C:attention}Grants{} access to the {C:blue}Forgery Closet",
					"in the {C:attention}Street{}",
					"{C:inactive}(Uses #1#/#2# shops)",
				}
			},
			c_cbean_yma_mirror = {
				name = "Mirror Key",
				text = {
					"When {C:attention}Blind{} is selected,",
					"replaces {C:attention}rightmost{} consumable",
					"with {C:attention}leftmost{} consumable",
					"{C:inactive}(Uses #1#/#2#)",
				},
			},
			c_cbean_yma_moon = {
				name = "Moon Key",
				text = {
					"{C:attention}Grants{} access to {C:dark_edition}The{}",
					"{C:dark_edition}Graveyard{} in the {C:attention}Street{}",
					"{C:inactive}(Uses #1#/#2# shops)",
				},
			},
			c_cbean_yma_music_box = {
				name = "Music Box Key",
				text = {
					{
						"{C:attention}Jokers{} are shuffled",
						"when hand is played",
					},
					{
						"Leftmost {C:attention}Joker",
						"{C:attention}triggers{} again",
						"{C:inactive}(Uses #1#/#2# Blinds)",
					},
				},
			},
			c_cbean_yma_orchestra = {
				name = "Orchestra Key",
				text = {
					"Create two {C:dark_edition}Negative{} {X:red,C:white}Starter{}",
					"or {X:black,C:white}Taunt{} {C:combo}Combo{} cards at",
					"the end of the {C:attention}round",
					"{C:inactive}(Uses #1#/#2# Blinds)"
				},
			},
			c_cbean_yma_reali = {
				name = "Reali Key",
				text = {
					"{C:attention}Grants{} access to {C:dark_edition}Dreamland",
					"{C:inactive}(Uses #1#/#2# shops)",
				},
			},
			c_cbean_yma_shadow = {
				name = "Shadow Key",
				text = {
					"{C:combo}Combo{} cards can",
					"be used {C:attention}twice",
					"{C:inactive}(Uses #1#/#2#)",
				},
			},
			c_cbean_yma_stamp = {
				name = "Stamp Key",
				text = {
					"{C:attention}Scored{} cards with {C:blue}Blue{}",
					"seals {C:attention}permanently{} gain",
					"a {C:attention}retrigger",
					"{C:inactive}(Uses #1#/#2# cards)",
				},
			},
			c_cbean_yma_sword = {
				name = "Sword Key",
				text = {
					"Cuts the {C:attention}Blind{}",
					"requirement in {C:attention}half{}",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_teddy = {
				name = "Teddy Key",
				text = {
					"Gives {C:attention}+#3#{} {C:blue}hand{}",
					"and {C:attention}+#3#{} {C:red}discard",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_tempus_fugit = {
				name = "Tempus Fugit Key",
				text = {
					{
						"When drawing first hand of {C:attention}round{},",
						"{C:attention}temporarily{} becomes a random {C:attention}Joker{}",
					},
					{
						"{C:red}Reverts{} when hand is played",
						"{C:inactive}(Uses #1#/#2# Blinds)",
					},
				},
			},
			c_cbean_yma_thorn = {
				name = "Thorn Key",
				text = {
					"{C:green}Probability{} is {C:attention}guaranteed",
					"for the leftmost {C:attention}Joker",
					"{C:inactive}(Uses #1#/#2# Blinds)",
				},
			},
			c_cbean_yma_timeshift = {
				name = "Timeshift Key",
				text = {
					"{C:attention}Jokers{} are restored",
					"when {C:red}destroyed",
					"{C:inactive}(Uses #1#/#2#)",
				},
			},
			c_cbean_yma_undertree = {
				name = "Undertree Key",
				text = {
					"When an {C:tarot}Arcana Pack{} is",
					"{C:attention}opened{}, it will contain an",
					"{C:attention}upgraded{} {C:tarot}Tarot{} card",
					"{C:inactive}(Uses #1#/#2# packs)",
				},
			},
		},
		Consumables2 = {
			c_cbean_jbill_tarot = {
				name = "Tarot",
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_colon_arch = {
				name = "Architecture",
				text = {
					"The next {C:attention}Blind{} this Ante",
					"is a random {C:attention}Teeny Blind",
					"{C:inactive,s:0.8}(May only be used one time per Ante)",
				},
			},
			c_cbean_jbill_planet = {
				name = "Planet",
				text = {
					"Upgrades {C:attention}last played hand{}",
					"and {C:attention}most played hand{}"
				},
			},
			c_cbean_jbill_spectral = {
				name = "Spectral",
				text = {
					"{C:red}Destroys{} half of the",
					"cards {C:attention}held in hand{}",
					"Gives random {C:attention}Enhancements{}",
					"to remaining cards"
				},
			},
			c_cbean_jbill_blessing = {
				name = "Blessing",
				text = {
					"{C:attention}Scored{} cards gain {C:mult}+#1#{} Mult",
					"{C:inactive}({C:attention}#2#{C:inactive} triggers remaining)",
				},
			},
			c_cbean_jbill_zodiac = {
				name = "Chinese Zodiac",
				text = {
					"Turn {C:attention}3{} selected cards into",
					"the rank of {C:attention}rightmost{} one"
				},
			},
			c_cbean_jbill_combo = {
				name = "Combo",
				text = {
					"Creates a {X:green,C:white}Starter{}",
					"and a {X:red,C:white}Finisher{}",
				},
			},
			c_cbean_jbill_key = {
				name = "Key",
				text = {
					"When entering shop,",
					"add a {C:yma_keys}Key{} to it",
					"{C:inactive}(Uses #1#/#2# CEO Blinds)"
				},
			},
			c_cbean_jbill_sheet = {
				name = "Sticker Sheet",
				text = {
					"Applies {C:attention}Sticker^2{} to",
					"{C:attention}1{} selected {C:attention}Joker{}"
				},
			},
			c_cbean_jbill_meta = {
				name = "Consumable^2",
				text = {
					"Creates a {C:money}Consumable^2{} for the set",
					"of {C:attention}Consumable{} to the left"
				},
			},
		},
		Employed = {
			empl_cbean_chicot = {
				name = "Chicot",
				text = {
					"Chicot will pay you {C:green}J#1#{}",
					"for beating a {C:attention}CEO Blind{}",
					"He {C:red}isn't{} going to count",
					"the amount you've beaten,",
					"so {C:attention}check on him{} regularly"
				}
			},
			empl_cbean_perkeo = {
				name = "Perkeo",
				text = {
					"Perkeo will {C:attention}copy{} a",
					"selected {C:attention}Consumable{}",
					"for {C:green}J#1#{}"
				}
			},
			empl_cbean_canio = {
				name = "Canio",
				text = {
					"Canio will {C:red}destroy{} a",
					"{C:attention}Playing Card{} of your choice",
					"for {C:green}J#1#{}"
				}
			},
			empl_cbean_yorick = {
				name = "Yorick",
				text = {
					"Yorick will apply",
					"{C:attention}Banished{} sticker to three",
					"{C:attention}Playing Cards{} of your choice",
					"for {C:green}J#1#"
				}
			},
			empl_cbean_triboulet = {
				name = "Triboulet",
				text = {
					"Triboulet will apply",
					"{C:attention}Jaded{} sticker to two",
					"{C:attention}Playing Cards{} of your choice",
					"for {C:green}J#1#"
				}
			}
		},

		--Sidequests
		yma_quest = {
			q_cbean_yma_credit_card = {
				name = {
					"Credit Card",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Spend {C:money}$#1#{} {C:inactive}[#2#]{}",
					"in a single {C:attention}shop{}",
					"to create {C:attention}Credit Card{}",
				},
			},
			q_cbean_yma_delayed_grat = {
				name = {
					"Delayed Gratification",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Finish a round without",
					"using any {C:red}discards{}",
					"to create {C:attention}Delayed Gratification{}",
				},
			},
			q_cbean_yma_burglar = {
				name = {
					"Burglar",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Destroy {C:attention}#1#{} {C:inactive}(#2#){} cards with",
					"a {C:diamonds}Diamond{} suit",
					"to create {C:attention}Burglar{}",
				},
			},
			q_cbean_yma_vampire = {
				name = {
					"Vampire",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Score a hand full of {C:attention}Enhanced{}",
					"cards to create {C:attention}Vampire{}",
				},
			},
			q_cbean_yma_wheel = {
				name = {
					"Jackpot",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Add {C:dark_edition}Negative{} to",
					"a random Joker",
					"when a {C:attention}Wheel of Fortune{}",
					"{C:green}successfully{} triggers",
					"{C:inactive}(Expires in {C:attention}#1#{} {C:inactive}rounds){}",
				},
			},
			q_cbean_yma_invisible = {
				name = {
					"Invisible",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Win a game of {C:attention}Cups{}",
					"in the {C:attention}Back Alley{}",
					"while having bet at least {C:money}$60{}",
					"to create a temporary",
					"{C:dark_edition}Negative{} {C:legendary,E:1}Legendary{} Joker",
				},
			},
			q_cbean_yma_vagabond = {
				name = {
					"Vagabond",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Play {C:attention}#1#{} {C:inactive}(#2#){} hands",
					"with {C:money}$4{} or less",
					"to create {C:attention}Vagabond{}",
				},
			},
			q_cbean_yma_yorick = {
				name = {
					"Yorick",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Discard {C:attention}#1#{} {C:inactive}(#2#){} cards",
					"in a single {C:attention}round{}",
					"to create {C:attention}Yorick{}",
				},
			},
			q_cbean_yma_shortcut = {
				name = {
					"Shortcut",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Skip {C:attention}2{} {C:inactive}(#1#){}",
					"consecutive {C:attention}Blinds{}",
					"to create {C:attention}Shortcut{}",
				},
			},
			q_cbean_yma_luchador = {
				name = {
					"Luchador",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Beat a {C:attention}Boss Blind{}",
					"without {C:attention}triggering{} it",
					"to create {C:attention}Luchador{}",
				},
			},
			q_cbean_yma_voucher = {
				name = {
					"Collector",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Open {C:attention}#2#{} {C:inactive}(#1#){} unique {C:attention}Booster",
					"{C:attention}Packs{} to redeem",
					"a random {C:attention}Voucher{}",
				},
			},
			q_cbean_yma_patience = {
				name = {
					"Patience",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Beat an {C:attention}Ante{}",
					"without {C:attention}rerolling{}",
					"to get {C:attention}5{} free {C:green}Rerollls{}",
					"in the next {C:attention}shop{}",
				},
			},
			q_cbean_0chill_warrior = {
				name = {
					"Lone Warrior",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Use {C:attention}#1#{} or more {C:combo}Combo{} cards",
					"at once in a turn",
					"to create {C:attention}Lone Warrior{}",
				},
			},
			q_cbean_yma_triboulet = {
				name = {
					"Triboulet",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"Score {C:attention}#1#{} {C:inactive}(#2#){} {C:attention}face{} cards",
					"to create {C:attention}Triboulet{}",
				},
			},
			q_cbean_nteam_square = {
				name = {
					"Square Joker",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"If {C:attention}Blind{} was defeated",
					"without playing a",
					"hand that contains",
					"{C:attention}#1#{} or more cards,",
					"create {C:attention}Square Joker{}",
				},
			},
			q_cbean_nteam_scholar = {
				name = {
					"Scholar",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"If a {C:attention}Sticker{} was",
					"applied to an {C:attention}Ace{},",
					"create {C:attention}Scholar{}",
				},
			},
			q_cbean_nteam_showman = {
				name = {
					"Showman",
					"{C:dark_edition,s:0.7}Side Quest{}",
				},
				text = {
					"If a {C:attention}Shop{} item reappeared",
					"within the same {C:attention}Shop{},",
					"create {C:attention}Showman{}",
					"and adds {C:dark_edition}Negative",
					"to 2 random {C:attention}Jokers",
					"without an {C:attention}Edition",
				},
			},
		},
		--Tboi items
		yma_tboi_items = {
			ti_cbean_yma_tboi_sad_onion = {
				name = {
					"The Sad Onion",
				},
				text = {
					"{X:chips,C:white}X#1#{} Chips",
				},
			},
			ti_cbean_yma_tboi_inner_eye = {
				name = {
					"The Inner Eye",
				},
				text = {
					{
						"All {C:white,X:chips}XChips{} sources trigger",
						"two {C:attention}additional{} times"
					},
					{
						"All {C:white,X:chips}XChips{} sources are",
						"{C:red}halved{}"
					}
				},
			},
			ti_cbean_yma_tboi_spoon_bender = {
				name = {
					"Spoon Bender",
				},
				text = {
					"Failed {C:attention}listed {C:green,E:1}probabilities",
					"retrigger {C:attention}twice"
				},
			},
			ti_cbean_yma_tboi_crickets_head = {
				name = {
					"Cricket's Head",
				},
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"All other {C:white,X:mult}XMult{} sources are",
						"multiplied by {C:white,X:mult}X#1#"
					}
				},
			},
			ti_cbean_yma_tboi_my_reflection = {
				name = {
					"My Reflection",
				},
				text = {
					"{C:attention}Played{} cards have a {C:green}#1# in #2#",
					"chance to {C:attention}return{} to hand"
				},
			},
			ti_cbean_yma_tboi_steven = {
				name = {
					"Steven",
				},
				text = {
					"{C:dark_edition}+#1#%{} Score"
				},
			},
			ti_cbean_yma_tboi_pentagram = {
				name = {
					"Pentagram",
				},
				text = {
					"{C:green}#1# in #2#{} chance to gain",
					"access to {C:attention}all locked areas",
					"for the rest of this {C:attention}Ante{}",
					"when {C:attention}CEO Blind{} is defeated"
				},
			},
			ti_cbean_yma_tboi_moms_eye = {
				name = {
					"Mom's Eye",
				},
				text = {
					"{C:attention}Random{} chance for {C:mult}+Mult",
					"effects to {C:attention}trigger{} again",
				},
			},
			ti_cbean_yma_tboi_ladder = {
				name = {
					"The Ladder",
				},
				text = {
					"{C:attention}Played{} hands {C:attention}contain{} the",
					"next two {C:attention}highest{} hands",
				},
			},
			ti_cbean_yma_tboi_one_up = {
				name = {
					"1up!",
				},
				text = {
					"Prevents Death",
					"{S:1.1,C:red,E:2}self destructs{}",
				},
			},
			ti_cbean_yma_tboi_number_one = {
				name = {
					"Number One",
				},
				text = {
					"{X:chips,C:white}X#1#{} Chips, {X:attention,C:white}X#2#{} Blind Size",
					"{C:attention}permanently",
				},
			},
			ti_cbean_yma_tboi_blood_martyr = {
				name = {
					"Blood of the Martyr",
				},
				text = {
					"{C:mult}+#1#{} Mult, {C:dark_edition}+#2#%{} Score",
				},
			},
			ti_cbean_yma_tboi_virus = {
				name = {
					"The Virus",
				},
				text = {
					"{C:attention}Blind requirement{} drops by",
					"{C:attention}#1#%{} after each played {C:blue}hand"
				},
			},
			ti_cbean_yma_tboi_heart = {
				name = {
					"<3",
				},
				text = {
					"{C:attention}-#1#{} Ante, Gain {C:money}$#2#"
				},
			},
			ti_cbean_yma_tboi_skeleton_key = {
				name = {
					"Skeleton Key",
				},
				text = {
					"{C:attention}Creates{} a {C:dark_edition}Negative{} {C:yma_keys}Key",
					"when {C:attention}Blind{} is selected"
				},
			},
			ti_cbean_yma_tboi_dollar = {
				name = {
					"A Dollar",
				},
				text = {
					"Earn {C:money}$#1#"
				},
			},
			ti_cbean_yma_tboi_transcendence = {
				name = {
					"Transcendence",
				},
				text = {
					"Cards {C:attention}held in hand{} give their",
					"{C:chips}Chip{} vaules"
				},
			},
			ti_cbean_yma_tboi_dinner = {
				name = {
					"Dinner",
				},
				text = {
					"{C:attention}-#1#{} Ante"
				},
			},
			ti_cbean_yma_tboi_breakfast = {
				name = {
					"Breakfast",
				},
				text = {
					"{C:attention}-#1#{} Ante"
				},
			},
			ti_cbean_yma_tboi_wooden_spoon = {
				name = {
					"Wooden Spoon",
				},
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}retrigger",
					"each {C:attention}played{} card"
				},
			},
			ti_cbean_yma_tboi_belt = {
				name = {
					"The Belt",
				},
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}retrigger",
					"each {C:attention}played{} card"
				},
			},
			ti_cbean_yma_tboi_wire_coat_hanger = {
				name = {
					"Wire Coat Hanger",
				},
				text = {
					"{X:chips,C:white}X#1#{} Chips",
				},
			},
			ti_cbean_yma_tboi_lucky_foot = {
				name = {
					"Lucky Foot",
				},
				text = {
					"{C:attention}+#1#{} to all {C:attention}listed",
					"{C:green,E:1}probabilities"
				},
			},
			ti_cbean_yma_tboi_cupids_arrow = {
				name = {
					"Cupid's Arrow",
				},
				text = {
					"{C:attention}#1#%{} of scored {C:attention}Chips{} are",
					"added to next hand",
					"{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips)",
				},
			},
			ti_cbean_yma_tboi_dr_fetus = {
				name = {
					"Dr. Fetus",
				},
				text = {
					"All {C:chips}+Chips{} sources become",
					"{C:white,X:chips}XChips{} with {X:attention,C:white}X#1#{} values"
				},
			},
			ti_cbean_yma_tboi_magneto = {
				name = {
					"Magneto",
				},
				text = {
					"{C:attention}Booster{} packs in",
					"the shop are {C:money}free",
				},
			},
			ti_cbean_yma_tboi_charm_vampire = {
				name = {
					"Charm of the Vampire",
				},
				text = {
					{
						"Gain a {C:red}discard{} for the round",
						"every {C:blue}#1#{} hands {C:attention}used",
						"{C:inactive}(Currently {C:attention}#2#{C:inactive}/{C:attention}#1#{C:inactive})",
					},
					{
						"Gain a {C:red}discard{} every {C:attention}#3#",
						"rounds completed",
						"{C:inactive}(Currently {C:attention}#4#{C:inactive}/{C:attention}#3#{C:inactive})",
					}
				},
			},
			ti_cbean_yma_tboi_battery = {
				name = {
					"The Battery",
				},
				text = {
					"{C:green}#1# in #2#{} chance for the first",
					"use of {C:attention}consumables{} to not",
					"destroy said {C:attention}consumable"
				},
			},
			ti_cbean_yma_tboi_steam_sale = {
				name = {
					"Steam Sale",
				},
				text = {
					"All cards and packs in",
					"shop are {C:attention}#1#%{} off",
				},
			},
			ti_cbean_yma_tboi_sister_maggy = {
				name = {
					"Sister Maggy",
				},
				text = {
					"{C:attention}Two{} rankless {C:attention}Bonus Cards",
					"are {C:attention}added{} to each {C:attention}played",
					"hand",
				},
			},
			ti_cbean_yma_tboi_technology = {
				name = {
					"Technology",
				},
				text = {
					"All {C:white,X:chips}XChips{} sources become",
					"{C:white,X:mult}XMult{} with {X:attention,C:white}X#1#{} values"
				},
			},
			ti_cbean_yma_tboi_chocolate_milk = {
				name = {
					"Chocolate Milk",
				},
				text = {
					"{X:chips,C:white}X#1#{} Chips per {C:chips}+Chips{} in",
					"{C:attention}played{} cards chip value"
				},
			},
			ti_cbean_yma_tboi_growth_hormones = {
				name = {
					"Growth Hormones",
				},
				text = {
					{
						"{C:green}#1# in #2#{} chance to {C:attention}retrigger",
						"each {C:attention}played{} card"
					},
					{
						"{C:dark_edition}+#3#%{} Score",
					}
				},
			},
			ti_cbean_yma_tboi_rosary = {
				name = {
					"Rosary",
				},
				text = {
					{
						"The next {C:attention}#1#{} blinds this {C:attention}Ante",
						"are {C:attention}Teeny Blinds",
						"{C:inactive}({C:attention}#2#{} {C:inactive}left)",
					},
					{
						"{X:chips,C:white}X#3#{} Chips",
					}
				},
			},
			ti_cbean_yma_tboi_phd = {
				name = {
					"PHD",
				},
				text = {
					"{C:attention}Doubles{} money {C:money}gain",
				},
			},
			ti_cbean_yma_tboi_x_ray_vision = {
				name = {
					"X-Ray Vision",
				},
				text = {
					"{C:attention}Prevents{} cards from",
					"being {C:attention}flipped",
				},
			},
			ti_cbean_yma_tboi_mark = {
				name = {
					"The Mark",
				},
				text = {
					{
						"{C:green}#1# in #2#{} chance to gain a {C:blue}hand",
						"for the {C:attention}round{} when",
						"{C:attention}Blind{} is selected"
					},
					{
						"{C:dark_edition}+#3#%{} Score",
					}
				},
			},
			ti_cbean_yma_tboi_dead_cat = {
				name = {
					"Dead Cat",
				},
				text = {
					"Prevents Death {C:attention}#1#{} times,",
					"{X:attention,C:white}X#2#{} Blind Size {C:attention}permanently",
				},
			},
			ti_cbean_yma_tboi_lokis_horns = {
				name = {
					"Loki's Horns",
				},
				text = {
					"{C:attention}Random{} chance for {C:chips}+Chips",
					"effects to {C:attention}trigger{} again",
				},
			},
			ti_cbean_yma_tboi_small_rock = {
				name = {
					"The Small Rock",
				},
				text = {
					{
						"{C:green}#1# in #2#{} chance each {C:attention}played",
						"card {C:red}doesn't{} score"
					},
					{
						"{X:chips,C:white}X#3#{} Chips, {C:dark_edition}+#4#%{} Score",
					}
				},
			},
			ti_cbean_yma_tboi_robo_baby = {
				name = {
					"Robo-Baby",
				},
				text = {
					"{C:attention}Two{} rankless {C:attention}Mult Cards{} are",
					"{C:attention}added{} to each {C:attention}played{} hand",
				},
			},
			ti_cbean_yma_tboi_halo = {
				name = {
					"The Halo",
				},
				text = {
					{
						"{C:green}#1# in #2#{} chance to {C:attention}retrigger",
						"each {C:attention}played{} card"
					},
					{
						"{C:attention}-#3#{} Ante, {X:chips,C:white}X#4#{} Chips,",
						"{C:dark_edition}+#5#%{} Score",
					}
				},
			},
			ti_cbean_yma_tboi_parasite = {
				name = {
					"The Parasite",
				},
				text = {
					"All {C:chips}+Chips{} sources trigger",
					"two {C:attention}additional{} times with",
					"{C:red}halved{} effects",
				},
			},
			ti_cbean_yma_tboi_money_power = {
				name = {
					"Money = Power",
				},
				text = {
					"{X:mult,C:white}X#1#{} Mult for every",
					"{C:money}$1{} you have",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult)",
				},
			},
			ti_cbean_yma_tboi_moms_knife = {
				name = {
					"Mom's Knife",
				},
				text = {
					{
						"All {C:white,X:chips}XChips{} sources",
						"are {C:attention}multiplied{} by {C:attention}#1#",
					},
					{
						"All {C:chips}+Chips{} sources ",
						"are {C:attention}divided{} by {C:attention}#2#",
					}
				},
			},
			ti_cbean_yma_tboi_dead_bird = {
				name = {
					"Dead Bird",
				},
				text = {
					"{C:attention}Two{} random {C:attention}playing cards",
					"are {C:attention}added{} to each {C:attention}played{}",
					"{C:blue}hand{} after the {C:attention}first",
				},
			},
			ti_cbean_yma_tboi_brimstone = {
				name = {
					"Brimstone",
				},
				text = {
					"All {C:chips}+Chips{} sources become",
					"{C:white,X:mult}XMult{} with {X:attention,C:white}X#1#{} Values"
				},
			},
			ti_cbean_yma_tboi_blood_bag = {
				name = {
					"Blood Bag",
				},
				text = {
					"{C:attention}-#1#{} Ante, {C:mult}+#2#{} Mult"
				},
			},
			ti_cbean_yma_tboi_whore_babylon = {
				name = {
					"Whore of Babylon",
				},
				text = {
					"{X:mult,C:white}X#3#{} Mult and {C:green}#1# in #2#{} chance",
					"to {C:attention}retrigger{} each card on",
					"last played {C:blue}hand"
				},
			},
			ti_cbean_yma_tboi_lump_coal = {
				name = {
					"A Lump of Coal",
				},
				text = {
					"{C:attention}Played{} cards {C:chips}Chip{} value is",
					"multipled by their {C:attention}position",
				},
			},
			ti_cbean_yma_tboi_technology_two = {
				name = {
					"Technology 2",
				},
				text = {
					"All {C:chips}+Chips{} sources become",
					"{C:mult}+Mult{} with {C:mult}halved{} values"
				},
			},
			ti_cbean_yma_tboi_ankh = {
				name = {
					"Ankh",
				},
				text = {
					{
						"The next {C:attention}#1#{} {C:attention}Blinds{} this {C:attention}Ante",
						"are {C:attention}Teeny Blinds{}, {X:attention,C:white}X#3#{} Blind",
						"Size {C:attention}permanently",
						"{C:inactive}({C:attention}#2# {C:inactive}left)",
					},
					{
						"Prevents Death",
						"{S:1.1,C:red,E:2}self destructs{}",
					}
				},
			},
			ti_cbean_yma_tboi_sacred_heart = {
				name = {
					"Sacred Heart",
				},
				text = {
					{
						"Failed {C:attention}listed {C:green,E:1}probabilities{}",
						"retrigger {C:attention}twice{}"
					},
					{
						"{C:attention}-#1#{} Ante, Gain {C:money}$#2#",
						"{C:chips}-#3#{} Chips, {X:chips,C:white}X#4#{} Chips",
					}
				},
			},
			ti_cbean_yma_tboi_magic_ball = {
				name = {
					"Magic 8 Ball",
				},
				text = {
					{
						"{C:attention}Creates{} a random {C:tarot}Tarot{} card",
						"{C:inactive}(Must have room){}",
					},
					{
						"{C:spectral}Spectral{} cards are more",
						"{C:attention}common",
					}
				},
			},
			--Birthright and its many, many, many deck effects.
			ti_cbean_yma_tboi_birthright = {
				name = {
					"Birthright",
				},
				text = {
					"{C:attention}Grants{} an effect",
					"based on the current {C:attention}deck",
				},
			},

			ti_cbean_yma_tboi_birthright_red_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Red Deck:",
						"Gain {C:red}+#1#{} Discards"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_blue_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Blue Deck:",
						"Gain {C:blue}+#1#{} Hands"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_yellow_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Yellow Deck:",
						"Gain {C:money}$#1#{}"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_green_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Green Deck:",
						"Gain an additional {C:money}$#1#{}",
						"per remaining {C:blue}Hand{} and",
						"{C:red}Discard{} at end of Round"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_black_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Black Deck:",
						"{C:attention}+#1#{} Joker slot"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_magic_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Magic Deck:",
						"Redeem {C:tarot}Omen Globe{} voucher",
					},
					{
						"When entering the shop,",
						"leftmost voucher pack",
						"turns into a {C:tarot}Tarot{} pack"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_nebula_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Nebula Deck:",
						"When entering the shop,",
						"transforms {C:attention}rightmost{} shop",
						"item into planet card of",
						"last played hand"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_ghost_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Ghost Deck:",
						"{C:spectral}Spectral{} cards appear",
						"{C:attention}#1#X{} more frequently",
						"in shop"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_abandoned_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Abandoned Deck:",
						"Removes {C:attention}cards{} of the",
						"{C:attention}#1#{} most infrequent",
						"ranks in {C:attention}full deck{}",
						"when picked up"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_checkered_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Checkered Deck:",
						"All {C:clubs}Clubs{} and {C:diamonds}Diamonds{}",
						"in full deck change into",
						"{C:spades}Spades{} and {C:hearts}Hearts{} respectively",
						"when a {C:attention}Blind{} is selected"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_zodiac_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Zodiac Deck:",
						"{C:spectral}Spectral{} cards appear",
						"at the same rate as",
						"{C:attention}Jokers{} in the shop",
					},
					{
						"{C:attention}Jokers{} can {C:red}no longer{}",
						"appear in the shop"
					}
				},
			},

			ti_cbean_yma_tboi_birthright_anaglyph_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Anaglyph Deck:",
						"Gain a {C:attention}Double Tag{}",
						"when entering a {C:attention}Blind{}"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_plasma_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Plasma Deck:",
						"{X:chips,C:white}X#1#{} Chips and {X:mult,C:white}X#2#{} Mult",
						"after score balances"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_erratic_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Erratic Deck:",
						"Gives every card in {C:attention}full deck{}",
						"a random, non-Stone enhancment"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck1 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"Recieve {C:attention}#1#{} random",
						"{C:attention}Vouchers{} on pickup"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck2 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"Get {C:attention}#1# Tags{}",
						"and {C:attention}#1#{} {C:tarot}Tarot{} Cards",
						"{C:inactive}(Must have room)"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck3 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"When entering the shop,",
						"transforms {C:attention}rightmost{} shop",
						"item into planet card of",
						"last played hand"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck4 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"Removes {C:attention}cards{} of the",
						"{C:attention}#1#{} most infrequent",
						"ranks in {C:attention}full deck{}",
						"when picked up"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck5 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"Only {C:attention}modded{} consumables can appear",
						"{C:inactive}(May have some vanilla items",
						"{C:inactive}in booster packs",
						"{C:inactive}due to pool exahustion)"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck6 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"{C:attention}+#1#{} in either {C:attention}Joker{} slots,",
						"hand size, or consumable slots"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_daily_deck7 = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Daily Deck:",
						"{C:attention}+#1#{} consumable slots"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_athena_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Athena Deck:",
						"When CEO Blind is defeated,",
            			"add {C:attention}#1#{} charges to",
            			"all held {C:attention}Blessings{}"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_urine_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Urine Deck:",
						"Scored {C:money}Piss{} cards",
						"are retriggered {C:attention}#1#{} times"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_happy_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Happy Deck:",
						"Create an {C:attention}Eternal{} {C:dark_edition}Negative{}",
						"{C:attention}Scary Face{} and {C:attention}Smiley Face{}",
						"on pickup"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_sticky_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Sticky Deck:",
						"The {C:attention}Stationery Shop",
						"gives {C:attention}#1#{} more rewards",
					},
				},
			},

			ti_cbean_yma_tboi_birthright_graveyard_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Graveyard Deck:",
						"{C:green}Plant Jokers{} can appear",
						"in any {C:green}Biome{}"
					},
				},
			},

			ti_cbean_yma_tboi_birthright_unknown_deck = {
				name = {
					"Birthright",
				},
				text = {
					{
						"{C:attention}Grants{} an effect",
						"based on current {C:attention}deck",
					},
					{
						"Unknown Deck:",
						"{X:chips,C:white}X#1#{} Chips"
					},
				},
			},
			------------------------------------------------------------------------
			ti_cbean_yma_tboi_speed_ball = {
				name = {
					"Speed Ball",
				},
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}retrigger",
					"each {C:attention}played{} card"
				},
			},
			ti_cbean_yma_tboi_ghost_baby = {
				name = {
					"Ghost Baby",
				},
				text = {
					"{C:attention}Two{} rankless {C:attention}Coarse Cards",
					"are {C:attention}added{} to each {C:attention}played",
					"hand",
				},
			},
			ti_cbean_yma_tboi_cat_nine_tails = {
				name = {
					"Cat-o-nine-tails",
				},
				text = {
					"{C:dark_edition}+#1#%{} Score"
				},
			},
			ti_cbean_yma_tboi_harlequin_baby = {
				name = {
					"Harlequin Baby",
				},
				text = {
					"The first two {C:attention}played cards",
					"are {C:attention}added{} to each {C:attention}played",
					"hand in {C:attention}reverse{} order",
				},
			},
			ti_cbean_yma_tboi_stem_cells = {
				name = {
					"Stem Cells",
				},
				text = {
					"{C:attention}-#1#{} Ante"
				},
			},
			ti_cbean_yma_tboi_fate = {
				name = {
					"Fate",
				},
				text = {
					{
						"Cards {C:attention}held in hand{} give their",
						"{C:chips}Chip{} values"
					},
					{
						"{C:green}#1# in #2#{} chance for {C:attention}-#3#{} Ante",
						"when {C:attention}CEO Blind{} is defeated"
					}
				},
			},
			ti_cbean_yma_tboi_tooth_picks = {
				name = {
					"Tooth Picks",
				},
				text = {
					"{X:chips,C:white}X#1#{} Chips",
				},
			},
			ti_cbean_yma_tboi_smb_super_fan = {
				name = {
					"SMB Super Fan",
				},
				text = {
					{
						"{C:green}#1# in #2#{} chance to {C:attention}retrigger",
						"each {C:attention}played{} card"
					},
					{
						"{C:attention}-#3#{} Ante, {X:chips,C:white}X#4#{} Chips,",
						"{C:dark_edition}+#5#%{} Score",
					}
				},
			},
			ti_cbean_yma_tboi_fanny_pack = {
				name = {
					"Fanny Pack",
				},
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}create{} a",
					"{C:dark_edition}Negative{} {C:tarot}Tarot{} card when",
					"playing a {C:blue}hand"
				},
			},
			ti_cbean_yma_tboi_rubber_cement = {
				name = {
					"Rubber Cement",
				},
				text = {
					"{C:green}Chance{} to gain a {C:blue}hand{} for",
					"the {C:attention}round{} when {C:attention}playing",
					"a {C:blue}hand"
				},
			},
			ti_cbean_yma_tboi_pyromaniac = {
				name = {
					"Pyromaniac",
				},
				text = {
					"If score of {C:attention}played hand{}",
					"exceeds the {C:attention}total blind",
					"{C:attention}requirement{}, give a random",
					"{C:dark_edition}Edition{} to a card in {C:attention}played",
					"{C:blue}hand"
				},
			},
		},
		Enhanced = {
			m_cbean_pboys_piss = {
				name = "Piss Card",
				text = {
					"Gives {C:chips}+#1#{} chips for",
					"each {C:attention}Piss card{} in deck",
					"{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}chips)",
				},
			},
			m_cbean_yma_lucky_1 = {
				name = "Lucky Card",
				text = {
					"{C:green}#1# in #4#{} chance",
					"for {C:mult}+#3#{} Mult",
					"{C:green}#2# in #6#{} chance",
					"to win {C:money}$#5#",
				},
			},
			m_cbean_yma_lucky_2 = {
				name = "Lucky Card",
				text = {
					"{C:green}#1# in #4#{} chance",
					"for {C:mult}+#3#{} Mult",
					"{C:green}#2# in #6#{} chance",
					"to win {C:money}$#5#",
				},
			},
			m_cbean_yma_mult_1 = {
				name = "Mult Card",
				text = {
					"{C:mult}+#1#{} Mult",
				},
			},
			m_cbean_yma_mult_2 = {
				name = "Mult Card",
				text = {
					"{C:mult}+#1#{} Mult",
					"Gives an additional {C:mult}5%{}",
					"of your current Mult",
				},
			},
			m_cbean_yma_bonus_1 = {
				name = "Bonus Card",
				text = {
					"{C:chips}+#1#{} Chips",
				},
			},
			m_cbean_yma_bonus_2 = {
				name = "Bonus Card",
				text = {
					"{C:chips}+#1#{} Chips",
					"Gives an additional {C:chips}5%{}",
					"of your current Chips",
				},
			},
			m_cbean_yma_steel_1 = {
				name = "Steel Card",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"while this card",
					"stays in hand",
				},
			},
			m_cbean_yma_steel_2 = {
				name = "Steel Card",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"when played or",
					"held in hand",
				},
			},
			m_cbean_yma_glass_1 = {
				name = "Glass Card",
				text = {
					"{X:mult,C:white} X#1# {} Mult",
					"{C:green}#2# in #3#{} chance to",
					"destroy card",
				},
			},
			m_cbean_yma_glass_2 = {
				name = "Glass Card",
				text = {
					"{X:mult,C:white} X#1# {} Mult",
					"{C:green}#2# in #3#{} chance to",
					"destroy card",
				},
			},
			m_cbean_wgrop_thistled = {
				name = "Thistled Card",
				text = {
					{
						"Cannot be {C:attention}debuffed{}"
					},
					{
						"{C:red}Destroy{} this card to",
						"turn it into a",
						"{C:attention}Pale Remnant Card{}"
					}

				},
			},
			m_cbean_wgrop_pale_remnant = {
				name = "Pale Remnant",
				text = {
					{ 	"{C:attention}Decrease{} this card's",
						"{C:attention}rank{} when {C:attention}scored{}" 
					},
					{ 	"Gains {C:white,X:red}X#1#{} {C:red}Mult{}",
						"for everytime it was {C:attention}scored{}",
						"at end of scoring",
						"{C:inactive}(Currently{} {C:white,X:red}X#2#{C:inactive})"
					},
					
				},
			},
			m_cbean_wgrop_coarse = {
				name = "Coarse Card",
				text = {
					"For every {C:money}$#1#{} of",
					"{C:attention}Joker{} sell value,",
					"this gains {C:white,X:chips}X#3#{} Chips",
					"{C:inactive}(Currently{} {C:white,X:chips}X#2#{C:inactive} Chips)"
				}
			},
			m_cbean_wgrop_graffiti = {
				name = "Graffiti Card",
				text = {
					{ "Take {C:dark_edition}#1#%{} of current",
						"{C:mult}Mult{} and {C:chips}Chips{}" },
					{ "{C:green}#2#{} in {C:green}#3#{} chance to",
						"create a random {C:attention}Tag{}" },
					{ "Scoring increases {C:dark_edition}Tax{}",
						"by {C:dark_edition}#4#%{}",
						"{C:inactive,s:0.95}[Resets at end of round]{}" }
				}
			},
			m_cbean_wgrop_magma = {
				name = "Magma Card",
				text = {
					{ "Turn {C:attention}#1#{} {C:green}random{} card",
						"held in hand into ",
						"{C:attention}Stone{}, {C:attention}Glass{}, or",
						"{C:attention}Steel{} when scoring" },
					{ "{C:red}Destroy{} this card",
						"after scoring" }
				}
			},
			m_cbean_wgrop_ice = {
				name = "Ice Card",
				text = {
					"{C:white,X:blue}X#1#{} Chips for each",
					"hand played this round",
					"{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)"
				}
			},
			m_cbean_wgrop_grapevine = {
				name = "Grapevine Card",
				text = {
					"Gains {C:mult}+#1#{} Mult",
					"when held in hand",
					"at end of round"
				}
			},
			--Jbill enhance
			m_cbean_jbill_banknote = {
				name = "Banknote",
				text = {
					"Earn {C:money}$#1#{}",
					"{C:red}Ranked Down{} when scored",
					"Banknote {C:attention}2s{} are {C:red}ripped{}",
					"on scoring"
				}
			},
			m_cbean_jbill_bean = {
				name = "Bean Card",
				text = {
					"{C:dark_edition}+#1#{} hand size",
					"while held in hand"
				}
			},
			-- Nameteam zomboids
			m_cbean_basic_zomboid = {
				name = "Basic Zomboid",
				text = {
					"{C:mult}+#1#{} Mult"
				}
			},
			m_cbean_carrot_zomboid = {
				name = "Carrothead Zomboid",
				text = {
					"{C:chips}+#1#{} chips"
				}
			},
			m_cbean_melon_zomboid = {
				name = "Melonhead Zomboid",
				text = {
					"{X:mult,C:white}X#1#{} Mult"
				}
			},
		},

		Edition = {
			e_cbean_sd_frozen = {
				name = "Frozen",
				text = {
					"Can't be clicked",
					"{C:green}1 in #1#{} chance to",
					"thaw when hand is played,",
					"otherwise gains {C:chips}+#2#{}",
					"permanent chips when held"
				},
			}
		},

		Joker = {

			-- Common

			j_cbean_colon_all_in                        = { -- George The Rat | N/A | N/A
				name = "All In",
				text = {
					"When entering an {C:attention}Ante{}, all {C:attention}Blinds{} are",
					"either {s:0.9,C:chips}Teeny Blinds{} or {E:1,C:money}CEO Blinds",
				},
			},
			j_cbean_colon_auto_belay                    = { -- George The Rat | N/A | N/A
				name = "Auto Belay",
				text = {
					"Gains {C:mult}+2{} Mult when a {C:attention}card{} is discarded,",
					"has a {C:green}1 in 7{} chance to {C:attention}reset when triggered",
					"{C:inactive}(Currently {C:mult}+0{C:inactive} Mult)",
				},
			},
			j_cbean_colon_boulder                       = { -- George The Rat | N/A | N/A
				name = "Boulder",
				text = {
					"Gains {C:white,X:mult}X0.1{} Mult when {C:money}money{} is spent",
					"has a {C:green}1 in 5{} chance to {C:attention}reset when triggered",
					"{C:inactive}(Currently {C:white,X:mult}X1{C:inactive} Mult)",
				},
			},
			j_cbean_colon_chalk                         = { -- George The Rat | N/A | Glitchkat10
				name = "Chalk",
				text = {
					"{C:white,X:mult}X#1#{} Mult",
					"Permanently increase winning",
					"{C:attention}Ante{} by {C:attention}+#2#{} when obtained",
					'{C:inactive}"Chalk is aid"',
				},
			},
			j_cbean_colon_lead                          = { -- George The Rat | N/A | N/A
				name = "Lead",
				text = {
					"Earn {C:money}$0{} at the {C:attention}end of round",
					"Payout increases by {C:money}$1{} when hand is played,",
					"{C:green}1 in 8{} chance to instead lose {C:red}$8",
				},
			},
			j_cbean_colon_loan_shark                    = { -- George The Rat | George The Rat | Glitchkat10
				name = "Loan Shark",
				text = {
					"Lose {C:money}$#1#{} when {s:0.9,C:chips}Teeny{}, {C:blue}Small{},",
					"or {C:attention}Big Blind{} is selected",
					"Earn {C:money}$#2#{} when {C:attention}Boss{}",
					"or {E:1,C:money}CEO Blind{} is selected",
				},
			},
			j_cbean_colon_lumberjack                    = { -- George The Rat | George The Rat | N/A
				name = "Lumberjack",
				text = {
					"All {C:attention}held in hand{} jacks are destroyed",
					"Gains {C:mult}+4{} mult when a jack is destroyed",
					"{C:inactive}(Currently {C:mult}+0{C:inactive} mult)",
				},
			},
			j_cbean_colon_pebble                        = { -- George The Rat | N/A | jamirror and bitter
				name = "Pebble",
				text = {
					{
						"{C:blue}Small Blinds{} are replaced",
						"with {s:0.9,C:chips}Teeny Blinds",
					},
					{
						"{C:money}Big Blinds{} are replaced",
						"with {C:blue}Small Blinds",
					},
				},
			},
			j_cbean_colon_top_rope                      = { -- George The Rat | N/A | bitter
				name = "Top Rope",
				text = {
					"Gain {C:chips}+15{} Chips when {C:attention}playing card{} scored at the end of round",
					"{C:green}1 in 2{} chance to instead decrease by {C:chips}-30{} Chips",
				},
			},

			-- Uncommon

			j_cbean_colon_career_ladder                 = { -- Glitchkat10 | N/A | N/A
				name = "Career Ladder",
				text = {
					"All {C:attention}Boss Blinds{} are replaced by {E:1,C:money}CEO Blinds",
					"All {E:1,C:attention}Showdown Boss Blinds{} are replaced by {C:attention}Boss Blinds",
					"All {E:1,C:money,s:1.1}Showdown CEO Blinds{} are replaced by {E:1,C:money}CEO Blinds",
				},
			},
			j_cbean_colon_minnesang                     = { -- bitter | N/A | Glitchkat10
				name = "Minnesang",
				text = {
					"{C:red}+#1#{} discards each round,",
					"lose {C:money}$#2#{} at end of round",
				},
			},
			j_cbean_colon_mu_cube                       = { --George The Rat | N/A | bitter
				name = "Mu Cube",
				text = {
					"Played {C:attention}4s{} give {X:mult,C:white}X#1#{} Mult every",
					"{C:attention}#2#{} {C:inactive}[#3#]{} times they are scored",
					"Played {C:attention}6s{} give {X:mult,C:white}X#4#{} Mult every",
					"{C:attention}#5#{} {C:inactive}[#6#]{} times they are scored",
				},
			},
			j_cbean_colon_orchestra                     = { -- bitter | N/A | bitter and Glitchkat10
				name = "Orchestra",
				text = {
					"{C:blue}+#1#{} hands per round",
					"{C:red}+#2#{} discards each round",
					"{C:attention}+#3#{} hand size",
				},
			},
			j_cbean_colon_rna                           = { -- bitter and George The Rat | N/A | bitter
				name = "RNA",
				text = {
					"If {C:attention}first hand{} of round",
					"has only {C:attention}1{} card, add",
					"a permanent copy with",
					"random enhancement to",
					"deck and draw it to {C:attention}hand{}",
					"{C:inactive,s:0.8}(Copy won't have an {C:dark_edition,s:0.8}edition{C:inactive,s:0.8} or {C:attention,s:0.8}seal{C:inactive,s:0.8})",
				},
			},
			j_cbean_colon_shadow                        = { -- Glitchkat10 | N/A | N/A
				name = "Shadow",
				text = {
					"When a {C:attention}Booster Pack{} is bought from the shop",
					"create its {C:attention}corresponding Tag",
					"{C:inactive}(if applicable)",
				},
			},
			j_cbean_colon_sproinky                      = { -- George The Rat | N/A | bitter
				name = "Sproinky",
				text = {
					"Played and unscoring cards become {C:attention}Steel",
					"Played {C:attention}Steel Cards{} become",
					"{C:red,E:2}permanently {C:red}debuffed",
				},
			},
			j_cbean_colon_trouvere                      = { -- bitter | N/A | bitter
				name = "Trouvère",
				text = {
					"{C:blue}+#1#{} hands per round,",
					"{C:red}-#2#{} discard each round",
				},
			},

			-- Rare

			j_cbean_colon_big_shot                      = { -- George The Rat | N/A | bitter
				name = "Big Shot",
				text = {
					"When a {C:attention}Big Blind{} is defeated,",
					"earn between {C:money}$#1#{} and {C:money}$#2#",
				},
			},
			j_cbean_colon_modernity                     = { -- George The Rat | N/A | Glitchkat10
				name = "Modernity",
				text = {
					"This Joker gains {C:white,X:mult}X#1#{} Mult",
					"when {C:attention}Blind{} is skipped",
					"This Joker loses {C:white,X:mult}X#2#{} Mult",
					"when {C:attention}Blind{} is selected",
					"{C:inactive}(Currently {C:white,X:mult}X#3#{C:inactive} Mult)",
				},
			},
			j_cbean_colon_spectaro                      = { -- George The Rat | N/A | bitter
				name = "Spectaro",
				text = {
					"Create a {C:spectral}Spectral{} card when",
					"{s:0.9,C:chips}Teeny Blind{} or {E:1,C:money}CEO Blind{} is",
					"defeated without discarding",
				},
			},
			j_cbean_colon_square_packing                = { -- Glitchkat10 | George The Rat | Glitchkat10
				name = "Square Packing",
				text = {
					"This Joker gains {X:mult,C:white}X#1#{} Mult",
					"every {C:attention}#2# {C:inactive}[#3#]{C:attention} Blinds{} selected",
					"{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
				},
			},
			j_cbean_colon_jester                        = { -- bitter | N/A | N/A
				name = "Jester",
				text = {
					"Each {C:attention}Ace{} held in hand gives",
					"{C:mult}+#1#{} Mult and {C:white,X:mult}X#2#{} Mult",
				},
			},

			-- Legendary

			j_cbean_colon_sophron                       = { -- bitter | N/A | bitter
				name = "Sophron",
				text = {
					"Retrigger all cards",
					"played for each card",
					"to the {C:attention}left of them",
				},
			},
			j_cbean_colon_plato                         = { -- Glitchkat10 | N/A | N/A
				name = "Plato",
				text = {
					"All {E:1,C:money}CEO Blinds{} are replaced by ",
					"a random {V:1}Lowercase Greek Blind",
				},
			},
			j_cbean_colon_aristotle                     = { -- Glitchkat10 | N/A | N/A
				name = "Aristotle",
				text = {
					"Open a {C:attention}Blessing Pack{} when {C:money,E:1}CEO Blind{} is defeated",
					"When a Blessing is obtained from a {C:attention}Booster Pack{},",
					"create 1 {C:spectral}Taa Marbuta",
				},
			},
			j_cbean_colon_aristoxenus                   = { -- Glitchkat10 | N/A | N/A
				name = "Aristoxenus",
				text = {
					"This Joker gains {X:mult,C:white}X#1#{} Mult",
					"when a {C:attention}new music track{} plays",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			j_cbean_colon_hippo                         = { -- George | N/A | Bitter
				name = "Hippocrates",
				text = {
					"{C:attention}+1{} hand size when a {C:attention}playing card",
					"is selected from a {C:attention}Standard Pack",
					"{C:attention}-1{} hand size if a card's rank or suit is {C:attention}altered",
					"{s:0.9}Playing cards cannot be destroyed",
					"{C:inactive}(Currently {C:attention}+0 {C:inactive}hand size)",
				},
			},
			--0 Driver Jokers

			--Common
			j_cbean_0chill_homosexual                   = {
				name = "Queer Joker",
				text = {
					"{C:mult}+#1#{} Mult if played",
					"hand contains",
					"a {C:attention}#2#{}",
				},
			},

			j_cbean_0chill_lesbian                      = {
				name = "Curious Joker",
				text = {
					"{C:chips}+#1#{} Chips if played",
					"hand contains",
					"a {C:attention}#2#{}",
				},
			},

			j_cbean_0chill_short                        = {
				name = "Playful Joker",
				text = {
					"{C:mult}+#1#{} Mult if played",
					"hand contains",
					"a {C:attention}#2#{}",
				},
			},

			j_cbean_0chill_abbreviated                  = {
				name = "Sharp Joker",
				text = {
					"{C:chips}+#1#{} Chips if played",
					"hand contains",
					"a {C:attention}#2#{}",
				},
			},

			--Uncommon
			j_cbean_0chill_thorn_ring                   = {
				name = "ThornRing",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"{C:red}-#2#{} hand size",
					},
					{
						"All non-{C:hearts}Heart{} cards",
						"are {C:red}debuffed{}",
					},
				},
			},

			j_cbean_sd_overchilled                      = { --I think this one got misplaced
				name = "Overchilled Beans",
				text = {
					"When round begins, add a {C:dark_edition}Frozen{}",
					"Bean playing card to your hand",
					"{C:inactive,s:0.8}Ah, shoot, they were supposed to be COOL..."
				}
			},

			--Rare

			j_cbean_0chill_chaos                        = {
				name = "The Parade",
				text = {
					"{X:mult,C:white}X#1#{} Mult if played",
					"hand contains",
					"a {C:attention}#2#{}",
				},
			},

			j_cbean_0chill_clique                       = {
				name = "The Hierarchy",
				text = {
					"{X:mult,C:white}X#1#{} Mult if played",
					"hand contains",
					"a {C:attention}#2#{}",
				},
			},
			j_cbean_0chill_nat20                        = {
				name = "Nat 20",
				text = {
					"Turns all {C:attention}listed {C:green,E:1,S:1.1}probabilities{}",
					"into a random probability",
					"between {C:green}1 in 20{} and {C:green}19 in 20{}",
					"{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}14 in 20{C:inactive})",
				},
			},
			j_cbean_0chill_driving_in_my_truck          = {
				name = "Asgore's Truck",
				text = {
					{
						"Destroys scored {C:attention}King{}",
						"cards in played hand",
					},
					{
						"This Joker gains {X:mult,C:white}X#1#{} Mult for",
						"each card destroyed this way,",
						"resets after each {C:attention}Ante{}",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)",
					},
				},
			},

			j_cbean_0chill_chum                         = {
				name = "Chumblock",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Turns adjacent {C:attention}Jokers{} into",
						"{C:attention}Chumblocks{} each hand",
					},
					{
						"{C:red,E:1,s:1.1}CAN'T BE SOLD!",
						"{C:red,E:1,s:1.1}Self destructs{}",
						"when triggered",
						"{C:inactive}Its so over{}"
					},
				},
			},

			j_cbean_0chill_lone_warrior                 = {
				name = "Lone Warrior",
				text = {
					"Gains {X:mult,C:white}X#2#{} Mult",
					"for each {C:combo}Combo{} card",
					"used this run",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)",
				},
			},
			j_cbean_0chill_house_rules                  = {
				name = "House Rules",
				text = {
					{
						"Unlocks new hands",
						"based on owned {C:attention}Jokers",
					},
					{
						"{C:attention}Select{} this Joker and",
						"check {C:attention}Run Info{} to",
						"see possible hands",
						"{C:inactive}(Indicated with an HR)",
					},
				},
			},

			j_cbean_0chill_noelle                       = {
				name = "Noelle",
				text = {
					{
						"Adds {C:dark_edition}Frozen{} to",
						"a random held card when",
						"a {C:attention}Blind{} is defeated"
					},
					{
						"Instead affects every held",
						"card, also makes them {C:attention}Ice Cards{},",
						"and allows {C:dark_edition}Frozen{} cards to be",
						"clicked if you have {C:attention}ThornRing{}"
					},
				},
			},

			j_cbean_0chill_mad_mailer                   = {
				name = "The Mad Mailer",
				text =
				{
					"If {C:attention}first discard{} of round",
					"has only {C:attention}1{} card, earn {C:money}$#1#{} and",
					"apply {C:attention}Mailed{} and {C:attention}Hooking{} to it",
					"{C:inactive}(Must not already have Mailed)"
				},
			},

			j_cbean_0chill_cryostasis                   = {
				name = "Cryostasis",
				text = {
					{
						"Adds {C:dark_edition}Frozen{} to all",
						"other {C:attention}Jokers{} when sold",
					},
					{
						"{C:inactive,E:1,s:1.5}Let's all just chill out...",
						"{C:inactive}and take responsibility"

					},
				},
			},

			j_cbean_0chill_permafrost                   = {
				name = "Permafrost",
				text = {
					{
						"{C:dark_edition}Frozen{} cards",
						"will not thaw"
					},
				},
			},

			--Chill Formation
			j_cbean_0chill_vacation_member0 = {
				name = {"Chill Formation", "{s:0.7}Cmykl:{} {B:1,C:white,s:0.7}Red Dot"},
				text = {
					{
						"Can be used as a {X:green,C:white}Starter{} Card",
						"in a {C:combo}Combo{} and changes",
						"effect each use"	
					},
					{
						"Highest rank card has",
						"{X:mult,C:white}X#1#{} Mult when scored",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},

			j_cbean_0chill_vacation_member1 = {
				name = {"Chill Formation", "{s:0.7}Capital Chirp:{} {B:1,C:white,s:0.7}Alien Invasion"},
				text = {
					{
						"Can be used as a {X:green,C:white}Starter{} Card",
						"in a {C:combo}Combo{} and changes",
						"effect each use"	
					},
					{
						"Each scored {C:hearts}Hearts{} card",
						"grants {C:mult}+#2#{} Mult and has a",
						"{C:green}#3# in #4#{} chance to create a",
						"random {C:dark_edition}Negative{} {C:planet}Planet{} card",
						"{C:inactive}Odds improve by 1 per card{}"
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},

			j_cbean_0chill_vacation_member2 = {
				name = {"Chill Formation", "{s:0.7}InspectorB:{} {B:2,C:white,s:0.7}Gluten Ray"},
				text = {
					{
						"Can be used as a {X:green,C:white}Starter{} Card",
						"in a {C:combo}Combo{} and changes",
						"effect each use"	
					},
					{
						"Each scored {C:attention}King{} and {C:attention}2{} earns {C:money}$#8#{}",
						"Otherwise scored cards earn {C:money}$#7#{}",
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},

			j_cbean_0chill_vacation_member3 = {
				name = {"Chill Formation", "{s:0.7}MarioFan597:{} {B:1,C:white,s:0.7}Trailblazer"},
				text = {
					{
						"Can be used as a {X:green,C:white}Starter{} Card",
						"in a {C:combo}Combo{} and changes",
						"effect each use"	
					},
					{
						"If score catches fire,",
						"get a {C:combo}Turbo{} tag"
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},

			j_cbean_0chill_vacation_member4 = {
				name = {"Chill Formation", "{s:0.7}Restruct:{} {B:3,C:white,s:0.7}Metal Pipe"},
				text = {
					{
						"Can be used as a {X:green,C:white}Starter{} Card",
						"in a {C:combo}Combo{} and changes",
						"effect each use"	
					},
					{
						"{X:mult,C:white}X#5#{} Mult",
					},
					{
						"Turns {C:dark_edition}Frozen{} cards held in hand",
						"into {C:attention}Steel Cards{}"
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},

			j_cbean_0chill_vacation_member5 = {
				name = {"Chill Formation", "{s:0.7}Monachrome:{} {B:4,C:white,s:0.7}Smoke and Mirrors"},
				text = {
					{
						"Can be used as a {X:green,C:white}Starter{} Card",
						"in a {C:combo}Combo{} and changes",
						"effect each use"	
					},
					{
						"{C:red}Destroys{} unscored played cards"
					},
					{
						"Combos Into:",
						"{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
						"{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}",
					},
				},
			},

			j_cbean_0chill_zagreus                      = {
				name = { "Zagreus" },
				text = {
					{
						"Create an {C:dark_edition,E:2}Olympus Tag",
						"when {C:attention}Blind{} is defeated"
					}
				}
			},

			--Pissboys

			j_cbean_pboys_molotov                       = {
				name = "Molotov Cocktail",
				text = {
					"When {C:attention}first hand{} is played,",
					"destroy a random amount",
					"of cards {C:attention}held in hand{}",
					"{C:inactive}(Maximum of #1# cards)",
				},
			},

			j_cbean_pboys_vodka                         = {
				name = "Vodka",
				text = {
					"When {C:attention}Boss{} or {E:1,C:money}Ceo Blind{} is",
					"defeated, gain a random Tag",
					"or {C:attention}#1#{} respectively",
				},
			},

			j_cbean_pboys_shower                        = {
				name = "Golden Shower",
				text = {
					"Each {C:attention}Piss{} card",
					"earns {C:money}$#1#{} when scored",
					"or held in hand",
				},
			},

			j_cbean_pboys_hydrant                       = {
				name = "Fire Hydrant",
				text = {
					"Retrigger all",
					"played {C:attention}Piss{} cards",
				},
			},

			j_cbean_pboys_coriolis                      = {
				name = "Coriolis Effect",
				text = {
					"If played hand contains a {C:attention}#3#{},",
					"first card permamently gains {C:chips}+#1#{} Chips,",
					"last card permamently gains {C:mult}+#2#{} Mult",
				},
			},

			j_cbean_pboys_kidney                        = {
				name = "Kidney Stone",
				text = {
					"Every discarded {C:attention}Piss{} card",
					"has a {C:green}#1# in #2#{} chance to",
					"permanently get {C:red}+#3#{} Mult",
				},
			},

			j_cbean_pboys_flag_japan                    = {
				name = "Flag of Japan",
				text = {
					"{C:mult}+#1#{} Mult for each {C:attention}Enhanced{}",
					"card remaining in deck",
					"{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult)",
				},
			},

			j_cbean_pboys_restroom_closed               = {
				name = "Restroom Closed",
				text = {
					"Each {C:attention}Piss{} card",
					"held in hand",
					"gives {C:chips}+#1#{} Chips",
				},
			},

			j_cbean_pboys_yellow_snow                   = {
				name = "Yellow Snow",
				text = {
					"When any card is {C:attention}sold{},",
					"{C:attention}enchance{} a random card",
					"into a {C:attention}Piss{} Card",
				},
			},

			j_cbean_pboys_button_mashing                = {
				name = "Button Mashing",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"create a {C:combo}Combo{} card",
					"when a hand is played",
				},
			},

			j_cbean_pboys_watermelon                    = {
				name = "Watermelon",
				text = {
					"For the next {C:attention}#1#{} rounds,",
					"{C:attention}enchance{} a random card",
					"in hand into a {C:attention}Piss{} Card",
					"at end of round",
				},
			},

			j_cbean_pboys_streamer                      = {
				name = "Streamer",
				text = {
					"Earn between {C:money}$#1#{} and {C:money}$#2#{}",
					"on using a {C:attention}consumable{}, beating",
					"blind with {C:attention}one{} hand, {C:attention}Booster",
					"{C:attention}Pack{} contains a {C:attention}Rare{} Joker",
					"and duplicating {C:spectral}#3#{}",
				},
			},

			j_cbean_pboys_flame                         = {
				name = "Flama Cola",
				text = {
					"Last played {C:attention}Ace{} or {C:attention}10",
					"gives {X:mult,C:white}X#1#{} Mult",
					"when scored",
				},
			},

			j_cbean_pboys_breuhh                        = {
				name = "Breuhh Brew",
				text = {
					"Add between {C:attention}1{} and {C:attention}10{} to",
					"{C:mult}Mult{}. Lose {C:chips}Chips{} equal",
					"to the amount added",
				},
			},

			j_cbean_pboys_gfs                           = {
				name = "Liquid GFS",
				text = {
					"Each {C:attention}#2#{} held in hand",
					"gives {C:mult}+#1#{} Mult",
					"{s:0.8}rank changes every round",
				},
			},

			j_cbean_pboys_nrio                          = {
				name = "Crocodile Soda",
				text = {
					"Earn {C:money}$#1#{} at end of round",
					"Payout increases by {C:money}$#2#{} if",
					"played hand contains a {C:attention}#3#{}",
				},
			},

			j_cbean_pboys_huythekiller                  = {
				name = "HuyTheWatter",
				text = {
					"{C:attention}Retrigger{} first scoring card",
					"{C:attention}#1#{} times, reduce by {C:attention}1{} for",
					"every {C:attention}Piss{} card in scoring hand",
				},
			},

			j_cbean_pboys_pumpkinman                    = {
				name = "Pumpkin Shake",
				text = {
					"Played {C:attention}Gold{} cards give",
					"{C:mult}+#1#{} Mult and {C:money}$#2#{}",
					"when scored",
				},
			},

			j_cbean_pboys_ihaveagun                     = {
				name = "I HAVE A GUN!",
				text = {
					"Receive {C:attention}#1#%{} of lost money",
					"in {C:attention}Back Alley{} minigame",
				},
			},

			j_cbean_pboys_peashooter                    = {
				name = "Peashooter",
				text = {
					"Copies ability of",
					"{C:attention}Zombie{} to the right",
					"{C:attention}Zombie{} have #1# lives...",
				},
			},

			--THe Cold Bean
			j_cbean_coldbean                            = { -- yo mama
				name = "Cold Bean",
				text = {
					"{E:1,C:attention}you werent meant to see this....",
					"({X:mult,C:white}X#1#{} Mult)",
				},
			},
			--Yeah! Mostly Artists
			j_cbean_yma_charred_fool                    = {
				name = "Charred Fool",
				text = {
					"Upgrade every held",
					"{C:tarot}Tarot{} card",
					"at end of round",
					"{C:inactive}(If possible)"
				},
			},
			j_cbean_yma_flerp                           = {
				name = "Flerp",
				text = {
					"Adds a new {C:attention}Scoring Window{} called {C:attention}Flerp{}",
					"Hands are now calculated as:",
					"{X:dark_edition,C:white}((Chips*Flerp)*Mult)+sqrt(Flerp){}"
				},
			},
			j_cbean_yma_edward                          = {
				name = "Exponentiation Edward",
				text = {
					"{X:dark_edition,C:white}^#1#{} Mult",
					"{C:inactive}The long lost brother to the",
					"{C:inactive}hyperoperation brothers,",
					"{C:inactive}none of them knew where",
					"{C:inactive}he went after the incident"
				},
			},
			j_cbean_yma_manny                           = {
				name = "Multiplication Manny",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"{C:inactive}The distant cousin to the",
					"{C:inactive}hyperoperation brothers,",
					"{C:inactive}also the only one",
					"{C:inactive}without any arrows"
				},
			},
			j_cbean_yma_seeing_stars                    = {
				name = "Seeing Stars",
				text = {
					"Only {C:planet}Planet{} related",
					"Jokers can appear",
				},
			},
			j_cbean_yma_key_ring                        = {
				name = "Spare Key",
				text = {
					"When a {C:yma_keys}Key{} breaks",
					"have a {C:green}chance{} to get a",
					"fresh {C:attention}copy{} of it",
				},
			},
			j_cbean_yma_the_jest_around                 = {
				name = "The Jest Around",
				text = {
					"{X:mult,C:white}X#1#{} Mult for current",
					"{C:combo}Combo{} length",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)",
				},
			},
			j_cbean_yma_born_salesman                   = {
				name = "Born Salesman",
				text = {
					"{C:money}Shop{} and {C:attention}Pack{}",
					"based {C:yma_keys}Keys",
					"take no {C:dark_edition}space",
				},
			},
			j_cbean_yma_well_wrapped                    = {
				name = "Well Wrapped",
				text = {
					"When this {C:attention}Joker{} is {C:red}destroyed",
					"{C:green}#1# in #2#{} chance to create",
					"The Soul",
				},
			},
			j_cbean_yma_unicorn                         = {
				name = "Unicorn",
				text = {
					"{X:mult,C:white}X#1#{} Mult if played hand",
					"contains {C:attention}all suits"
				},
			},
			j_cbean_yma_joker_vision                    = {
				name = "Joker Vision",
				text = {
					"Leftmost {C:combo}Combo{} card",
					"{C:attention}retriggers{} twice",
				},
			},
			j_cbean_yma_set_of_dice                     = {
				name = "Set of Dice",
				text = {
					"{C:green}Probability{} is {C:attention}guaranteed",
					"for all {C:attention}#1#",
					"resets after each {C:attention}Blind{}",
				},
			},
			j_cbean_yma_yeah_mostly_artists_form0       = {
				name = {
					"FirstTry",
					"{C:legendary,s:0.7}Yeah! Mostly Artists{}",
				},
				text = {
					{
						"When a {C:attention}Blind{} is selected,",
						"this Joker changes into",
						"a random {C:legendary}Form{}",
					},
					{
						"{C:green}#1# in #2#{} chance",
						"for cards {C:attention}held in hand{}",
						"to create a {C:attention}Buffoon Tag{}",
					},
				},
			},
			j_cbean_yma_yeah_mostly_artists_form1       = {
				name = {
					"Flynn",
					"{C:legendary,s:0.7}Yeah! Mostly Artists{}",
				},
				text = {
					{
						"When a {C:attention}Blind{} is selected,",
						"this Joker changes into",
						"a random {C:legendary}Form{}",
					},
					{
						"Cards held in hand",
						"permanently gain {C:mult}+#4#{} mult",
					},
				},
			},
			j_cbean_yma_yeah_mostly_artists_form2       = {
				name = {
					"Rainstar",
					"{C:legendary,s:0.7}Yeah! Mostly Artists{}",
				},
				text = {
					{
						"When a {C:attention}Blind{} is selected,",
						"this Joker changes into",
						"a random {C:legendary}Form{}",
					},
					{
						"If played hand contains",
						"a {C:attention}#3#{}, convert",
						"all cards held in hand into",
						"the {C:attention}suit{} of first played card",
					},
				},
			},
			j_cbean_yma_yeah_mostly_artists_form3       = {
				name = {
					"cloudzXIII",
					"{C:legendary,s:0.7}Yeah! Mostly Artists{}",
				},
				text = {
					{
						"When a {C:attention}Blind{} is selected,",
						"this Joker changes into",
						"a random {C:legendary}Form{}",
					},
					{
						"If played hand contains",
						"a card with an {C:attention}Enhancement{},",
						"enhance a random",
						"card held in hand",
					},
				},
			},
			j_cbean_yma_yeah_mostly_artists_form4       = {
				name = {
					"RattlingSnow353",
					"{C:legendary,s:0.7}Yeah! Mostly Artists{}",
				},
				text = {
					{
						"When a {C:attention}Blind{} is selected,",
						"this Joker changes into",
						"a random {C:legendary}Form{}",
					},
					{
						"{C:chips}+#5#{} Chips",
						"Every {C:attention}2{} hands played,",
						"transform into a random {C:attention}Key{}"
					},
				},
			},
			j_cbean_yma_yeah_mostly_artists_form5       = {
				name = {
					"Lyre",
					"{C:legendary,s:0.7}Yeah! Mostly Artists{}",
				},
				text = {
					{
						"When a {C:attention}Blind{} is selected,",
						"this Joker changes into",
						"a random {C:legendary}Form{}",
					},
					{
						"(no effect)",
					},
				},
			},
			--Name Team
			j_cbean_nteam_self_insert                   = {
				name = "Name Team",
				text = {
					"Changes effect",
					"after defeating",
					"a {C:attention}CEO Blind",
					"{C:inactive}(Scaling of effects",
					"{C:inactive}is preserved)"
				},
			},
			j_cbean_nteam_self_insert_thunderedge       = {
				name = "ThunderEdge",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult when",
						"exchanging {C:attention}Stickers",
						"or rerolling the",
						"{C:attention}Stationery Shop",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_nteam_self_insert_revo              = {
				name = "Revo",
				text = {
					{
						"Gives {X:mult,C:white}X#1#{} Mult per {C:attention}Sticker{}",
						"applied this run",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_nteam_self_insert_dave              = {
				name = "Crazy Dave",
				text = {
					{
						"Each {C:attention}Plant Joker",
						"gives {X:mult,C:white}X#2#{} Mult",
						"Creates a {C:attention}Plant Joker{}",
						"at the end of the {C:attention}Shop{}",
						"{C:inactive}(Must have room)",
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_nteam_self_insert_ghost             = {
				name = "GhostSalt",
				text = {
					{
						"Creates a {C:dark_edition}Negative{}",
						"{C:tarot}Tarot{} card after",
						"using a {C:cbean_stickersheet}Sticker Sheet"
					},
					{
						"Gains {X:mult,C:white}X#1#{} Mult when a",
						"{C:tarot}Tarot{} card is used",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_nteam_self_insert_doggfly           = {
				name = "Doggfly",
				text = {
					{
						"{C:green}#1# in #2#{} chance to apply",
						"a {C:attention}positive Sticker{} to",
						"a random Joker at the",
						"start of the {C:attention}Shop",
						"{C:green}Numerator{} increases by {C:green}1{}",
						"per {C:attention}Plant Joker{} owned",
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_nteam_self_insert_inky              = {
				name = "Inky",
				text = {
					{
						"If played hand contains",
						"{C:attention}4{} cards, this Joker",
						"gains {X:chips,C:white}X#1#{} Chips",
						"{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)",
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_nteam_self_insert_doctor            = {
				name = "TheAlternateDoctor",
				text = {
					{
						"Gains {X:mult,C:white}X#1#{} Mult when a",
						"{C:cbean_stickersheet}Sticker Sheet{} is used",
						"At end of round, if your",
						"{C:attention}deck{} has a {C:attention}Sticker{},",
						"create a {C:cbean_stickersheet}Sticker Sheet{}",
						"{C:inactive}(Must have room)",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
					},
					{
						"Changes effect",
						"after defeating",
						"a {C:attention}CEO Blind",
						"{C:inactive}(Scaling of effects",
						"{C:inactive}is preserved)"
					},
				},
			},
			j_cbean_peashooter                          = {
				name = "Pea Shooter",
				text = {
					"{C:attention}X#1#{} Blind size"
				},
			},
			j_cbean_sunflower                           = {
				name = "Sunflower",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"give {C:money}$#3#{} at",
					"end of round"
				},
			},
			j_cbean_wallnut                             = {
				name = "Wall-Nut",
				text = {
					"Joker to the {C:attention}right{}",
					"cannot be {C:red}debuffed{}",
					"and {C:red}cannot{} have",
					"stickers"
				},
			},
			j_cbean_potatomine                          = {
				name = "Potato Mine",
				text = {
					"Sell this {C:attention}Joker{} after {C:attention}#1#{C:inactive} [#2#]",
					"rounds to {C:attention}halve{} the current",
					"{C:attention}Blind's{} required chips"
				},
			},
			j_cbean_snowpea                             = {
				name = "Snow Pea",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:green}#1# in #2#{} chance to",
					"disable current {C:attention}Blind{}"
				},
			},
			j_cbean_repeater                            = {
				name = "Repeater",
				text = {
					"{C:attention}Retrigger{} all scored",
					"cards in {C:attention}first",
					"{C:attention}hand{} of round"
				},
			},
			j_cbean_chomper                             = {
				name = "Chomper",
				text = {
					"After scoring, {C:red}destroy{}",
					"a random card in",
					"scoring hand.",
					"This Joker's destruction",
					"effect becomes inactive",
					"for {C:attention}3{C:inactive} [#1#]{} rounds",
					"after it triggers",
				},
			},
			j_cbean_puff_shroom                         = {
				name = "Puff Shroom",
				text = {
					"{X:mult,C:white}X#1#{} Mult{} if this",
					"{C:attention}Joker{} is in the {C:attention}2{}",
					"leftmost Joker slots",
				},
			},
			j_cbean_sun_shroom                          = {
				name = "Sun Shroom",
				text = {
					{
						"Earn {C:money}$#1#{} at",
						"end of round",
					},
					{
						"Becomes {C:attention}Sunnier Shroom{}",
						"after {C:attention}#2#{C:inactive} [#3#]{} rounds"
					},
				},
			},
			j_cbean_sunnier_shroom                      = {
				name = "Sunnier Shroom",
				text = {
					"{C:green}#1# in #2#{} chance to",
					"earn {C:money}$#3#{} at",
					"end of round",
					"{C:inactive,s:0.8}(This seems familiar...)"
				},
			},
			j_cbean_fume_shroom                         = {
				name = "Fume Shroom",
				text = {
					"All {C:attention}Shrooms{} to the",
					"right of this {C:attention}Joker",
					"give {X:mult,C:white}X#1#{} Mult"
				},
			},
			j_cbean_scaredy_shroom                      = {
				name = "Scaredy Shroom",
				text = {
					"{C:mult}+#1#{} Mult{} if this",
					"{C:attention}Joker{} is in the {C:attention}2{}",
					"leftmost Joker slots",
				},
			},
			j_cbean_ice_shroom                          = {
				name = "Ice Shroom",
				text = {
					"When {C:green}sold{}, the next {C:attention}#1#{}",
					"{C:attention}Blinds{} won't end until",
					"all hands are used"
				},
			},
			j_cbean_ice_lettuce                         = {
				name = "Iceberg Lettuce",
				text = {
					"When {C:green}sold{}, the next {C:attention}#1#{}",
					"{C:attention}Blind{} won't end until",
					"all hands are used"
				},
			},
			j_cbean_doom_shroom                         = {
				name = "Doom Shroom",
				text = {
					{
						"Sell {C:attention}Joker{} to set {C:attention}Blind's{}",
						"required Chips to {C:red}0",
						"If facing a {C:attention}Boss{} or {C:attention}CEO{}",
						"{C:attention}Blind{}, halve it instead",
					},
					{
						"Creates a {C:attention}Crater{}",
						"when sold"
					},
				},
			},
			j_cbean_crater                              = {
				name = "Crater",
				text = {
					"Is {C:attention}Eternal{}",
					"{C:red,E:1,s:1.1}Self destructs{} after",
					"{C:attention}#1#{C:inactive} [#2#]{} rounds"
				},
			},
			j_cbean_squash                              = {
				name = "Squash",
				text = {
					"Sell this {C:attention}Joker{} to {C:red}defeat",
					"the current {C:attention}Blind",
					"If facing a {C:attention}Boss{} or {C:attention}CEO Blind{},",
					"halve its requirement instead",
				},
			},
			j_cbean_threepeater                         = {
				name = "Threepeater",
				text = {
					{
						"{C:chips}+#1#{} Chips",
					},
					{
						"{X:mult,C:white}X#2#{} Mult",
					},
					{
						"Earn {C:money}$#3#{} at",
						"end of round"
					}
				},
			},
			j_cbean_tangle_kelp                         = {
				name = "Tangle Kelp",
				text = {
					"{C:red}Destroy{} the first",
					"played card",
					"Afterwards, {C:red}debuffs{} itself",
				},
			},
			j_cbean_jalepeno                            = {
				name = "Jalapeno",
				text = {
					"Sell this {C:attention}Joker",
					"to {C:red}destroy{} all",
					"cards in hand"
				},
			},
			j_cbean_grave_buster                        = {
				name = "Grave Buster",
				text = {
					"Sell this {C:attention}Joker",
					"to {C:red}remove{} all {C:red}Negative {C:attention}Stickers",
					"from a random {C:attention}Joker"
				},
			},
			j_cbean_boomberry                           = {
				name = "Boom Berry",
				text = {
					"Last played card",
					"gives {C:chips}+#1#{} Chips",
					"when scored",
				},
			},
			j_cbean_vamporcini                          = {
				name = "Vamporcini",
				text = {
					{
						"{C:mult}+#1#{} Mult",
					},
					{
						"{C:red}Debuffs{} itself",
						"after triggering"
					},
				},
			},
			j_cbean_chili_pepper                        = {
				name = "Chili Pepper",
				text = {
					"Sell this {C:attention}Joker{} to halve",
					"current {C:attention}Blind{} requirement,",
					"then permanently {C:red}debuff{}",
					"all cards held in hand"
				},
			},
			j_cbean_bz_button                           = {
				name = "Bzzz Button",
				text = {
					"All scored cards in the",
					"hand played {C:attention}after",
					"this {C:attention}Joker{} is sold give",
					"{X:mult,C:white}X#1#{} Mult and are destroyed",
				},
			},
			j_cbean_bun_chi                             = {
				name = "Bun Chi",
				text = {
					{
						"{C:chips}+#1#{} Chips",
					},
					{
						"After {C:attention}#4#{C:inactive} [#3#]{} triggers,",
						"{C:mult}+#2#{} Mult instead"
					},
				},
			},
			j_cbean_meteor_flower                       = {
				name = "Meteor Flower",
				text = {
					"Highest ranked scored",
					"card is {C:red}destroyed",
					"Cards adjacent to it",
					"permanently gain {C:mult}+#1#{} Mult"
				},
			},
			j_cbean_sundew_tangler                      = {
				name = "Sundew Tangler",
				text = {
					{
						"{C:attention}Playing cards",
						"{C:red}cannot{} be retriggered",
					},
					{
						"Each played card",
						"gives {C:money}$#1#{} when scored"
					},
				},
			},
			j_cbean_bean_sprout                         = {
				name = "Bean Sprout",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Highest ranked card",
						"in played hand gives",
						"{X:mult,C:white}X#2#{} Mult when scored"
					},
				},
			},
			j_cbean_night_cap                           = {
				name = "Night Cap",
				text = {
					{
						"All other {C:attention}Jokers{} lose",
						"{C:red}$1{} of sell value at",
						"end of round",
					},
					{
						"This Joker gains {X:mult,C:white}X#2#{} Mult",
						"per {C:attention}Joker{} it affects",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
					},
				},
			},
			j_cbean_bamboo_spartan                      = {
				name = "Bamboo Spartan",
				text = {
					{
						"After final {C:red}discard{} of round,",
						"gains {C:chips}Chips{} equal to",
						"the sum of the ranks",
						"of all cards in hand",
						"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
					},
					{
						"Gains {C:attention}twice{} as many {C:blue}Chips",
						"if you have {C:attention}1{} hand remaining",
					},
				},
			},
			j_cbean_sea_flora                           = {
				name = "Sea Flora",
				text = {
					"{C:chips}+#1#{} Chips for",
					"each {C:attention}Joker{} to the",
					"left of this {C:attention}Joker",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
				},
			},
			j_cbean_bud_uh_boom                         = {
				name = "Bud'uh Boom",
				text = {
					{
						"Sell this {C:attention}Joker",
						"to instantly defeat",
						"the current {C:attention}Blind{}",
					},
					{
						"If sold, {C:attention}Jokers{} have",
						"a {C:green}1 in 3{} chance to",
						"not trigger until the",
						"next {C:attention}Blind{} is defeated"
					},
				},
			},
			j_cbean_cran_jelly                          = {
				name = "Cran Jelly",
				text = {
					"Scored cards are",
					"retriggered {C:attention}#1#{} times",
					"{C:green}#2# in #3#{} chance",
					"each played card",
					"to be {C:red}destroyed{}"
				},
			},
			j_cbean_maybee                              = {
				name = "Maybee",
				text = {
					"On final {C:blue}hand{} of",
					"round, {C:attention}3{} random",
					"scored cards",
					"give {X:mult,C:white}X#1#{} Mult"
				},
			},
			j_cbean_tomb_tangler                        = {
				name = "Tomb Tangler",
				text = {
					"Sell this {C:attention}Joker",
					"to {C:red}remove{} all {C:attention}Stickers",
					"from a random {C:attention}Joker",
					"and give it {C:dark_edition}Negative{}"
				},
			},
			j_cbean_tallnut                             = {
				name = "Tall-Nut",
				text = {
					{
						"Future cards can have",
						"at most {C:attention}1{} Sticker",
					},
					{
						"Cards {C:red}cannot{} be debuffed"
					},
				},
			},
			j_cbean_spikeweed                           = {
				name = "Spikeweed",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Scored cards",
						"lose {C:chips}-#1#{} Chips",
					},
					{
						"Destroy scored cards",
						"if their total",
						"Chip value becomes",
						"{C:attention}0{} or less"
					},
				},
			},
			j_cbean_iceweed                             = {
				name = "Iceweed",
				text = {
					{
						"Scored cards gain",
						"{X:mult,C:white}X#1#{} Mult permanently",
						"but lose {C:chips}-1{} Chip",
					},
					{
						"{C:red}Destroys{} scored cards if",
						"their total {C:chips}Chips{} value",
						"becomes {C:attention}0{} or less"
					},
				},
			},
			j_cbean_blover                              = {
				name = "Blover",
				text = {
					{
						"Cards {C:red}cannot{} score",
					},
					{
						"Gains {X:mult,C:white}X#2#{} Mult for",
						"each card that",
						"would have scored",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
					},
				},
			},
			j_cbean_sea_shroom                          = {
				name = "Sea Shroom",
				text = {
					"{X:mult,C:white}X#1#{} Mult if this",
					"{C:attention}Joker{} is your",
					"{C:attention}leftmost{} Joker"
				},
			},
			j_cbean_split_pea                           = {
				name = "Split Pea",
				text = {
					"{X:mult,C:white}X#1#{} Mult if this {C:attention}Joker{}",
					"is closer to the left",
					"of your {C:attention}Joker{} area,",
					"{C:mult}+#2#{} Mult otherwise"
				},
			},
			j_cbean_starfruit                           = {
				name = "Starfruit",
				text = {
					"{C:red}+#5#{} discards each round",
					"{C:mult}+#2#{} Mult, {C:chips}+#1#{} Chips, {X:mult,C:white}X#3#{} Mult",
					"Earn {C:money}$#4#{} at end of round"
				},
			},
			j_cbean_pumpkin                             = {
				name = "Pumpkin",
				text = {
					"{C:attention}Joker to the {C:attention}left",
					"cannot be {C:attention}flipped{} or {C:red}debuffed{}",
					"{C:red}Self-destructs{} after preventing",
					"{C:attention}#1#{C:inactive} [#2#]{} flips or debuffs"
				},
			},
			j_cbean_magnet_shroom                       = {
				name = "Magnet Shroom",
				text = {
					{
						"Removes {C:attention}Gold{} and {C:attention}Steel{}",
						"from all scored cards",
						"Gains {X:mult,C:white}X#2#{} Mult per",
						"removed enhancement",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)",
					},
					{
						"Earn {C:money}$#3#{} at end of round",
					},
				},
			},
			j_cbean_flower_pot                          = {
				name = "Flower Pot",
				text = {
					"{X:mult,C:white}X#1#{} Mult if scored",
					"hand contains one",
					"card of each suit"
				},
			},
			j_cbean_cabbage_pult                        = {
				name = "Cabbage Pult",
				text = {
					"Played card with",
					"the highest rank",
					"gives {C:mult}+#1#{} Mult",
					"when scored",
				},
			},
			j_cbean_coffee_bean                         = {
				name = "Coffee Bean",
				text = {
					"Retrigger the {C:attention}Joker",
					"to the right {C:attention}#1#{} time",
					"Retrigger it {C:attention}#2#{} times",
					"instead if it",
					"is a {C:attention}Shroom",
				},
			},
			j_cbean_plantern                            = {
				name = "Plantern",
				text = {
					{
						"{C:attention}Shows{} the next ",
						"{C:attention}#1#{} cards in deck",
						"<-1 -- #2#->"
					},
					{
						"Cards {C:red}cannot{} be flipped",
					},
				},
			},
			j_cbean_plantern_collection                 = {
				name = "Plantern",
				text = {
					{
						"{C:attention}Shows{} the next ",
						"{C:attention}#1#{} cards in deck",
						"{C:inactive}(Doesn't show cards",
						"{C:inactive}in the collection)"
					},
					{
						"Cards {C:red}cannot{} be flipped",
					},
				},
			},
			j_cbean_cactus                              = {
				name = "Cactus",
				text = {
					"If played hand contains",
					"more than {C:attention}1{} scoring card,",
					"a {C:attention}random{} scoring card",
					"{C:red}doesn't{} trigger and this",
					"{C:attention}Joker{} gains {X:mult,C:white}X#2#{} Mult",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
				},
			},
			j_cbean_garlic                              = {
				name = "Garlic",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"{C:attention}Shuffles{} 2 random",
						"{C:attention}Jokers{} before scoring"
					},
				},
			},
			j_cbean_umbrella_leaf                       = {
				name = "Umbrella Leaf",
				text = {
					"{C:attention}Jokers{} to the {C:attention}left{} and",
					"{C:attention}right{} of this {C:attention}Joker",
					"cannot be {C:red}debuffed{} or {C:attention}flipped{}"
				},
			},
			j_cbean_marigold                            = {
				name = "Marigold",
				text = {
					"At end of round,",
					"randomly gives",
					"{C:money}+$#1#{}, {C:money}+$#2#{} or{C:money} +$#3#"
				},
			},
			j_cbean_melon_pult                          = {
				name = "Melon Pult",
				text = {
					{
					"{X:mult,C:white}X#1#{} Mult",
					},
					{
					"Adjacent {C:attention}Jokers{} give",
					"{C:mult}+#2#{} Mult"
					},
				},
			},
			j_cbean_twin_sunflower                      = {
				name = "Twin Sunflower",
				text = {
					"Earn {C:money}$#1#{} when",
					"hand is played"
				},
			},
			j_cbean_kernel_pult                         = {
				name = "Kernel Pult",
				text = {
					{
						"Scored cards",
						"give {C:mult}+#3#{} Mult,",
					},
					{
						"{C:green}#1# in #2#{} chance to",
						"{C:red}debuff{} scored cards",
						"until the end",
						"of the {C:attention}Ante{}"
					},
				},
			},
			j_cbean_hypno_shroom                        = {
				name = "Hypno Shroom",
				text = {
					{
						"Scored cards",
						"give {C:mult}+#1#{} Mult",
					},
					{
						"Mult increases by {C:mult}+#2#{}",
						"when a {C:attention}Boss Blind{}",
						"is triggered"
					},
				},
			},
			j_cbean_golden_magnet                       = {
				name = "Golden Magnet",
				text = {
					"Cashout is {C:red}halved{}",
					"Gains {X:mult,C:white}X#2#{} Mult",
					"per removed {C:attention}${}",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
				},
			},
			j_cbean_winter_melon                        = {
				name = "Winter Melon",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Adjacent {C:attention}Jokers{} give {X:mult,C:white}X#4#{} Mult",
						"but are {C:red}debuffed{}",
						"This value increases",
						"by {X:mult,C:white}X#3#{} Mult when this",
						"{C:attention}Joker{} is triggered"
					},
				},
			},
			j_cbean_spikerock                           = {
				name = "Spikerock",
				text = {
					{
						"Scored cards give",
						"{X:mult,C:white}X#1#{} Mult but",
						"permanently lose {C:red}-1{} Chip",
					},
					{
						"Destroy scored cards if",
						"their {C:attention}total{} Chip value",
						"is {C:attention}0{} or less"
					},
				},
			},
			j_cbean_imitater                            = {
				name = "Imitater",
				text = {
					"{C:attention}Transforms{} into the",
					"last {C:green}bought{} {C:attention}Joker{}",
					"when obtained"
				},
			},
			j_cbean_gloom_shroom                        = {
				name = "Gloom Shroom",
				text = {
					"Adjacent {C:attention}Jokers{} and",
					"all played and",
					"scored cards give",
					"{X:mult,C:white}X#1#{} Mult when scored"
				},
			},
			j_cbean_cattail                             = {
				name = "Cattail",
				text = {
					"If played hand has",
					"{C:attention}2{} or more cards,",
					"its {C:attention}first{} and {C:attention}last{} cards",
					"don't trigger and this",
					"{C:attention}Joker{} gains {X:mult,C:white}X#2#{} mult",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
				},
			},
			j_cbean_gatling_pea                         = {
				name = "Gatling Pea",
				text = {
					"First {C:attention}4{} scored cards",
					"are retriggered {C:attention}#1#{} times"
				},
			},
			j_cbean_cob_cannon                          = {
				name = "Cob Cannon",
				text = {
					"Stores every {C:chips}+Chips{} outcome",
					"from {C:attention}Jokers, gives",
					"stored {C:chips}+Chips{} on",
					"{C:attention}final hand{} of round",
					"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}"
				},
			},
			j_cbean_bloomerang                          = {
				name = "Bloomerang",
				text = {
					"If played hand has",
					"{C:attention}2{} or more cards, {C:attention}retrigger{}",
					"the {C:attention}first{} scored card",
					"when the {C:attention}last{} is scored"
				},
			},
			j_cbean_snap_dragon                         = {
				name = "Snap Dragon",
				text = {
					"When a card is scored,",
					"it and its adjacent cards",
					"give {C:mult}+#1#{} Mult"
				},
			},
			j_cbean_coconut_cannon                      = {
				name = "Coconut Cannon",
				text = {
					"On final hand of round,",
					"retrigger adjacent {C:attention}Jokers{}"
				},
			},
			j_cbean_bonk_choy                           = {
				name = "Bonk Choy",
				text = {
					"When the {C:attention}lowest{} ranked",
					"card in played hand is",
					"scored, adjacent cards",
					"give {X:mult,C:white}X#1#{} Mult"
				},
			},
			j_cbean_spring_bean                         = {
				name = "Spring Bean",
				text = {
					"First played card",
					"counts as the",
					"{C:attention}suits{} of all other",
					"played and scored cards"
				},
			},
			j_cbean_pea_pod                             = {
				name = "Pea Pod",
				text = {
					"Destroy any other",
					"obtained {C:attention}Pea Pods{}",
					"Gains {C:mult}+#2#{} Mult per",
					"{C:attention}Pea Pod{} destroyed",
					"{C:inactive,s:0.8}(Can always spawn)",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
				},
			},
			j_cbean_lightning_reed                      = {
				name = "Lightning Reed",
				text = {
					"This and all {C:attention}Jokers{}",
					"to the right give {X:mult,C:white}X#1#{} Mult",
					"{X:mult,C:white}XMult{} for each {C:attention}Joker{} is",
					"reduced by {C:attention}25%{} for each",
					"{C:attention}Joker{} to the left",
					"{C:inactive}(Ex: X2, X1.5, X1.12, etc.)"
				},
			},
			j_cbean_hot_potato                          = {
				name = "Hot Potato",
				text = {
					"When {C:green}sold{}, {C:attention}Undebuffs{}",
					"{C:attention}2{} highlighted {C:attention}Jokers{}",
					"{C:inactive}I think this guy",
					"{C:inactive}is in the wrong mod"
				},
			},
			j_cbean_robotga                             = {
				name = "Rotobaga",
				text = {
					"Each scored card",
					"gives {C:chips}+#1#{} Chips"
				},
			},
			j_cbean_gold_leaf                           = {
				name = "Gold Leaf",
				text = {
					{
						"Earn {C:money}$#1#{} at",
						"end of round",
					},
					{
						"{C:inactive}(Cannot appear {C:dark_edition}Negative{C:inactive})"
					},
				},
			},
			j_cbean_stunion                             = {
				name = "Stunion",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Scored cards are",
						"debuffed until the",
						"end of the ante"
					},
				},
			},
			j_cbean_chard_guard                         = {
				name = "Chard Guard",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"First 3 scored cards",
						"are debuffed for", "the rest of the ante"
					},
				},
			},
			j_cbean_pepper_pult                         = {
				name = "Pepper Pult",
				text = {
					"{C:attention}Undebuff{} all debuffed",
					"cards before scoring",
					"Gains {C:mult}+#2#{} Mult per",
					"undebuffed card",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
				},
			},
			j_cbean_bean                                = {
				name = "Chilli Bean",
				text = {
					"When {C:green}sold{} in a blind",
					"disable the current blind",
					"but makes cards {C:red}unable",
					"to score"
				},
			},
			j_cbean_red_stinger                         = {
				name = "Red Stinger",
				text = {
					"Gives {X:mult,C:white}X#2#{} {C:red}less{} Mult",
					"for every {C:attention}Joker{} to",
					"the left of this card.",
					"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
				},
			},
			j_cbean_AKKE                                = {
				name = "A.K.E.E.",
				text = {
					"All {C:attention}Jokers{} on the right",
					"of this card give {C:mult}+#1#{} Mult",
					"if they are triggered",
					"{C:attention}during{} scoring"
				},
			},
			j_cbean_endurian                            = {
				name = "Endurian",
				text = {
					"Lose {C:mult}-#2#{} Mult",
					"when a card is sold",
					"or destroyed",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
				},
			},
			j_cbean_stallia                             = {
				name = "Stallia",
				text = {
					{
						"{C:mult}+#1#{} Mult",
					},
					{
						"First {C:attention}3{} scored cards",
						"cannot {C:attention}score{}"
					},
				},
			},
			j_cbean_laser_bean                          = {
				name = "Laser Bean",
				text = {
					"Scored cards give {C:mult}+#1#*N{} Mult",
					"where {C:attention}N{} is the number of",
					"cards on their right",
					"{C:inactive,s:0.9}(ex: First card in a hand{}",
					"{C:inactive,s:0.9}of five cards would{}",
					"{C:inactive,s:0.9}get +#2# Mult when scored){}"
				},
			},
			j_cbean_citron                              = {
				name = "Citron",
				text = {
					"{C:chips}+#1#{} Chips",
					"on the final hand",
					"of the round"
				},
			},
			j_cbean_infinut                             = {
				name = "Infi-Nut",
				text = {
					"Lose {C:mult}-#2#{} Mult",
					"when triggered.",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
					"{C:inactive}(Resets when Mult hits {C:red}0{C:inactive})"
				},
			},
			j_cbean_tile_turnip                         = {
				name = "Tile Turnip",
				text = {
					"{C:attention}Retrigger{} the {C:attention}Joker{}",
					"on the right {C:attention}#1#{} Time",
					"if the {C:attention}Joker{} on",
					"the left triggeres"
				},
			},
			j_cbean_EM_peach                            = {
				name = "E.M. Peach",
				text = {
					{
						"All playing cards",
						"are {C:red}debuffed{}",
					},
					{
						"{C:red}Debuffed{} cards",
						"give {X:mult,C:white}X#1#{} Mult"
					},
				},
			},
			j_cbean_magnifying_grass                    = {
				name = "Magnifying Grass",
				text = {
					"Gains {X:mult,C:white}X#3#{} Mult",
					"when given {C:money}$#1#{}",
					"{C:inactive,s:0.9}(Resets each round)",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
				},
			},
			j_cbean_sun_bean                            = {
				name = "Sun Bean",
				text = {
					"Get a {C:attention}Sun Bean{} tag",
					"and increase it's value",
					"depending on the current",
					"{C:attention}Blind{} when sold",
					"{C:inactive,s:0.8}(e.g Small Blind = 6, Big Blind = 12)"
				},
			},
			j_cbean_phat_beet                           = {
				name = "Phat Beet",
				text = {
					"Scored cards and",
					"triggered adjacent",
					"{C:attention}Jokers{} give {C:mult}+#1#{} Mult"
				},
			},
			j_cbean_intensive_carrot                    = {
				name = "Intensive Carrot",
				text = {
					"When sold, creates",
					"a random previously",
					"sold {C:attention}Joker{}"
				},
			},
			j_cbean_thyme_warp                          = {
				name = "Thyme Warp",
				text = {
					"When sold during",
					"{C:attention}Blind{} select, go back",
					"a {C:attention}Blind{} and {C:attention}Round{}",
					"{C:inactive}(Cannot go back an ante)"
				},
			},
			j_cbean_celery_stalker                      = {
				name = "Celery Stalker",
				text = {
					{
						"Joker on the {C:attention}left{} has",
						"{C:red}halved{} values",
					},
					{
						"Joker on the {C:attention}right{} has",
						"{C:green}doubled{} values"
					},
				},
			},
			j_cbean_primal_sunflower                    = {
				name = "Primal Sunflower",
				text = {
					"Earn {C:money}$#1#{} at",
					"end of round"
				},
			},
			j_cbean_primal_wallnut                      = {
				name = "Primal Wall-nut",
				text = {
					{
						"Jokers cannot",
						"be debuffed",
					},
					{
						"{C:red,E:1,s:1.1}Self destruct{} after",
						"{C:attention}#1#{C:inactive} [#2#]{} antes"
					},
				},
			},
			j_cbean_primal_potato                       = {
				name = "Primal Potato",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Sell while in {C:attention}Blind{}",
						"to destroy cards",
						"held in hand"
					},
				},
			},
			j_cbean_guacodile                           = {
				name = "Guacodile",
				text = {
					{
						"{C:mult}+#1#{} Mult",
					},
					{
						"Sell in {C:attention}Blind",
						"to reduce current",
						"requirement by",
						"(Small Blind Chips)/2",
						"{C:inactive}(Reducing by: {C:attention}#2#{C:inactive})"
					},
				},
			},
			j_cbean_bowling_bulb                        = {
				name = "Bowling Bulb",
				text = {
					{
						"First scored card",
						"gives {C:chips}+#3#{} Chips"
					},
					{
						"Second scored card",
						"gives {C:mult}+#2#{} Mult",
					},
					{
						"Third scored card",
						"gives {X:mult,C:white}X#1#{} Mult",
					},
				},
			},
			j_cbean_banana_launcher                     = {
				name = "Banana Launcher",
				text = {
					"First scored card",
					"gives {X:mult,C:white}X#1#{} Mult",
					"and gets debuffed",
					"for {C:attention}3{} rounds"
				},
			},
			j_cbean_moonflower                          = {
				name = "Moonflower",
				text = {
					"Earn {C:money}+$#1#{} at",
					"end of round,",
					"earn an extra {C:money}+$1{}",
					"for every owned {C:dark_edition}Shadow{} {C:attention}Joker",
				},
			},
			j_cbean_shadow_shroom                       = {
				name = "Shadow Shroom",
				text = {
					"Sell this card while",
					"in a {C:attention}Blind{} to reduce",
					"{C:attention}Blind's{} chips by {C:dark_edition}#1#%{}",
					"for each hand left"
				},
			},
			j_cbean_dusk_lobber                         = {
				name = "Dusk Lobber",
				text = {
					"A random scored",
					"card gives {X:mult,C:white}X#1#{} Mult"
				},
			},
			j_cbean_primal_peashooter                   = {
				name = "Primal Peashooter",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"{C:attention}1{} random {C:attention}Joker{}",
						"is {C:attention}shuffled",
						"before scoring"
					},
				},
			},
			j_cbean_perfume_shroom                      = {
				name = "Perfume Shroom",
				text = {
					"Reduce the next {C:attention}Blind's{}",
					"requirements by {C:attention}#2#%{}",
					"when the current",
					"{C:attention}Blind{} is triggered",
					"{C:inactive}(Currently reducing {C:attention}#1#%{C:inactive})"
				},
			},
			j_cbean_nightshade                          = {
				name = "Nightshade",
				text = {
					"Destroy the first scoring",
					"card and add half of its",
					"{C:chips}Chip{} value as {C:mult}Mult{}",
					"to this card",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
				},
			},
			j_cbean_grimrose                            = {
				name = "Grimrose",
				text = {
					"When this card is {C:green}sold",
					"{C:red}destroy{} a random card",
					"from the {C:attention}next{} scoring",
					"hand and {C:green}level up{} the",
					"played hand"
				},
			},
			j_cbean_homing_thistle                      = {
				name = "Homing Thistle",
				text = {
					"First scored card",
					"gives {C:chips}+#1#{} Chips"
				},
			},
			j_cbean_ghost_pepper                        = {
				name = "Ghost Pepper",
				text = {
					{
						"All scored cards",
						"give {C:chips}+#1#{} Chips",
					},
					{
						"{C:red,E:1,s:1.1}Self destructs{} after",
						"{C:attention}#3#{C:inactive} (#2#){} rounds"
					},
				},
			},
			j_cbean_sweet_potato                        = {
				name = "Sweet Potato",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"Playing card scoring",
						"order is {C:dark_edition}randomized{}"
					},
				},
			},
			j_cbean_sap_fling                           = {
				name = "Sap-fling",
				text = {
					"{C:attention}Playing cards",
					"are instead scored",
					"{C:attention}after{} Jokers"
				},
			},
			j_cbean_lava_guava                          = {
				name = "Lava Guava",
				text = {
					{
						"Sell to defeat",
						"current {C:attention}Blind{}",
					},
					{
						"Leaves behind {C:attention}Lava{}",
						"when sold"
					},
				},
			},
			j_cbean_lava                                = {
				name = "Lava",
				text = {
					"Is {C:attention}Eternal{}",
					"{C:red,E:1,s:1.1}Self destructs{} after",
					"{C:attention}#1#{C:inactive} [#2#]{} rounds"
				},
			},
			j_cbean_fire_peashooter                     = {
				name = "Fire Peashooter",
				text = {
					"First scored card",
					"is retriggered {C:attention}#1#{} times",
					"but destroyed afterwards"
				},
			},
			j_cbean_shrinking_violet                    = {
				name = "Shrinking Violet",
				text = {
					"Most {C:attention}consumables{} can now",
					"affect {C:green}double{} the cards"
				},
			},
			j_cbean_electric_currant                    = {
				name = "Electric Currant",
				text = {
					"Cards between your",
					"scored {C:attention}Leftmost{}",
					"and {C:attention}Rightmost{}",
					"cards give {C:mult}+#1#{} Mult"
				},
			},
			j_cbean_kiwibeast                           = {
				name = "Kiwibeast",
				text = {
					"This Joker gains {X:mult,C:white}X#2#{} Mult",
					"every {C:attention}#1#{} hands you",
					"don't defeat a {C:attention}Blind",
					"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
				},
			},
			j_cbean_power_lily                          = {
				name = "Power Lily",
				text = {
					"{C:attention}Doubles{} the values",
					"of the card on the right",
					"for {C:attention}2{} rounds when {C:green}sold{}"
				},
			},
			j_cbean_toad_stool                          = {
				name = "Toad Stool",
				text = {
					"If played hand only",
					"has {C:attention}1{} card,",
					"destroy it",
					"and gain {C:money}$#1#{}"
				},
			},
			j_cbean_straw_burst                         = {
				name = "Strawburst",
				text = {
					"After {C:attention}2{} {C:blue}Hands{}",
					"gives {C:chips}+#2#{} Chips",
					"{C:inactive}(Currently {C:blue}#1#{C:inactive} Hands played)"
				},
			},
			j_cbean_electric_blueberry                  = {
				name = "Electric Blueberry",
				text = {
					"{C:attention}Retrigger{} a random",
					"scoring card",
					"{C:attention}#1#{} times"
				},
			},
			j_cbean_jack_o_lantern                      = {
				name = "Jack O' Lantern",
				text = {
					{
						"Scored cards",
						"give {X:mult,C:white}X#2#{} Mult",
					},
					{
						"{C:green}#3# in #4#{} chance scored",
						"cards get destroyed",
					},
					{
						"After {C:attention}#1#{} hands,",
						"{C:red}debuffs{} itself",
						"for {C:attention}#5#{} hands"
					},
				},
			},
			j_cbean_grapeshot                           = {
				name = "Grapeshot",
				text = {
					"{C:green}Sell{} this card to",
					"{C:red}destroy{} {C:attention}#1#{} random",
					"cards in hand",
				},
			},
			j_cbean_cold_snapdragon                     = {
				name = "Cold Snapdragon",
				text = {
					"First 3 scoring cards",
					"give {X:chips,C:white}X#1#{} Chips but are",
					"{C:red}debuffed{} for current",
					"{C:attention}Ante{} afterwards"
				},
			},
			j_cbean_escape_root                         = {
				name = "Escape Root",
				text = {
					{
						"{C:mult}+#1#{} Mult",
					},
					{
						"Changes places",
						"before scoring"
					},
				},
			},
			j_cbean_gold_bloom                          = {
				name = "Gold Bloom",
				text = {
					"Sell this to get",
					"{C:money}$#1#{} per {C:attention}Jokers{}",
					"owned"
				},
			},
			j_cbean_wasabi_whip                         = {
				name = "Wasabi Whip",
				text = {
					"{C:attention}Leftmost{} and {C:attention}Rightmost{}",
					"scoring cards give",
					"{X:mult,C:white}X#1#{} Mult but have",
					"a {C:green}#2# in #3#{} chance",
					"to get {C:red}destroyed"
				},
			},
			j_cbean_apple_mortar                        = {
				name = "Apple Mortar",
				text = {
					"Last 3 cards in scoring",
					"gives {C:mult}+#1#{} Mult",
					"{C:green}#2# in #3#{} Chance",
					"to cause them to",
					"not score at all"
				},
			},
			j_cbean_witch_hazel                         = {
				name = "Witch Hazel",
				text = {
					"After scoring",
					"{C:attention}transform{} a random",
					"scored card to {C:attention}another",
					"scored card"
				},
			},
			j_cbean_parsnip                             = {
				name = "Parsnip",
				text = {
					{
						"First card gains",
						"{C:chips}+#1#{} Chips when scored",
					},
					{
						"{C:green}#2# in #3#{} chance to",
						"instead {C:red,E:1,s:1.1}self destruct{} ",
						"and add {C:chips}+#4#{} Bonus chips",
						"to other scored cards",
					},
				},
			},
			j_cbean_missle_toe                          = {
				name = "Missle Toe",
				text = {
					"Last {C:attention}highlighted{} card",
					"{C:attention}before{} hand is played",
					"gives {X:mult,C:white}X#1#{} Mult",
					"Any other card",
					"{C:red}will not{} score"
				},
			},
			j_cbean_cauli_power                         = {
				name = "Cauli Power",
				text = {
					{
						"If a Blind is defeated",
						"in a {C:attention}single{} hand,",
						"{:green}store{} its required chips",
						"{C:inactive}(Stored: {C:chips}#3#{C:inactive} Chips)"
					},
					{
						"When a {:attention}Blind{} is selected,",
						"{C:green}#1# in #2#{} Chance to {C:red}remove{}",
						"the {C:chips}stored chips{} from",
						"the current blind's required chips",
					}
				},
			},
			j_cbean_electric_peashooter                 = {
				name = "Electric Peashooter",
				text = {
					"All cards to the",
					"right of this",
					"gives {C:mult}+#1#{} Mult"
				},
			},
			j_cbean_holly_barrier                       = {
				name = "Holly Barier",
				text = {
					"For the next {C:attention}#1#{C:inactive} (#2#){} Hands",
					"create a {C:dark_edition}Negative{}",
					"{C:attention}Holly{} Projectile",
					"with a random effect"
				},
			},
			-- projectiles
			j_cbean_holly_projectile                    = {
				name = "Holly Projectile",
				text = {
					"When added to deck",
					"obtains a random ability",
				},
			},
			j_cbean_holly_projectile_mult               = {
				name = "Holly Projectile",
				text = {
					"{C:mult}+#1#{} Mult"
				},
			},
			j_cbean_holly_projectile_chips              = {
				name = "Holly Projectile",
				text = {
					"{C:chips}+#1#{} Chips"
				},
			},
			j_cbean_holly_projectile_dollars            = {
				name = "Holly Projectile",
				text = {
					"{C:money}+$#1#{} after",
					"every round"
				},
			},
			--

			j_cbean_zoybean_pod                         = {
				name = "Zoybean Pod",
				text = {
					"Every {C:attention}#2#{C:inactive} (#1#){} Hands",
					"add a random {C:attention}Zomboid{}",
					"card to your deck"
				},
			},
			-- zomboids
			j_cbean_basic_z                             = {
				name = "Basiz Zomboid",
				text = {
					"{C:mult}+#1#{} Mult"
				},
			},
			j_cbean_carrot_z                            = {
				name = "Carrothead Zomboid",
				text = {
					"{C:chips}+#1#{} Chips"
				},
			},
			j_cbean_melon_z                             = {
				name = "Melonhead Zomboid",
				text = {
					"{X:mult,C:white}X#1#{} Mult"
				},
			},
			--

			["j_cbean_electrici-tea"]                   = {
				name = "Electrici-tea",
				text = {
					{
						"Sell while in",
						"{C:attention}Blind{} to defeat it",
					},
					{
						"{C:red}Debuffs{} adjacent",
						"{C:attention}Jokers{} for {C:attention}1{} round",
						"when sold"
					},
				},
			},

			j_cbean_sling_pea                           = {
				name = "Sling-Pea",
				text = {
					"Scored Cards",
					"give {C:mult}+#1#{} Mult",
					"{C:mult}-#2#{} Mult per trigger"
				},
			},

			j_cbean_pea_vine                            = {
				name = "Pea Vine",
				text = {
					"Multiply all values",
					"of {C:attention}Pea Jokers",
					"by {C:attention}X#1#",
					"{C:inactive}(Pea Vine excluded)"
				},
			},

			j_cbean_power_vine                          = {
				name = "Power Vine",
				text = {
					{
						"Every owned {C:green}Electric{}",
						"{C:attention}Jokers{}'s values are",
						"multiplied by {C:attention}X#1#{}",
						"{C:inactive}(Power Vine excluded)"
					},
					{
						"Playing Cards",
						"{C:red}cannot{} retrigger",
					},
				},
			},

			j_cbean_blastberry_vine                     = {
				name = "Blastberry Vine",
				text = {
					{
						"During scoring, triggered",
						"{C:attention}Jokers{} to the right",
						"of this gives {C:mult}+#1#{} Mult",
					},
				},
			},

			j_cbean_pyre_vine                           = {
				name = "Pyre Vine",
				text = {
					{
						"During scoring, triggered",
						"{C:attention}Jokers{} to the right",
						"of this gives {C:chips}+#1#{} Chips",
					},
				},
			},
			j_cbean_shine_vine                          = {
				name = "Shine Vine",
				text = {
					{
						"Earn {C:money}$#1#{} after every round",
						"and an extra {C:money}$1{} for every",
						"{C:attention}Joker{} right of this {C:attention}Joker{}",
						"{C:inactive}(Currently {C:money}$#2#{C:inactive})"
					},
				},
			},
			j_cbean_explode_o_vine                      = {
				name = "Explode-O-Vine",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"{C:red,E:1,s:1.1}Self destructs{} after",
						"{C:attention}#2#{C:inactive} (#3#){} Rounds",
					},
				},
			},
			j_cbean_gloom_vine                          = {
				name = "Gloom Vine",
				text = {
					{
						"{C:chips}+#1#{} Chips for every",
						"shadow plant owned",
						"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
					},
				},
			},
			j_cbean_murkadamia                          = {
				name = "Murkadamia Nut",
				text = {
					"Gains {C:mult}+#2#{} Mult",
					"for each card scored",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
				},
			},
			j_cbean_ultomato                            = {
				name = "Ultomato",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
					"Future copies of this",
					"card gain {X:mult,C:white}X1{} Mult"
				},
			},

			j_cbean_ice_bloom                           = {
				name = "Ice Bloom",
				text = {
					{
					"Scored cards give",
					"{X:mult,C:white}X#1#{} Mult",
					},
					{
					"Scored cards have a",
					"{C:green}#2# in #3#{} chance to be",
					"{C:red}debuffed{} permanently"
					},
				},
			},

			j_cbean_tumbleweed                          = {
				name = "Tumbleweed",
				text = {
					"Scored cards have a {C:green}#2# in #3#{}",
					"chance to retrigger",
					"{C:attention}#1#{} additional times",
					"Otherwise, they don't",
					"trigger at all"
				},
			},

			j_cbean_pokra                               = {
				name = "Pokra",
				text = {
					{
						"First scored card",
						"gives {X:mult,C:white}X#1#{} Mult",
					},
					{
						"Every {C:attention}#3#{} {C:inactive}(#2#){} triggers",
						"every played card gives",
						"{X:mult,C:white}X#1#{} Mult"
					},
				},
			},

			j_cbean_dazey_chain                         = {
				name = "Dazey Chain",
				text = {
					{	
						"{C:chips}+#1#{} Chips",
					},
					{
						"After 2 rounds, starts",
						"giving {C:mult}+#2#{} Mult",
					},
					{
						"After 5 rounds, starts",
						"giving {X:mult,C:white}X#3#{} Mult",
						"{C:inactive}(Rounds: #4#, Stage: #5#)"
					},
				},
			},
			j_cbean_imp_pear                            = {
				name = "Imp Pear",
				text = {
					"Sell this {C:attention}Joker{} to reduce the",
					"current {C:attention}Blind{}'s requirement by",
					"this {C:attention}Ante's{} {C:attention}Big Blind{} requirement",
				},
			},

			j_cbean_dartichoke                          = {
				name = "Dartichoke",
				text = {
					"Highest ranked card",
					"gives twice its rank as",
					"Chips when scored",
				},
			},
			j_cbean_gumnut                              = {
				name = "Gumnut",
				text = {
					"When {C:green}sold{}, next {C:attention}#2#{} Blind",
					"wont end until all",
					"hands are used"
				},
			},
			j_cbean_puffball                            = {
				name = "Puffball",
				text = {
					"Scored cards between",
					"{C:attention}Leftmost{} and {C:attention}Rightmost{}",
					"give {X:mult,C:white}X#1#{} Mult but have",
					"a {C:green}#2# in #3#{} chance to",
					"get {C:red}destroyed{}"
				},
			},
			j_cbean_olive_pit                           = {
				name = "Olive Pit",
				text = {
					"When a {C:attention}Jokers{} is sold",
					"this card gains {C:attention}1/20{} of",
					"its sell value as {X:mult,C:white}XMULT",
					"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
				},
			},
			j_cbean_turkey_pult                         = {
				name = "Turkey Pult",
				text = {
					"When a {C:attention}Blind{}",
					"is selected, create",
					"a {C:attention}Tofu Turkey{}"
				},
			},
			j_cbean_tofu_turkey                         = {
				name = "Tofu Turkey",
				text = {
					{
						"{C:chips}+#1#{} Chips",
					},
				},
			},
			j_cbean_boingsetta                          = {
				name = "Boingsetta",
				text = {
					"Scored cards gain",
					"{X:mult,C:white}X#1#{} permanent Mult"
				},
			},
			j_cbean_stickybomb_rice                     = {
				name = "Stickybomb Rice",
				text = {
					"A random card {C:red}won't{} score",
					"but will give {C:mult}+#1#{} Mult"
				},
			},
			j_cbean_hocus_crocus                        = {
				name = "Hocus Crocus",
				text = {
					{
						"Playing Cards' {C:attention}scoring",
						"order is {C:dark_edition}reversed",
					},
					{
						"First scored card permantly",
						"gain {C:mult}+#1#{} Perma Mult"
					},
				},
			},
			j_cbean_headbutter_lettuce                  = {
				name = "Headbutter Lettuce",
				text = {
					"If a scored card's position",
					"is the same as this Joker's",
					"position it gives {C:chips}+#1#{} Chips",
					"{C:inactive,s:0.85}(e.g 3rd in {C:attention}Jokers{C:inactive,s:0.85}, 3rd in scoring)"
				},
			},
			j_cbean_draftodil                           = {
				name = "Draftodil",
				text = {
					{
					"{X:mult,C:white}X#1#{} Mult",
					},
					{
					"Played cards has a",
					"{C:green}#2# in [RANK]{} chance to",
					"to be discarded instead"
					},
				},
			},
			j_cbean_boom_ballon_flower                  = {
				name = "Boom Ballon Flower",
				text = {
					{
						"Remove any {C:attention}Seal{},",
						"{C:dark_edition}Edition{} or {C:attention}Enhancement{}",
						"from {C:attention}First{} highlighted",
						"and {C:attention}Scored{} card",
					},
					{
						"Gains {X:mult,C:white}X#2#{} Mult",
						"for each modification",
						"this Joker removes",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
					},
				},
			},
			j_cbean_inferno                             = {
				name = "Inferno",
				text = {
					{
						"Scored cards",
						"give {X:mult,C:white}X#1#{} Mult",
					},
					{
						"Scored cards",
						"this Joker affects",
						"are {C:red}downgraded{}",
						"to a rank below"
					},
				},
			},
			j_cbean_solar_sage                          = {
				name = "Solar Sage",
				text = {
					"{C:green}Sell{} this to",
					"turn the next scored",
					"cards into {C:money}Gold{} and apply",
					"{C:money}Gold Seal{} on them"
				},
			},
			j_cbean_noctairne                           = {
				name = "Noctarine",
				text = {
					"Selling this {C:attention}Joker{}",
					"while in a blind {C:attention}Halfs{}",
					"the required chips but",
					"{C:red}prevents{} Playing Cards",
					"from scoring for the",
					"rest of the round"
				},
			},
			j_cbean_health_seeker                       = {
				name = "Health Seeker",
				text = {
					"{C:green}Sell{} this {C:attention}Jokers{}",
					"to {C:attention}half{} all",
					"{C:attention}Blinds{} requirements",
					"for this ante"
				},
			},
			j_cbean_tiger_grass                         = {
				name = "Tiger Grass",
				text = {
					{
						"{C:red}Destroys{} the {C:attention}Leftmost{} played",
						"card and gains {X:mult,C:white}X#2#{} Mult",
						"{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
					},
					{
						"{C:attention}Debuffs{} self",
						"for {C:attention}1{} hand",
						"when triggered"
					},
				},
			},
			j_cbean_teleporto_mine                      = {
				name = "Teleporto Mine",
				text = {
					"{C:green}Sell{} this card",
					"to move the current {C:attention}Boss{}",
					"to the next {C:attention}Ante{}",
					"{C:inactive,s:0.8}(Blank excluded)"
				},
			},
			j_cbean_blockoli                            = {
				name = "Blockoli",
				text = {
					"{C:attention}Retriggers{} adjacent {C:attention}Jokers{},",
					"but they have a {C:green}chance{}",
					"they {C:red}don't{} trigger at all",
					"{C:inactive}(Only works during scoring)"
				},
			},
			j_cbean_buttercup                           = {
				name = "Buttercup",
				text = {
					"{C:attention}First{} scoring card",
					"gives {C:mult}+#1#{} Mult but",
					"is debuffed for the",
					"rest of the ante"
				},
			},
			j_cbean_bramble_bush                        = {
				name = "Bramble Bush",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult"
					},
					{
						"This Joker and Jokers",
						"to the right of it",
						"{C:red}cannot{} be dragged",
					},
				},
			},
			j_cbean_rhubarbarian                        = {
				name = "Rhubarbarian",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"when a hand is played,", "all cards left",
						"in hand are {C:red}discarded"
					},
				},
			},
			j_cbean_levitater                           = {
				name = "Levitater",
				text = {
					{
						"{C:green}#2# in #3#{} chance",
						"for cards to",
						"{C:red}not score{}",
					},
					{
						"Cards affected",
						"from this Joker",
						"give {X:mult,C:white}X#1#{} Mult"
					},
				},
			},
			j_cbean_mega_gattling_pea                   = {
				name = "Mega Gattling Pea",
				text = {
					"First scored card",
					"is retriggered {C:attention}#1#{} times",
					"After scoring, has a",
					"{C:green}#2# in #3#{} chance to increase",
					"repetitions by {C:attention}1{}"
				},
			},

			j_cbean_dragon_bruit                        = {
				name = "Dragon Bruit",
				text = {
					"{C:mult}+#1#{} Mult, {C:chips}+#2#{} Chips",
					"and {X:mult,C:white}X#3#{} Mult.",
					"Saves you from {C:red}death{} once then",
					"spawns {C:attention}2{} {C:green}Baby Bruits{}",
					"{C:inactive}(Must have room)"
				},
			},
			j_cbean_baby_bruit                          = {
				name = "Baby Bruit",
				text = {
					"{C:chips}+#1#{} Chips",
					"Is {:dark_edition}Eternal{}",
					"for {C:attention}#3#{C:inactive} #2#{} rounds"
				},
			},
			j_cbean_electric_peel                       = {
				name = "Electric Peel",
				text = {
					"A random scored card",
					"gives {C:chips}+#1#{} Chips",
					"Other scored cards give",
					"{C:chips}+#2#{} Chips"
				},
			},
			j_cbean_guard_shroom                        = {
				name = "Guard Shroom",
				text = {
					"After every {C:attention}#2#{C:inactive} (#1#){}",
					"{C:blue}hands{} played, apply",
					"a {C:purple}Guard Shroom{} sticker",
					"to a {C:attention}Jokers{} without one"
				},
			},

			j_cbean_aqua_vine                           = {
				name = "Aqua Vine",
				text = {
					{
						"Gains {C:attention}ability{}",
						"based on the",
						"{C:attention}Joker{} to the",
						"right's {C:dark_edition}rarity{}"
					},
				},
			},

			-- aqua vine variants

			j_cbean_aqua_vine_common                    = {
				name = "Aqua Vine",
				text = {
					{
						"Gains {C:attention}ability{}",
						"based on the",
						"{C:attention}Joker{} to the",
						"right's {C:dark_edition}rarity{}"
					},
					{
						"{C:chips}+#1#{} Chips"
					},
				},
			},

			j_cbean_aqua_vine_uncommon                  = {
				name = "Aqua Vine",
				text = {
					{
						"Gains {C:attention}ability{}",
						"based on the",
						"{C:attention}Joker{} to the",
						"right's {C:dark_edition}rarity{}"
					},
					{
						"{C:mult}+#1#{} Mult"
					},
				},
			},

			j_cbean_aqua_vine_rare                      = {
				name = "Aqua Vine",
				text = {
					{
						"Gains {C:attention}ability{}",
						"based on the",
						"{C:attention}Joker{} to the",
						"right's {C:dark_edition}rarity{}"
					},
					{
						"Each scored card",
						"gives {C:money}+$#1#{}"
					},
				},
			},

			j_cbean_aqua_vine_legendary                 = {
				name = "Aqua Vine",
				text = {
					{
						"Gains {C:attention}ability{}",
						"based on the",
						"{C:attention}Joker{} to the",
						"right's {C:dark_edition}rarity{}"
					},
					{
						"{X:mult,C:white}X#1#{} Mult"
					},
				},
			},
			--

			j_cbean_mangofier                           = {
				name = "Mangofier",
				text = {
					"Every played {C:red}even{}",
					"hand gives {X:mult,C:white}X#1#{} Mult",
					"while every {C:blue}odd{} hand",
					"gives {X:mult,C:white}X#2#{} Mult"
				},
			},

			j_cbean_blast_spinner                       = {
				name = "Blast Spinner",
				text = {
					"A random scored card",
					"gives {X:mult,C:white}X#1#{} Mult",
					"but is debuffed for the",
					"entire ante afterwards"
				},
			},

			j_cbean_blaze_leaf                          = {
				name = "Blaze Leaf",
				text = {
					{
						"Cards on the left",
						"give {X:mult,C:white}X#1#{} Mult",
					},
					{
						"Cards on the right",
						"give {C:mult}+#2#{} Mult"
					},
				},
			},

			j_cbean_frost_bonnet                        = {
				name = "Frost Bonnet",
				text = {
					"If you have more",
					"hands than discards,",
					"{C:chips}+#1#{} Chips",
					"Otherwise {C:mult}+#2#{} Mult"
				},
			},

			j_cbean_znake_lilly                         = {
				name = "Znake Lilly",
				text = {
					"On first {C:blue}hand{} of the",
					"round, a random card in",
					"full deck turns into a",
					"random {C:attention}Zomboid{} card",
				},
			},

			j_cbean_sweetheart_snare                    = {
				name = "Sweetheart Snare",
				text = {
					{
						"Blind wont progress",
						"until all {C:blue}hands{} are used",
					},
					{
						"{S:1.1,C:red,E:2}Self destructs{} after",
						"{C:attention}#2#{C:inactive} (#1#){} Rounds"
					},
				},
			},

			j_cbean_hammeruit                           = {
				name = "Hammeruit",
				text = {
					{
						"{C:attention}#3#{} random scored cards give", 
						"{X:mult,C:white}X#1#{} Mult in {C:attention}final hand{} of round",
						"{C:inactive}(Resets each round){}"
					},
					{
						"Above effect gains {X:mult,C:white}X#2#{} Mult",
						"for each card scored",
					},
				},
			},

			j_cbean_pea_nut                             = {
				name = "Pea-Nut",
				text = {
					{
						"{C:attention}X#1#{} Blind Size",
					},
					{
						"Card on the right",
						"{C:red}cannot{} be debuffed"
					},
				},
			},

			j_cbean_dandelion                           = {
				name = "Dandelion",
				text = {
					"If played hand has",
					"only {C:attention}3{} cards",
					"a random one gains",
					"{C:mult}+#1#{} Perma Mult"
				},
			},

			j_cbean_bombegranate                        = {
				name = "Bombegranate",
				text = {
					"When entering a {C:attention}Blind{}, reduce",
					"its requirements by {C:dark_edition}#1#%{}",
					"Reduced amount decreases",
					"by {C:red}-#2#{} per trigger"
				},
			},

			j_cbean_blooming_heart                      = {
				name = "Blooming Heart",
				text = {
					"Scored cards give",
					"{C:mult}+#1#{} Mult.",
					"increases by {C:attention}1{}",
					"per trigger and {C:red}resets",
					"after scoring ends"
				},
			},

			j_cbean_corn_fetti_popper                   = {
				name = "Corn-fetti Popper",
				text = {
					"Leftmost scored card",
					"gives {C:mult}+#1#{} Mult",
					"scaled by the amount",
					"of scoring cards on",
					"its right"
				},
			},

			j_cbean_seashooter                          = {
				name = "Sea Shooter",
				text = {
					"Each odd scoring",
					"card gives {C:chips}+#1#{} Chips"
				},
			},

			j_cbean_sourshot                            = {
				name = "Sour Shot",
				text = {
					"Scored cards lose",
					"{C:red}-1{} Chips but",
					"give {C:money}$#1#{}"
				},
			},

			j_cbean_security_gourds                     = {
				name = "Security Gourds",
				text = {
					"Give {C:blue}+#1#{} Hands",
					"and {C:red}+#2#{} discard",
					"when out of hands",
					"{C:red}Self-Destructs{}"
				},
			},

			j_cbean_devour_bloom                        = {
				name = "Devour Bloom",
				text = {
					"{C:green}Sell{} this card",
					"to instantly defeat the",
					"blind but {:red}lose",
					"a random {C:attention}Joker{}"
				},
			},

			j_cbean_spore_shroom                        = {
				name = "Spore Shroom",
				text = {
					{
						"{X:mult,C:white}X#1#{} Mult",
					},
					{
						"When a {C:attention}Boss{} or {C:attention}CEO Blind{} is",
						"defeated, create another",
						"{C:dark_edition}Negative{} {C:purple}Spore-Shroom{}",
						"{C:inactive,:s0.8}(Other Spore-Shrooms created",
						"{C:inactive}by this Spore-Shroom can't",
						"{C:inactive}create Spore-Shrooms)",
					},
				},
			},

			j_cbean_spore_shroom_nodup                  = {
				name = "Spore Shroom",
				text = {
					"{X:mult,C:white}X#1#{} Mult",
				},
			},

			j_cbean_torchwood                           = {
				name = "Torchwood",
				text = {
					"All {C:attention}Jokers{} to the left",
					"of this has {C:attention}X1.5{}",
					"values"
				},
			},

			j_cbean_solar_tomato                        = {
				name = "Solar Tomato",
				text = {
					"When sold, gives {C:money}$#1#{} per",
					"card in the most",
					"recent scored hand",
					"{C:inactive}(Will give {C:money}$#2#{C:inactive})"
				},
			},

			j_cbean_goo_peashooter                      = {
				name = "Goo Peashooter",
				text = {
					"When hand is played,",
					"{C:attention}Blind{} requirements",
					"are reduced by {C:attention}#1#%{}",
				},
			},

			j_cbean_snap_pea                            = {
				name = "Snap Pea",
				text = {
					"Every {C:attention}#2#{} {C:inactive}(#3#){} hands played,",
					"destroy a random",
					"scored card and gain",
					"Mult equal to its rank",
					"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
				},
			},

			j_cbean_explode_o_nut                       = {
				name = "Explode-O-Nut",
				text = {
					{
						"Adjacent {C:attention}Jokers",
						"{C:red}cannot{} be debuffed",
					},
					{
						"Gains {X:mult,C:white}X#1#{} Mult when",
						"preventing a debuff",
					},
					{
						"{C:red,E:2}Self-destructs{}",
						"if this {C:attention}Joker's{} {X:mult,C:white}XMult{}",
						"would exceed {X:mult,C:white}X#2#{}",
						"{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
					},
				},
			},

			-- quick end
			j_cbean_nameteam_stickerbomb                = {
				name = {
					"Stickerbomb",
				},
				text = {
					"{C:mult}+#1#{} Mult per {C:attention}Sticker",
					"currently applied",
					"on any card or deck",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
				},
			},
			j_cbean_nameteam_sticker_collection         = {
				name = {
					"Sticker Collection",
				},
				text = {
					"{X:mult,C:white}X#1#{} Mult per unique",
					"{C:attention}Sticker{} currently applied",
					"on any card or deck",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
				},
			},
			j_cbean_nameteam_topsyturvy                 = {
				name = "Topsy Turvy",
				text = {
					"Played {C:attention}3s{} give {C:chips}+#1#{}",
					"Chips when scored,",
					"played {C:attention}2s{} give {C:chips}+#2#{}",
					"Chips when scored",
				},
			},

			j_cbean_commit_farming                      = {
				name = "Commit Farming",
				text = {
					"{C:chips}+#1#{} Chips for each",
					"{C:attention}unique{} consumable",
					"picked up this run",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
				},
			},

			j_cbean_smoke_merchant                      = {
				name = "Smoke Merchant",
				text = {
					"Gains {X:mult,C:white}X#1#{} Mult",
					"at the end of shop",
					"{C:red}Resets{} if money was",
					"spent in the shop",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
				},
			},
			j_cbean_nameteam_bettercreditcard           = {
				name = "Better Credit Card",
				text = {
					{
						"Go up to",
						"{C:red}-$#1#{} in debt",
					},
					{
						"Sell this {C:attention}Joker{}",
						"to {C:red}nullify{} debt",
					},
				},
			},
			j_cbean_nameteam_hollyjollyjoker            = {
				name = "Holly Jolly Joker",
				text = {
					"Played cards with {C:clubs}Clubs{}",
					"suit give {C:money}$#1#{} if played",
					"hand contains a {C:attention}#2#{}",
				},
			},
			j_cbean_nameteam_stachenscarfen             = {
				name = "Stachenscarfen",
				text = {
					"All spawned {C:attention}Jokers{}",
					"are {C:green}Uncommon{}",
				},
			},
			j_cbean_nameteam_aldus                      = {
				name = "Aldus",
				text = {
					"{C:tarot}Tarot{} cards that",
					"change {C:attention}suits{} or",
					"add {C:attention}enhancements{}",
					"{C:red}cannot appear{}",
				},
			},
			j_cbean_nameteam_manface                    = {
				name = "Man Face",
				text = {
					"When {C:attention}round{} begins,",
					"applies {C:attention}Man{} to one",
					"random {C:attention}non-Man{}",
					"card in your hand",
				},
			},
			j_cbean_nameteam_jimboss                    = {
				name = "Jimboss",
				text = {
					"Disables current {C:attention}Boss{}",
					"or {E:1,C:money}CEO Blind{} on",
					"{C:attention}third{} hand of round",
				},
			},
			j_cbean_nameteam_alecwatson                 = {
				name = {
					"Alec Watson",
					"{s:0.7}[Technology Connections]{}",
				},
				text = {
					"When a {C:attention}consumable{} is",
					"purchased, creates a",
					"{C:attention}second copy{} of it",
					"{C:inactive}(Must have room){}",
				},
			},
			j_cbean_nameteam_diamondshapewithadotinside = {
				name = "{s:0.9}Diamond Shape With a Dot Inside{}",
				text = {
					"Played {C:diamonds}Diamonds{} give",
					"{C:mult}+#1#{} Mult when scored",
					"if played hand contains",
					"a {C:red}non-Diamond{}",
				},
			},
			j_cbean_nameteam_giveway                    = {
				name = "Give Way",
				text = {
					"{C:white,X:mult}X#1#{} Mult",
					"before scoring",
				},
			},
			j_cbean_nameteam_ghostimage                 = {
				name = "Ghost Image",
				text = {
					"Upgrades a random",
					"poker hand by {C:attention}#1#{}",
					"level when using",
					"a {C:planet}Planet{} card",
				},
			},
			j_cbean_nameteam_tipoftheiceberg            = {
				name = "Tip of the Iceberg",
				text = {
					"Gains {C:chips}+#1#{} Chips for each",
					"card {C:attention}purchased{} from the",
					"shop before {C:green}rerolling{}",
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips){}",
				},
			},
			j_cbean_nameteam_bottomofthebarrel          = {
				name = "Bottom of the Barrel",
				text = {
					"Gains {C:mult}+#1#{} Mult for each",
					"card {C:attention}purchased{} from the",
					"shop after all {C:green}rerolls{}",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}",
				},
			},
			j_cbean_nameteam_halfbodyjoker              = {
				name = "Half-body Joker",
				text = {
					"Cards held in hand",
					"give {C:mult}+#1#{} Mult",
				},
			},
			j_cbean_nameteam_teenyweenyjoker            = {
				name = "{s:0.6}Teeny Weeny Joker{}",
				text = {
					"{s:0.8}Gains {C:mult,s:0.8}+#1#{s:0.8} Mult if all",
					"{s:0.8}played cards are {C:attention,s:0.8}2s{}",
					"{C:inactive,s:0.8}(Currently {C:mult,s:0.8}+#2#{C:inactive,s:0.8} Mult){}",
				},
			},
			j_cbean_nameteam_presidenthathaway          = {
				name = "President Hathaway",
				text = {
					{
						"Played {C:attention}Kings{} of",
						"{C:spades}Spades{} give {C:white,X:mult}X#1#{} Mult",
						"when scored",
					},
					{
						"{C:red,E:1}Lose the run{} if this",
						"Joker is {C:red}destroyed{}",
					},
				},
			},
			j_cbean_nameteam_collager                   = {
				name = "Collager",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:red}destroys{} a random {C:tarot}Tarot{} card",
					"If successful, creates",
					"a {C:cbean_stickersheet}Sticker Sheet{}",
				},
			},
			j_cbean_nameteam_theworldshardestjoker      = {
				name = "The World's Hardest Joker",
				text = {
					"Play {C:attention}#1#{} {C:inactive}[#2#]{} consecutive",
					"{C:attention}Straight Flushes{} to create",
					"a copy of {C:spectral}The Soul{}",
					"{C:inactive}(Must have room){}",
				}
			},
			j_cbean_nameteam_coffeemug                  = {
				name = "Coffee Mug",
				text =
				{
					"Retriggers all played",
					"cards with {C:attention}Stickers{}",
					"{C:attention}#1#{} times for {C:attention}#2#{} hands"
				}
			},
			j_cbean_nameteam_poorphotography            = {
				name = "Poor Photography",
				text =
				{
					"Leftmost {C:attention}face{} card held",
					"in hand gives {C:white,X:mult}X#1#{} Mult"
				}
			},
			j_cbean_nameteam_chuckmcgill                = {
				name = '{s:0.9}Charles "Chuck" McGill{}',
				text =
				{
					"Gives {C:white,X:mult}X#1#{} Mult if",
					"played hand is not",
					"the {C:attention}previous hand{}",
					"{C:inactive}(Previous hand: {C:attention}#2#{C:inactive}){}"
				}
			},
			j_cbean_nameteam_brodyfoxx                  = {
				name = 'Brody Foxx',
				text =
				{
					{
						"Played {C:attention}Kings{} give",
						"{C:money}$#1#{} when scored"
					},
					{
						"When {C:attention}Blind{} is selected,",
						"tells a {C:attention}Yo Mama{} joke"
					}
				}
			},
			j_cbean_nameteam_theannouncement            = {
				name = 'The Announcement',
				text =
				{
					{
						"When round begins,",
						"{C:green}#1# in #2#{} chance to add",
						"a {C:attention}Piss{} card to your deck"
					},
					{
						"Otherwise, creates a",
						"copy of {C:tarot}The Moon{}",
						"{C:inactive}(Must have room){}"
					}
				}
			},
			j_cbean_nameteam_intheway                   = {
				name = 'In the Way',
				text =
				{
					"Retrigger {C:attention}first{} and",
					"{C:attention}last{} played cards",
					"used in scoring",
					"{C:attention}#1#{} additional time"
				}
			},
			j_cbean_nameteam_riverstyx                  = {
				name = 'Sail the Styx',
				text =
				{
					"Gives {C:attention}+#1#{} Joker slots",
					"after {C:attention}#2#{} {C:inactive}[#3#]{} Jokers {C:money}sold{}",
					"{C:inactive}(Currently #4#){}"
				}
			},
			j_cbean_nameteam_thelastsupper              = {
				name = 'The Last Supper',
				text =
				{
					"{C:white,X:mult}X#1#{} Mult if {C:attention}full deck{}",
					"contains exactly",
					"{C:attention}#2#{} face cards",
					"{C:inactive}({C:attention}#3#:#2#{C:inactive}, #4#){}"
				}
			},
			j_cbean_nameteam_pipelinepunch              = {
				name = 'Pipeline Punch',
				text =
				{
					"For the next {C:attention}#1#{} hands,",
					"leftmost scoring card",
					"has a {C:green}#2# in #3#{} chance",
					"to become a {C:attention}Queen{}"
				}
			},
			j_cbean_nameteam_butterfly                  = {
				name = 'Butterfly',
				text =
				{
					"Gains {C:mult}+#1#{} Mult if played",
					"hand is not the {C:attention}first{}",
					"or {C:attention}second{} hand of round",
					"{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}"
				}
			},
			j_cbean_nameteam_butterflywing              = {
				name = 'Butterfly Wing',
				text =
				{
					"{C:chips}+#1#{} Chips",
					"{C:inactive}(8X the value your{}",
					"{C:inactive}Butterfly was on){}"
				}
			},
			j_cbean_nameteam_goldenghost                = {
				name = 'Golden Ghost',
				text =
				{
					"Earn {C:money}$#1#{} at end of round,",
					"gains {C:money}$#2#{} when playing",
					"{C:attention}final{} hand of round"
				}
			},
			j_cbean_nameteam_liam                       = {
				name = 'Liam',
				text =
				{
					"{C:attention}+#1#{} hand size for each",
					"other owned {C:red}Rare{} {C:attention}Joker{}",
					"{C:inactive}(Currently {C:attention}+#2#{C:inactive} hand size,{}",
					"{C:inactive}max of {C:attention}+#3#{C:inactive} hand size){}"
				}
			},
			j_cbean_nameteam_bryce                      = {
				name = 'Bryce',
				text =
				{
					"Each {C:attention}Jack{}",
					"held in hand",
					"gives {X:mult,C:white}X#1#{} Mult",
				}
			},
			j_cbean_nameteam_crowbar                    = {
				name = 'Crowbar',
				text =
				{
					"Played {C:attention}Aces{} convert",
					"{C:red}#1#{} discard into {C:blue}#1#{}",
					"hand when scored"
				}
			},
			j_cbean_nameteam_littlegarnet               = {
				name = 'Little Garnet',
				text =
				{
					"Played {C:attention}2s{} earn {C:money}$#1#{}",
					"when scored, earn",
					"{C:money}$#2#{} instead if they",
					"are {C:hearts}Hearts{} suit"
				}
			},
			j_cbean_nameteam_adapaige                   = {
				name = 'Dr. Paige',
				text =
				{
					"Upon playing a hand,",
					"debuffed playing cards have",
					"a {C:green}#1# in #2#{} chance to",
					"rebuff themselves"
				}
			},
			j_cbean_nameteam_edega                      = {
				name = 'Dr. Edega',
				text = {
					{
						"Upon playing a hand,",
						"playing cards have",
						"a {C:green}#1# in #2#{} chance to",
						"debuff themselves"
					},
					{
						"For each card that has",
						"been debuffed, gain {C:mult}+#3#{} Mult",
						"{s:0.8}Resets at the end of the round",
						"{C:inactive}(Currently {C:mult}+#4#{C:inactive} Mult){}"
					},
				}
			},
			j_cbean_nameteam_ian                        = {
				name = 'Ian',
				text = {
					{
						"Played {C:attention}cards{}",
						"permanently gains",
						"{C:chips}+#1#{} Chips when scored",
						"This Joker loses {C:chips}#2#{} Chips",
						"per card upgraded"
					},
					{
						"Upon reaching {C:chips}0{} Chips",
						"this Joker debuffs itself"
					}
				}
			},
			j_cbean_nameteam_charles                    = {
				name = 'Charles',
				text =
				{
					"Prevents Death,",
					"gives {C:money}$#1#{}, {C:red}destroys{} an",
					"adjacent {C:attention}Joker{} and",
					"{S:1.1,C:red,E:2}self destructs{}"
				}
			},
			j_cbean_nameteam_intentionallyblank         = {
				name = 'Intentionally Blank',
				text =
				{
					"Adjacent {C:attention}Jokers{}",
					"give {C:white,X:mult}X#1#{} Mult"
				}
			},
			j_cbean_nameteam_bountyhunter               = {
				name = 'Bounty Hunter',
				text =
				{
					"When {C:attention}Blind{} is selected,",
					"{C:red}destroy{} Joker to the",
					"right and earn {C:money}$#1#{}"
				}
			},
			j_cbean_nameteam_pawn                       = {
				name = 'Pawn',
				text =
				{
					"After {C:attention}#2#{} {C:inactive}[#1#]{} rounds,",
					"becomes a {C:attention}Queen{}"
				}
			},
			j_cbean_nameteam_queen                      = {
				name = 'Queen',
				text =
				{
					"Played {C:attention}Queens{} give",
					"{C:chips}+#1#{} Chips, {C:mult}+#2#{} Mult",
					"and {C:white,X:mult}X#3#{} Mult",
					"when scored"
				}
			},
			j_cbean_nameteam_zirconiumpants             = {
				name = 'Zirconium Pants',
				text =
				{
					"If played hand",
					"contains a {C:attention}Two Pair{},",
					"an {C:attention}unenhanced{} card held",
					"in hand becomes {C:attention}Steel{}"
				}
			},
			j_cbean_nameteam_mappedout                  = {
				name = 'Mapped Out',
				text =
				{
					"Gives {C:white,X:mult}X#1#{} Mult for",
					"each unique {C:green}Biome{}",
					"visited this run",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult){}"
				}
			},
			j_cbean_nameteam_beentheredonethat          = {
				name = 'Been There Done That',
				text =
				{
					"{C:white,X:mult}X#1#{} Mult if a {C:attention}Voucher{}",
					"was purchased this {C:attention}Ante{}",
					"{C:inactive}(Currently #2#){}"
				}
			},
			j_cbean_nameteam_miraclemachine             = {
				name = 'Miracle Machine',
				text =
				{
					"Played cards with {C:attention}odd{}",
					"rank give {C:money}$#1#{} when scored",
					"{C:inactive}(A, 9, 7, 5, 3){}"
				}
			},
			j_matador                                   = {
				name = "Red Matador",
				text = {
					"Earn {C:money}$#1#{} if played",
					"hand triggers the",
					"{C:attention}Boss Blind{} ability",
				},
				unlock = {
					"Defeat a Boss Blind",
					"in {E:1,C:attention}1 hand{} without",
					"using any discards",
				},
			},
			j_cbean_nameteam_greenmatador               = {
				name = 'Green Matador',
				text =
				{
					"Earn {C:money}$#1#{} at end of round,",
					"gains {C:money}+$#2#{} during {C:attention}CEO Blind{}",
					"for each unused {C:red}discard{}"
				}
			},
			j_cbean_nameteam_bluematador                = {
				name = 'Blue Matador',
				text =
				{
					"Earn {C:money}$#1#{} at end of round,",
					"gains {C:money}+$#2#{} during {C:attention}CEO Blind{}",
					"for each unused {C:blue}hand{}"
				}
			},
			j_cbean_nameteam_splashman                  = {
				name = 'Splash Man',
				text =
				{
					{
						"Every {C:attention}played card{}",
						"counts in scoring"
					},
					{
						"Played cards give",
						"{C:white,X:mult}X#1#{} Mult when scored"
					}
				}
			},
			j_cbean_nameteam_bozobrain                  = {
				name = 'Bozo Brain',
				text =
				{
					"Earn {C:money}$#1#{} if played",
					"hand is level {C:attention}1{}"
				}
			},
			j_cbean_nameteam_walledin                   = {
				name = 'Walled In',
				text =
				{
					"All cards in {C:attention}Standard{}",
					"{C:attention}Packs{} are {C:green}guaranteed{}",
					"to be {C:attention}Stone{}"
				}
			},
			j_cbean_nameteam_trafficlight               = {
				name = 'Traffic Light',
				text =
				{
					"{C:white,X:mult}X#1#{} Mult if this",
					"Joker was on {C:green}GO{} or",
					"{C:attention}PREPARE TO STOP{} when",
					"hand was played"
				}
			},
			j_cbean_nameteam_cacklejack                 = {
				name = 'Cacklejack',
				text = {
					{
						"At end of round,",
						"replace a random",
						"{C:attention}Joker{} with another",
						"of the same {C:attention}rarity{}"
					},
					{
						"Cannot affect Joker",
						"to the {C:attention}left{} or {C:attention}itself{}",
						"or other {C:attention}Cacklejacks{}"
					}
				}
			},
			j_cbean_nameteam_wayne                      = {
				name = 'Wayne',
				text =
				{
					"Prevents Death,",
					"go back {C:attention}#1# ante,",
					"but sends you to",
					"{C:attention}The Afterlife",
				}
			},
			j_cbean_nameteam_absoluteschnozz            = {
				name = 'Absolute Schnozz',
				text =
				{
					"Retrigger {C:attention}middle{} played",
					"card(s) used in scoring",
					"{C:attention}#1#{} additional times",
				}
			},
			j_cbean_nameteam_face                       = {
				name = 'Face',
				text =
				{
					"Played face cards",
					"give {C:white,X:mult}X#1#{} Mult",
					"when scored"
				}
			},
			j_cbean_nameteam_markiplier                 = {
				name = 'Markiplier',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_1               = {
				name = 'Multiplier',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_2               = {
				name = 'Market Pire',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_3               = {
				name = 'Marlinshire',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_4               = {
				name = 'For Suppliers',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_5               = {
				name = 'Mark (A Player)',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_6               = {
				name = 'Market Buyer',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_7               = {
				name = 'Park For Hire',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_markiplier_8               = {
				name = 'Welcome',
				text =
				{
					"Gains {C:white,X:mult}X#1#{} Mult if",
					"played hand contains",
					"a {C:attention}9{}, {C:attention}8{} or {C:attention}7{}",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult)"
				}
			},
			j_cbean_nameteam_fashionismypassion         = {
				name = 'Fashion is my Passion',
				text =
				{
					"Played cards with",
					"{C:hearts}Heart{} suit give",
					"{C:chips}+#1#{} Chips when scored",
				}
			},
			j_cbean_nameteam_wavegoodbye                = {
				name = 'Wave Goodbye',
				text =
				{
					"Earn {C:money}$#1#{} when playing",
					"{C:attention}final{} hand of round"
				}
			},
			j_cbean_nteam_mix_up                        = {
				name = 'Mix Up',
				text =
				{
					"If played hand is not",
					"the {C:attention}most played{} hand,",
					"gain {C:blue}+#1#{} hands this round",
					"Can only trigger {C:attention}#2#{}",
					"times per round",
				}
			},
			j_cbean_nteam_rick_astley                   = {
				name = 'Rick Astley',
				text =
				{
					"If played hand contains",
					"at least {C:attention}3{} distinct ranks,",
					"this {C:attention}Joker{} gains {X:mult,C:white}X#1#{} Mult",
					"{C:inactive}(Currently {C:white,X:mult}X#2#{C:inactive} Mult){}"
				}
			},
			j_cbean_nameteam_yjh                        = {
				name = 'Your Joker Here',
				text =
				{
					"When {C:attention}Blind{} is selected,",
					"creates a {C:tarot}Tarot{} card for",
					"each empty {C:attention}Joker{} slot",
					"{C:inactive}(Must have room){}"
				}
			},
			j_cbean_nameteam_tokenofappreciation        = {
				name = 'Token of Appreciation',
				text =
				{
					"Earn {C:money}$#1#{} when buying",
					"{C:attention}Jokers{} from the {C:money}shop{}"
				}
			},

			--wgropop Jokers
			j_cbean_wgrop_withering_memory              = {
				name = "Withering Memory",
				text = {
					{
						"Scored {C:attention}Dark Suits{} give",
						"{C:white,X:chips}X#1#{} Chips if a {C:attention}Light Suit{}",
						"is scored {C:attention}beforehand{}",
					},
					{
						"Scored {C:attention}Light Suits{} give",
						"{C:white,X:mult}X#2#{} Mult if a {C:attention}Dark Suit{}",
						"is scored {C:attention}beforehand{}",
					}
				},
			},
			--[[ Old Poltergeist Description
			j_cbean_wgrop_jhett_the_poltergeist         = {
				name = "Jhett the Poltergeist",
				text = {
					{ "{C:red}Destroys{} all {C:attention}Pale Remnant{} cards",
						"{C:attention}held in hand{} after scoring" },
					{ "This Joker gains {C:white,X:red}X#1#{} Mult {C:attention}for{}",
						"{C:attention}every{} held {C:attention}Pale Remnant{} card at",
						"the start of the hand when",
						"above ability destroys one",
						"{C:inactive}(Currently{} {C:white,X:mult}X#2#{} {C:inactive}Mult){}"
					},
				}
			},
			]]

			j_cbean_wgrop_jhett_the_poltergeist         = {
				name = "Jhett the Poltergeist",
				text = {
					{ "{C:red}Destroys{} all {C:attention}Pale Remnant{} cards",
						"{C:attention}held in hand{} after scoring" },
					{ "This Joker gains {C:white,X:red}X#1#{} Mult {C:attention}for{}",
						"{C:attention}every{} {C:attention}Pale Remnant{} card",
						"above ability destroys",
						"{C:inactive}(Currently{} {C:white,X:mult}X#2#{} {C:inactive}Mult){}"
					},
				}
			},
			j_cbean_wgrop_oasis                         = {
				name = "Oasis",
				text = {
					"Retrigger {C:attention}Enhanced{} cards {C:attention}#2#{}",
					"time{C:inactive}(s){} for every {C:attention}#1#{}",
					"{C:attention}Unenhanced{} cards in hand"
				}
			},
			j_cbean_wgrop_glass_spire                   = {
				name = "Glass Spire",
				text = {
					"When a {C:attention}Glass{} card",
					"is {C:red}destroyed{},",
					"add a {C:attention}Coarse{} copy",
					"to your hand"
				}
			},
			j_cbean_wgrop_scorched_hands                = {
				name = "Scorched Hands",
				text = {
					{ "Discarded cards have",
						"a {C:green}#1#{} in {C:green}#2#{} chance to",
						"be {C:red}destroyed{}" },
					{ "{C:attention}Unenhanced{} cards",
						"destroyed this",
						"way give {C:money}$#3#{}",
						"{C:attention}Enhanced{} cards",
						"give {C:money}$#4#{} instead" }
				}
			},
			j_cbean_wgrop_starry_reflection             = {
				name = "Starry Reflection",
				text = {
					{ "Score {C:chips}Chips{} equal to",
						"{C:dark_edition}#1#%{} of {C:attention}base{}",
						"poker hand's {C:blue}Chips{}" },
					{ "Increase {C:dark_edition}percentage{} by",
						"{C:dark_edition}#2#%{} when {C:attention}selling{}",
						"a {C:planet}Planet{} card" }
				}
			},
			j_cbean_wgrop_stop_sign                     = {
				name = "Stop Sign",
				text = {
					"{C:inactive,s:0.75}Perhaps some things are better...{}",
					"{C:inactive,s:0.95}Left Behind.{}"
				}
			},                                     --jokers jbill pokers woah woah jokercards yo jokers yo jbill
			j_cbean_jbill_who                           = { -- added by nteam
				name = "Who can Placehold Now?",
				text = {
					{
						"After the {C:attention}Big blind{} shop,",
						"reroll {C:attention}Boss{} and {C:attention}CEO Blinds{}.",
					},
					{
						"Gains {X:mult,C:white}X#1#{} Mult when",
						"entering {C:attention}Boss{} or {C:attention}CEO blinds{}.",
						"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
					}
				},
			},
			j_cbean_jbill_98                            = { -- added by nteam
				name = "98%",
				text = {
					"{C:attention}Teeny{} blind is",
					"always {C:legendary}Estrogen{}"
				}
			},
			j_cbean_jbill_tlane                         = {
				name = "Triple Lane",
				text = {
					"{X:mult,C:white}X3{} Mult if poker hand",
					"contains an {C:attention}Ace{} and a {C:attention}#3#{}",
					"{X:chips,C:white}X3{} Chips if poker hand",
					"contains a {C:attention}5{} and a {C:attention}#3#{}"
				}
			},
			j_cbean_jbill_elephant                      = {
				name = "Wonderful Elephant",
				text = {
					{
						"Has 100 fake {C:attention}Achievements{}",
						"for you to complete!",
						"{C:inactive,s:0.9}(First trigger of each fake Achievement",
						"{C:inactive,s:0.9}triggers an actual counterpart)"
					},
					{
						"{C:mult}+1{} Mult for each above",
						"{C:attention}Achievement{} completed",
						"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
					},
				}
			},
			j_cbean_jbill_spill                         = {
				name = "Spill the Beans",
				text = {
					"Adds {C:attention}#1# Bean Cards{} to deck",
					"when Small Blind is selected"
				}
			},
			j_cbean_jbill_pizzazzy                      = {
				name = "Pizzazzy Joker",
				text = {
					"Gives {C:mult}Scrabble Value{}",
					"of {C:attention}Joker{} to the left in Mult",
					"{C:inactive,s:0.8}(Mult of each letter is sent individually)",
					"{C:inactive,s:0.8}(Appears when chosen language is English)"
				}
			},
			j_cbean_jbill_leak                          = {
				name = "Jimboleaks",
				text = {
					"Can't take {C:attention}Booster Pack{} cards",
					"until they're {C:money}Leaked{}",
					"Skipping {C:attention}Booster Pack{} before",
					"{C:money}Leaking{} refunds it"
				}
			},
			j_cbean_jbill_redbull                       = {
				name = "RedBull 67",
				text = {
					"{C:red}+#1#{} Discards",
					"{S:1.1,C:red,E:2}self destructs{} if more than",
					"{C:hands}#2#{} hands are played"
				}
			},
			j_cbean_jbill_palte                         = {
				name = "My Palte ToT",
				text = {
					{
						"{C:attention}Blind Requirements{}",
						"are {C:red}Hidden{}"
					},
					{
						"{X:mult,C:white}X#1#{} Mult"
					},
				}
			},
			j_cbean_jbill_schneider                     = {
				name = {
					"{C:inactive,s:0.8}Don't forget...{}",
					"...My {C:white,X:mult}Heartbeat{} on the Right"
				},
				text = {
					"On {C:attention}Ante Change{}:",
					"If {C:white,X:mult}XMult{} value of {C:attention}Joker{}",
					"to the right is higher than {C:mult}#2#{},",
					"{C:mult}destroys{} it and gains",
					"{C:attention}double of its {C:white,X:mult}XMult{} value",
					"Will gain: {C:white,X:mult}X#3#",
					"{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive})"
				}
			},
			j_cbean_jbill_gameshow                      = {
				name = {
					"Intestinal Game Show",
				},
				text = {
					"If zero {C:mult}discards{} remains",
					"{C:green}#1# in #2#{} chance to {C:attention}Enhance{}",
					"drawn cards"
				}
			},
			j_cbean_jbill_ante_lock                     = {
				name = "Ante Lock",
				text = {
					"When ante increases, gains {C:white,X:chips}X#2#{} Chips,",
					"increases required amount of {C:attention}Antes{}",
					"{C:inactive}(Currently: {C:white,X:chips}X#1#{C:inactive}, #3#/#4#)"
				}
			},
			j_cbean_jbill_manos                         = {
				name = "Hands of Fate",
				text = {
					{
						"{C:attention}Hand count{} remains",
						"unchanged when",
						"a hand is {C:attention}played{}",
					},
					{
						"Loses {C:white,X:mult}X#2#{} Mult",
						"when playing a hand",
						"{C:inactive}(Currently: {C:white,X:mult}X#1#{} {C:inactive}Mult)"
					},
				},
			},
			j_cbean_jbill_pythagoras                    = {
				name = "Pythagoreanistic Joker",
				text = {
					"This Joker gains {C:white,X:mult}X#2#{} Mult",
					"for every {C:attention}Bean Card{}",
					"that is destroyed",
					"{C:inactive}(Currently: {C:white,X:mult}X#1#{C:inactive} Mult)"
				}
			},
			j_cbean_jbill_wee_bottle                    = {
				name = "Wee inside the Bottle",
				text = {
					"Scoring {C:attention}2s{}",
					"become {C:attention}Glass Cards{}",
					"{C:inactive,s:0.7}Thank god there's no root ranks"
				}
			},
			j_cbean_jbill_dj                            = {
				name = "Deejay",
				text = {
					{
						"The {C:attention}2 rightmost{} scoring",
						"cards are {C:attention}retriggered{}",
					},
					{
						"The {C:attention}2 leftmost{} scoring",
						"cards will {C:mult}not score{}"
					},
				}
			},
			j_cbean_jbill_jimbill                       = {
				name = "Jim Bill",
				text = {
					"{C:green}#2# in #3#{} chance for",
					"each played {C:attention}Enhanced Card",
					"to give {C:green}+J#1#{} when scored"
				}
			},
			j_cbean_jbill_exchange                      = {
				name = "Currency Exchange",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:money}$5{} is exchanged for {C:green}J1"
				}
			},
			j_cbean_jbill_stare                      = {
				name = {"Two-Thousand",
					 	"Blind Stare"},
				text = {
					"Gains {C:white,X:mult}X#2#{} Mult",
					"if final score",
					"is at most {C:attention}#3#%{}",
					"of {C:attention}Blind{} requirement",
					"{C:inactive}(Currently: {X:mult,C:white}X#1#{}{C:inactive} Mult)"
				}
			},
			j_cbean_jbill_tcna                          = {
				name = {
					"{s:0.8}The Campaign for",
					"North Africa",
				},
				text = {
					{
						"Gains {C:mult}#10#{} Mult every",
						"{C:attention}#2# {C:inactive}[#1#]{} cards played",
						"{C:inactive}(Currently: {C:mult}+#7#{}{C:inactive} Mult)"
					},
					{
						"Gains {C:chips}#10#{} Chips every",
						"{C:attention}#4# {C:inactive}[#3#]{} cards played",
						"{C:inactive}(Currently: {C:chips}+#8#{}{C:inactive} Chips)"
					},
					{
						"Gains {C:white,X:mult}X#11#{} Mult after",
						"playing or discarding",
						"{C:attention}#6# {C:inactive}[#5#]{} cards in total",
						"{C:inactive}(Currently: {C:white,X:mult}X#9#{}{C:inactive} Mult)"
					}
				}
			},


            j_chicot={
                name="Chicot",
                text={
                    "Disables effect of",
                    "every {C:attention}Boss{} or {C:attention}CEO Blind",
                },
                unlock={
                    "{E:1,s:1.3}?????",
                },
            },
		},
		Other = {
			cbean_nteam_secret = {
				name = "Hint",
				text = {
					"Does something",
					"when {C:attention}clicked{} on",
				}
			},
			cbean_nteam_square_scale = {
				name = "Notice",
				text = {
					"Removing Square will",
					"{C:red}halve{} this Jokers values"
				}
			},
			cbean_house_rules_hint = {
				name = "House Rules",
				text = {
					"This Joker unlocks",
					"at least one",
					"{C:attention}House Rules{} hand!"
				}
			},
			--Medals
			cbean_yma_common_medal = {
				name = "Common Medal",
				text = {
					"Gain {C:chips}+#1#{} Chips, {C:mult}+#2#{}",
					"Mult, or {C:money}$1-2{}"
				},
			},
			cbean_yma_uncommon_medal = {
				name = "Uncommon Medal",
				text = {
					"Gain {C:chips}+#1#{} Chips, {C:mult}+#2#{}",
					"Mult, or {C:green}#3# in #4#{} chance",
					"to gain {C:money}$5"
				},
			},
			cbean_yma_rare_medal = {
				name = "Rare Medal",
				text = {
					"{X:chips,C:white}X#1#{} Chips, {X:mult,C:white}X#2#{} Mult",
					"or {C:green}#3# in #4#{} chance to",
					"create a {C:attention}random",
					"{C:attention}consumable"
				},
			},
			cbean_yma_legendary_medal = {
				name = "Legendary Medal",
				text = {
					"Gain {X:chips,C:white}X#1#{} Chips per card played,",
					"Gain {X:mult,C:white}X#3#{} Mult per hand played,",
					"and create a {C:attention}random {C:dark_edition}Negative{}",
					"{C:attention}consumable{} at the end of {C:attention}round",
					"{C:inactive}(Currently {C:white,X:chips}X#2#{C:inactive} Chips and {C:white,X:mult}X#4#{C:inactive} Mult)",
				},
			},
			--Undiscovered
			undiscovered_yma_quest = {
				name = "Not Discovered",
				text = {
					"Complete Side",
					"Quests in an",
					"unseeded run to",
					"learn what it does",
				},
			},
			undiscovered_colon_architecture = {
				name = "Not Discovered",
				text = {
					"Obtain this card in an",
					"unseeded run to",
					"learn what it does",
				},
			},
			undiscovered_yma_tboi_items = {
				name = "Not Discovered",
				text = {
					"Obtain this card in an",
					"unseeded run to",
					"learn what it does",
				},
			},
			undiscovered_yma_keys = {
				name = "Unknown Key Card",
				text = {
					"Find this card in an unseeded",
					"run to find out what it does",
				},
			},
			undiscovered_cbean_stickersheet = {
				name = "Not Discovered",
				text = {
					"Obtain this card in",
					"an unseeded run to",
					"learn what it does",
				},
			},
			k_cbean_pissjoker = {
				name = "Piss Joker",
				text = {
					"Count as a {C:attention}Piss{}",
					"{C:attention}related{} Joker",
				},
			},
			p_cbean_colon_architecture_normal = {
				name = "Construction Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:colon_Architecture}Architecture{} cards to",
					"be used immediately",
				},
			},
			p_cbean_colon_architecture_jumbo = {
				name = "Jumbo Construction Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:colon_Architecture}Architecture{} cards to",
					"be used immediately",
				},
			},
			p_cbean_colon_architecture_mega = {
				name = "Mega Construction Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:colon_Architecture}Architecture{} cards to",
					"be used immediately",
				},
			},
			--Zodiacs
			p_cbean_czodiac_normal1 = {
				name = "Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_normal2 = {
				name = "Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_normal3 = {
				name = "Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_normal4 = {
				name = "Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_jumbo1 = {
				name = "Jumbo Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_jumbo2 = {
				name = "Jumbo Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_mega1 = {
				name = "Mega Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			p_cbean_czodiac_mega2 = {
				name = "Mega Zodiac Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
					"be used immediately",
				},
			},
			--Blessings
			p_cbean_blessing_normal1 = {
				name = "Pantheon Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
					"to take with you",
				},
			},
			p_cbean_blessing_normal2 = {
				name = "Pantheon Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
					"to take with you",
				},
			},
			p_cbean_blessing_jumbo = {
				name = "Jumbo Pantheon Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
					"to take with you",
				},
			},
			p_cbean_blessing_mega = {
				name = "Mega Pantheon Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
					"to take with you",
				},
			},
			cbean_combo_starter = { --Explains if card can be used to start a combo
				name = "Combo Starter",
				text = {
					"This card can be used",
					"to start a combo",
				},
			},
			--Keys
			p_cbean_yma_key_normal1 = {
				name = "Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_normal2 = {
				name = "Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_normal3 = {
				name = "Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_normal4 = {
				name = "Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_jumbo1 = {
				name = "Jumbo Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_jumbo2 = {
				name = "Jumbo Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_mega1 = {
				name = "Mega Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			p_cbean_yma_key_mega2 = {
				name = "Mega Key Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:yma_keys}Key{} cards to",
					"be used immediately",
				},
			},
			--Meta packs
			p_cbean_meta_pack1 = {
				name = "Meta Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:money}Consumable^2{} cards"
				},
			},
			p_cbean_meta_pack2 = {
				name = "Meta Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:money}Consumable^2{} cards"
				},
			},
			p_cbean_meta_jumbo = {
				name = "Jumbo Meta Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:money}Consumable^2{} cards"
				},
			},
			p_cbean_meta_mega = {
				name = "Mega Meta Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:money}Consumable^2{} cards"
				},
			},
			--Combo Packs
			p_cbean_combo_booster_standard1 = {
				name = "Jimbattle: Standard Edition",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:combo,E:1}Combo{} cards",
					"to take with you"
				},
			},
			p_cbean_combo_booster_standard2 = {
				name = "Jimbattle: Standard Edition",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:combo,E:1}Combo{} cards",
					"to take with you"
				},
			},
			p_cbean_combo_booster_special1 = {
				name = "Jimbattle: Special Edition",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:combo,E:1}Combo{} cards",
					"to take with you"
				},
			},
			p_cbean_combo_booster_ultimate1 = {
				name = "Jimbattle: Ultimate Edition",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:combo,E:1}Combo{} cards",
					"to take with you"
				},
			},

			-- Sticker Sheet Packs

			p_cbean_nameteam_stickersheet_normal1 = {
				name = "Collector's Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:cbean_stickersheet}Sticker Sheets{} to",
					"be used immediately"
				}
			},
			p_cbean_nameteam_stickersheet_normal2 = {
				name = "Collector's Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:cbean_stickersheet}Sticker Sheets{} to",
					"be used immediately"
				}
			},
			p_cbean_nameteam_stickersheet_jumbo1 = {
				name = "Storage Collector's Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:cbean_stickersheet}Sticker Sheets{} to",
					"be used immediately"
				}
			},
			p_cbean_nameteam_stickersheet_mega1 = {
				name = "Warehouse Collector's Pack",
				text = {
					"Choose {C:attention}#1#{} of up to",
					"{C:attention}#2# {C:cbean_stickersheet}Sticker Sheets{} to",
					"be used immediately"
				}
			},
			--Seals
			cbean_yma_cipher_seal = {
				name = "Cipher Seal",
				text = {
					"{C:green}#1# in #2#{} chance to {C:attention}polish",
					"a random {C:yma_keys}Key{} when this",
					"card is {C:attention}scored",
				},
			},
			-- Name Team Stickers
			cbean_mailed = {
				name = "Mailed",
				text = {
					"{C:red}-$2{} when",
					"{C:red}discarded{}",
				},
			},
			cbean_locked = {
				name = "Locked",
				text = {
					"Selects a {C:attention}random",
					"card in full deck",
					"when applied",
					"When the selected",
					"card or this card",
					"is destroyed, {C:attention}both",
					"are destroyed"
				},
			},
			cbean_unlucky = {
				name = "Unlucky",
				text = {
					"{C:red}Halves{} all probabilities",
					"{C:inactive}(ex. {C:green}2 in 5{C:inactive} -> {C:green}1 in 5{C:inactive}){}",
				},
			},
			cbean_hooking = {
				name = "Hooking",
				text = {
					"{C:red}Discarded{} if held",
					"in hand when",
					"hand is played",
				},
			},
			cbean_colon_tauic = {
				name = "Tauic",
				text = {
					"May apply {C:dark_edition}Negative{}",
				},
			},
			cbean_flashcard = {
				name = "Flash Card",
				text = {
					"{C:attention}Replace{} this card",
					"with another card of",
					"the same {C:attention}rarity{} when",
					"{C:green}rerolling{} the shop",
				},
			},
			cbean_frowning = {
				name = "Frowning",
				text = {
					"{C:red}Debuffed{} if played",
					"hand contains",
					"any {C:attention}face{} cards",
				},
			},
			cbean_plasma = {
				name = "Plasma",
				text = {
					"{X:purple,C:white}X2{} Blind size",
					"Balances {C:attention}10%{} of {C:blue}Chips",
					"and {C:red}Mult{} when",
					"calculating final score",
				},
			},
			cbean_painted = {
				name = "Painted",
				text = {
					"{C:attention}+1{} hand size",
					"{C:red}-1{} Joker slot",
				},
			},
			cbean_black = {
				name = "Black",
				text = {
					"{C:blue}-1{} hand",
					"every round",
					"{C:attention}Jokers{} are {C:attention}10X{} more",
					"likely to be {C:dark_edition}Negative{}",
				},
			},
			cbean_heavy = {
				name = "Heavy",
				text = {
					"{C:red}-1{} hand size",
					"while held in",
					"consumable slots",
				},
			},
			cbean_dangerous = {
				name = "Dangerous",
				text = {
					"When used, {C:green}#1# in #2#{}",
					"chance for the next",
					"selected Blind to",
					"have {X:purple,C:white}X2{} Blind size",
				},
			},
			cbean_shield = {
				name = "Shield",
				text = {
					"{C:green}Prevents{} the",
					"{C:red}destruction{} of this",
					"card {C:attention}once{}",
				},
			},
			cbean_man = {
				name = "Man",
				text = {
					"Cannot be",
					"{C:red}debuffed{}",
				},
			},
			cbean_minuscule = {
				name = "Minuscule",
				text = {
					"Fills {C:dark_edition}0.5{} slots",
				},
			},
			cbean_shuffle = {
				name = "Shuffle",
				text = {
					"When a hand is {C:attention}played{},",
					"randomizes this {C:attention}Joker's position",
				},
			},
			cbean_nebula = {
				name = "Nebula",
				text = {
					"{C:red}-1{} consumable slot, create a",
					"{C:dark_edition}Negative {C:planet}Planet{} card for",
					"{C:attention}most played hand{} when",
					"{C:attention}Small Blind{} is selected",
				},
			},
			cbean_green = {
				name = "Green",
				text = {
					"Earn no {C:attention}Interest",
					"Earn an additional {C:money}$1",
					"per remaining {C:blue}Hand{} and",
					"{C:red}Discard{} at end of round",
				},
			},
			cbean_brainrot = {
				name = "Brainrot",
				text = {
					"If {C:attention}6{} and {C:attention}7{}",
					"are {C:attention}scored{} together",
					"{C:attention}retrigger{} this card",
				},
			},
			cbean_egg = {
				name = "Egg",
				text = {
					"Gains {C:money}$2{} of {C:attention}sell value",
					"at end of round",
				},
			},
			cbean_hungry = {
				name = "Hungry",
				text = {
					"When a {C:attention}Blind{} is selected",
					"{C:red}consumes{} the card",
					"next to it",
				},
			},
			cbean_barren = {
				name = "Barren",
				text = {
					"Card {C:red}cannot",
					"have an",
					"enhancement",
				},
			},
			cbean_spore = {
				name = "Spore",
				text = {
					"When a {C:attention}Blind{}",
					"is set, applies",
					"a {C:dark_edition}random{} sticker",
					"to a different card",
					"in the same area",
				},
			},
			cbean_healing = {
				name = "Healing",
				text = {
					"When a {C:attention}Blind{}",
					"is set removes",
					"a {C:dark_edition}Random{} negative",
					"sticker from a card",
					"in the same area",
				},
			},
			cbean_misprinted = {
				name = "Misprinted",
				text = {
					"Copies a random",
					"{C:attention}Sticker{} effect",
					"Chosen effect changes",
					"at end of round",
					"{C:inactive}(Copying #1#)",
				},
			},
			cbean_poor = {
				name = "Poor",
				text = {
					"All earned money",
					"is halved",
				},
			},
			cbean_square = {
				name = "Square",
				text = {
					"Can only trigger",
					"if played hand",
					"has exactly 4",
					"cards"
				},
			},
			cbean_shroom = {
				name = "Shroom",
				text = {
					"Card is considered",
					"a {C:purple}Shroom{}",
					"Can only trigger",
					"if in the 2 leftmost",
					"slots"
				},
			},
			cbean_guardshroom = {
				name = "Guard Shroom",
				text = {
					"Increase the Values",
					"of the applied card",
					"by {C:attention}%5{}"
				},
			},

			cbean_targeted = {
				name = "Targeted",
				text = {
					"Retrigger this",
					"card {C:attention}once.",
					"Moves to a different",
					"card after triggering"
				},
			},

			cbean_flagged = {
				name = "Flagged",
				text = {
					"After scoring",
					"{C:green}#1# in 8{} Chance to",
					"{C:red}destroy{} adjacent cards"
				},
			},

			-- Blind Stickers

			cbean_the_arm_sticker = {
				name = "The Arm",
				text = {
					"{C:red}Decrease{} {C:planet}level{} of",
					"played {C:attention}poker hand{}",
				},
			},

			cbean_the_club_sticker = {
				name = "The Club",
				text = {
					"During any {C:attention}Blind{},",
					"all {C:clubs}Club{} cards",
					"are {C:red}debuffed{}",
				},
			},

			cbean_the_eye_sticker = {
				name = "The Eye",
				text = {
					"No repeat",
					"{C:attention}hand types{}",
				},
			},
			cbean_the_fish_sticker = {
				name = "The Fish",
				text = {
					"Cards drawn {C:attention}face down{}",
					"after each hand played",
				},
			},
			cbean_the_flint_sticker = {
				name = "The Flint",
				text = {
					"Base {C:chips}Chips{} and",
					"{C:mult}Mult{} are {C:attention}halved{}",
				},
			},
			cbean_the_goad_sticker = {
				name = "The Goad",
				text = {
					"During any {C:attention}Blind{},",
					"all {C:spades}Spade{} cards",
					"are {C:red}debuffed{}",
				},
			},
			cbean_the_head_sticker = {
				name = "The Head",
				text = {
					"During any {C:attention}Blind{},",
					"all {C:hearts}Heart{} cards",
					"are {C:red}debuffed{}",
				},
			},
			cbean_the_wall_sticker = {
				name = "The Wall",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:white,X:purple}X2{} Blind requirement",
				},
			},
			cbean_the_manacle_sticker = {
				name = "The Manacle",
				text = {
					"{C:red}-1{} hand size",
				},
			},
			cbean_the_mark_sticker = {
				name = "The Mark",
				text = {
					"All face cards are",
					"drawn {C:attention}face down{}",
				},
			},
			cbean_the_mouth_sticker = {
				name = "The Mouth",
				text = {
					"Play only {C:attention}1{} hand",
					"type every round",
				},
			},
			cbean_the_ox_sticker = {
				name = "The Ox",
				text = {
					"Playing a {C:attention}#1#{}",
					"sets money to {C:red}$0{}",
				},
			},
			cbean_the_pillar_sticker = {
				name = "The Pillar",
				text = {
					"Cards played previously",
					"this {C:attention}Ante{} are {C:red}debuffed{}",
				},
			},
			cbean_the_needle_sticker = {
				name = "The Needle",
				text = {
					"Play only {C:attention}1{}",
					"hand per round",
					"Blind sizes are {C:attention}halved{}",
				},
			},
			cbean_the_plant_sticker = {
				name = "The Plant",
				text = {
					"During any {C:attention}Blind{},",
					"all {C:attention}face{} cards",
					"are {C:red}debuffed{}",
				},
			},
			cbean_the_psychic_sticker = {
				name = "The Psychic",
				text = {
					"Must play {C:attention}5{}",
					"or more cards",
				},
			},
			cbean_the_serpent_sticker = {
				name = "The Serpent",
				text = {
					"After {C:blue}Play{} or {C:red}Discard{},",
					"always draw {C:attention}3{} cards",
				},
			},
			cbean_the_tooth_sticker = {
				name = "The Tooth",
				text = {
					"Lose {C:red}$1{} per",
					"card played",
				},
			},
			cbean_the_water_sticker = {
				name = "The Water",
				text = {
					"When {C:attention}Blind{} is selected,",
					"lose all {C:red}discards{}",
				},
			},
			cbean_the_wheel_sticker = {
				name = "The Wheel",
				text = {
					"{C:green}#1# in #2#{} cards get",
					"drawn {C:attention}face down{}",
				},
			},
			cbean_the_window_sticker = {
				name = "The Window",
				text = {
					"During any {C:attention}Blind{},",
					"all {C:diamonds}Diamond{} cards",
					"are {C:red}debuffed{}",
				},
			},
			cbean_verdant_leaf_sticker = {
				name = "Verdant Leaf",
				text = {
					"All cards {C:red}debuffed{}",
					"until {C:attention}1{} Joker {C:money}sold{}",
				},
			},
			cbean_cerulean_bell_sticker = {
				name = "Cerulean Bell",
				text = {
					"Forces {C:attention}1{} card to",
					"always be {C:attention}selected{}",
				},
			},
			cbean_amber_acorn_sticker = {
				name = "Amber Acorn",
				text = {
					"{C:attention}Flips{} and {C:attention,E:1}shuffles{}",
					"all Joker cards",
				},
			},
			cbean_crimson_heart_sticker = {
				name = "Crimson Heart",
				text = {
					"One random Joker",
					"{C:red}disabled{} every hand",
				},
			},
			cbean_violet_vessel_sticker = {
				name = "Violet Vessel",
				text = {
					"When {C:attention}Blind{} is selected,",
					"{C:white,X:purple}X3{} Blind requirement",
				},
			},
			--Jbill stickers
			cbean_jaded = {
				name = "Jaded",
				text = { "Considered a {C:attention}face{} card" }
			},
			cbean_banished = {
				name = "Banished",
				text = {
					"{C:red}Discards{} itself when drawn",
					"and draws a new {C:attention}card{}",
					"{C:attention}Removes{} this sticker",
					"after beating a {C:attention}CEO{} Blind"
				}
			},
			cbean_stick2 = {
				name = "Sticker^2",
				text = { "{C:attention}+0.5{} consumable slots" }
			},
			cbean_mitosis = {
				name = "Mitosis",
				text = {
					"{C:green}#1# in #2#{} chance for",
					"{C:attention} Playing{} card to {C:attention}duplicate",
					"at the end of the round"
				}
			},
			-- Stake Stickers
			cbean_nameteam_sticker = {
				name = "NTeam Sticker",
				text = { "Used this Joker", "to win on {C:attention}NTeam", "{C:attention}stake{} difficulty" },
			},
			cbean_consumable_sticker = {
				name = "Consumed Sticker",
				text = { "Used this Joker", "to win on {C:attention}Consumed", "{C:attention}stake{} difficulty" },
			},
			cbean_playingcardstake_sticker = {
				name = "Spade of Stickers",
				text = { "Used this Joker", "to win on {C:attention}Spade of Stakes", "difficulty" },
			},
			cbean_deck_sticker = {
				name = "Painted Sticker",
				text = { "Used this Joker", "to win on {C:attention}Painted", "{C:attention}Stake{} difficulty" },
			},
			cbean_blind_sticker = {
				name = "Plant Sticker",
				text = { "Used this Joker", "to win on {C:attention}Plant", "{C:attention}Stake{} difficulty" },
			},
			--Pizzazzy
			cbean_pizzazzy_a_u = {
				name = "A, E, I, L, N, O, R, S, T, U",
				text = { "{C:mult}+1{}" }
			},
			cbean_pizzazzy_d_g = {
				name = "D, G",
				text = { "{C:mult}+2{}" }
			},
			cbean_pizzazzy_b_p = {
				name = "B, C, M, P",
				text = { "{C:mult}+3{}" }
			},
			cbean_pizzazzy_f_y = {
				name = "F, H, V, W, Y",
				text = { "{C:mult}+4{}" }
			},
			cbean_pizzazzy_k = {
				name = "k",
				text = { "{C:mult}+5{}" }
			},
			cbean_pizzazzy_j_x = {
				name = "J, X",
				text = { "{C:mult}+8{}" }
			},
			cbean_pizzazzy_q_z = {
				name = "m",
				text = { "{C:mult}+10{}" }
			},
			-- Biomes don't work well in info queues
			cbean_biome_nameteam_afterlife = {
				name = "The Afterlife",
				text = {
					"There is nothing to",
					"do here."
				},
			},
		},
		Planet = {
			c_cbean_sdown_gay_planet = {
				name = "Salacia",
			},
			c_cbean_sdown_gayflush_planet = {
				name = "Orcus",
			},
			c_cbean_sdown_bobtail_planet = {
				name = "Vesta",
			},
			c_cbean_0chill_house_rules_planet = {
				name = "Haumea",
				text = {
					"Upgrade every House",
					"Rules {C:legendary,E:1}poker hand",
					"by {C:attention}1{} level",
				},
			},
		},
		colon_Architecture = {
			c_cbean_architecture_complete = {
				name = "#1#",
				text = {
					"{C:attention}#2#{} will appear next Ante"
				}
			},
			c_cbean_architecture_queued = {
				name = "#1#",
				text = {
					"{C:attention}#2#{} will appear in #3# Antes"
				}
			},
			c_cbean_architecture_BUGBUG = {
				name = "PANIC!!!!!!!!!!!!!!!!!!!!",
				text = {
					"{X:mult,C:white}You{} {X:mult,C:white}Did{} {X:mult,C:white}This{} {X:mult,C:white}Wrong!"
				}
			},

			c_cbean_colon_corinthian_capital = {
				name = "Corinthian Capital",
				text = {
					"{C:attention}Alpha{} appears next Ante when",
					"at least {C:attention}33%{} {C:inactive}[#1#%]{} of the cards",
					"in your full deck are {C:attention}Lucky"
				}
			},
			c_cbean_colon_stylobate = {
				name = "Stylobate",
				text = {
					"{C:attention}Omega{} appears next Ante when",
					"you have {C:attention}3{} {C:inactive}[#1#]{} other {C:attention}Architecture",
					"{C:attention}Cards{} in their {C:red}base form",
					"{C:inactive,s:0.8}(Excluding Stylobate)"
				}
			},
			c_cbean_colon_raking = {
				name = "Raking",
				text = {
					"{C:attention}Beta{} appears next Ante when",
					"a {C:attention}Food Joker{} is {C:red}destroyed"
				}
			},
			c_cbean_colon_abacus = {
				name = "Abacus",
				text = {
					"{C:attention}Gamma{} appears next Ante when",
					"{C:attention}20{} {C:inactive}[#1#]{} {C:red}unscoring cards{} are played"
				}
			},
			c_cbean_colon_flute = {
				name = "Flute",
				text = {
					"{C:attention}Delta{} appears next Ante",
					"when {C:attention}5{} {C:inactive}[#1#]{} or more {C:red}discards",
					"are used in {C:attention}one round"
				}
			},
			c_cbean_colon_necking = {
				name = "Necking",
				text = {
					"{C:attention}Epsilon{} appears next Ante",
					"when you win within {C:attention}10%{} of",
					"the {C:red}Blind requirement"
				}
			},
			c_cbean_colon_volute = {
				name = "Volute",
				text = {
					"{C:attention}Zeta{} appears next Ante when {C:attention}5 Glass",
					"{C:attention}cards{} are {C:red}discarded{} at the same time"
				}
			},
			c_cbean_colon_acanthus_leaf = {
				name = "Acanthus Leaf",
				text = {
					"{C:attention}Eta{} appears next Ante when",
					"{C:attention}4{} {C:inactive}[#1#]{} {C:attention}#2#s{} have been {C:red}destroyed"
				}
			},
			c_cbean_colon_cornice = {
				name = "Cornice",
				text = {
					"{C:attention}Theta{} appears next Ante when",
					"a hand that's {C:attention}on fire{} is {C:red}discarded"
				}
			},
			c_cbean_colon_frieze = {
				name = "Frieze",
				text = {
					"{C:attention}Iota{} appears next Ante when",
					"{C:attention}50{} {C:inactive}[#1#]{} items are {C:attention}purchased"
				}
			},
			c_cbean_colon_fillet = {
				name = "Fillet",
				text = {
					"{C:attention}Kappa{} appears next Ante when",
					"the {C:red}final hand{} of round is",
					"used {C:attention}3{} {C:inactive}[#1#]{} rounds in a row"
				}
			},
			c_cbean_colon_boss = {
				name = "Boss",
				text = {
					"{C:attention}Lambda{} appears next Ante",
					"when {C:red}#1#{} is redeemed"
				}
			},
			c_cbean_colon_triglyph = {
				name = "Triglyph",
				text = {
					"{C:attention}Mu{} appears next Ante when",
					"you {C:red}discard{} {C:attention}#1# 10{} {C:inactive}[#2#]{} times"
				}
			},
			c_cbean_colon_metope = {
				name = "Metope",
				text = {
					"{C:attention}Nu{} appears next Ante when you",
					"play a {C:attention}Flush{} of {V:1}#1#{} {C:attention}3{} {C:inactive}[#2#]{} times"
				}
			},
			c_cbean_colon_shaft = {
				name = "Shaft",
				text = {
					"{C:attention}Xi{} appears next Ante when",
					"your {C:attention}greatest leveled",
					"poker hand is {C:red}#1#"
				}
			},
			c_cbean_colon_rosette = {
				name = "Rosette",
				text = {
					"{C:attention}Omicron{} appears next Ante",
					"when your deck does not",
					"change for {C:attention}3{} {C:inactive}[#1#]{} Antes in a row"
				}
			},
			c_cbean_colon_drum = {
				name = "Drum",
				text = {
					"{C:attention}Pi{} appears next Ante when {C:attention}1 Flush House{} {C:inactive}[#1#]{},",
					"{C:attention}Five of a Kind{} {C:inactive}[#2#]{}, and {C:attention}Flush Five{} {C:inactive}[#3#]",
					"have each been {C:red}discarded"
				}
			},
			c_cbean_colon_architrave = {
				name = "Architrave",
				text = {
					"{C:attention}Rho{} appears next Ante when {C:attention}10{} {C:inactive}[#2#]{} {C:attention}poker hands{}",
					"that are {C:red}not {C:attention}#1#{} are played"
				}
			},
			c_cbean_colon_echinus = {
				name = "Echinus",
				text = {
					"{C:attention}Sigma{} appears next Ante when",
					"your deck contains {C:attention}at least one",
					"card of {C:attention}every vanilla Enhancement",
					"{C:inactive,s:0.8}(You need #1#)"
				}
			},
			c_cbean_colon_echinus_nil = {
				name = "Echinus",
				text = {
					"{C:attention}Sigma{} appears next Ante when",
					"your deck contains {C:attention}at least one",
					"card of {C:attention}every vanilla Enhancement"
				}
			},
			c_cbean_colon_echinus_multiple = {
				name = "Echinus",
				text = {
					"{C:attention}Sigma{} appears next Ante when",
					"your deck contains {C:attention}at least one",
					"card of {C:attention}every vanilla Enhancement",
					"{C:inactive,s:0.6}(You need #1# and #2#)"
				}
			},
			c_cbean_colon_molding = {
				name = "Molding",
				text = {
					"{C:attention}Tau{} appears next Ante when",
					"The Wheel of Fortune {C:tarot}Nopes!",
					"{C:attention}4{} {C:inactive}[#1#]{} times in a row"
				}
			},
			c_cbean_colon_pediment = {
				name = "Pediment",
				text = {
					"{C:attention}Upsilon{} appears next Ante when all possible",
					"{C:attention}Blinds{} are {C:red}skipped{} for {C:attention}3{} {C:inactive}[#1#]{} Antes in a row"
				}
			},
			c_cbean_colon_base = {
				name = "Base",
				text = {
					"{C:attention}Phi{} appears next Ante when at",
					"least {C:attention}2{} of the same Joker are",
					"owned {C:red}simultaneously"
				}
			},
			c_cbean_colon_entablazure = {
				name = "Entablazure",
				text = {
					"{C:attention}Chi{} appears next Ante when",
					"you have {C:red}exactly{} {C:attention}1{} {C:blue}Common{} {C:inactive}[#1#]{},",
					"{C:green}Uncommon{} {C:inactive}[#2#]{} and {C:red}Rare{} {C:inactive}[#3#]{} Joker"
				}
			},
			c_cbean_colon_ionic_captial = {
				name = "Ionic Capital",
				text = {
					"{C:attention}Psi{} appears next Ante when",
					"{C:attention}5{} {C:inactive}[#1#]{} {C:spectral}Spectral{} Packs are {C:red}skipped"
				}
			},
		},
		Spectral = {
			c_cbean_colon_stereobate = {
				name = "Stereobate",
				text = {
					"A random {C:legendary,E:1}Greek Blind",
					"appears next Ante"
				}
			},
			c_cbean_colon_stereobate_queued = {
				name = "Stereobate",
				text = {
					"A random {C:legendary,E:1}Greek Blind",
					"will appear in #1# Antes"
				}
			},

			c_cbean_yma_archive = {
				name = "Archive",
				text = {
					"Add a {V:1}#2#",
					"to {C:attention}#1#{} selected",
					"card in your hand",
				},
			},
			c_cbean_yma_omega = {
				name = "Omega Key",
				text = {
					"{C:attention}Create{} a random {C:dark_edition}Negative{} {C:yma_keys}Key{}",
					"when {C:blue}hand{} is played",
					"{C:inactive}(Uses #1#/#2# hands)",
				},
			},
			c_cbean_0chill_qilin = {
				name = "The Qilin",
				text = {
					"Turn at least {C:attention}2{} selected cards",
					"into the rank of the {C:attention}rightmost{}",
					"selected card and {C:dark_edition}Negative{}",
					"{C:inactive}(Drag to rearrange)",
				},
			},
			c_cbean_0chill_cronus = {
				name = "The Blessing of Cronus",
				text = {
					{
						"Prevents {C:attention}Blessings{} from",
						"using charges each round",
						"{C:inactive}({C:attention}#1#{C:inactive} rounds left)",
					},
					{
						"Gains {C:attention}#2#{} charges when",
						"a blessing is {C:attention}sold{}",
					},
				},
			},
			c_cbean_0chill_nope_from_above = {
				name = {
					"Nope! From Above",
					"{X:dark_edition,C:white,s:0.7}Universal{}",
				},
				text = {
					{
						"{C:green}#2# in #3#{} chance for one of below:",
						"{s:0.8}1. {C:chips,s:0.8}+#4#{s:0.8} Chips, {C:mult,s:0.8}+#5#{s:0.8} Mult, {X:mult,C:white,s:0.8}X#6#{s:0.8} Mult",
						"{s:0.7}Boosted by total combo length",
						"{s:0.8}2. Add {C:dark_edition,s:0.8}Polychrome{s:0.8} to a random Joker",
						"{s:0.8}3. Create {C:attention,s:0.8}#7#{s:0.8} {C:dark_edition,s:0.8}Negative{s:0.8} Tarot card"
					},
					{
						"Counts as {C:dark_edition}#1#{} Combo cards",
					},
					{
						"Combos Into:",
						"{X:dark_edition,C:white}Anything",
						"{C:inactive}(Even if stated otherwise)",
					},
				},
			},
			c_cbean_0chill_for_all = {
				name = {
					"For All",
				},
				text = {
					"For all consumables,",
					"there is a booster pack",
				},
			},
			-- yma upgraded spectrals
			c_cbean_yma_familiar_level1 = {
				name = {
					"Familiar",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced face",
					"{C:attention}cards{} to your hand",
				},
			},
			c_cbean_yma_familiar_level2 = {
				name = {
					"Familiar",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced face",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}Face cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
				},
			},
			c_cbean_yma_familiar_level3 = {
				name = {
					"Familiar",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced face",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}Face cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_familiar_level4 = {
				name = {
					"Familiar",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Destroy {C:attention}#1#{} selected",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced face",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}Face cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_familiar_level5 = {
				name = {
					"Familiar",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Destroy {C:attention}#1#{} selected",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced face",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}Face cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_grim_level1 = {
				name = {
					"Grim",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced Aces",
					"to your hand",
				},
			},
			c_cbean_yma_grim_level2 = {
				name = {
					"Grim",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced Aces",
					"to your hand",
					"Created {C:attention}Aces{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
				},
			},
			c_cbean_yma_grim_level3 = {
				name = {
					"Grim",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced Aces",
					"to your hand",
					"Created {C:attention}Aces{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_grim_level4 = {
				name = {
					"Grim",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Destroy {C:attention}#1#{} selected",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced Aces",
					"to your hand",
					"Created {C:attention}Aces{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_grim_level5 = {
				name = {
					"Grim",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Destroy {C:attention}#1#{} selected",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced Aces",
					"to your hand",
					"Created {C:attention}Aces{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_incantation_level1 = {
				name = {
					"Incantation",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced numbered",
					"{C:attention}cards{} to your hand",
				},
			},
			c_cbean_yma_incantation_level2 = {
				name = {
					"Incantation",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced numbered",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}numbered cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
				},
			},
			c_cbean_yma_incantation_level3 = {
				name = {
					"Incantation",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Destroy {C:attention}#1#{} random",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced numbered",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}numbered cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_incantation_level4 = {
				name = {
					"Incantation",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Destroy {C:attention}#1#{} selected",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced numbered",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}numbered cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_incantation_level5 = {
				name = {
					"Incantation",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Destroy {C:attention}#1#{} selected",
					"card in your hand, add",
					"{C:attention}#2#{} random {C:attention}Enhanced numbered",
					"{C:attention}cards{} to your hand",
					"Created {C:attention}numbered cards{} have a",
					"{C:green}#3# in #4#{} chance to spawn with a {C:attention}Seal{}",
					"and/or an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_talisman_level1 = {
				name = {
					"Talisman",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Add a {C:attention}Gold Seal{}",
					"to {C:attention}#1#{} selected",
					"card in your hand",
				},
			},
			c_cbean_yma_talisman_level2 = {
				name = {
					"Talisman",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Add a {C:attention}Gold Seal{}",
					"to {C:attention}#1#{} selected",
					"card in your hand",
					"When held, retrigger all",
					"{C:attention}Gold Sealed cards{} once",
				},
			},
			c_cbean_yma_talisman_level3 = {
				name = {
					"Talisman",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Add a {C:attention}Gold Seal{}",
					"to {C:attention}#1#{} selected",
					"card in your hand",
					"When held, retrigger all",
					"{C:attention}Gold Sealed cards{} once",
					"and they give {C:money}+$1{} for every",
					"{C:attention}Gold Sealed card{} in deck",
				},
			},
			c_cbean_yma_talisman_level4 = {
				name = {
					"Talisman",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Add a {C:attention}Gold Seal{}",
					"to {C:attention}#1#{} selected",
					"card in your hand",
					"When held, retrigger all",
					"{C:attention}Gold Sealed cards{} once",
					"and they give {C:money}+$1{} for every",
					"{C:attention}Gold Sealed card{} in deck",
				},
			},
			c_cbean_yma_talisman_level5 = {
				name = {
					"Talisman",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Add a {C:attention}Gold Seal{}",
					"to {C:attention}#1#{} selected",
					"card in your hand",
					"When held, retrigger all",
					"{C:attention}Gold Sealed cards{} once,",
					"they give {C:money}+$1{} for every",
					"{C:attention}Gold Sealed card{} in deck,",
					"and gives {C:money}+$6{} for every",
					"{C:attention}Gold Sealed card{} that {C:attention}hasn't{}",
					"been played",
				},
			},
			c_cbean_yma_wraith_level1 = {
				name = {
					"Wraith",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Creates a random",
					"{C:red}Rare{C:attention} Joker{},",
					"sets money to {C:money}$10",
				},
			},
			c_cbean_yma_wraith_level2 = {
				name = {
					"Wraith",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Creates a random",
					"{C:red}Rare{C:attention} Joker{},",
					"with a random {C:dark_edition}Edition{},",
					"sets money to {C:money}$10",
				},
			},
			c_cbean_yma_wraith_level3 = {
				name = {
					"Wraith",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Creates a random",
					"{C:red}Rare{C:attention} Joker{},",
					"with a random {C:dark_edition}Edition{},",
					"and a {C:dark_edition}Negative{},{C:attention} Perishable{},",
					"{C:red}Rare{} {C:attention} Joker",
					"sets money to {C:money}$10",
				},
			},
			c_cbean_yma_wraith_level4 = {
				name = {
					"Wraith",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Creates a random",
					"{C:red}Rare{C:attention} Joker{},",
					"with a random {C:dark_edition}Edition{},",
					"and a {C:dark_edition}Negative{},{C:attention} Perishable{},",
					"{C:red}Rare{} {C:attention} Joker",
				},
			},
			c_cbean_yma_wraith_level5 = {
				name = {
					"Wraith",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Creates {C:attention}2{} random",
					"{C:dark_edition}Negative{} {C:red}Rare{C:attention} Jokers{}",
				},
			},
			c_cbean_yma_sigil_level1 = {
				name = {
					"Sigil",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Converts all cards",
					"in hand to the {C:attention}suit",
					"of the selected {C:attention}card",
				},
			},
			c_cbean_yma_sigil_level2 = {
				name = {
					"Sigil",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Converts all cards",
					"in hand to the {C:attention}suit",
					"of the selected {C:attention}card",
					"They additionally gain the same,",
					"{C:attention}random Enhancement",
				},
			},
			c_cbean_yma_sigil_level3 = {
				name = {
					"Sigil",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Converts all cards",
					"in hand to the {C:attention}suit",
					"of the selected {C:attention}card",
					"They additionally gain the same,",
					"{C:attention}random Enhancement {}and {C:attention}Seal",
				},
			},
			c_cbean_yma_sigil_level4 = {
				name = {
					"Sigil",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Converts up to {C:attention}10{} cards and all cards",
					"in hand to the {C:attention}suit",
					"of the selected {C:attention}card",
					"They additionally gain the same,",
					"{C:attention}random Enhancement {}and {C:attention}Seal",
				},
			},
			c_cbean_yma_sigil_level5 = {
				name = {
					"Sigil",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Converts up to {C:attention}10{} cards and all cards",
					"in hand to the {C:attention}suit",
					"of the selected {C:attention}card",
					"They additionally gain the same,",
					"{C:attention}random Enhancement {}, {C:attention}Seal",
					"and {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_ectoplasm_level1 = {
				name = {
					"Ectoplasm",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Add {C:dark_edition}Negative{} to",
					"a random {C:attention}Joker,",
					"{C:red}-#1#{} hand size",
				},
			},
			c_cbean_yma_ectoplasm_level2 = {
				name = {
					"Ectoplasm",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Add {C:dark_edition}Negative{} to",
					"a random {C:attention}Joker,",
					"and a random {C:attention}consumable{},",
					"{C:red}-#1#{} hand size",
				},
			},
			c_cbean_yma_ectoplasm_level3 = {
				name = {
					"Ectoplasm",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Add {C:dark_edition}Negative{} to",
					"a random {C:attention}Joker,",
					"a random {C:attention}consumable{} and",
					"{C:attention}3{} random {C:attention}Playing Cards{},",
					"in your deck,",
					"{C:red}-#1#{} hand size",
				},
			},
			c_cbean_yma_ectoplasm_level4 = {
				name = {
					"Ectoplasm",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Add {C:dark_edition}Negative{} to",
					"a selected {C:attention}Joker,",
					"a random {C:attention}consumable{} and",
					"{C:attention}3{} random {C:attention}Playing Cards{},",
					"in your deck,",
					"{C:red}-#1#{} hand size",
				},
			},
			c_cbean_yma_ectoplasm_level5 = {
				name = {
					"Ectoplasm",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Add {C:dark_edition}Negative{} to",
					"a selected {C:attention}Joker,",
					"a random {C:attention}consumable{} and",
					"{C:attention}3{} random {C:attention}Playing Cards{},",
					"in your deck and in your hand",
				},
			},
			c_cbean_yma_immolate_level1 = {
				name = {
					"Immolate",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Destroys {C:attention}#1#{} random",
					"cards and {C:attention}#3#{} selected card in hand,",
					"gain {C:money}$#2#",
				},
			},
			c_cbean_yma_immolate_level2 = {
				name = {
					"Immolate",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Destroys {C:attention}#1#{} random",
					"cards and {C:attention}#3#{} selected cards in hand,",
					"gain {C:money}$#2#",
				},
			},
			c_cbean_yma_immolate_level3 = {
				name = {
					"Immolate",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Destroys {C:attention}#1#{} random",
					"cards and {C:attention}#3#{} selected cards in hand,",
					"gain {C:money}$#2#",
				},
			},
			c_cbean_yma_immolate_level4 = {
				name = {
					"Immolate",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Destroys {C:attention}#3#{} selected cards in hand,",
					"gain {C:money}$#2#",
				},
			},
			c_cbean_yma_immolate_level5 = {
				name = {
					"Immolate",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Destroys {C:attention}up to #3#{} selected cards in hand,",
					"gain {C:money}$#2#",
				},
			},
			c_cbean_yma_soul_level1 = {
				name = {
					"The Soul",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Creates a",
					"{C:legendary,E:1}Legendary{} Joker",
					"Created Joker has {X:money,C:white}X2.5{} sell value",
					"{C:inactive}(Must have room)",
				},
			},
			c_cbean_yma_soul_level2 = {
				name = {
					"The Soul",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Creates a",
					"{C:legendary,E:1}Legendary{} Joker",
					"Created Joker has {X:money,C:white}X2.5{} sell value",
					"and always appears with an {C:dark_edition}Edition{}",
					"{C:inactive}(Must have room)",
				},
			},
			c_cbean_yma_soul_level3 = {
				name = {
					"The Soul",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Creates a",
					"{C:legendary,E:1}Legendary{} Joker",
					"Created Joker has {X:money,C:white}X2.5{} sell value",
					"and an {C:dark_edition}Edition{}",
				},
			},
			c_cbean_yma_soul_level4 = {
				name = {
					"The Soul",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Creates a",
					"{C:legendary,E:1}Legendary{} Joker",
					"Created Joker has {X:money,C:white}X2.5{} sell value",
					"and {C:dark_edition}Negative{}",
				},
			},
			c_cbean_yma_soul_level5 = {
				name = {
					"The Soul",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Creates a",
					"{C:legendary,E:1}Legendary{} Joker",
					"Created Joker has {X:money,C:white}X2.5{} sell value",
					"and {C:dark_edition}Negative{}",
					"Creates another joker,",
					"{C:green}Fixed 50% chance{} to either be",
					"another {C:legendary,E:1}Legendary{} or a {C:rare}Rare{}",
				},
			},
			c_cbean_yma_black_hole_level1 = {
				name = {
					"Black Hole",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Upgrade every",
					"{C:legendary,E:1}poker hand",
					"by {C:attention}2{} levels",
				},
			},
			c_cbean_yma_black_hole_level2 = {
				name = {
					"Black Hole",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Upgrade every",
					"{C:legendary,E:1}poker hand",
					"by {C:attention}2{} levels",
					"Upgrades the {C:attention}3 most played Poker Hands{}",
					"by {C:attention}3{} levels",
				},
			},
			c_cbean_yma_black_hole_level3 = {
				name = {
					"Black Hole",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Upgrade every",
					"{C:legendary,E:1}poker hand",
					"by {C:attention}2{} levels plus",
					"the level of the {C:attention}lowest",
					"{C:attention}level Poker Hand",
					"Upgrades the {C:attention}3 most played Poker Hands{}",
					"by {C:attention}3{} levels",
				},
			},
			c_cbean_yma_black_hole_level4 = {
				name = {
					"Black Hole",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Upgrade every",
					"{C:legendary,E:1}poker hand",
					"by {C:attention}2{} levels plus",
					"the level of the {C:attention}lowest",
					"{C:attention}level Poker Hand",
					"Upgrades the {C:attention}3 most played Poker Hands{}",
					"by {C:attention}3{} levels",
					"{C:attention}Doubles{} Chips & Mult of all",
					"{C:attention}Poker Hands{}",
				},
			},
			c_cbean_yma_black_hole_level5 = {
				name = {
					"Black Hole",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Upgrade every",
					"{C:legendary,E:1}poker hand",
					"by {C:attention}2{} levels plus",
					"the level of the {C:attention}lowest",
					"{C:attention}level Poker Hand",
					"Upgrades the {C:attention}3 most played Poker Hands{}",
					"by {C:attention}3{} levels",
					"{C:attention}Doubles{} Chips, Mult",
					"Level Chips & Level Mult of all",
					"{C:attention}Poker Hands{}",
				},
			},
			c_cbean_nteam_mitosis_sheet = {
				name = {
					"Mitosis"
				},
				text = {
					"Applies {C:dark_edition}Mitosis{} to {C:attention}1{}",
					"selected playing card",
				},
			},
		},
		Stake = {
			stake_cbean_nameteam = {
				name = "NTeam Stake",
				text = {
					"Many {C:attention}Stickers{} added by",
					"{E:1,V:1}Name Team{} may spawn",
					"{s:0.8}Applies all previous Stakes",
				},
			},
			stake_cbean_consumable = {
				name = "Consumed Stake",
				text = {
					"{C:attention}Consumables{} may spawn",
					"with specific {C:attention}Stickers{}",
					"{s:0.8}Applies all previous Stakes",
				},
			},
			stake_cbean_playingcardstake = {
				name = "Spade of Stakes",
				text = {
					"{C:attention}Playing Cards{} have a chance to gain",
					"{C:attention}1{} or more {C:attention}Stickers{} after being played",
					"{s:0.8}Applies all previous Stakes",
				},
			},
			stake_cbean_deck = {
				name = "Painted Stake",
				text = {
					"{C:green}1 in 4{} chance to apply",
					"a {C:attention}Sticker{} to your deck",
					"at the end of the shop",
					"{s:0.8}Applies all previous Stakes",
				},
			},
			stake_cbean_blind = {
				name = "Plant Stake",
				text = {
					"Apply a random {C:attention}Blind Sticker",
					"to your deck when",
					"{C:attention}CEO Blind{} is defeated",
					"{s:0.8}Applies all previous Stakes",
				},
			},
		},
		cbean_StickerSheet = {
			c_cbean_plasma_sheet = {
				name = "Plasma",
				text = {
					{
						"Applies {C:dark_edition}Plasma{} to",
						"your {C:attention}Deck{}",
					},
				},
			},
			c_cbean_black_sheet = {
				name = "Black",
				text = {
					{
						"Applies {C:dark_edition}Black{} to",
						"your {C:attention}Deck{}",
					},
				},
			},
			c_cbean_painted_sheet = {
				name = "Painted",
				text = {
					{
						"Applies {C:dark_edition}Painted{} to",
						"your {C:attention}Deck{}",
					},
				},
			},
			c_cbean_nebula_sheet = {
				name = "Nebula",
				text = {
					{
						"Applies {C:dark_edition}Nebula{} to",
						"your {C:attention}Deck{}",
					},
				},
			},
			c_cbean_green_sheet = {
				name = "Green",
				text = {
					{
						"Applies {C:dark_edition}Green{} to",
						"your {C:attention}Deck{}",
					},
				},
			},
			c_cbean_eternal_sheet = {
				name = "Eternal",
				text = {
					{
						"Applies {C:attention}Eternal{} to",
						"a random {C:attention}Joker{}",
					},
					{
						"Creates a free",
						"{C:attention}Voucher Tag{}",
					},
				},
			},
			c_cbean_perishable_sheet = {
				name = "Perishable",
				text = {
					{
						"Applies {C:attention}Perishable{} to",
						"a random {C:attention}Joker{}",
					},
					{
						"Applies {C:dark_edition}Negative{} to",
						"the same {C:attention}Joker{}",
					},
				},
			},
			c_cbean_rental_sheet = {
				name = "Rental",
				text = {
					{
						"Applies {C:attention}Rental{} to",
						"a random {C:attention}Joker{}",
					},
					{
						"Gives {C:money}$20",
					},
				},
			},
			c_cbean_mailed_sheet = {
				name = "Mailed",
				text = {
					{
						"Applies {C:attention}Mailed{} to {C:attention}1{}",
						"selected playing card",
					},
					{
						"Adds a {C:tarot}Purple{} seal",
						"to the same {C:attention}playing card{}",
					},
				},
			},
			c_cbean_hooking_sheet = {
				name = "Hooking",
				text = {
					{
						"Applies {C:attention}Hooking{} to {C:attention}1{}",
						"selected playing card",
					},
					{
						"Another {C:attention}#1# unenhanced{}",
						"cards in your deck",
						"{C:inactive}(if any){} become {C:attention}Gold{}",
					},
				},
			},
			c_cbean_flashcard_sheet = {
				name = "Flash Card",
				text = {
					{
						"Applies {C:attention}Flash Card{} to",
						"{C:attention}1{} selected {C:attention}Joker{}",
					},
					{
						"Next {C:attention}5{} rerolls",
						"cost {C:money}$3{} more",
					},
				},
			},
			c_cbean_frowning_sheet = {
				name = "Frowning",
				text = {
					{
						"Applies {C:attention}Frowning{} to {C:attention}1{}",
						"selected {C:attention}playing card{}",
					},
					{
						"Creates a random",
						"{C:attention}Enhanced face{} card",
					},
				},
			},
			c_cbean_misprinted_sheet = {
				name = "Misprinted",
				text = {
					{
						"Applies {C:attention}Misprinted{} to",
						"{C:attention}1{} selected {C:attention}Joker{}",
					},
					{
						"The selected {C:attention}Joker",
						"becomes {C:dark_edition}Negative{}",
					},
				},
			},
			c_cbean_shield_sheet = {
				name = "Shield",
				text = {
					"Applies {C:attention}Shield{} to",
					"{C:attention}1{} selected {C:attention}Joker{}",
				},
			},
			c_cbean_brainrot_sheet = {
				name = "Brainrot",
				text = {
					"Applies {C:attention}Brainrot{} to {C:attention}1{}",
					"selected {C:attention}playing card{}",
				},
			},
			c_cbean_heavy_sheet = {
				name = "Heavy",
				text = {
					{
						"Applies {C:attention}Heavy{} to",
						"{C:attention}1{} selected consumable",
					},
					{
						"Applies {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
						"{C:dark_edition}Polychrome{} edition to",
						"a random {C:attention}playing card",
					},
				},
			},
			c_cbean_dangerous_sheet = {
				name = "Dangerous",
				text = {
					"Creates a {C:attention}Dangerous{}",
					"{C:spectral}Spectral{} card",
					"{C:inactive}(Must have room){}",
				},
			},
			c_cbean_hungry_sheet = {
				name = "Hungry",
				text = {
					{
						"Applies {C:attention}Hungry{} to",
						"a random Joker",
					},
					{
						"Values of said {C:attention}Joker",
						"are multiplied by {C:attention}x1.5",
					},
				},
			},
			c_cbean_egg_sheet = {
				name = "Egg",
				text = {
					"Applies {C:attention}Egg{} to {C:attention}1{} random",
					"{C:attention}Joker{} without {C:attention}Egg",
				},
			},
			c_cbean_spore_sheet = {
				name = "Spore",
				text = {
					{
						"Applies {C:attention}Spore{} to {C:attention}1{} random",
						"{C:attention}Joker{} without {C:attention}Spore",
					},
					{
						"Earn {C:money}$#1#{} per {C:attention}Sticker",
						"on all held {C:attention}Jokers",
						"{C:inactive}(Will earn {C:money}$#2#{C:inactive})"
					}
				},
			},
			c_cbean_shuffle_sheet = {
				name = "Shuffle",
				text = {
					"Applies {C:attention}Shuffle{} to {C:attention}1{} random",
					"{C:attention}Joker{} without {C:attention}Shuffle",
					"The affected {C:attention}Joker",
					"can't be {C:red}debuffed"
				},
			},
			c_cbean_minuscule_sheet = {
				name = "Minuscule",
				text = {
					"Applies {C:attention}Minuscule{} to {C:attention}1{} selected",
					"{C:attention}Joker{} without {C:attention}Minuscule",
				},
			},
			c_cbean_locked_sheet = {
				name = "Locked",
				text = {
					"Applies {C:attention}Locked{} to {C:attention}1{} selected",
					"{C:attention}playing card{} without {C:attention}Locked{},",
					"then creates {C:attention}#1#{} copies of it",
				},
			},
			c_cbean_healing_sheet = {
				name = "Healing",
				text = {
					"Applies {C:attention}Healing{} to {C:attention}1{} selected",
					"{C:attention}Joker{} without {C:attention}Healing{} that",
					"has a detrimental {C:attention}Sticker",
				},
			},
			c_cbean_barren_sheet = {
				name = "Barren",
				text = {
					"Applies {C:attention}Barren{} to {C:attention}1{} selected",
					"{C:attention}playing card{} without {C:attention}Barren{}",
					"The selected card gains",
					"{X:mult,C:white}X#1#{} Mult permanently"
				},
			},
			c_cbean_square_sheet = {
				name = "Square",
				text = {
					"Applies {C:attention}Square{} to {C:attention}1{} selected",
					"{C:attention}Joker{} without {C:attention}Square{}",
					"The selected {C:attention}Joker{}'s",
					"values are {C:attention}doubled",
					"while {C:attention}Square{} is applied",
					"{C:inactive}(If applicable)"
				},
			},
			c_cbean_poor_sheet = {
				name = "Poor",
				text = {
					"Applies {C:dark_edition}Poor{} to",
					"your {C:attention}Deck{}",
					"Go up to an",
					"additional",
					"{C:red}-$#1#{} in debt "
				},
			},
		},
		Tag = {
			tag_cbean_hongbao = {
				name = 'Hongbao Tag',
				text = {
					"Gives a free",
					"{C:sdown_czodiac}Mega Zodiac Pack"
				}
			},
			tag_cbean_olympus = {
				name = 'Olympus Tag',
				text = {
					"Gives a free",
					"{C:sdown_blessing}Mega Pantheon Pack"
				}
			},
			tag_cbean_sunbean = {
				name = 'Sunbean Tag',
				text = {
					"After defeating",
					"the Blind,",
					"gain {C:money}$#1#",
				},
			},
			tag_cbean_colon_construction = {
				name = 'Construction Tag',
				text = {
					"Gives a free",
					"{C:attention}Mega Construction Pack"
				}
			},
			tag_cbean_colon_ceoreroll = {
				name = 'CEO Tag',
				text = {
					"Reroll the",
					"{C:attention}CEO Blind"
				}
			},
			tag_cbean_0chill_combo = {
				name = 'Turbo Tag',
				text = {
					"Gives a free",
					"{C:combo}Jimbattle: Ultimate Edition Pack"
				}
			},
			tag_cbean_0chill_squared = {
				name = 'Power Tag',
				text = {
					"Gives a free",
					"{C:money}Mega Meta Pack"
				}
			},
			tag_cbean_0chill_key = {
				name = 'Keychain Tag',
				text = {
					"Gives a free",
					"{C:yma_keys}Mega Key Pack"
				}
			},
			tag_cbean_0chill_sticker = {
				name = 'Decal Tag',
				text = {
					"Gives a free",
					"{C:cbean_stickersheet}Warehouse Collector's Pack"
				}
			},
		},
		Tarot = {
			c_cbean_pboys_river = {
				name = "The River",
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			--Jbill tarot
			c_cbean_jbill_currency = {
				name = "The Currency",
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			-- yma consumable upgrades
			c_cbean_yma_magician_level1 = {
				name = {
					"The Magician",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_magician_level2 = {
				name = {
					"The Magician",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_magician_level3 = {
				name = {
					"The Magician",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_magician_level4 = {
				name = {
					"The Magician",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Lucky cards{}",
						"have {C:green}double odds{}",
					},
				},
			},
			c_cbean_yma_magician_level5 = {
				name = {
					"The Magician",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Lucky cards{}",
						"have {C:green}triple odds{}",
					},
				},
			},
			c_cbean_yma_high_priestess_level1 = {
				name = {
					"The High Priestess",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					{
						"Creates up to {C:attention}#1#",
						"random {C:planet}Planet{} cards",
						"{C:inactive}(Must have room)",
					},
					{
						"One created {C:planet}Planet{}",
						"is guranteed to be your",
						"{C:attention}most played hand's{}",
					},
				},
			},
			c_cbean_yma_high_priestess_level2 = {
				name = {
					"The High Priestess",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					{
						"Creates up to {C:attention}#1#",
						"random {C:planet}Planet{} cards",
						"{C:inactive}(Can overflow 1 slot)",
					},
					{
						"One created {C:planet}Planet{}",
						"is guranteed to be your",
						"{C:attention}most played hand's{}",
					},
				},
			},
			c_cbean_yma_high_priestess_level3 = {
				name = {
					"The High Priestess",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					{
						"Creates up to {C:attention}#1#",
						"random {C:planet}Planet{} cards",
						"{C:inactive}(Can overflow 1 slot)",
					},
					{
						"Two created {C:planet}Planets{}",
						"are guranteed to be your",
						"{C:attention}most played hand's{}",
					},
				},
			},
			c_cbean_yma_high_priestess_level4 = {
				name = {
					"The High Priestess",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Creates up to {C:attention}#1# random",
						"{C:dark_edition}Negative{} {C:planet}Planet{} cards",
					},
					{
						"Two created {C:planet}Planets{}",
						"are guranteed to be your",
						"{C:attention}most played hand's{}",
					},
				},
			},
			c_cbean_yma_high_priestess_level5 = {
				name = {
					"The High Priestess",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Creates up to {C:attention}#1#",
					"{C:dark_edition}Negative{} {C:planet}Planet{} cards",
					"of your {C:attention}most played hand{}",
				},
			},
			c_cbean_yma_empress_level1 = {
				name = {
					"The Empress",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_empress_level2 = {
				name = {
					"The Empress",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_empress_level3 = {
				name = {
					"The Empress",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_empress_level4 = {
				name = {
					"The Empress",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Mult Cards{} give",
						"an additional {C:mult}+4{} Mult",
					},	
				},
			},
			c_cbean_yma_empress_level5 = {
				name = {
					"The Empress",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Mult Cards{} give",
						"and additional {C:mult}+4{} Mult",
						"plus {C:mult}5%{} of current Chips",
					},
				},
			},
			c_cbean_yma_heirophant_level1 = {
				name = {
					"The Hierophant",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_heirophant_level2 = {
				name = {
					"The Hierophant",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_heirophant_level3 = {
				name = {
					"The Hierophant",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_heirophant_level4 = {
				name = {
					"The Hierophant",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Bonus Cards{} give",
						"an additional {C:chips}+20{} Chips",
					},
				},
			},
			c_cbean_yma_heirophant_level5 = {
				name = {
					"The Hierophant",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Bonus Cards{} give",
						"an additional {C:chips}+20{} Chips",
						"plus {C:chips}5%{} of current Chips",
					},
				},
			},
			c_cbean_yma_chariot_level1 = {
				name = {
					"The Chariot",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_chariot_level2 = {
				name = {
					"The Chariot",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_chariot_level3 = {
				name = {
					"The Chariot",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_chariot_level4 = {
				name = {
					"The Chariot",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Steel Cards{} give",
						"an additional {X:mult,C:white}X0.5{} Mult",
					},
				},
			},
			c_cbean_yma_chariot_level5 = {
				name = {
					"The Chariot",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Steel Cards{} give",
						"an additional {X:mult,C:white}X0.5{} Mult",
						"and work {C:attention}when played{}",
					},
				},
			},
			c_cbean_yma_justice_level1 = {
				name = {
					"Justice",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_justice_level2 = {
				name = {
					"Justice",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_justice_level3 = {
				name = {
					"Justice",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Enhances {C:attention}#1#{}",
					"selected cards to",
					"{C:attention}#2#s",
				},
			},
			c_cbean_yma_justice_level4 = {
				name = {
					"Justice",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Glass Cards{} are",
						"{C:green}half as likely{} to {C:attention}break",
					},
				},
			},
			c_cbean_yma_justice_level5 = {
				name = {
					"Justice",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Enhances {C:attention}#1#{}",
						"selected cards to",
						"{C:attention}#2#s",
					},
					{
						"Created {C:attention}Glass Cards{} are",
						"{C:green}half as likely{} to {C:attention}break",
						"and give {X:mult,C:white}X1{} more Mult",
					},
				},
			},
			c_cbean_yma_hermit_level1 = {
				name = {
					"The Hermit",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Earn {C:money}$#2#{}, then",
					"double money",
					"{C:inactive}(Max of $#1#){}",
				},
			},
			c_cbean_yma_hermit_level2 = {
				name = {
					"The Hermit",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Earn {C:money}$#2#{}, then",
					"double money",
					"{C:inactive}(Max of $#1#){}",
				},
			},
			c_cbean_yma_hermit_level3 = {
				name = {
					"The Hermit",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Earn {C:money}$#2#{}, then",
					"double money",
					"{C:inactive}(Max of $#1#){}",
				},
			},
			c_cbean_yma_hermit_level4 = {
				name = {
					"The Hermit",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Earn {C:money}$#2#{}, then",
					"double money",
					"{C:inactive}(Max of $#1#){}",
				},
			},
			c_cbean_yma_hermit_level5 = {
				name = {
					"The Hermit",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Earn {C:money}$#2#{}, then",
					"triple money",
					"{C:inactive}(Max of $#1#){}",
				},
			},
			c_cbean_yma_wheel_of_fortune_level1 = {
				name = {
					"The Wheel of Fortune",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"{C:green}#1# in #2#{} chance to add",
					"{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
					"{C:dark_edition}Polychrome{} edition",
					"to a random {C:attention}Joker",
				},
			},
			c_cbean_yma_wheel_of_fortune_level2 = {
				name = {
					"The Wheel of Fortune",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"{C:green}#1# in #2#{} chance to add",
					"{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
					"{C:dark_edition}Polychrome{} edition",
					"to a random {C:attention}Joker",
				},
			},
			c_cbean_yma_wheel_of_fortune_level3 = {
				name = {
					"The Wheel of Fortune",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Adds {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
					"{C:dark_edition}Polychrome{} edition",
					"to a random {C:attention}Joker",
				},
			},
			c_cbean_yma_wheel_of_fortune_level4 = {
				name = {
					"The Wheel of Fortune",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					"Adds {C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or",
					"{C:dark_edition}Polychrome{} edition",
					"to the selected {C:attention}Joker",
				},
			},
			c_cbean_yma_wheel_of_fortune_level5 = {
				name = {
					"The Wheel of Fortune",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					"Adds any edition",
					"to the selected {C:attention}Joker",
				},
			},
			c_cbean_yma_star_level1 = {
				name = {
					"The Star",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_star_level2 = {
				name = {
					"The Star",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_star_level3 = {
				name = {
					"The Star",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Gold Cards{}",
					}
				},
			},
			c_cbean_yma_star_level4 = {
				name = {
					"The Star",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Gold Cards{}",
						"with {C:attention}Blue Seals{}",
					}
				},
			},
			c_cbean_yma_star_level5 = {
				name = {
					"The Star",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:dark_edition}Negative{}",
						"{C:attention}Gold Cards{}",
						"with {C:attention}Blue Seals{}",
					},
				},
			},
			c_cbean_yma_moon_level1 = {
				name = {
					"The Moon",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_moon_level2 = {
				name = {
					"The Moon",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_moon_level3 = {
				name = {
					"The Moon",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Glass Cards{}",
					},
				},
			},
			c_cbean_yma_moon_level4 = {
				name = {
					"The Moon",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Glass Cards{}",
						"with {C:attention}Purple Seals{}",
					},
				},
			},
			c_cbean_yma_moon_level5 = {
				name = {
					"The Moon",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:dark_edition}Foil{}",
						"{C:attention}Glass Cards{}",
						"with {C:attention}Purple Seals{}",
					},
				},
			},
			c_cbean_yma_sun_level1 = {
				name = {
					"The Sun",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_sun_level2 = {
				name = {
					"The Sun",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_sun_level3 = {
				name = {
					"The Sun",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Steel Cards{}",
					},
				},
			},
			c_cbean_yma_sun_level4 = {
				name = {
					"The Sun",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Steel Cards{}",
						"with {C:attention}Red Seals{}",
					},
				},
			},
			c_cbean_yma_sun_level5 = {
				name = {
					"The Sun",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:dark_edition}Polychrome{}",
						"{C:attention}Steel Cards{}",
						"with {C:attention}Red Seals{}",
					},
				},
			},
			c_cbean_yma_world_level1 = {
				name = {
					"The World",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_world_level2 = {
				name = {
					"The World",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Converts up to",
					"{C:attention}#1#{} selected cards",
					"to {V:1}#2#{}",
				},
			},
			c_cbean_yma_world_level3 = {
				name = {
					"The World",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Lucky Cards{}",
					},
				},
			},
			c_cbean_yma_world_level4 = {
				name = {
					"The World",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:attention}Lucky Cards{}",
						"with {C:attention}Gold Seals{}",
					},
				},
			},
			c_cbean_yma_world_level5 = {
				name = {
					"The World",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Converts up to",
						"{C:attention}#1#{} selected cards",
						"to {V:1}#2#{}",
					},
					{
						"Converted cards also",
						"become {C:dark_edition}Holographic{}",
						"{C:attention}Lucky Cards{}",
						"with {C:attention}Gold Seals{}",
					},
				},
			},
			c_cbean_yma_judgement_level1 = {
				name = {
					"Judgement",
					"{C:attention,s:0.7}Level 1{}",
				},
				text = {
					{
						"Creates a random",
						"{C:attention}Joker{} card",
						"{C:inactive}(Must have room)",
					},
					{
						"{C:green}#1# in #2#{} chance to",
						"create a {C:attention}Buffoon Tag{}",
					},
				},
			},
			c_cbean_yma_judgement_level2 = {
				name = {
					"Judgement",
					"{C:attention,s:0.7}Level 2{}",
				},
				text = {
					"Creates a random",
					"{C:attention}Joker{} card",
					"and a {C:attention}Buffoon Tag{}",
					"{C:inactive}(Must have room)",
				},
			},
			c_cbean_yma_judgement_level3 = {
				name = {
					"Judgement",
					"{C:attention,s:0.7}Level 3{}",
				},
				text = {
					"Creates {C:attention}#1#{} random",
					"{C:attention}Jokers{} and a",
					"{C:attention}Buffoon Tag{}",
					"{C:inactive}(Must have room)",
				},
			},
			c_cbean_yma_judgement_level4 = {
				name = {
					"Judgement",
					"{C:attention,s:0.7}Level 4{}",
				},
				text = {
					{
						"Creates {C:attention}#3#{} random",
						"{C:attention}Jokers{} and a",
						"{C:attention}Buffoon Tag{}",
						"{C:inactive}(Must have room)",
					},
					{
						"{C:green}#1# in #2#{} chance to",
						"create a random",
						"{C:attention}Non-Common Joker{}",
					},
						
				},
			},
			c_cbean_yma_judgement_level5 = {
				name = {
					"Judgement",
					"{C:attention,s:0.7}Level 5{}",
				},
				text = {
					{
						"Creates {C:attention}#3#{} random",
						"{C:attention}Jokers{} and a",
						"{C:attention}Buffoon Tag{}",
						"{C:inactive}(Must have room)",
					},
					{
						"{C:green}#1# in #2#{} chance to",
						"create a random",
						"{C:attention}Non-Common Joker{}",
					},
				},
			},
		},
		Voucher = {
			--Yeah! Mostly Artists
			v_cbean_yma_special_deal = {
				name = "Special Deal",
				text = {
					"{C:attention}Booster{} Packs have",
					"{C:attention}#1#{} extra option",
					"to choose from",
				},
			},
			v_cbean_yma_krater = {
				name = "Krater",
				text = {
					"{C:attention}Praying{} becomes more ",
					"{C:attention}effective{} in {C:dark_edition}Dreamland",
				},
			},
			v_cbean_yma_grand_theft = {
				name = "Grand Theft",
				text = {
					"You may now {C:attention}steal",
					"consumables from",
					"{C:attention}Booster{} packs",
				},
			},
			-- Name Team Vouchers
			v_cbean_nameteam_more_choices = {
				name = "More Stock",
				text = {
					"The {C:attention}Stationery Shop",
					"accepts {C:attention}#1#{} more sticker type",
					"and gives {C:attention}#2#{} more rewards",
				},
			},
			v_cbean_nameteam_free_sample = {
				name = "Free Sample",
				text = {
					"Entering the {C:attention}Stationery Shop",
					"the first time this {C:attention}Round",
					"has a {C:green}#1# in #2#{} chance to",
					"create a {C:cbean_stickersheet}Sticker Sheet"
				},
			},
		},
		Biome = {
			--Wgropping it
			wgrop_desert = {
				name = "Desert",
				text = {
					"You can carry less",
					"but packed plenty",
					"of resources",
				},
			},
			wgrop_forest = {
				name = "Forest",
				text = {
					"At the end of the day,",
					"everything grows",
				},
			},
			wgrop_graveyard = {
				name = "Graveyard",
				text = {
					"Destroyed Cards may",
					"persist after death",
				},
			},
			wgrop_volcanic = {
				name = "Volcano",
				text = {
					"Only discards have",
					"value in this land",
				},
			},
			wgrop_glaciers = {
				name = "Glacier",
				text = {
					"The snow reduces your",
					"vision, so keep your",
					"hands warm",
				},
			},
			wgrop_city = {
				name = "City",
				text = {
					"Constant taxes, but",
					"plenty to see and do",
				},
			},
			nameteam_davelawn = {
				name = "Dave's Lawn",
				text = {
					"Plants are your best",
					"option for keeping",
					"zombies off your lawn",
				},
			},
			nameteam_afterlife = {
				name = "The Afterlife",
				text = {
					"There is nothing to",
					"do here"
				},
			},
		},
	},
	misc = {
		achievement_descriptions = {
			ach_cbean_highlight = "Highlight a playing card",
			ach_cbean_highlight2 = "Highlight 2 playing cards",
			ach_cbean_highlight3 = "Highlight 3 playing cards",
			ach_cbean_highlight4 = "Highlight 4 playing cards",
			ach_cbean_highlight5 = "Highlight 5 playing cards",
			ach_cbean_play = "Read the name, dummy",
			ach_cbean_play1 = "Play a hand containing only 1 card",
			ach_cbean_play2 = "Play a hand containing only 2 cards",
			ach_cbean_play3 = "Play a hand containing only 3 cards",
			ach_cbean_play4 = "Play a hand containing only 4 cards",
			ach_cbean_play5 = "Play a hand containing 5 cards",
			ach_cbean_discard = "Discard a hand containing only 1 card",
			ach_cbean_discard2 = "Discard a hand containing only 2 cards",
			ach_cbean_discard3 = "Discard a hand containing only 3 cards",
			ach_cbean_discard4 = "Discard a hand containing only 4 cards",
			ach_cbean_discard5 = "Discard a hand containing 5 cards",
			ach_cbean_yorick = "Discard 23 cards in total",
			ach_cbean_playhigh = "Play a high card",
			ach_cbean_playpair = "Play a pair",
			ach_cbean_playtwopair = "Play two pair",
			ach_cbean_playthree = "Play three of a kind",
			ach_cbean_playfour = "Play four of a kind",
			ach_cbean_playflush = "Play a flush",
			ach_cbean_playstraight = "Play a straight",
			ach_cbean_playfstraight = "Play a straight flush",
			ach_cbean_playgay = "Play a gay",
			ach_cbean_playgayflush = "Play a gay flush",
			ach_cbean_playbob = "Play a bobtail",
			ach_cbean_playhouse = "Play a full house",
			ach_cbean_playsecret = "Play a secret hand (House Rules not included)",
			ach_cbean_playunscoring = "Play a hand with 1 unscoring card",
			ach_cbean_playunscoring2 = "Play a hand with 2 unscoring cards",
			ach_cbean_playunscoring3 = "Play a hand with 3 unscoring cards",
			ach_cbean_playunscoring4 = "Play a hand with 4 unscoring cards",
			ach_cbean_six7 = "Highlight 6-7 in that order",
			ach_cbean_meaning = "Highlight 4-2 in that order",
			ach_cbean_nice = "Highlight 6-9 in that order",
			ach_cbean_nine10 = "Highlight 2-1 in that order",
			ach_cbean_leet = "Highlight 1-3-3-7 in that order",
			ach_cbean_boob = "Highlight 8-A-A-8 in that order",
			ach_cbean_four20 = "Highlight 4-2-0 in that order",
			ach_cbean_pi = "Highlight 3-1-4 in that order",
			ach_cbean_sparta = "Highlight 3-A-A in that order",
			ach_cbean_math = "Highlight 2-5-3 in that order",
			ach_cbean_math2 = "Highlight 4-5 in that order",
			ach_cbean_homestuck = "Highlight 4-1-3 in that order",
			ach_cbean_nend = "Highlight 8-8-8 in that order",
			ach_cbean_bhack = "Press B, stupid!",
			ach_cbean_konami = "Use the Konami Code",
			ach_cbean_teeny_blind = "Beat a teeny blind",
			ach_cbean_small_blind = "Beat a small blind",
			ach_cbean_big_blind = "Beat a big blind",
			ach_cbean_boss_blind = "Beat a boss blind",
			ach_cbean_ceo_blind = "Beat a CEO blind",
			ach_cbean_beaten1 = "Beat a blind",
			ach_cbean_beaten3 = "Beat 3 blinds",
			ach_cbean_beaten6 = "Beat 6 blinds",
			ach_cbean_tenprocent = "Wonderful Elephant reaches 10 mult!",
			ach_cbean_thirtyprocent = "Wonderful Elephant reaches 30 mult!",
			ach_cbean_halfway_mark = "Wonderful Elephant reaches 50 mult!",
			ach_cbean_seventyprocent = "Wonderful Elephant reaches 70 mult!",
			ach_cbean_ninetyprocent = "Wonderful Elephant reaches 90 mult!",
			ach_cbean_slot1 = "Have the Wonderful Elephant in your first joker slot",
			ach_cbean_slot2 = "Have the Wonderful Elephant in your second joker slot",
			ach_cbean_slot3 = "Have the Wonderful Elephant in your third joker slot",
			ach_cbean_slot4 = "Have the Wonderful Elephant in your fourth joker slot",
			ach_cbean_tarot = "Use a tarot",
			ach_cbean_planet = "Use a planet",
			ach_cbean_spectral = "Use a spectral",
			ach_cbean_combo = "Use a combo card",
			ach_cbean_consumesquared = "Use a consumeable^2",
			ach_cbean_blessing = "Hold a blessing while playing a hand",
			ach_cbean_sticker_sheet = "Use a sticker sheet",
			ach_cbean_zodiac = "Use a zodiac card",
			ach_cbean_keys = "Hold a key while playing a hand",
			ach_cbean_mutemusic = "Mute music",
			ach_cbean_maxmusic = "Max out music",
			ach_cbean_contrast = "Enable high contrast",
			ach_cbean_consumefull = "Fill out consumable slots",
			ach_cbean_jokerfull = "Fill out joker slots",
			ach_cbean_ante = "Reach a new (or not so new) Ante",
			ach_cbean_dollars5 = "Have 5 dollars",
			ach_cbean_dollars10 = "Have 10 dollars",
			ach_cbean_dollars25 = "Have 25 dollars",
			ach_cbean_dollars40 = "Have 40 dollars",
			ach_cbean_reroll = "Reroll shop",
			ach_cbean_reroll5 = "Reroll shop 5 times",
			ach_cbean_reroll10 = "Reroll shop 10 times",
			ach_cbean_click = "Click on this Wonderful Elephant!",
			ach_cbean_click5 = "Click on it 5 times!",
			ach_cbean_click10 = "Click on it 10 times!",
			ach_cbean_click20 = "Click on it 20 times!",
			ach_cbean_click35 = "Click on it 35 times!",
			ach_cbean_scoring1000 = "Score reaches 1000",
			ach_cbean_scoring10000 = "Score reaches 10000",
			ach_cbean_scoring50000 = "Score reaches 50000",
			ach_cbean_scoring100000 = "Score reaches 100000",
			ach_cbean_scoring200000 = "Score reaches 200000",
			ach_cbean_complete = "Wonderful Elephant reaches 99 mult...",
			ach_cbean_address_me = "Adressed it!"
		},
		achievement_names = {
			ach_cbean_address_me = "Adress me",
			ach_cbean_highlight = "Highlight of the Day!",
			ach_cbean_highlight2 = "Highlight of the Two-Day!",
			ach_cbean_highlight3 = "Highlight of The... Wednesday?",
			ach_cbean_highlight4 = "Four of a Highlight!",
			ach_cbean_highlight5 = "Highlight of the Week!",
			ach_cbean_play = "Play a Hand!",
			ach_cbean_play1 = "Is it High?",
			ach_cbean_play2 = "Pair of Cards",
			ach_cbean_play3 = "Three of Cards",
			ach_cbean_play4 = "Four of Cards",
			ach_cbean_play5 = "All the Cards!",
			ach_cbean_discard = "Trash",
			ach_cbean_discard2 = "Waste",
			ach_cbean_discard3 = "Full Bin",
			ach_cbean_discard4 = "Dump",
			ach_cbean_discard5 = "Landfill",
			ach_cbean_yorick = "Poor Yorick",
			ach_cbean_playhigh = "High and Mighty?",
			ach_cbean_playpair = "How romantic!",
			ach_cbean_playtwopair = "Twice romantic!",
			ach_cbean_playthree = "Card... X3",
			ach_cbean_playfour = "Just the four of them",
			ach_cbean_playflush = "Not playing toilet flush sound, sorry",
			ach_cbean_playstraight = "Are you sure?",
			ach_cbean_playfstraight = "Pick, asshole?",
			ach_cbean_playgay = "How queerious...",
			ach_cbean_playgayflush = "So queer!",
			ach_cbean_playbob = "Not the cat, not the dog",
			ach_cbean_playhouse = "House always wins",
			ach_cbean_playsecret = "How did you know?",
			ach_cbean_playunscoring = "Wow, wasting",
			ach_cbean_playunscoring2 = "Double the waste",
			ach_cbean_playunscoring3 = "You could just give those to me y'know",
			ach_cbean_playunscoring4 = "4-1 in favor to waster",
			ach_cbean_six7 = "6 7",
			ach_cbean_meaning = "The Meaning of Life",
			ach_cbean_nice = "Nice",
			ach_cbean_nine10 = "What's 9+10?",
			ach_cbean_leet = "LEET",
			ach_cbean_boob = "Boob",
			ach_cbean_four20 = "I have no drug jokes in me",
			ach_cbean_pi = "Pie? Where?",
			ach_cbean_sparta = "THIS IS SPARTA",
			ach_cbean_math = "(2*125)+3",
			ach_cbean_math2 = "3*(30/(15-13))",
			ach_cbean_homestuck = "Homestuck",
			ach_cbean_nend = "The end is never the end",
			ach_cbean_bhack = "Press B, stupid!",
			ach_cbean_konami = "Way too much contra",
			ach_cbean_teeny_blind = "Baby Steps",
			ach_cbean_small_blind = "Small step for a Joker",
			ach_cbean_big_blind = "A Big Blind for the Jokerkind",
			ach_cbean_boss_blind = "From space to gamble",
			ach_cbean_ceo_blind = "Eat the rich",
			ach_cbean_beaten1 = "YOU'RE WINNER", -- Intended
			ach_cbean_beaten3 = "Triple kill",
			ach_cbean_beaten6 = "Six of a Blind",
			ach_cbean_tenprocent = "10%",
			ach_cbean_thirtyprocent = "30%",
			ach_cbean_halfway_mark = "Halfway Mark",
			ach_cbean_seventyprocent = "70%",
			ach_cbean_ninetyprocent = "90%",
			ach_cbean_slot1 = "I am the first!",
			ach_cbean_slot2 = "Silver medal",
			ach_cbean_slot3 = "Bronce is good enough",
			ach_cbean_slot4 = "Fourth? FOURTH?!",
			ach_cbean_tarot = "To the Treasure Room!",
			ach_cbean_planet = "Stargazing... No, that's not it",
			ach_cbean_spectral = "What even are those? Honestly?",
			ach_cbean_combo = "Combo un-breaker",
			ach_cbean_consumesquared = "To the To the",
			ach_cbean_blessing = "Achoo!",
			ach_cbean_sticker_sheet = "Stick it!",
			ach_cbean_zodiac = "At the moment of writing it's the horse",
			ach_cbean_keys = "I've been looking for it everywhere!",
			ach_cbean_mutemusic = "Missing out on divine sounds",
			ach_cbean_maxmusic = "MAX IT OUT!",
			ach_cbean_contrast = "Makes some contrast, huh?",
			ach_cbean_consumefull = "Full Pockets",
			ach_cbean_jokerfull = "Full Pockers",
			ach_cbean_ante = "Up/Down The Ante!",
			ach_cbean_dollars5 = "Pocket money",
			ach_cbean_dollars10 = "More money",
			ach_cbean_dollars25 = "Money power",
			ach_cbean_dollars40 = "Monier money",
			ach_cbean_reroll = "Show me more",
			ach_cbean_reroll5 = "I said more!",
			ach_cbean_reroll10 = "More!",
			ach_cbean_click = "Click me!",
			ach_cbean_click5 = "Click me more!",
			ach_cbean_click10 = "Click me down!",
			ach_cbean_click20 = "Click me to death!",
			ach_cbean_click35 = "Clickaholic...",
			ach_cbean_scoring1000 = "Low score",
			ach_cbean_scoring10000 = "Over 9000!",
			ach_cbean_scoring50000 = "Half a Hundred",
			ach_cbean_scoring100000 = "Five zeroes",
			ach_cbean_scoring200000 = "Double that",
			ach_cbean_complete = "Wonderful completionist!",

		},
		blind_states = {},
		challenge_names = {
			c_cbean_sdown_inexcusable = "Inexcusable",
			c_cbean_all_stickers = "Oops! All Stickers",
			c_cbean_tornado_poker = "Tornado Poker"
		},
		collabs = {},
		dictionary = {
			k_cbean_token 						= "Token",
			k_cbean_0chill_combopack            = "Combo Pack",

			k_colon_architecture_pack           = "Architecture Pack",

			cbean_colon_random_face             = "(Random face card)",
			cbean_colon_random_achievable_tier2 = "(Random T2 Voucher)",
			cbean_colon_most_rank_in_deck       = "(Most common rank in deck)",
			cbean_colon_least_suit_in_deck      = "(Least common suit in deck)",
			cbean_colon_least_leveled           = "(Least leveled poker hand)",
			cbean_colon_most_played             = "(Most played poker hand)",

			sheet_most_held                     = "(Most held rank)",
			sheet_most_played                   = "(Most played rank)",
			regression_most_rank                = "(Most common rank)",
			regression_least_rank               = "(Least common rank)",
			regression_most_suit                = "(Most common suit)s",
			regression_least_suit               = "(Least common suit)s",
			demeter_random_rank                 = "[Rank]",
			sdown_czodiac_add                   = "+1 Zodiac",
			k_cbean_0chill_formation_ex         = "Formation Change!",
			k_dispelled_ex                      = "Dispelled!",
			k_strengthened_ex                   = "Strengthened!",
			k_cbean_sdown_czodiacpack           = "Zodiac Pack",
			k_cbean_sdown_blessingpack          = "Pantheon Pack",
			ph_alley_wager                      = "Care to make a wager?",
			ph_graveyard                        = "Where the dead sleeps",
			ph_stationery                       = "We trade Stickers!",
			ph_choose_biome_1                   = "Choose your",
			ph_choose_biome_2                   = "Destination",
			k_select_biome                      = "Select",
			b_reroll                            = "Reroll",
			cbean_yma_toggle_to_items			= "Show Items",
			cbean_yma_toggle_to_jokers			= "Show Jokers",
			q_cbean_yma_quality1				= "Quality 1",
			q_cbean_yma_quality2				= "Quality 2",
			q_cbean_yma_quality3				= "Quality 3",
			q_cbean_yma_quality4				= "Quality 4",
			cbean_stationery_accepts            = {
				"Only accepts Jokers",
				"with {C:attention}1 or more{} of the",
				"{C:attention}Stickers{} listed below:",
			},
			cbean_stationery_gives              = {
				"In exchange for the",
				"listed {C:attention}Stickers{}, will",
				"give the following:",
			},
			cbean_stationery_name               = {
				"{f:cbean_fancy,s:2}Dr. Cattlebury{}",
				"{C:inactive}(Full name: Bentley",
				"{C:inactive}Reed Cattlebury)",
			},
			--#region Stationery rewards
			cbean_reward_money                  = {
				"Earn {C:money}$#1#{}",
			},
			cbean_reward_joker_edition          = {
				"Creates a random Joker",
				"with a random {C:edition}Edition{}",
				"{C:inactive}(Must have room)",
			},
			cbean_reward_shield                 = {
				"Applies {V:1,T:cbean_shield}Shield{} to",
				"selected Joker",
			},
			cbean_reward_plasma                 = {
				"Applies {V:1,T:cbean_plasma}Plasma{} to",
				"current Deck",
			},
			cbean_reward_black                  = {
				"Applies {V:1,T:cbean_black}Black{} to",
				"current Deck",
			},
			cbean_reward_painted                = {
				"Applies {V:1,T:cbean_painted}Painted{} to",
				"current Deck",
			},
			cbean_reward_house                  = {
				"Creates {C:attention,T:j_cbean_0chill_house_rules}House Rules{}",
				"{C:inactive}(Must have room)",
			},
			cbean_reward_sheets                 = {
				"Creates {C:attention}#1#{} {C:dark_edition,T:e_negative}Negative{}",
				"{C:cbean_stickersheet}Sticker Sheets{}",
			},
			cbean_reward_blessings              = {
				"Creates {C:attention}#1#{} {C:dark_edition,T:e_negative}Negative{}",
				"{C:attention}Blessings{}",
			},
			cbean_reward_keys                   = {
				"Creates {C:attention}#1#{} {C:dark_edition,T:e_negative}Negative{}",
				"{C:attention}Keys{}",
			},
			cbean_reward_zodiacs                = {
				"Creates {C:attention}#1#{} {C:dark_edition,T:e_negative}Negative{}",
				"{C:attention}Chinese Zodiacs{}",
			},
			cbean_reward_combos                 = {
				"Creates {C:attention}#1#{} {C:dark_edition,T:e_negative}Negative{}",
				"{C:attention}Combo Cards{}",
			},
			--#endregion
			k_cbean_yma_keypack                 = "Key Pack",
			cbean_0chill_blind_weakend          = "Blind Weakened!",
			cbean_0chill_blind_strengthened     = "Blind Strengthened!",
			k_revived_ex  						= "Revived!",

			k_colon_architecture                = "Architecture",
			ph_no_colon_architecture            = "No architecture in progress",
			ph_colon_architecture_started       = "Architecture in progress",
			k_cbean_colon_started_ex            = "In Progress!",
			k_cbean_colon_completed_ex          = "Constructed!",
			k_cbean_colon_queued_ex             = "Queued!",
			b_colon_architecture_cards          = "Architecture Cards",

			k_yma_spin_casino                   = "Spin",
			k_yma_tboi_chest                    = "Chest",
			k_yma_keys                          = "Key",
			k_failed_ex                         = "Failed",
			k_yma_tboi_items                    = "Item",
			b_yma_keys_cards                    = "Keys",
			k_yma_key_plus_use                  = "Use",
			k_cbean_yma_street                  = "Street",
			k_hell_sac                          = "Sacrifice",
			k_yma_chance_to_fail_key            = "(Chance to break)",
			k_yma_chance_to_fail_belssing       = "(Chance to fail)",
			k_yma_polish                        = "Polish",
			k_yma_pray                          = "Pray",
			k_yma_pray_fail                     = "Unanswered",
			k_yma_polish_fail                   = "Salvaged",
			k_yma_key_broke                     = "Broken",
			k_yma_dreamland_upgrade             = "Upgrade",
			k_yma_key_faded                     = "Faded",
			k_yma_transform                     = "Transformed!",
			k_yma_tag                           = "Tag!",
			k_cbean_peashooter_1                = "Armless Zombie",
			k_cbean_peashooter_2                = "Headless Zombie",
			k_cbean_peashooter_3                = "Dead Zombie",
			k_cbean_burned                      = "Burned!",
			k_cbean_piss_ex                     = "Piss!",
			k_cbean_mash_ex                     = "Mash!",
			k_cbean_munch_ex					= "Munched!",
			k_cbean_pboys_abet                  = "Bet",
			k_cbean_unique_ex                   = "???",
			k_cbean_balley_ex                   = "Alley!",
			k_cbean_aexit_ex                    = "Exit",
			k_cbean_pboys_arule                 = "Choose a Cup",
			k_cbean_pboys_aplus                 = "+",
			k_cbean_pboys_aminus                = "-",
			k_cbean_nteam_doubled               = "Doubled!",
			k_cbean_nteam_tripled               = "Tripled!",
			k_cbean_nteam_halved                = "Halved!",
			cbean_disable_animations            = "Disable Joker Animations",
			cbean_disable_copyright             = "Disable Copyrighted Material",
			k_cbean_stickersheet                = "Sticker Sheet",
			b_cbean_stickersheet_cards          = "Sticker Sheets",
			k_cbean_stickersheetpack            = "Collector's Pack",
			b_nteam_exchange                    = "Exchange",
			k_plus_stickersheet                 = "+1 Sticker Sheet",
			k_plus_blessing                     = "+1 Blessing",
			k_plus_combo_card                   = "+1 Combo",
			k_plus_key                          = "+1 Key",
			k_plus_soul                         = "+The Soul",
			k_plus_piss                         = "+1 Piss Card",
			k_cbean_nteam_uhoh                  = "Uh oh!",
			k_cbean_nteam_danger                = "Danger!",
			k_cbean_nteam_randomized            = "Randomized!",
			k_cbean_unknown                     = "Unknown",
			k_jbill_leak                        = "Leak!",
			k_jbill_ach                         = "Achievement Unlocked!",
			k_jbill_metapack                    = "Meta Pack",
			k_ihaveagun_ex                      = "I HAVE A GUN!",

			k_cbean_halved                      = "Halved!",
			k_cbean_chomp                       = "Chomp!",

			k_nteam_tboi_items                	= "Items",

			k_cbean_yomama                      = "Yo mama...",

			k_styx_active                       = "active",
			k_styx_inactive                     = "inactive",

			k_converted                         = "Converted",

			k_cbean_mitosis                     = "Mitosis!",

			k_cbean_adapaige_heal               = "Healed!",
			k_cbean_edega_debuff                = "Healed?",
			k_cbean_ian_exhausted               = "Exhausted!",

			ph_cbean_nameteam_charles           = "Saved by Charles",
			ph_cbean_nameteam_wayne             = "Click Cash Out to Continue",
			k_cbean_promoted_ex                 = "Promoted!",

			ph_cbean_dragon_bruit               = "Saved by Dragon Bruit!",
			k_cbean_replaced_ex                 = "Replaced!",

			k_who_away                          = "Go Away!",
			k_schneider_upg                     = "My lord...",
			k_astro_upg                         = "Unbalanced!",
			k_dollar_jimbux                     = "Exchnaged!",

			k_yma_aug_scrap  					= "Scrap",

			cbean_copyright_headsup_1           = "Heads up!",
			cbean_copyright_headsup_2           = "If you are streaming this mod,",
			cbean_copyright_headsup_3a          = "you should turn on the ",
			cbean_copyright_headsup_3b          = "Disable",
			cbean_copyright_headsup_4a          = "Copyrighted Material",
			cbean_copyright_headsup_4b          = " setting in",
			cbean_copyright_headsup_5           = "this mod's Config to avoid any",
			cbean_copyright_headsup_6           = "issues with copyright.",
			cbean_dontshowagain                 = "Don't show me this again",
			bean_1                              = "Make good use of this umbrella",
			bean_2                              = "What? No, my legal name isn't BEANIE, are you fucking stupid?",
			bean_3                              = "It has a small comment written on it, '--J*kers fuck off'",
			bean_4                              = "Not approved by the School of Apeiron!",
			bean_5                              = "Mr. Localthunk, a second developer chaos has hit #modding",
			bean_6                              = "Our code is made of trans people! They don't mind it :3",
			bean_7                              = "Also try Hot Potato!",
			bean_8                              = "Rated AAAAAAAAAAAAAA for mature Zoobles only!",
			bean_9                              = "Now with the ability to have sex! (Depricated)",
			bean_10                             = "This splash text is sentient!",
			bean_11                             = "Changes your orientation!",
			bean_12                             = "Could hospitalize an autistic toddler!",
			bean_13                             = "Nature's potato': why are Jokers 'playing' Beans?",
			bean_14                             = "5 Jokers out of 150 are employed!",
			bean_15                             = "Mostly harmless!",
			bean_16                             = "Jeu Malter? Hardly even know 'er!",
			bean_17                             = "Originally called Bean's Almanac!",
			bean_18                             = "Filled with jokers, like some kind of digital circus...",
			bean_19                             = "Part of a breakfast that's balanced like Cryptid...",
			bean_20                             = "This mod won't crash itself, it's happy!",
			bean_21                             = "...why are you like this?",
			bean_22                             = "Oops! All obscure references!",
			bean_23                             = "I really wish I weren't here right now",
			bean_24                             = 'She "Orta" on my "Lab" until I "Shinku" ',
			bean_25                             = "You PARASITE!!!!!",
			bean_26                             = "Cold Beans is based on a true story of Cole D. Beane",
			bean_27                             = "Balatro? I hardly even know 'er o!",
			bean_28                             = "You know I put the sauce in the can like I'm Cold Beanz",
			bean_29                             = "It's not a self-insert if it's not yourself!",
			bean_30                             = "This time I'm really gonna do it.",
			bean_31                             = "This quip was added on February 5, 2026!",
			bean_32                             = 'Let\'s pretend that "hot pot is better" is just a personal opinion',
			bean_33                             = "it should have been called cool beans instead im just saying",
			bean_34                             = "Am I glad that he's frozen in there and that we're out here!",
			bean_35                             = "Me when the beans are cold",
			bean_36                             = "Do you wanna build a beanmaaaaan?",
			bean_37                             = "You gotta be kidding me.",
			bean_38                             = "So! How're you finding the crashes?",
			bean_39                             = "Joker? I barely know her!",
			bean_40                             = "Hello there",
			bean_41                             = ":3",
			bean_42                             = "Stop clicking me, it tickles!",
			bean_43                             = "Thanks for slopping by!",
			bean_44                             = "Hotpot? Whats that? Some kinda cold beans ripoff?",
			bean_45                             = "Are we some kinda Cold Beans?",
			bean_46                             = "Cool explosion",
			bean_47                             = "I have a dream - Abraham Lincoln",
			bean_48                             = "play hotpot! it features pregnancy!",
			bean_49                             = "your are the father",
			bean_50                             = "Can you add me to your balatro mod",
			bean_51                             = "Insert cash or payment type",
			bean_52                             = "The cold never bothered me anyway...",
			bean_53                             = "me when the pot isn't hot",
			bean_54                             = "me when the hot isn't pot",
			bean_55                             = "me when i overuse this joke format",
			bean_56                             = "Watch what happens when I cast a bean I don't know!",
			bean_57                             = "Sorry, it's just a prank",
			bean_58                             = "LETS GO JUSTIN!!!!!!",
			bean_59                             = "What if the world was made of pudding?",
			bean_60                             = "Thats not... the ThornRing, is it...?",
			bean_61                             = "THIS JOKER CARD IS THE PROPERTY OF JOHN C. BEANS",
			bean_62                             = "... ignoring the fact that they might be Dracula",
			bean_63                             = "LK LK Forward HP LP",
			bean_64                             = "REDACTED is so goated",
			bean_65                             = "I summon pot of greed to draw three additional cards from my deck!",
			bean_66                             = "She's a killer, beeeean",
			bean_67                             = "Me when the mystery is minty",
			bean_68                             = "Tiger Uppercut",
			bean_69                             = "Me when the consumeable is squared",
			bean_70                             = "They're not even square, isn't that messed up?",
			bean_71                             = "There is a virus in this mod sorry:(",
			bean_72                             = "Also try smallpox! ... the mod.  there's a mod named smallpox, don't get the deadly disease that only exists frozen in two labs anymore",
			bean_73                             = "Me when the rules are house",
			bean_74                             = "Can't crit so it's balanced",
			bean_75                             = "Hey guys what if i made another card that's exactly the soul but just for my mod",
			bean_76                             = "Hey guys what if i made another rarity between rare and legendary",
			bean_77                             = "Hey guys what if i made reversed tarots again",
			bean_78                             = "What if instead of cold beans it was warm rice?",
			bean_79                             = "so like are beans the opposite of potatoes or what",
			bean_80                             = "Play it with cryptid! I'm sure nothing will break",
			bean_81                             = "Play cold beans",
			bean_82                             = "DO NOT play cold beans",
			bean_83                             = "I've never seen a Jimbo transformation",
			bean_84                             = "The greatest JokerForge mod to never use Jokerforge!",
			bean_85                             = "i remember you're cold",
			bean_86                             = "it's like he's in some king of... cold beans...",
			bean_87                             = "He's blue for an {C:blue}amazing{} reason",
			bean_88                             = "Also try VVVVVV!",
			bean_89                             = "{V:1} Attempt to index field 'colour' (a nil value) {}",
			bean_90                             = "try going outside",
			bean_91                             = "Also play Jimbo&! and Flying Ace. Separately. Then together. The separately again",
			bean_92                             = "https://ko-fi.com/athebyne6174",
			bean_93                             = "https://ko-fi.com/comykel",
			bean_94                             = "... Fine, go look at https://ko-fi.com/wingedcatgirl if you insist.",
			bean_95                             = "I'm literally a bean, what's your excuse?",
			bean_96                             = "SMODS next release when?",
			bean_97                             = "Deltarune tomorrow",
			bean_98                             = "Normal amount of title screen quips!",
			bean_99                             = "Reblog if you too are gay and/or don't go to bed on time!",
			bean_100                            = "Tax exemption",
			bean_101                            = "                      hi",
			bean_102                            = "According to... nah, I wouldn't do that to ya.",
			bean_103                            = "Switch to Linux!",
			bean_104                            = "I have a suggestion.",
			bean_105                            = "Come give me money at these coordinates...",
			bean_106                            = "Ghosts are awesome",
			bean_107                            = "What is wrong with you? Why are you blue?",
			bean_108                            = "MORAL: There was a Sewer Man",
			bean_109                            = "this quip is taking us to the Moose Man",
			bean_110                            = "funny joker eat a pepsi",
			bean_111                            = "Is pepsi ok?",
			bean_112                            = "This, too, is vanilla.",
			bean_113                            = "I'm always scoring 2 much, or not scoring enough, or not scoring at all",
			bean_114                            = "I know what you are.",
			bean_115                            = "awawawawa :3",
			bean_116                            = "Focus, J",
			bean_118                            = "Incompatible!",
			bean_119                            = "im colding it and by it lets just say my beans",
			bean_120                            = "Bean there, done that",
			bean_121                            = ".-.-  .-.. ..-- -... .-.. ..--  -... --- -... -.--",
			bean_122                            = "Ayo the beans, are here!",
			bean_123                            = "Did you know that this mod contains 66 binding of isaac items? Well, now you know",
			bean_124                            = "Whatever you do at ante 8 dont play small blind",
			bean_125                            = "Now here's what's gonna happen...",
			bean_126                            = "i fogor",
			bean_127                            = "I'm freezing rn",
			bean_128                            = "A visitor?",
			bean_129                            = "I love beans Charlie I LOVES BEANS",
			bean_130                            = "I'm not in cold, Bean(s). I am THE COLD!",
			bean_131                            = "Switch to Amulet",
			bean_132                            = "jimbo word of the day : death",
			bean_133                            = "Swag",
			bean_134                            = "Blueprint x Brainstrom... eeerm... wait... this isnt google...",
			bean_135                            = "And they were roommates",
			bean_136                            = "Me and the boys at 3am looking for beans",
			bean_137                            = "Entrusting this World to Jokers ~ Jokerize World",
			bean_138                            = "Which came first, ranch or cool ranch?",
			bean_139                            = "I warned you about stairs, bro!!!! I told you dog! I told you man! I told you about stairs",
			bean_140                            = "This mod is sponsored by Bean Shadow Legend",
			bean_141                            = "what the hell did i add?", --If you add more quips, go to Jimbobills hooks.lua and look for math.random at line 16. added these
			bean_142                            = "why do they call it oven when you of in the cold food of out hot eat the food",
			bean_143                            = "How've you bean?",
			bean_144                            = "John! What's up! Great to see ya.",
			bean_145                            = "Get me out of this thing!",
			bean_146                            = "What a gift to relish... A victim that can't perish.",
			bean_147                            = "bwow tss. bwowtss, bwowow tss",
			bean_148                            = "adriana salteee",
			bean_149                            = "Wow! If you're reading this, you got very lucky!",
			bean_150                            = "You are the coldest person EVER!",
			bean_151                            = "Well, we know your mouse works now.",
			bean_152                            = "I see you.",
			bean_153                            = "+5 hand size, reduces by 1 each round",
			bean_154                            = "Brrr. Have you brought a coat?",
			bean_155                            = "hnnngggh",
			bean_156                            = "We had to type these flavour texts out manually. Donations appreciated.",
			bean_157                            = "Fuel my caffeine addiction! https://buymeacoffee.com/ghostsalt",
			bean_158                            = "Win 100 runs to leak all the government files!",
			bean_159                            = "Cold Beans: People Get Arrested For Less",
			bean_160                            = "You are now breathing manually.",
			bean_161                            = "FAQ: Why?",
			bean_162                            = "If it's Valentine's Day, happy Valentine's Day! <3",
			bean_163                            = "gwah",
			bean_164                            = "t's th Mssng Vwls rnd!",
			bean_165                            = "My  key stopped working. Anyway, wecome to Cod Beans!",
			bean_166                            = "If this isn't a vibe, the code was certainly vibed.",
			bean_167                            = "No ads, at least.",
			bean_168                            = "Yes... Ha ha ha... YES!",
			bean_169                            = "This is the 169th flavour text! That's 13 squared. Neat!",
			bean_170							= "This is the 170th flavour text! 170 is deficient by 16, it is utterly useless!",
		},
		high_scores = {},
		labels = {
			cbean_yma_common_medal = "Common Medal",
			cbean_yma_uncommon_medal = "Uncommon Medal",
			cbean_yma_rare_medal = "Rare Medal",
			cbean_yma_legendary_medal = "Legendary Medal",
			cbean_colon_tauic = "Tauic",

			cbean_sd_frozen = "Frozen",

			cbean_sdown_lunar_seal = "Lunar Seal",
			cbean_yma_cipher_seal = "Cipher Seal",

			cbean_mailed = "Mailed",
			cbean_hooking = "Hooking",
			cbean_flashcard = "Flash Card",
			cbean_frowning = "Frowning",
			cbean_plasma = "Plasma",
			cbean_painted = "Painted",
			cbean_black = "Black",
			cbean_egg = "Egg",
			cbean_minuscule = "Minuscule",
			cbean_shuffle = "Shuffle",
			cbean_green = "Green",
			cbean_dangerous = "Dangerous",
			cbean_heavy = "Heavy",
			cbean_shield = "Shield",
			cbean_nebula = "Nebula",
			cbean_brainrot = "Brainrot",
			cbean_hungry = "Hungry",
			cbean_barren = "Barren",
			cbean_spore = "Spore",
			cbean_healing = "Healing",
			cbean_misprinted = "Misprinted",
			cbean_poor = "Poor",
			cbean_square = "Square",
			cbean_unlucky = "Unlucky",
			cbean_locked = "Locked",
			cbean_shroom = "Shroom",
			cbean_guardshroom = "Guard Shroom",
			cbean_targeted = "Targeted",
			cbean_flagged = "Flagged",

			cbean_the_arm_sticker = "The Arm",
			cbean_the_club_sticker = "The Club",
			cbean_the_eye_sticker = "The Eye",
			cbean_the_fish_sticker = "The Fish",
			cbean_the_flint_sticker = "The Flint",
			cbean_the_goad_sticker = "The Goad",
			cbean_the_head_sticker = "The Head",
			cbean_the_wall_sticker = "The Wall",
			cbean_the_manacle_sticker = "The Manacle",
			cbean_the_mark_sticker = "The Mark",
			cbean_the_mouth_sticker = "The Mouth",
			cbean_the_ox_sticker = "The Ox",
			cbean_the_pillar_sticker = "The Pillar",
			cbean_the_needle_sticker = "The Needle",
			cbean_the_plant_sticker = "The Plant",
			cbean_the_psychic_sticker = "The Psychic",
			cbean_the_serpent_sticker = "The Serpent",
			cbean_the_tooth_sticker = "The Tooth",
			cbean_the_water_sticker = "The Water",
			cbean_the_wheel_sticker = "The Wheel",
			cbean_the_window_sticker = "The Window",
			cbean_verdant_leaf_sticker = "Verdant Leaf",
			cbean_amber_acorn_sticker = "Amber Acorn",
			cbean_cerulean_bell_sticker = "Cerulean Bell",
			cbean_violet_vessel_sticker = "Violet Vessel",
			cbean_crimson_heart_sticker = "Crimson Heart",
			cbean_man = "Man",

			cbean_jaded = "Jaded",
			cbean_banished = "Banished",
			cbean_stick2 = "Sticker^2",
			cbean_mitosis = "Mitosis",
		},
		poker_hand_descriptions = {
			["cbean_sdown_antistraight"] = {
				"5 cards, with no two cards having the same",
				"or consecutive ranks",
			},
			["cbean_sdown_antistraight_flush"] = {
				"5 cards, all sharing the same suit, with no two cards",
				"having the same or consecutive ranks",
			},
			["cbean_sdown_bobtail"] = {
				"4 cards in a row (consecutive ranks) with",
				"all cards sharing the same suit",
				"Prioritized below Straights"
			},

			--House Rules Hands
			["cbean_sdown_sacrifice"] = {
				"A hand that contains five cards that have not been played before",
				"Must have {C:attention}House Rules{} and {C:attention}Obelisk{} to play",
			},

			["cbean_sdown_8r8k"] = {
				"A hand that contains at least two 8s,",
				"with at least one of them being Lucky",
				"Must have {C:attention}House Rules{} and {C:attention}8 Ball{} to play",
			},

			--how would a normal description even work what would you call this.
			--"5 cards with no two having consecutive ranks. with consecutive ranks" how do you even describe it
			["cbean_sdown_pansexual"] = {
				"A hand that somehow contains both a Straight and a Gay",
				"Must have {C:attention}House Rules{} and {C:attention}Shortcut{} to play",
			},

			["cbean_sdown_pansexual_flush"] = {
				"A hand that somehow contains a Straight a Gay and a Flush",
				"Must have {C:attention}House Rules{} and {C:attention}Shortcut{} to play",
			},

			["cbean_sdown_stone_hand"] = {
				"Daring today, aren't we?",
				"Must have {C:attention}House Rules{} and {C:attention}Marble Joker or Stone Joker{} to play",
			},

			["cbean_sdown_true_home"] = {
				"Three cards with a matching rank and suit,",
				"and two cards with a different matching rank and suit",
				"Must have {C:attention}House Rules{} and {C:attention}Seeing Double or {}",
				"{C:attention}Diamond Shape With a Dot Inside{} to play",
			},

			["cbean_sdown_67"] = {
				"A 6 and a 7. They may be played with up to 3 other unscored cards",
				"Must have {C:attention}House Rules{} and {C:attention}Sixth Sense or Mu Cube{} to play",
			},

			["cbean_sdown_flush_67"] = {
				"A 6 and a 7 sharing the same suit",
				"They may be played with up to 3 other unscored cards",
				"Must have {C:attention}House Rules{} and {C:attention}Sixth Sense or Mu Cube{} to play",
			},

			["cbean_sdown_flush_two"] = {
				"2 cards that share the same rank and suit",
				"They may be played with up to 3 other unscored cards",
				"Must have {C:attention}House Rules{} and {C:attention}Jolly Joker or Sly Joker or The Duo{} to play",
			},

			["cbean_sdown_flush_three"] = {
				"3 cards that share the same rank and suit",
				"They may be played with up to 2 other unscored cards",
				"Must have {C:attention}House Rules{} and {C:attention}Zany Joker or Wily Joker or The Trio{} to play",
			},

			["cbean_0chill_fibonacci"] = {
				"A hand that contains an 8, 5, 3, 2, and an Ace",
				"Must have {C:attention}House Rules{} and {C:attention}Fibonacci{} to play",
			},

			["cbean_0chill_fibonacci_flush"] = {
				"A hand that contains an 8, 5, 3, 2,",
				"and an Ace sharing the same suit",
				"Must have {C:attention}House Rules{} and {C:attention}Fibonacci{} to play",
			},

			["cbean_0chill_proceed"] = {
				"PROCEED",
				"Must have {C:attention}House Rules{} and {C:attention}ThornRing{} to play",
			},

			["cbean_0chill_deer_in_headlights"] = {
				"A hand that contains only 1 King and no other cards",
				"Must have {C:attention}House Rules{} and {C:attention}Asgore's Truck{} to play",
				"{C:inactive}Driving in my truck, right after a beer...",
			},

			["cbean_0chill_favorite_year"] = {
				"EV3RY BUDDY 'S FAVORITE [[Number 1 Rated Hand1997]]",
				"Must have {C:attention}House Rules{} and {C:attention}Big Shot{} to play",
			},

			["cbean_0chill_favorite_year_flush"] = {
				"A hand containing a [FAVORITE] Year and a Flush",
				"Must have {C:attention}House Rules{} and {C:attention}Big Shot{} to play",
				"{C:inactive}Sighting 1997",
			},

			["cbean_0chill_jackpot"] = {
				"A hand that contains three 7s",
				"Must have {C:attention}House Rules{} and ether {C:attention}Oops! All 6s{},",
				"{C:attention}Nat 20{}, or {C:attention}Set of Dice{} to play",
			},

			["cbean_0chill_house_rules"] = {
				"A hand that contains a Jack, 4, 3, Ace, and a Stone Card",
				"Must have {C:attention}House Rules{} to play",
			},

			["cbean_wgrop_thorny_boquete"] = {
				"A hand that contains either",
				"{C:attention}3{} Light Suits and {C:attention}2{} Dark Suits or",
				"{C:attention}2{} Light Suits and {C:attention}3{} Dark Suits",
				"Must have {C:attention}House Rules{} and {C:attention}Withering Memory{} to play"
			},
			["cbean_yma_astro"] = {
				"A hand that contains an Ace, Star, Thorn, Royal, and Omega",
			},
			["cbean_nteam_collection"] = {
				"A hand that contains at least {C:attention}3{} cards with a {C:attention}Sticker",
				"The cards must also have at least {C:attention}3{}",
				"different {C:attention}Stickers{} among them",
				"Must have {C:attention}House Rules{} and {C:attention}Sticker Collection or Stickerbomb{} to play"
			},
			["cbean_nteam_collection_3oak"] = {
				"A hand that contains 3 cards with the same rank and",
				"at least {C:attention}3{} cards with a {C:attention}Sticker",
				"The cards must also have at least {C:attention}3{}",
				"different {C:attention}Stickers{} among them",
				"Must have {C:attention}House Rules{} and {C:attention}Sticker Collection or Stickerbomb{} to play"
			},
		},
		poker_hands = {
			["cbean_yma_astro"] = "Astro",
			["cbean_sdown_antistraight"] = "Gay",    -- Athebyne | N/A | Athebyne
			["cbean_sdown_antistraight_flush"] = "Gay Flush", -- Athebyne | N/A | Athebyne
			["cbean_sdown_bobtail"] = "Bobtail",     -- Athebyne | N/A | Athebyne

			--House Rules Hands
			["cbean_sdown_sacrifice"] = "HR Sacrifice",
			["cbean_sdown_8r8k"] = "HR Lucky 8r8k",
			["cbean_sdown_pansexual"] = "HR Pansexual",
			["cbean_sdown_pansexual_flush"] = "HR Pansexual Flush",
			["cbean_sdown_stone_hand"] = "HR Yet Another 5 Stone Cards Hand",
			["cbean_sdown_true_home"] = "HR True Home",
			["cbean_sdown_67"] = "HR 67",
			["cbean_sdown_flush_67"] = "HR Flush 67",
			["cbean_sdown_flush_two"] = "HR Flush Tuah",
			["cbean_sdown_flush_three"] = "HR Flush Threeah",
			["cbean_0chill_fibonacci"] = "HR Fibonacci",
			["cbean_0chill_fibonacci_flush"] = "HR Fibonacci Flush",
			["cbean_0chill_house_rules"] = "HR House Rules",
			["cbean_0chill_proceed"] = "HR PROCEED",
			["cbean_0chill_deer_in_headlights"] = "HR Deer in Headlights",
			["cbean_0chill_favorite_year"] = "HR [Favorite] Year",
			["cbean_0chill_favorite_year_flush"] = "HR [Favorite] Year Flush",
			["cbean_0chill_jackpot"] = "HR Jackpot!",
			["cbean_wgrop_thorny_boquete"] = "HR Thorny Bouquet",
			["cbean_nteam_collection"] = "HR Collection",
			["cbean_nteam_collection_3oak"] = "HR Three of a Collection",
		},
		quips = {
			--Back Alley Welcome Quotes
			cbean_pboys_hi_1 = {
				"I hope you'll",
				"be interested",
				"in my game!",
			},
			cbean_pboys_hi_2 = {
				"Hello there!",
			},
			cbean_pboys_hi_3 = {
				"Let's play a game!",
			},
			cbean_pboys_hi_4 = {
				"Top of the",
				"morning to you!",
			},
			cbean_pboys_hi_5 = {
				"Hello, traveler!",
			},
			cbean_pboys_hi_6 = {
				"Hi, I hope you",
				"brought good",
				"luck with you!",
			},
			cbean_pboys_hi_7 = {
				"Welcome to the",
				"Back Alley!",
			},

			--Back Alley Win Quotes
			cbean_pboys_win_1 = {
				"{C:dark_edition}YOU WIN!",
				"{C:inactive}sadly...",
			},
			cbean_pboys_win_2 = {
				"My disappearing",
				"trick didn't work...",
			},
			cbean_pboys_win_3 = {
				"It was",
				"beginner's luck!",
			},
			cbean_pboys_win_4 = {
				"I need to shuffle",
				"{S:1.1,C:attention,E:2}faster",
			},
			cbean_pboys_win_5 = {
				"You won?",
				"{C:inactive}oh man",
			},
			cbean_pboys_win_6 = {
				"My debts are growing",
			},
			cbean_pboys_win_7 = {
				"...",
			},
			--Back Alley Lose Quotes
			cbean_pboys_lose_1 = {
				"Better luck",
				"next time",
			},
			cbean_pboys_lose_2 = {
				"99 percent of",
				"gamblers stop right",
				"before winning big",
			},
			cbean_pboys_lose_3 = {
				"You cant stop",
				"losing",
			},
			cbean_pboys_lose_4 = {
				"Wheel of Fortune",
				"probably never",
				"works for you!",
			},
			cbean_pboys_lose_5 = {
				"Wait. Did I win?",
			},
			cbean_pboys_lose_6 = {
				"Money Money Money",
			},
			cbean_pboys_lose_7 = {
				"!!!",
			},
			--Back Alley Too Much Winning Quotes
			cbean_pboys_get_out_1 = {
				"Sorry, you just",
				"win too much",
			},
			cbean_pboys_get_out_2 = {
				"Pay no attention",
				"to the man behind",
				"the cardboard",
			},
			cbean_pboys_get_out_3 = {
				"Three strikes",
				"and I'm out",
			},
			cbean_pboys_get_out_4 = {
				"Give me a round,",
				"gotta make a call",
			},
			cbean_pboys_get_out_5 = {
				"Aw dang it",
			},
			cbean_pboys_get_out_6 = {
				"Oh No What That",
			},
			cbean_pboys_get_out_7 = {
				"I'll come back",
				"when I'm a little",
				"mmmmmm richer"
			},

			--Back Alley Tutorial 
			cbean_pboys_tutorial_1 = {
				"This is {C:attention}Back Alley!",
			},
			cbean_pboys_tutorial_2 = {
				"You can {C:attention}bet{}",
				"your money here.",
			}, --Reworded the tutorial a bit -0chill
			cbean_pboys_tutorial_3 = {
				"Find the {C:attention}ball{}",
				"after I {C:attention}shuffle{}",
				"these cups."
			},
			cbean_pboys_tutorial_4 = {
				"Choosing the correct cup",
				"will {C:attention}double{} the bet.",
			},
			cbean_pboys_tutorial_5 = {
				"Otherwise you will",
				"{C:attention}lose{} everything.",
			},
			cbean_pboys_tutorial_6 = {
				"The higher the bet, the",
				"{C:attention}faster{} I'll shuffle.",
			},
			cbean_pboys_tutorial_7 = {
				"{C:attention}Good luck!",
			},
			cbean_nteam_tutorial_0 = {
				"Click me to progress",
				"through the tutorial of",
				"the {C:attention}Stationery Shop{}",
				"{C:inactive}(0/10)",
			},
			cbean_nteam_tutorial_1 = {
				"Welcome to the {C:attention}Stationery",
				"{C:attention}Shop{}, where you can trade",
				"{C:attention}Stickers{} for various rewards.",
				"{C:inactive}(1/10)",
			},
			cbean_nteam_tutorial_2 = {
				"First, select exactly",
				"{C:attention}1{} Joker to begin the",
				"exchange process.",
				"{C:inactive}(2/10)",
			},
			cbean_nteam_tutorial_3 = {
				"If the selected Joker",
				"has {C:attention}1 or more{} of the",
				"{C:attention}Stickers{} listed to the right...",
				"{C:inactive}(3/10)",
			},
			cbean_nteam_tutorial_4 = {
				"...you can press the",
				"{C:attention}Exchange{} button to remove",
				"all listed {C:attention}Stickers{} and...",
				"{C:inactive}(4/10)",
			},
			cbean_nteam_tutorial_5 = {
				"...receive all the",
				"rewards listed below",
				"the accepted {C:attention}Stickers{}.",
				"{C:inactive}(5/10)",
			},
			cbean_nteam_tutorial_6 = {
				"If a reward states",
				"that a {C:attention}Sticker{} will be",
				"applied and the listed...",
				"{C:inactive}(6/10)",
			},
			cbean_nteam_tutorial_7 = {
				"...target(s) already have",
				"that {C:attention}Sticker{}, then the",
				"{C:attention}Sticker{} won't be reapplied.",
				"{C:inactive}(7/10)",
			},
			cbean_nteam_tutorial_8 = {
				"Exchanging {C:attention}Stickers",
				"in the {C:attention}Stationery",
				"{C:attention}Shop{} will reroll...",
				"{C:inactive}(8/10)",
			},
			cbean_nteam_tutorial_9 = {
				"the {C:attention}Stickers{} this",
				"Shop accepts and",
				"all given rewards.",
				"{C:inactive}(9/10)",
			},
			cbean_nteam_tutorial_10 = {
				"You can also spend",
				"{C:money}money{} to reroll the",
				"{C:attention}Stationery Shop{}.",
				"{C:inactive}(10/10)",
			},
			cbean_yma_forgery_tutorial_0 = {
				"Heya! Want to know what I can do?",
				"Then {C:attention}click me{}."
			},
			cbean_yma_forgery_tutorial_1 = {
				"Welcome to the {C:attention}Forge Shop{}!"
			},
			cbean_yma_forgery_tutorial_2 = {
				"This {C:attention}Medal{} thing is an item that",
				"can buff any Joker you think of!"
			},
			cbean_yma_forgery_tutorial_3 = {
				"To create it, simply select the {C:attention}\"Scrap\"",
				"button while selecting a Joker."
			},
			cbean_yma_forgery_tutorial_4 = {
				"Then, you'll click on {C:red}\"Upgrade\"{} below me!"
			},
			cbean_yma_forgery_tutorial_5 = {
				"After so, I'll... {C:red}\"get rid of\"{} the scrapped Joker",
			},
			cbean_yma_forgery_tutorial_6 = {
				"and upgrade your selected joker with the {C:attention}Medal",
				"that matches the scrapped rarity."
			},
			cbean_yma_forgery_leave1_0 = {
				"That should do it! Enjoy your medal!"
			},
			cbean_yma_forgery_leave1_1 = {
				"Now, I have to dust this room.",
			},
			cbean_yma_forgery_leave1_2 = {
				"So, If you can excuse me..."
			},
			cbean_yma_forgery_leave1_3 = {
				"Go."
			},
			cbean_yma_forgery_leave2 = {
				"Let’s just skip the formalities."
			},
			cbean_yma_forgery_leave3 = {
				"Time to leave."
			},
			cbean_yma_forgery_leave4 = {
				"You know the drill now."
			},
			cbean_yma_forgery_leave5 = {
				"I won't repeat myself again."
			},
			cbean_yma_forgery_leave6 = {
				"Mr. Ceremony isn't going to wait any longer."
			},
		},
		ranks = {
			["cbean_yma_s"] = "Star",
			["cbean_yma_t"] = "Thorn",
			["cbean_yma_r"] = "Royal",
			["cbean_yma_o"] = "Omega",
		},
		suits_plural = {},
		suits_singular = {},
		tutorial = {},
		v_dictionary = {
			coldbean_team = { "Team: #1#" },
			coldbean_idea = { "Idea: #1#" },
			coldbean_art = { "Art: #1#" },
			coldbean_code = { "Code: #1#" },
			a_burned_cards = "#1# Cards",
			a_yma_plus_score = "+#1#% Score",
			a_tarot = "+#1# Tarot",
			a_tarots = "+#1# Tarots"
		},
		v_text = {
			--TODO look at aikoyori's patch more closely to get this to be anything. Or maybe we don't need it to
			--be that modifiable if nobody else uses this. In which case who cares tbh.
			ch_c_cbean_sdown_all_blinds_are = {
				"{C:attention}All Blinds{} are {C:attention}The Folly",
			},
			ch_c_cbean_nteam_all_stickers = {
				"All {C:attention}Jokers{}, {C:attention}consumables{},"
			},
			ch_c_cbean_nteam_all_stickers_2 = {
				"and {C:attention}playing cards{} (including starting ones)",
			},
			ch_c_cbean_nteam_all_stickers_3 = {
				"have {C:attention}Stickers",
			},
			ch_c_cbean_win_ante_poker = {
				"Required {C:attention}Ante{} to win is {C:attention}11",
			},
		},
	},
}
