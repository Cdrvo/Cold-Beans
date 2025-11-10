-- Sorted by rarity and filtered alphabetically
-- Information goes: Suggestor | Art | Coder

return {
    descriptions = {
        Back = {},
        Blind = {
            bl_cbean_colon_treasure = {
                name = "The Treasure",
                text = {
                    "When {C:money}${} is earned, increase",
                    "blind size by {X:purple} X0.2 {} base"
                }
            },
            bl_cbean_colon_gate = {
                name = "The Gate",
                text = {
                    "Moderately large blind"
                }
            },
            bl_cbean_colon_sheet = {
                name = "The Sheet",
                text = {
                    "Debuff held #1#s and played #2#s"
                }
            },
            bl_cbean_colon_stamp = {
                name = "The Stamp",
                text = {
                    "Debuff all Sealed cards"
                }
            },
            bl_cbean_colon_salesman = {
                name = "The Salesman",
                text = {
                    "Next shop and Blind select screen are skipped"
                }
            },
            bl_cbean_colon_gamma = {
                name = "The Gamma",
                text = {
                    "Retrigger all played cards 2 additional times",
                    "Retrigger all played and held in hand cards 3 additional times"
                }
            },
            bl_cbean_colon_wee = {
                name = "Wee Blind",
                text = {}
            }
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
            j_cbean_colon_full_180 = { -- Glitchkat10 | N/A | N/A
                name = "Full 180",
                text = {
                    "Blind order in current {C:attention}Ante{} is {C:dark_edition,E:1}randomized",
                    "{C:attention}Blind requirement{} is kept in the same order"
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
            j_cbean_colon_loan_shark = { -- George The Rat | N/A | N/A
                name = "Loan Shark",
                text = {
                    "Lose {C:money$5{} when defeating a {s:0.9,C:chips}Teeny{}, {C:blue}Small{}, or {C:attention}Big Blind",
                    "Gain {C:money}$15{} when defeating a {C:attention}Boss{} or {E:1,C:money}CEO{C:money} Blind",
                }
            },
            j_cbean_colon_lumberjack = { -- George The Rat | N/A | N/A
                name = "Lumberjack",
                text = {
                    "All {C:attention}held in hand{} jacks are destroyed",
                    "Gains {C:mult}+4{} mult when a jack is destroyed",
                    "{C:inactive}(Currently {C:mult}+0{C:inactive} mult)"
                }
            },
            j_cbean_colon_minnesang = { -- bitter | N/A | N/A
                name = "Minnesang",
                text = {
                    "{C:red}#1#{} discards each round,",
                    "{C:money}#2#{} dollar per round"
                }
            },
            j_cbean_colon_orchestra = { -- bitter | N/A | N/A
                name = "Orchestra",
                text = {
                    "{C:blue}+2{} hands per round",
                    "{C:red}+2{} discards each round",
                    "{C:attention}+2{} hand size"
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
            j_cbean_colon_mu_cube = { --George The Rat | N/A | bitter
                name = "Mu Cube",
                text = {
                    "Played {C:attention}4s{} give {X:mult,C:white}X#1#{} Mult every",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} times they are scored",
                    "Played {C:attention}6s{} give {X:mult,C:white}X#4#{} Mult every",
                    "{C:attention}#5#{} {C:inactive}[#6#]{} times they are scored"
                },
            },
            j_cbean_colon_rna = { -- bitter and George The Rat | N/A | bitter
                name = "RNA",
                text = {
                    "If {C:attention}first hand{} of round has only {C:attention}1", 
                    "add a permanent copy to deck and draw to {C:attention}hand", 
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
                    "{C:blue}+2{} hands each round,",
                    "{C:red}-1{} discards per round"
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
                    "Creates a {C:spectral}Spectral{} card when {s:0.9,C:chips}Teeny Blind{}",
                    "or {E:1,C:money}CEO{} Blind is defeated without discarding",
                },
            },
            j_cbean_colon_packing = { -- Glitchkat10 | George The Rat | Glitchkat10
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
                    "Each {C:attention}Ace{} held in hand gives {C:white,X:mult}X1.5{} Mult",
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
                    "Open 1 {C:dark_edition}Blessing{} {C:attention}Pack{} when a {E:1, C:money}CEO Blind{} is defeated",
                    "When a {C:dark_edition}Blessing{} is obtained from a {C:attention}Booster Pack{},",
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
        },
        Other = {},
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {},
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {},
        collabs = {},
        dictionary = {
            sheet_most_held = "(Most held rank)",
            sheet_most_played = "(Most played rank)",
        },
        high_scores = {},
        labels = {},
        poker_hand_descriptions = {},
        poker_hands = {},
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
        v_text = {},
    },
}