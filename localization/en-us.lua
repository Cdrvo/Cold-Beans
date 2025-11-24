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
        Enhanced = {},
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
            p_cbean_czodiac_normal1 = {
                name = "Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_normal2 = {
                name = "Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_jumbo1 = {
                name = "Jumbo Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_jumbo2 = {
                name = "Jumbo Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_mega1 = {
                name = "Mega Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_czodiac_mega2 = {
                name = "Mega Zodiac Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Chinese Zodiac{} cards to",
                    "be used immediately"
                }
            },
            p_cbean_blessing_normal1 = {
                name = "Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Blessing{} cards",
                    "take"
                }
            },
            p_cbean_blessing_normal2 = {
                name = "Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Blessing{} cards",
                    "take"
                }
            },
            p_cbean_blessing_jumbo = {
                name = "Jumbo Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Blessing{} cards",
                    "take"
                }
            },
            p_cbean_blessing_mega = {
                name = "Mega Pantheon Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2# {C:attention}Blessing{} cards",
                    "take"
                }
            }
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
            }
        },
        Spectral = {
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
            }
        },
        Stake = {},
        Tag = {},
        Tarot = {},
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
            k_cbean_sdown_blessingpack = "Pantheon Pack"
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
            }
        },
        poker_hands = {
            ["cbean_sdown_antistraight"] = "Gay", -- Athebyne | N/A | Athebyne
            ["cbean_sdown_antistraight_flush"] = "Gay Flush", -- Athebyne | N/A | Athebyne
            ["cbean_sdown_bobtail"] = "Bobtail" -- Athebyne | N/A | Athebyne
        },
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {
            coldbean_team = { "Team: #1#" },
            coldbean_idea = { "Idea: #1#" },
            coldbean_art = { "Art: #1#" },
            coldbean_code = { "Code: #1#" }
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
