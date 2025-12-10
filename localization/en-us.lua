-- Sorted by rarity and filtered alphabetically
-- Information goes: Suggestor | Art | Coder

return {
    descriptions = {
        Back = {},
        Blind = {
            bl_cbean_colon_treasure = { -- George The Rat | George The Rat | N/A
                name = "The Treasure",
                text = {
                    "When {C:money}${} is earned, increase",
                    "blind size by {X:purple} X0.2 {} base"
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
                    "a debuffed stone card to deck",
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
                    "card scored this round"                                                -- I changed ante to round if changed change code
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
                    "{X:purple}+X1{} base when",
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
                    "{C:inactive}(Splash-like effects still count as unscoring)"
                }
            },
            bl_cbean_sdown_rebellion = { -- Athebyne | TBA | TBA
                name = "The Rebellion",
                text = {
                    "Cards held in hand subtract",
                    "their chip value from Chips",
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
            bl_cbean_lower_colon_alpha = { -- Glitchkat10 | George The Rat | N/A
                name = "Alpha",
                text = {
                    "Lucky cards' probabilities",
                    "are tripled",
                }
            },
            bl_cbean_upper_colon_alpha = { -- Glitchkat10 | George The Rat | N/A
                name = "Alpha",
                text = {
                    "Played lucky cards are guaranteed",
                    "to successfully trigger at least one",
                    "of their probability effects when scored"
                }
            },
            bl_cbean_lower_colon_beta = { -- Glitchkat10 | George The Rat | N/A
                name = "Beta",
                text = {
                    "Scale all Jokers"
                }
            },
            bl_cbean_upper_colon_beta = { -- Glitchkat10 | George The Rat | N/A
                name = "Beta",
                text = {
                    "Scale all Jokers when",
                    "hand is played"
                }
            },
            bl_cbean_lower_colon_gamma = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Gamma",
                text = {
                    "Retrigger all played",
                    "cards 2 times",
                }
            },
            bl_cbean_upper_colon_gamma = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Gamma",
                text = {
                    "Retrigger all played",
                    "and held in hand",
                    "cards 3 times",
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
                    "Retrigger all card",
                    "discarded effects"
                }
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
                    "Played Glass cards",
                    "permanently gain X0.25 Mult",
                    "when scored"
                }
            },
            bl_cbean_upper_colon_zeta = { -- Glitchkat10 | George The Rat | N/A
                name = "Zeta",
                text = {
                    "Played Glass cards permanently",
                    "gain +1 denominator to their",
                    "probability effects when scored"
                }
            },
            bl_cbean_lower_colon_eta = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Eta",
                text = {
                    "Apply a random Enhancement,",
                    "Edition, or Seal to played",
                    "face cards when scored"
                }
            },
            bl_cbean_upper_colon_eta = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Eta",
                text = {
                    "Apply a random Enhancement,",
                    "Edition, and Seal to played",
                    "face cards when scored"
                }
            },
            bl_cbean_lower_colon_theta = { -- Glitchkat10 | George The Rat | N/A
                name = "Theta",
                text = {
                    "Earn $10 per X0.1",
                    "Blind requirement",
                    "scored at end of round"
                }
            },
            bl_cbean_upper_colon_theta = { -- Glitchkat10 | George The Rat | N/A
                name = "Theta",
                text = {
                    "-1 Ante per X10",
                    "Blind requirement",
                    "scored at end of round"
                }
            },
            bl_cbean_lower_colon_iota = { -- Glitchkat10 | George The Rat | N/A
                name = "Iota",
                text = {
                    "Redeem 1 random Voucher,",
                    "create 1 random Joker, and",
                    "create 1 random consumable"
                }
            },
            bl_cbean_upper_colon_iota = { -- Glitchkat10 | George The Rat | N/A
                name = "Iota",
                text = {
                    "Redeem 2 random Vouchers,",
                    "create 2 random Negative Jokers,",
                    "and create 2 random Negative",
                    "consumables when hand is played"
                }
            },
            bl_cbean_lower_colon_kappa = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Kappa",
                text = {
                    "Permanently gain",
                    "+1 hand size"
                }
            },
            bl_cbean_upper_colon_kappa = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Kappa",
                text = {
                    "Permanently gain +1 hand",
                    "and +1 hand size"
                }
            },
            bl_cbean_lower_colon_lambda = { -- Glitchkat10 | George The Rat | N/A
                name = "Lambda",
                text = {
                    "Redeem 2 random",
                    "Tier 1 Vouchers",
                }
            },
            bl_cbean_upper_colon_lambda = { -- Glitchkat10 | George The Rat | N/A
                name = "Lambda",
                text = {
                    "Redeem 2 random Tier 2",
                    "Vouchers and their",
                    "corresponding Tier 1s",
                }
            },
            bl_cbean_lower_colon_mu = { -- Glitchkat10 | George The Rat | N/A
                name = "Mu",
                text = {
                    "If played hand contains 3 or more",
                    "scoring cards of the same rank,",
                    "each scoring card gains +10 Mult",
                }
            },
            bl_cbean_upper_colon_mu = { -- Glitchkat10 | George The Rat | N/A
                name = "Mu",
                text = {
                    "If played hand contains 3 or more",
                    "scoring cards of the same rank,",
                    "each scoring card gains X1 Mult"
                }
            },
            bl_cbean_lower_colon_nu = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Nu",
                text = {
                    "If played hand contains",
                    "a Flush, each card gains",
                    "+50 Chips when scored"
                }
            },
            bl_cbean_upper_colon_nu = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Nu",
                text = {
                    "If played hand contains",
                    "a Flush, each card gains",
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
                    "Played modified cards",
                    "gain +5 Mult when scored"
                }
            },
            bl_cbean_upper_colon_omicron = { -- Glitchkat10 | George The Rat | N/A
                name = "Omicron",
                text = {
                    "Played Enhanced cards gain",
                    "+30 Chips when scored,",
                    "played cards with an Edition gain",
                    "+10 Mult when scored, and",
                    "played cards with a Seal gain",
                    "X0.2 Mult when scored"
                }
            },
            bl_cbean_lower_colon_pi = { -- Glitchkat10 | George The Rat | N/A
                name = "Pi",
                text = {
                    "First scored card's",
                    "suit is transferred",
                    "to all scored cards"
                }
            },
            bl_cbean_upper_colon_pi = { -- Glitchkat10 | George The Rat | N/A
                name = "Pi",
                text = {
                    "First scored card's",
                    "rank is transferred",
                    "to all scored cards"
                }
            },
            bl_cbean_lower_colon_rho = { -- Glitchkat10 | George The Rat | N/A
                name = "Rho",
                text = {
                    "If played poker hand",
                    "is most played, upgrade",
                    "level of all poker hands"
                }
            },
            bl_cbean_upper_colon_rho = { -- Glitchkat10 | George The Rat | N/A
                name = "Rho",
                text = {
                    "Upgrade level of most played",
                    "poker hand by number",
                    "of times it's been played"
                }
            },
            bl_cbean_lower_colon_chi = { -- Glitchkat10 | George The Rat | N/A
                name = "Chi",
                text = {
                    "When Blind is selected,",
                    "create 1 random {C:dark_edition}Negative{} {C:blue}Common{C:attention} Joker{}",
                    "and 1 random {C:dark_edition}Negative{} {C:green}Uncommon{C:attention} Joker{}",
                }
            },
            bl_cbean_upper_colon_chi = { -- Glitchkat10 | George The Rat | N/A
                name = "Chi",
                text = {
                    "When Blind is selected,",
                    "create 1 random {C:dark_edition}Negative{} {C:green}Uncommon{C:attention} Joker{}",
                    "and 1 random {C:dark_edition}Negative{} {C:red}Rare{C:attention} Joker{}",
                }
            },
            bl_cbean_colon_wee = { -- George The Rat | George The Rat | jamirror
                name = "Wee Blind",
                text = {
                    "Very small Blind"
                }
            },
            bl_cbean_colon_handsy = { -- George The Rat | George The Rat | jamirror
                name = "Handsy Blind",
                text = {
                    "+1 hand"
                }
            },
            bl_cbean_colon_clumsy = { -- George The Rat | George The Rat | jamirror
                name = "Clumsy Blind",
                text = {
                    "+1 discard"
                }
            },
            bl_cbean_colon_charitable = { -- George The Rat | George The Rat | jamirror
                name = "Charitable Blind",
                text = {
                    "+100% interest"
                }
            },
            bl_cbean_colon_jolly = { -- George The Rat | George The Rat | jamirror
                name = "Jolly Blind",
                text = {
                    "If played hand contains a Pair,",
                    "add an Enhanced card to hand"
                }
            },
            bl_cbean_colon_cutesy = { -- George The Rat | George The Rat | jamirror
                name = "Cutesy Blind",
                text = {
                    "If played hand contains a Flush,",
                    "make 2 cards held in hand Wild"
                }
            },
            bl_cbean_colon_pretty = { -- George The Rat | George The Rat | jamirror
                name = "Pretty Blind",
                text = {
                    "If played hand contains a Straight,",
                    "create Negative Planets of most played",
                    "hand and least played hand"
                }
            },
            bl_cbean_colon_thirsty = { -- George The Rat | George The Rat | Glitchkat10
                name = "Thirsty Blind",
                text = {
                    "Played cards earn",
                    "$#1# when scored"
                }
            },
            bl_cbean_sdown_chaffed = { --Athebyne | TBA | wingedcatgirl
                name = "Chaffed Blind",
                text = {
                    "Leftmost card in first",
                    "discard is destroyed",
                    "{C:inactive}(Drag to rearrange)"
                }
            },
            bl_cbean_sdown_estrogen = { --Athebyne | TBA | wingedcatgirl
                name = "Estrogen",
                text = {
                    "Discarded face cards",
                    "become Queens"
                }
            },
        },
        Combo = {
            c_cbean_0chill_raging_storm= {
                name = {"Raging Storm",
                    "{X:red,C:white,s:0.7}Finisher{}"
                },
                text = {{
                    "{X:mult,C:white}X#1#{} Mult",
                    "Boosted by current combo",
                    "length when selected"
                },
                {
                    "Combos Into:",
                    "Nothing",
                }}
            },
            c_cbean_0chill_standing_punch= {
                name = {"Standing Punch",
                    "{X:green,C:white,s:0.7}Starter{}"
                },
                text = {{
                    "{C:chips}+#1#{} Chips for",
                    "first card scored"
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_standing_knee= {
                name = {"Standing Knee",
                    "{X:green,C:white,s:0.7}Starter{}"
                },
                text = {{
                    "{C:mult}+#1#{} Mult for",
                    "first card scored"
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_rose_throw= {
                name = {"Elegant Rose",
                    "{X:cbean_taunt_name,C:white,s:0.7}Taunt{}"
                },
                text = {{
                    "Either gain {C:blue}+#1#{} hand",
                    "or {C:red}+#1#{} discard",
                },
                {
                    "Can only be used",
                    "{C:attention}once{} per round"
                },
                {
                    "Combos Into:",
                    "{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
                }}
            },
            c_cbean_0chill_victory_pose= {
                name = {"Victory Pose",
                    "{X:cbean_taunt_name,C:white,s:0.7}Taunt{}"
                },
                text = {{
                    "Lowers blind by {C:dark_edition}-#1#%",
                    "when scored",
                    "Boosted by current combo",
                    "length when used"
                },
                {
                    "Can only be used",
                    "{C:attention}once{} per round"
                },
                {
                    "Combos Into:",
                    "{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
                }}
            },
            c_cbean_0chill_raging_demon= {
                name = {"Raging Demon",
                    "{X:blue,C:white,s:0.7}Ultimate{}"
                },
                text = {{
                    "{C:chips}+#1#{} Chips for",
                    "every card scored",
                    "Boosted by {C:attention}total{}",
                    "combo length"
                },
                {
                    "Combos Into:",
                    "Nothing",
                }}
            },
            c_cbean_0chill_shoryuken= {
                name = {"Shoryuken",
                    "{X:purple,C:white,s:0.7}Special{}"
                },
                text = {{
                    "Retrigger {C:attention}first{} played",
                    "card used in scoring",
                    "{C:attention}#1#{} additional times",
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:blue,C:white}Ultimate{}"
                }}
            },
                c_cbean_0chill_crouching_punch= {
                name = {"Crouching Punch",
                    "{X:green,C:white,s:0.7}Starter{}"
                },
                text = {{
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains a {C:attention}#2#",

                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
                c_cbean_0chill_hadouken= {
                name = {"Hadouken",
                    "{X:red,C:white,s:0.7}Finisher{}"
                },
                text = {{
                    "{C:mult}+#1#{} Mult for every",
                    "card in played hand",
                    "Boosted by current combo",
                    "length when used"

                },
                {
                    "Combos Into:",
                    "Nothing"
                }}
            },
                c_cbean_0chill_tatsumaki= {
                name = {"Tatsumaki Senpukyaku",
                    "{X:red,C:white,s:0.7}Finisher{}"
                },
                text = {{
                    "Retriggers all scoring",
                    "cards up to an",
                    "additional {C:attention}#1#{} times"

                },
                {
                    "Combos Into:",
                    "Nothing"
                }}
            },
                c_cbean_0chill_low_short= {
                name = {"Low Short",
                    "{X:cbean_series,C:white,s:0.7}Series{}"
                },
                text = {{
                    "The highest ranked card gives",
                    "{X:mult,C:white}X#1#{} Mult when scored",
                    "Boosted by current combo",
                    "length when used"

                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_jump= {
                name = {"Jump",
                    "{X:green,C:white,s:0.7}Starter{}"
                },
                text = {{
                    "Every {C:attention}played card{}",
                    "counts in scoring",

                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_aohana= {
                name = {"127 Shiki: Aohana",
                    "{X:cbean_series,C:white,s:0.7}Series{}"
                },
                text = {{
                    "Levels up {C:attention}played hand{}"
                },
                {
                   "Can only be used",
                    "{C:attention}once{} per round" 
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_crouching_launch= {
                name = {"Crouching Launch",
                    "{X:green,C:white,s:0.7}Starter{}"
                },
                text = {{
                    "First played {C:attention}card{}",
                    "permanently gains {C:chips}+#1#{} Chips",
                    "when scored"
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_flash_kick= {
                name = {"Flash Kick",
                    "{X:purple,C:white,s:0.7}Special{}"
                },
                text = {{
                    "Retrigger {C:attention}last{} played",
                    "card used in scoring",
                    "{C:attention}#1#{} additional times",
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:blue,C:white}Ultimate{}"
                }}
            },
               c_cbean_0chill_aegis_reflector= {
                name = {"Aegis Reflector",
                    "{X:blue,C:white,s:0.7}Ultimate{}"
                },
                text = {{
                    "Levels up {C:attention}played hand{}",
                    "for length of",
                    "{C:attention}total{} combo"
                },
                {
                   "Can only be used",
                    "{C:attention}once{} per round"
                },
                {
                    "Combos Into:",
                    "Nothing"
                }}
            },
               c_cbean_0chill_wryyyyyy= {
                name = {"WRYYYYYY!",
                    "{X:cbean_taunt_name,C:white,s:0.7}Taunt{}"
                },
                text = {{
                    "{C:green}#1# in #2#{} chance the",
                    "next scored card",
                    "is retriggered when",
                    "a card is scored"
                },
                {
                    "Combos Into:",
                    "{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
                }}
            },
               c_cbean_0chill_torou_zan= {
                name = {"Torou Zan",
                    "{X:cbean_series,C:white,s:0.7}Series{}"
                },
                text = {{
                    "{X:mult,C:white}X#1#{} Mult,",
                    "but {C:attention}increases{}",
                    "blind size by {C:dark_edition}#2#%{}"
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
               c_cbean_0chill_joudan_sokuto_geri= {
                name = {"Joudan Sokuto Geri",
                    "{X:cbean_series,C:white,s:0.7}Series{}"
                },
                text = {{
                    "The lowest ranked card gives",
                    "{X:mult,C:white}X#1#{} Mult when scored",
                    "Gives an additional {X:mult,C:white}X#2#{} Mult",
                    "for each scored card"
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
            c_cbean_0chill_god_fist= {
                name = {"Electric Wind God Fist",
                    "{X:cbean_series,C:white,s:0.7}Series{}"
                },
                text = {{
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to",
                    "instead be {X:chips,C:white}XChips"
                },
                {
                    "Combos Into:",
                    "{X:black,C:white}Taunt{}, {X:cbean_series,C:white}Series{},",
                    "{X:red,C:white}Finisher{}, {X:purple,C:white}Special{}"
                }}
            },
               c_cbean_0chill_fighting_stance= {
                name = {"Fighting Stance",
                    "{X:cbean_taunt_name,C:white,s:0.7}Taunt{}"
                },
                text = {{
                    "Counts as using {C:attention}#1#{} Combo cards",
                    "in a combo"
                },
                {
                    "Combos Into:",
                    "{X:cbean_series,C:white}Series{}, {X:purple,C:white}Special{}",
                }}
            },
        },
        yma_keys = {
            c_cbean_yma_alpha = {
                name = 'Alpha Key',
                text = {
                    '{C:red}Removes{} a random {C:money}Sticker{}',
                    'from a random {C:attention}Joker{} at the',
                    'end of {C:attention}round',
                    '{C:inactive}(Uses #1#/#2#)',
                }
            },
            c_cbean_yma_angel = {
                name = 'Angel Key',
                text = {
                    '{C:attention}Creates{} a random {C:sdown_blessing}Blessing{}',
                    'with a {C:red}lower{} expire date',
                    'when a {C:attention}Booster{} pack is',
                    'opened',
                    '{C:inactive}(Uses #1#/#2# packs)',
                }
            },
            c_cbean_yma_animal = {
                name = 'Animal Key',
                text = {
                    '{C:attention}Create{} a random {C:dark_edition}Negative{}',
                    '{C:sdown_czodiac}Chinese Zodiac{} when',
                    '{C:attention}selecting{} blind',
                    '{C:inactive}(Uses #1#/#2# blinds)',
                }
            },
            c_cbean_yma_anywhere = {
                name = 'Anywhere Key',
                text = {
                    '{C:attention}Allows{} access to any',
                    '{C:attention}location{} otherwise {C:red}blocked{}',
                    'off by another {C:yma_keys}Key',
                    '{C:inactive}(Uses #1#/#2# shops)',
                }
            },
            c_cbean_yma_bitey = {
                name = 'Bitey Key',
                text = {
                    'Removes {C:attention}enhancements{} from',
                    '{C:attention}scored{} cards and gives',
                    'them {C:attention}permanently{} {C:mult}+#3#{} Mult',
                    '{C:inactive}(Uses #1#/#2# cards)',
                }
            },
            c_cbean_yma_chain = {
                name = 'Chain Key',
                text = {
                    'When the {C:yma_keys}Key{} to the left',
                    '{C:attention}triggers{} add an {C:attention}additional',
                    'use to the {C:yma_keys}Key{} to the right',
                    '{C:inactive}(Uses #1#/#2#)',
                }
            },
            c_cbean_yma_creation = {
                name = 'Creation Key',
                text = {
                    'Creates a {C:attention}random{} free',
                    '{C:attention}Booster{} pack in the {C:money}shop',
                    '{C:inactive}(Uses #1#/#2# shops)'
                }
            },
            c_cbean_yma_demon = {
                name = 'Demon Key',
                text = {
                    {
                        '{C:green}#3# in #4#{} chance to {C:attention}apply{} a',
                        'random {C:edition}edition{} to the two',
                        '{C:attention}leftmost{} playing cards'
                    },
                    {
                        '{C:attention}Shuffles{} played {C:attention}cards',
                        '{C:inactive}(Uses #1#/#2# hands)',
                    }
                }
            },
            c_cbean_yma_echo = {
                name = 'Echo Key',
                text = {
                    'When {C:blue}hand{} is {C:attention}played',
                    'mimics {C:tarot}Tarot{} to the left',
                    '{C:inactive}(Uses #1#/#2# hands)'
                }
            },
            c_cbean_yma_enigma = {
                name = 'Enigma Key',
                text = {
                    '{C:attention}consumable{} pool is',
                    'randomized',
                    '{C:inactive}(Uses ?/? blinds)'
                }
            },
            c_cbean_yma_gender = {
                name = 'Gender Key',
                text = {
                    '{C:attention}Scored{} face cards change {C:attention}gender',
                    '{C:inactive}(Uses #1#/#2# cards)',
                }
            },
            c_cbean_yma_ghost = {
                name = 'Ghost Key',
                text = {
                    '{C:attention}Creates{} two temporary',
                    '{C:dark_edition}Negative{} {C:attention}Jokers{} when blind',
                    'is {C:attention}selected',
                    '{C:inactive}(Uses #1#/#2# shops)',
                }
            },
            c_cbean_yma_giant = {
                name = 'Giant Key',
                text = {
                    'Create a {X:red,C:white}Finisher{} or',
                    '{X:blue,C:white}Ultimate{} {C:combo}Combo{} at',
                    'end of {C:attention}round',
                    '{C:inactive}(Uses #1#/#2# blinds)'
                }
            },
            c_cbean_yma_harlequin = {
                name = 'Harlequin Key',
                text = {
                    '{C:attention}Mimics{} leftmost {C:attention}Joker',
                    '{B:1,C:white}#3#',
                    '{C:inactive}(Uses #1#/#2# blinds)'
                }
            },
            c_cbean_yma_head = {
                name = 'Head Key',
                text = {
                    '{C:green}#3# in #4#{} chance to {C:attention}create{} a',
                    '{C:yma_keys}Key{} when the {C:attention}Boss{} blind',
                    'is {C:attention}defeated',
                    '{C:inactive}(Uses #1#/#2# blinds)'
                }
            },
            c_cbean_yma_hercules = {
                name = 'Hercules Key',
                text = {
                    {
                        '{C:attention}Creates{} two {C:dark_edition}Negative',
                        '{C:sdown_blessing}Blessings{} when blind is',
                        '{C:attention}selected'
                    },
                    {
                        'All {C:sdown_blessing}Blessings{} are {C:red}destroyed',
                        'at the end of {C:attention}round',
                        '{C:inactive}(Uses #1#/#2# blinds)'
                    }
                }
            },
            c_cbean_yma_identity = {
                name = 'Identity Key',
                text = {
                    '{C:attention}Temporary{} turns into a',
                    'random {X:cbean_series,C:white}Series{} or {X:purple,C:white}Special{}',
                    '{C:combo}Combo{} card when blind is',
                    '{C:attention}selected',
                    '{C:inactive}(Uses #1#/#2# blinds)'
                }
            },
            c_cbean_yma_key_to_hell = {
                name = 'Key to Hell',
                text = {
                    '{C:attention}Grants{} access to {C:red}Hell',
                    '{C:inactive}(Uses #1#/#2# shops)',
                }
            },
            c_cbean_yma_matchstick = {
                name = 'Matchstick Key',
                text = {
                    'If {C:blue}hand{} scores larger than',
                    'the blind {C:attention}requirement',
                    '{C:attention}create{} a random {C:attention}Tag',
                    '{C:inactive}(Uses #1#/#2# blinds)'
                }
            },
            c_cbean_yma_mending = {
                name = 'Mending Key',
                text = {
                    '{C:attention}Restores{} one use of {C:yma_keys}Key{} to',
                    'the left when it {C:attention}triggers',
                    '{C:inactive}(Uses #1#/#2#)',
                }
            },
            c_cbean_yma_mirror = {
                name = 'Mirror Key',
                text = {
                    'When blind is {C:attention}selected',
                    'replaces {C:attention}rightmost{} consumable',
                    'with {C:attention}leftmost{} consumable',
                    '{C:inactive}(Uses #1#/#2#)',
                }
            },
            c_cbean_yma_moon = {
                name = 'Moon Key',
                text = {
                    'Allows {C:red}destroyed{} Jokers to',
                    'be {C:attention}bought{} in shop',
                    '{C:inactive}(Uses #1#/#2# shops)',
                }
            },
            c_cbean_yma_music_box = {
                name = 'Music Box Key',
                text = {
                    {
                        '{C:attention}Jokers{} are shuffled each',
                        '{C:blue}hand{}'
                    },
                    {
                        'Leftmost {C:attention}Joker',
                        '{C:attention}triggers{} again',
                        '{C:inactive}(Uses #1#/#2# blinds)',
                    }
                     
                }
            },
            c_cbean_yma_orchestra = {
                name = 'Orchestra Key',
                text = {
                    '{C:attention}Create{} two {C:dark_edition}Negative{} {X:green,C:white}Starter{}',
                    'or {X:black,C:white}Taunt{} {C:combo}Combos',
                    '{C:inactive}(Uses #1#/#2# hands)',
                }
            },
            c_cbean_yma_reali = {
                name = 'Reali Key',
                text = {
                    '{C:attention}Grants{} access to {C:dark_edition}Dreamland',
                    '{C:inactive}(Uses #1#/#2# shops)',
                }
            },
            c_cbean_yma_shadow = {
                name = 'Shadow Key',
                text = {
                    '{C:combo}Combo{} cards can be used',
                    '{C:attention}twice',
                    '{C:inactive}(Uses #1#/#2#)',
                }
            },
            c_cbean_yma_stamp = {
                name = 'Stamp Key',
                text = {
                    '{C:attention}Scored{} cards with a {C:blue}Blue',
                    'Seal {C:attention}permanently{} gain a',
                    '{C:attention}retrigger',
                    '{C:inactive}(Uses #1#/#2# cards)',
                }
            },
            c_cbean_yma_sword = {
                name = 'Sword Key',
                text = {
                    '{C:attention}Cuts{} the blind {C:attention}requirement',
                    'in half',
                    '{C:inactive}(Uses #1#/#2# blinds)',
                }
            },
            c_cbean_yma_teddy = {
                name = 'Teddy Key',
                text = {
                    'Gives {C:attention}+#3#{} {C:blue}hand{} and',
                    '{C:attention}+#3#{} {C:red}discard',
                    '{C:inactive}(Uses #1#/#2# blinds)',
                }
            },
            c_cbean_yma_tempus_fugit = {
                name = 'Tempus Fugit Key',
                text = {
                    {
                        '{C:attention}Temporary{} turns into a',
                        'random {C:attention}Joker'
                    },
                    {
                        '{C:red}Reverts{} after {C:attention}first{} played',
                        '{C:blue}hand',
                        '{C:inactive}(Uses #1#/#2# blinds)',
                    }
                }
            },
            c_cbean_yma_thorn = {
                name = 'Thorn Key',
                text = {
                    '{C:green}Probability{} is {C:attention}guaranteed',
                    'for the leftmost {C:attention}Joker',
                    '{C:inactive}(Uses #1#/#2# blinds)',
                }
            },
            c_cbean_yma_timeshift = {
                name = 'Timeshift Key',
                text = {
                    '{C:attention}Jokers{} are restored when',
                    '{C:red}destroyed',
                    '{C:inactive}(Uses #1#/#2#)',
                }
            },
            c_cbean_yma_undertree = {
                name = 'Undertree Key',
                text = {
                    ''
                }
            },
        },
        yma_quest = {
            q_cbean_yma_credit_card = {
                name = {
                    "Credit Card",
                    "{C:dark_edition,s:0.7}Side Quest{}"
                },
                text = {
                    "Spend {C:money}$#1#{} {C:inactive}(#2#){}",
                    "in a single {C:attention}shop{}",
                    "to create {C:attention}Credit Card{}",
                }
            },
            q_cbean_yma_delayed_grat = {
                name = {
                    "Delayed Gratification",
                    "{C:dark_edition,s:0.7}Side Quest{}"
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
                    "{C:dark_edition,s:0.7}Side Quest{}"
                },
                text = {
                    "Destroy {C:attention}#1#{} {C:inactive}(#2#){} cards with",
                    "a {C:diamonds}Diamond{} suit",
                    "to create {C:attention}Burglar{}",
                }
            },
            q_cbean_yma_vampire = {
                name = {
                    "Vampire",
                    "{C:dark_edition,s:0.7}Side Quest{}"
                },
                text = {
                    "Score a hand full of {C:attention}Enhanced{} cards",
                    "to create {C:attention}Vampire{}",
                }
            },
            q_cbean_yma_vagabond = {
                name = {
                    "Vagabond",
                    "{C:dark_edition,s:0.7}Side Quest{}"
                },
                text = {
                    "Play {C:attention}#1#{} {C:inactive}(#2#){} hands",
                    "with {C:money}$4{} or less",
                    "to create {C:attention}Vagabond{}",
                }
            },
            q_cbean_yma_yorick = {
                name = {
                    "Yorick",
                    "{C:dark_edition,s:0.7}Side Quest{}"
                },
                text = {
                    "Discard {C:attention}#1#{} {C:inactive}(#2#){} cards",
                    "in a single {C:attention}round{}",
                    "to create {C:attention}Yorick{}",
                }
            }
        },
        Enhanced = {
            m_cbean_pboys_piss = {
                name = "Piss Card",
                text = {
                    	"Gives {C:chips}+#1#{} Chips for",
			"each {C:attention}Piss card{} in deck",
			"{C:inactive}(Currently {C:chips}+#2#{} {C:inactive}Chips)"
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
        },
        Joker = {

            -- Common

            j_cbean_colon_all_in = { -- George The Rat | N/A | N/A
                name = "All In",
                text = {
                    "When entering an {C:attention}Ante{}, all {C:attention}Blinds{} are",
                    "either {s:0.9,C:chips}Teeny Blinds{} or {E:1,C:money}CEO Blinds"
                }
            },
            j_cbean_colon_auto_belay = { -- George The Rat | N/A | N/A
                name = "Auto Belay",
                text = {
                    "Gains {C:mult}+2{} Mult when a {C:attention}card{} is discarded,",
                    "has a {C:green}1 in 7{} chance to {C:attention}reset when triggered",
                    "{C:inactive}(Currently {C:mult}+0{C:inactive} Mult)"
                }
            },
            j_cbean_colon_boulder = { -- George The Rat | N/A | N/A
                name = "Boulder",
                text = {
                    "Gains {C:white,X:mult}X0.1{} Mult when {C:money}money{} is spent",
                    "has a {C:green}1 in 5{} chance to {C:attention}reset when triggered",
                    "{C:inactive}(Currently {C:white,X:mult}X1{C:inactive} Mult)"
                }
            },
            j_cbean_colon_chalk = { -- George The Rat | N/A | Glitchkat10
                name = "Chalk",
                text = {
                    "{C:white,X:mult}X#1#{} Mult",
                    "Permanently increase winning",
                    "{C:attention}Ante{} by {C:attention}+#2#{} when obtained",
                    "{C:inactive}\"Chalk is aid\""
                }
            },
            j_cbean_colon_lead = { -- George The Rat | N/A | N/A
                name = "Lead",
                text = {
                    "Earn {C:money}$0{} at the {C:attention}end of round",
                    "Payout increases by {C:money}$1{} when hand is played,",
                    "{C:green}1 in 8{} chance to instead lose {C:red}$8"
                }
            },
            j_cbean_colon_loan_shark = { -- George The Rat | George The Rat | Glitchkat10
                name = "Loan Shark",
                text = {
                    "Lose {C:money}$#1#{} when {s:0.9,C:chips}Teeny{}, {C:blue}Small{},",
                    "or {C:attention}Big Blind{} is selected",
                    "Earn {C:money}$#2#{} when {C:attention}Boss{}",
                    "or {E:1,C:money}CEO Blind{} is selected"
                }
            },
            j_cbean_colon_lumberjack = { -- George The Rat | George The Rat | N/A
                name = "Lumberjack",
                text = {
                    "All {C:attention}held in hand{} jacks are destroyed",
                    "Gains {C:mult}+4{} mult when a jack is destroyed",
                    "{C:inactive}(Currently {C:mult}+0{C:inactive} mult)"
                }
            },
            j_cbean_colon_pebble = { -- George The Rat | N/A | jamirror and bitter
                name = "Pebble",
                text = {
                    "{C:blue}Small Blinds{} are replaced with {s:0.9,C:chips}Teeny Blinds",
                    "{C:money}Big Blinds{} are replaced with {C:blue}Small Blinds",
                }
            },
            j_cbean_colon_top_rope = { -- George The Rat | N/A | bitter
                name = "Top Rope",
                text = {
                    "Gain {C:chips}+15{} Chips when {C:attention}playing card{} scored at the end of round",
                    "{C:green}1 in 2{} chance to instead decrease by {C:chips}-30{} Chips",
                }
            },

            -- Uncommon

            j_cbean_colon_career_ladder = { -- Glitchkat10 | N/A | N/A
                name = "Career Ladder",
                text = {
                    "All {C:attention}Boss Blinds{} are replaced by {E:1,C:money}CEO Blinds",
                    "All {E:1,C:attention}Showdown Boss Blinds{} are replaced by {C:attention}Boss Blinds",
                    "All {E:1,C:money,s:1.1}Showdown CEO Blinds{} are replaced by {E:1,C:money}CEO Blinds",
                },
            },
            j_cbean_colon_minnesang = { -- bitter | N/A | Glitchkat10
                name = "Minnesang",
                text = {
                    "{C:red}+#1#{} discards each round,",
                    "Lose {C:money}$#2#{} at end of round"
                }
            },
            j_cbean_colon_mu_cube = { --George The Rat | N/A | bitter
                name = "Mu Cube",
                text = {
                    "Played {C:attention}4s{} give {X:mult,C:white}X#1#{} Mult every",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} times they are scored",
                    "Played {C:attention}6s{} give {X:mult,C:white}X#4#{} Mult every",
                    "{C:attention}#5#{} {C:inactive}[#6#]{} times they are scored"
                },
            },
            j_cbean_colon_orchestra = { -- bitter | N/A | bitter and Glitchkat10
                name = "Orchestra",
                text = {
                    "{C:blue}+#1#{} hands per round",
                    "{C:red}+#2#{} discards each round",
                    "{C:attention}+#3#{} hand size"
                }
            },
            j_cbean_colon_rna = { -- bitter and George The Rat | N/A | bitter
                name = "RNA",
                text = {
                    "If {C:attention}first hand{} of round has only {C:attention}1", 
                    "add a permanent copy with a random enhancement", "to deck and draw to {C:attention}hand", 
                    "{C:inactive}(Copy will not have any {C:dark_edition}editions{C:inactive} or {C:attention}seals{C:inactive})"},
            },
            j_cbean_colon_shadow = { -- Glitchkat10 | N/A | N/A
                name = "Shadow",
                text = {
                    "When a {C:attention}Booster Pack{} is bought from the shop",
                    "create its {C:attention}corresponding Tag",
                    "{C:inactive}(if applicable)"
                },
            },
            j_cbean_colon_sproinky = { -- George The Rat | N/A | bitter
                name = "Sproinky",
                text = {
                    "Played and unscoring cards become {C:attention}Steel",
                    "Played {C:attention}Steel Cards{} become",
                    "{C:red,E:2}permanently {C:red}debuffed"
                },
            },
            j_cbean_colon_trouvere = { -- bitter | N/A | bitter
                name = "Trouvère",
                text = {
                    "{C:blue}+#1#{} hands per round,",
                    "{C:red}-#2#{} discards each round"
                }
            },

            -- Rare

            j_cbean_colon_big_shot = { -- George The Rat | N/A | bitter
                name = "Big Shot",
                text = {
                    "When a {C:attention}Big Blind{} is defeated,",
                    "earn between {C:money}$#1#{} and {C:money}$#2#",
                },
            },
            j_cbean_colon_modernity = { -- George The Rat | N/A | Glitchkat10
                name = "Modernity",
                text = {
                    "This Joker gains {C:white,X:mult}X#1#{} Mult",
                    "when {C:attention}Blind{} is skipped",
                    "This Joker loses {C:white,X:mult}X#2#{} Mult",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive}(Currently {C:white,X:mult}X#3#{C:inactive} Mult)",
                },
            },
            j_cbean_colon_spectaro = { -- George The Rat | N/A | bitter
                name = "Spectaro",
                text = {
                    "Create a {C:spectral}Spectral{} card when",
                    "{s:0.9,C:chips}Teeny Blind{} or {E:1,C:money}CEO Blind{} is",
                    "defeated without discarding",
                },
            },
            j_cbean_colon_square_packing = { -- Glitchkat10 | George The Rat | Glitchkat10
                name = "Square Packing",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "every {C:attention}#2# {C:inactive}[#3#]{C:attention} Blinds{} selected",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                },
            },
            j_cbean_colon_jester = { -- bitter | N/A | N/A
                name = "Jester",
                text = {
                    "Each {C:attention}Ace{} held in hand gives", "{C:mult}+#1#{} Mult and {C:white,X:mult}X#2#{} Mult",
                },
            },

            -- Legendary

            j_cbean_colon_sophron = { -- bitter | N/A | bitter
                name = "Sophron",
                text = {
                    "Retrigger all cards",
                    "played for each card",
                    "to the {C:attention}left of them"
                },
            },
            j_cbean_colon_plato = { -- Glitchkat10 | N/A | N/A
                name = "Plato",
                text = {
                    "All {E:1,C:money}CEO Blinds{} are replaced by ",
                    "a random {V:1}Lowercase Greek Blind"
                },
            },
            j_cbean_colon_aristotle = { -- Glitchkat10 | N/A | N/A
                name = "Aristotle",
                text = {
                    "Open a {C:attention}Blessing Pack{} when {C:money,E:1}CEO Blind{} is defeated",
                    "When a Blessing is obtained from a {C:attention}Booster Pack{},",
                    "create 1 {C:spectral}Taa Marbuta"
                },
            },
            j_cbean_colon_aristoxenus = { -- Glitchkat10 | N/A | N/A
                name = "Aristoxenus",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "when a {C:attention}new music track{} plays",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                },
            },
            j_cbean_colon_hippo = { -- George | N/A | Bitter
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
            j_cbean_0chill_homosexual = {
                name = "Queer Joker",
                text = {
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{}"
                },
            },

            j_cbean_0chill_lesbian = {
                name = "Curious Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#{}"
                },
            },

            j_cbean_0chill_short = {
                name = "Playful Joker",
                text = {
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{}"
                },
            },

            j_cbean_0chill_abbreviated = {
                name = "Sharp Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#{}"
                },
            },

            --Uncommon
            j_cbean_0chill_thorn_ring = {
                name = "Thorn Ring",
                text = {{
                    "{X:mult,C:white}X#1#{} Mult"
                },
                {
                    "{C:red}-#2#{} hand size"
                },
                {
                    "All non-{C:hearts}Heart{} cards",
                    "are {C:red}debuffed{}"
                }}
            },


            --Rare

            j_cbean_0chill_chaos = {
                name = "The Parade",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{}"
                },
            },

            j_cbean_0chill_clique = {
                name = "The Hierarchy",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{}"
                },
            },
            j_cbean_0chill_nat20 = {
                name = "Nat 20",
                text = {
                    "Turns all {C:attention}listed {C:green,E:1,S:1.1}probabilities{}",
                    "into a random probability",
                    "between {C:green}1 in 20{} and {C:green}19 in 20{}",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}14 in 20{C:inactive})",
                },
            },
            j_cbean_0chill_driving_in_my_truck = {
                name = "Asgore's Truck",
                text = {{
                    "Destroys scored {C:attention}King{} cards",
                    "in played hand"
                    },
                    {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult for",
                    "each card destroyed this way,",
                    "resets after each {C:attention}Ante{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive} Mult)"
                }},
            },

            j_cbean_0chill_lone_warrior = {
                name = "Lone Warrior",
                text = {
                    "Gains {X:mult,C:white}X#2#{} Mult",
                    "for each {C:attention}Combo{} card",
                    "used this run",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult)"
                }
            },
            j_cbean_0chill_house_rules = {
                name = "House Rules",
                text = {{
                    "Unlocks new hands",
                    "based on owned {C:attention}Jokers"
                },
                {
                    "{C:attention}Select{} this Joker and",
                    "check {C:attention}Run Info{} to",
                    "see possible hands",
                    "{C:inactive}(Indicated with an HR)"
                }}
            },

	    --Pissboys 

            j_cbean_pboys_molotov = {
                name = "Molotov Cocktail",
                text = {
                    "When {C:attention}first hand{} is played,",
		    "destroy a random amount",
		    "of cards {C:attention}held in hand{}",
		    "{C:inactive}(Maximum of #1# cards)"
                },
            },
			
			j_cbean_pboys_vodka = {
                name = "Vodka",
                text = {
                    	"When {C:attention}Boss{} or {E:1,C:money}Ceo Blind{} is",
			"defeated, gain a random Tag",
			"or {C:attention}#1#{} respectively"
                },
            },
			
			j_cbean_pboys_shower = {
                name = "Golden Shower",
                text = {
                    "Each {C:attention}Piss{} card",
                    "earns {C:money}$#1#{} when scored",
					"or held in hand",
                },
            },
			
			j_cbean_pboys_hydrant = {
                name = "Fire Hydrant",
                text = {
                    "Retrigger all",
					"played {C:attention}Piss{} cards"
                },
            },

			j_cbean_pboys_coriolis = {
                name = "Coriolis Effect",
                text = {
                    "If played hand contains a {C:attention}#3#{},",
					"first scored card gain {C:chips}+#1#{} Chips,",
                    "last scored card gain {C:mult}+#2#{} Mult",
                },
            },
			
			j_cbean_pboys_kidney = {
                name = "Kidney Stone",
                text = {
					"Every discarded {C:attention}Piss{} card",
                    "has a {C:green}#1# in #2#{} chance to",
                    "permanently get {C:red}+#3#{} Mult"
                },
            },
			
			j_cbean_pboys_flag_japan = {
                name = "Flag of Japan",
                text = {
					"{C:mult}+#1#{} Mult for each {C:attention}Enhanced{}",
					"card remaining in deck",
					"{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult)"
                },
            },
			
			j_cbean_pboys_restroom_closed = {
                name = "Restroom Closed",
                text = {
					"Each {C:attention}Piss{} card",
					"held in hand",
					"gives {C:chips}+#1#{} Chips"
                },
            },
			
			j_cbean_pboys_yellow_snow = {
                name = "Yellow Snow",
                text = {
					"When any card is {C:attention}sold{},",
                    "{C:attention}enchance{} a random card",
                    "into a {C:attention}Piss{} Card",
                },
            },
			
			j_cbean_pboys_button_mashing = {
                name = "Button Mashing",
                text = {
					"{C:green}#1# in #2#{} chance to",
                    "create a {C:combo}Combo{} card",
                    "when a hand is played",
                },
            },
			
			j_cbean_pboys_watermelon = {
                name = "Watermelon",
                text = {
					"For the next {C:attention}#1#{} rounds,",
                    "{C:attention}enchance{} a random card",
                    "in hand into a {C:attention}Piss{} Card",
                    "at end of round",
                },
            },
			
            --THe Cold Bean
            j_cbean_coldbean = { -- yo mama
                name = "Cold Bean",
                text = {
                    "{E:1,C:attention}you werent meant to see this....", 
                    "({X:mult,C:white}X#1#{} Mult)",
                },
            },
        },
        Other = {
            undiscovered_yma_quest = {
                name = "Not Discovered",
                text = {
                    "Complete Side",
                    "Quests in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
            undiscovered_yma_keys = {
				name = 'Unknown Key Card',
				text = {
					'Find this card in an unseeded',
					'run to find out what it does'
				}
			},
			k_cbean_pissjoker = {
                name = "Piss Joker",
                text = {
                    "Count as a {C:attention}Piss{}",
					"{C:attention}releated{} Joker"
                }
            },
            --Zodiacs
            p_cbean_czodiac_normal1 = {
                name = "Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_normal2 = {
                name = "Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_jumbo1 = {
                name = "Jumbo Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_jumbo2 = {
                name = "Jumbo Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_mega1 = {
                name = "Mega Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_mega2 = {
                name = "Mega Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_czodiac}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            --Blessings
            p_cbean_blessing_normal1 = {
                name = "Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
                    "take"
                }
            },
            p_cbean_blessing_normal2 = {
                name = "Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
                    "take"
                }
            },
            p_cbean_blessing_jumbo = {
                name = "Jumbo Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
                    "take"
                }
            },
            p_cbean_blessing_mega = {
                name = "Mega Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:sdown_blessing}Blessing{} cards",
                    "take"
                }
            },
            cbean_combo_starter = { --Explains if card can be used to start a combo
                name = "Combo Starter",
                text = {
                    "This card can be used",
                    "to start a combo"
                },
            },
            --Keys
            p_cbean_yma_key_normal1 = {
                name = "Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_normal2 = {
                name = "Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_normal3 = {
                name = "Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_normal4 = {
                name = "Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_jumbo1 = {
                name = "Jumbo Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_jumbo2 = {
                name = "Jumbo Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_mega1 = {
                name = "Mega Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_yma_key_mega2 = {
                name = "Mega Key Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:yma_keys}Key{} cards to",
                    "be used immediately"
                }
            },
        },
        Planet = {
            c_cbean_sdown_gay_planet = {
                name = "Salacia"
            },
            c_cbean_sdown_gayflush_planet = {
                name = "Orcus"
            },
            c_cbean_sdown_bobtail_planet = {
                name = "Vesta"
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
        Spectral = {
            c_cbean_yma_omega = {
                name = 'Omega Key',
                text = {
                    '{C:attention}Create{} a random {C:dark_edition}Negative{} {C:yma_keys}Key{}',
                    'when {C:blue}hand{} is played',
                    '{C:inactive}(Uses #1#/#2# hands)'
                }
            },
            c_cbean_0chill_qilin = {
                name = "The Qilin",
                text = {
                    "Turn at least {C:attention}2{} selected cards",
                    "into the rank of the {C:attention}leftmost{}",
                    "selected card and {C:dark_edition}Negative{}",
                    "{C:inactive}(Drag to rearrange)"
                }
            },
            c_cbean_0chill_cronus = {
                name = "The Blessing of Cronus",
                text = {{
                    "Prevents {C:attention}Blessings{} from",
                    "using charges each round",
                    "{C:inactive}({C:attention}#1#{C:inactive} rounds left)"
                },
                {
                    "Gains {C:attention}#2#{} charges when",
                    "a blessing is {C:attention}sold{}",
                }}
            },
            c_cbean_0chill_nope_from_above= {
                name = {"Nope! From Above",
                    "{X:dark_edition,C:white,s:0.7}Universal{}"
                },
                text = {{
                    "Counts as {C:dark_edition}#1#{} Combo cards",
                },
                {
                    "Combos Into:",
                    "{C:dark_edition}Anything",
                    "{C:inactive}(Even if stated otherwise)"
                }}
            },
            -- yma upgraded spectrals
			c_cbean_yma_wraith_level1 = {
                name = {
                    "Wraith",
                    "{C:inactive}Level 1{}"
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
                    "{C:inactive}Level 2{}"
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
                    "{C:inactive}Level 3{}"
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
                    "{C:inactive}Level 4{}"
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
                    "{C:inactive}Level 5{}"
                },
                text = {
                    "Creates {C:attention}2{} random",
                    "{C:dark_edition}Negative{} {C:red}Rare{C:attention} Jokers{}"
                },
            },
			c_cbean_yma_ectoplasm_level1 = {
                name = {
                    "Ectoplasm",
                    "{C:inactive}Level 1{}"
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
                    "{C:inactive}Level 2{}"
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
                    "{C:inactive}Level 3{}"
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
                    "{C:inactive}Level 4{}"
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
                    "{C:inactive}Level 5{}"
                },
                text = {
                    "Add {C:dark_edition}Negative{} to",
                    "a selected {C:attention}Joker,",
                    "a random {C:attention}consumable{} and",
                    "{C:attention}3{} random {C:attention}Playing Cards{},",
                    "in your deck and in your hand"
                },
            },
        },
        Stake = {},
        Tag = {},
        Tarot = {
			c_cbean_pboys_river = {
                name = "The River",
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
                    "{C:inactive}Level 1{}"
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
                    "{C:inactive}Level 2{}"
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
                    "{C:inactive}Level 3{}"
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
                    "{C:inactive}Level 4{}"
                },
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s",
                    "Created {C:attention}Lucky cards{} have {C:green}double odds{}",
                },
            },
			c_cbean_yma_magician_level5 = {
                name = {
                    "The Magician",
                    "{C:inactive}Level 5{}"
                },
                text = {
                    "Enhances {C:attention}#1#{}",
                    "selected cards to",
                    "{C:attention}#2#s",
                    "Created {C:attention}Lucky cards{} have {C:green}triple odds{}",
                },
            },
			c_cbean_yma_hermit_level1 = {
                name = {
                    "The Hermit",
                    "{C:inactive}Level 1{}"
                },
                text = {
                    "Earn {C:money}$#2#{}, then {C:money}doubles{} it",
                    "{C:inactive}(Max of $#3#){}"
                },
            },
			c_cbean_yma_hermit_level2 = {
                name = {
                    "The Hermit",
                    "{C:inactive}Level 2{}"
                },
                text = {
                    "Earn {C:money}$#2#{}, then {C:money}doubles{} it",
                    "{C:inactive}(Max of $#3#){}"
                },
            },
			c_cbean_yma_hermit_level3 = {
                name = {
                    "The Hermit",
                    "{C:inactive}Level 3{}"
                },
                text = {
                    "Earn {C:money}$#2#{}, then {C:money}doubles{} it",
                    "{C:inactive}(Max of $#3#){}"
                },
            },
			c_cbean_yma_hermit_level4 = {
                name = {
                    "The Hermit",
                    "{C:inactive}Level 4{}"
                },
                text = {
                    "Earn {C:money}$#2#{}, then {C:money}doubles{} it",
                    "{C:inactive}(Max of $#3#){}"
                },
            },
			c_cbean_yma_hermit_level5 = {
                name = {
                    "The Hermit",
                    "{C:inactive}Level 5{}"
                },
                text = {
                    "Earn {C:money}$#2#{}, then {C:money}triples{} it",
                    "{C:inactive}(Max of $#3#){}"
                },
            },
			c_cbean_yma_wheel_of_fortune_level1 = {
                name = {
                    "The Wheel of Fortune",
                    "{C:inactive}Level 1{}"
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
                    "{C:inactive}Level 2{}"
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
                    "{C:inactive}Level 3{}"
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
                    "{C:inactive}Level 4{}"
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
                    "{C:inactive}Level 5{}"
                },
                text = {
                    "Adds any edition",
                    "to the selected {C:attention}Joker",
                },
            },
		},
        Voucher = {},
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {
            c_cbean_sdown_inexcusable = "Inexcusable"
        },
        collabs = {},
        dictionary = {
            sheet_most_held = "(Most held rank)",
            sheet_most_played = "(Most played rank)",
            regression_most_rank = "(Most common rank)",
            regression_least_rank = "(Least common rank)",
            regression_most_suit = "(Most common suit)s",
            regression_least_suit = "(Least common suit)s",
            demeter_random_rank = "[Rank]",
            sdown_czodiac_add = "+1 Zodiac",
            k_dispelled_ex="Dispelled!",
            k_strengthened_ex="Strengthened!",
            k_cbean_sdown_czodiacpack = "Zodiac Pack",
            k_cbean_sdown_blessingpack = "Pantheon Pack",
            ph_alley_wager = 'Care to make a wager?',
            ph_graveyard = 'Where the dead sleeps',
            k_cbean_yma_keypack = "Key Pack",
            cbean_0chill_blind_weakend = "Blind Weakend!",
            cbean_0chill_blind_strengthened = "Blind Strengthened!",
            k_yma_keys = 'Keys',
            b_yma_keys_cards = 'Keys',
            k_yma_key_plus_use = 'Use',
            k_cbean_yma_street = 'Street',
            k_yma_key_broke = 'Broken',
            k_yma_key_faded = 'Faded',
			k_cbean_burned="Burned!",
            k_cbean_piss_ex = "Piss!",
            k_cbean_mash_ex = "Mash!",
			k_cbean_pboys_abet="Bet",
			k_cbean_unique_ex="???",
			k_cbean_balley_ex="Alley!",
			k_cbean_aexit_ex="Exit",
			k_cbean_pboys_arule="Choose a Cup",
			k_cbean_pboys_aplus="+",
			k_cbean_pboys_aminus="-",

        },
        high_scores = {},
        labels = {
            cbean_sdown_lunar_seal = "Lunar Seal"
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
            },

            --House Rules Hands
            ["cbean_0chill_fibonacci"] = {
                "A hand that contains an 8, 5, 3, 2, and an Ace",
                "Must have {C:attention}House Rules{} and {C:attention}Fibonacci{} to play"  
            },

            ["cbean_0chill_fibonacci_flush"] = {
                "A hand that contains an 8, 5, 3, 2,",
                "and an Ace sharing the same suit",
                "Must have {C:attention}House Rules{} and {C:attention}Fibonacci{} to play"  
            },

            ["cbean_0chill_proceed"] = {
                "PROCEED",
                "Must have {C:attention}House Rules{} and {C:attention}Thorn Ring{} to play"  
            },

            ["cbean_0chill_deer_in_headlights"] = {
                "A hand that contains 5 kings",
                "Must have {C:attention}House Rules{} and {C:attention}Asgore's Truck{} to play",
                "{C:inactive}Driving in my truck, right after a beer..."  
            },

            ["cbean_0chill_jackpot"] = {
                "A hand that contains 3 sevens",
                "Must have {C:attention}House Rules{} and {C:attention}Oops! All 6s{} to play",  
            },

            ["cbean_0chill_house_rules"] = {
                "A hand that contains an Jack, 4, 3, 1,",
                "Must have {C:attention}House Rules{} to play"  
            },
        },
        poker_hands = {
            ["cbean_sdown_antistraight"] = "Gay", -- Athebyne | N/A | Athebyne
            ["cbean_sdown_antistraight_flush"] = "Gay Flush", -- Athebyne | N/A | Athebyne
            ["cbean_sdown_bobtail"] = "Bobtail", -- Athebyne | N/A | Athebyne

            --House Rules Hands
            ["cbean_0chill_fibonacci"] = "HR Fibonacci",
            ["cbean_0chill_fibonacci_flush"] = "HR Fibonacci Flush",
            ["cbean_0chill_house_rules"] = "HR House Rules",
            ["cbean_0chill_proceed"] = "HR PROCEED",
            ["cbean_0chill_deer_in_headlights"] = "HR Deer in Headlights",
            ["cbean_0chill_jackpot"] = "HR Jackpot!"
        },
        quips={ 
            cbean_pboys_hi_1={
                "I hope you'll",
				"be interested",
				"in my game!",
            },
            cbean_pboys_hi_2={
                "Hello there!",
            },
            cbean_pboys_hi_3={
                "Let's play a game!",
            },
            cbean_pboys_hi_4={
                "Top of the",
				"morning to you!",
            },
            cbean_pboys_hi_5={
                "Hello traveler!",
            },
            cbean_pboys_hi_6={
                "Hi, I hope you",
				"brought good",
				"luck with you!",
            },
            cbean_pboys_hi_7={
                "Welcome back alley!"
            },
			cbean_pboys_win_1={
                "{C:dark_edition}YOU WIN!",
                "{C:inactive}sadly...",
            },
            cbean_pboys_win_2={
                "My disappearing",
				"trick didn't work...",
            },
            cbean_pboys_win_3={
                "It was",
				"beginner's luck!",
            },
            cbean_pboys_win_4={
                "I need to shuffle",
				"{S:1.1,C:attention,E:2}faster",
            },
            cbean_pboys_win_5={
                "You won?",
				"{C:inactive}oh man",
            },
            cbean_pboys_win_6={
                "My debts are growing",
            },
            cbean_pboys_win_7={
                "...",
            },
			cbean_pboys_lose_1={
                "Better luck",
				"next time",
            },
            cbean_pboys_lose_2={
                "99 percent of",
				"gamblers stop right",
				"before winning big",
            },
            cbean_pboys_lose_3={
                "You cant stop",
				"losing",
            },
            cbean_pboys_lose_4={
                "Wheel of fortune",
				"probably never",
				"works for you!",
            },
            cbean_pboys_lose_5={
                "Wait, Did I win?",
            },
            cbean_pboys_lose_6={
                "Money Money Money",
            },
            cbean_pboys_lose_7={
                "!!!",
            },
			cbean_pboys_tutorial_1={
                "This is {C:attention}Back Alley!",
            },
            cbean_pboys_tutorial_2={
                "You can {C:attention}bet{}",
				"your money here",
            },
            cbean_pboys_tutorial_3={
                "Then i will {C:attention}swap{} cups",
				"and you have to",
				"{C:attention}choose{} the right one",
            },
            cbean_pboys_tutorial_4={
                "The correct cup will",
				"{C:attention}double{} the bet",
            },
            cbean_pboys_tutorial_5={
                "Otherwise you will",
				"{C:attention}lose{} everything",
            },
            cbean_pboys_tutorial_6={
                "The higher the bet, the more",
				"{C:attention}difficult{} it becomes",
            },
            cbean_pboys_tutorial_7={
                "{C:attention}Good luck!",
            },
        },
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            coldbean_team = { "Team: #1#" },
            coldbean_idea = { "Idea: #1#" },
            coldbean_art = { "Art: #1#" },
            coldbean_code = { "Code: #1#" },
	    a_burned_cards="#1# Cards",
        },
        v_text = {
            --TODO look at aikoyori's patch more closely to get this to be anything. Or maybe we don't need it to
            --be that modifiable if nobody else uses this. In which case who cares tbh.
            ch_c_cbean_sdown_all_blinds_are={
                "{C:attention}All Blinds{} are {C:attention}The Folly",
            }
        },
    },
}

