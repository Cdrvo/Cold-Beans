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
        Joker = { -- you guys better sort by Rarity, additional category then alphabetical

                    -- COMMON 14/13

            -- climbing ones
            j_cbean_colon_autobelay = { -- Auto Belay | Common | ??George| n/a
                name = "Auto Belay",
                text = {
                    "Gains {C:mult}+2{} Mult when a {C:attention}card{} is discarded",
                    "but has a {C:green}1 in 7{} chance to {C:attention}reset",
                    "{C:inactive}(Currently {C:mult}+0{C:inactive} Mult)",
                }
            },
            j_cbean_colon_boulder = { -- Boulder | Common | George | tbd
                name = "Boulder",
                text = {
                    "Gains {C:white,X:mult}X0.1{} Mult when {C:money}money{} is spent",
                    "but has a {C:green}1 in 5{} chance to {C:attention}reset",
                    "{C:inactive}(Currently {C:white,X:mult}X1{C:inactive} Mult)",
                }
            },
            j_cbean_colon_lead = { -- Lead | Common | George | tbd
                name = "Lead",
                text = {
                    "Earn {C:money}$0{} at the {C:attention}end of round",
                    "Gain {C:money}$1{} per hand played, {C:green}1 in 8{} chance to instead lose 8", -- this line may be too long....
                }
            },
            j_cbean_colon_topRope = { -- Boulder | Common | George | tbd
                name = "Top Rope",
                text = {
                    "Gain {C:chips}+15{} Chips when {C:attention}playing card{} scored at the {C:attention}end of round", -- attention-slop
                    "{C:green}1 in 2{} chance to instead decrease by {C:chips}-30{} Chips", -- this line may be too long....
                }
            },

            -- Troubadour Inspired
            j_cbean_colon_minnesang = { -- Minnesang | Common | Bitter | tbd
                name = "Minnesang",
                text = {
                    "{C:red}#1#{} discards each round,",
                    "{C:money}#2#{} dollar per round"
                }
            },
            j_cbean_colon_trouvere = { -- Trouvère | Common | Bitter | tbd
                name = "Trouvère", -- name might be fucked with font
                text = {
                    "{C:blue}+2{} hands each round,",
                    "{C:red}-1{} discards per round"
                }
            },                                                                                      --   vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
            j_cbean_colon_orchestra = { -- Orchestra | Common | Bitter | tbd                             JUST AN IDEA!!! would be a mix of all 33
                name = "Orchestra", -- name might be fucked with font                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                text = {
                    "{C:blue}+2{} hands each round,",
                    "{C:blue}+2{} discards each round,",        -- could be 1 or 2 idk
                    "{C:blue}+2{} hand size each round,",
                }
            },

            -- misc
            j_cbean_colon_allin = { -- All in | Common | ?? | tbd
                name = "All In",
                text = {
                    "When entering an {C:attention}ante{} all blinds are",
                    "either all {s:0.9,C:chips}teeny blinds{} or all {E:1,C:money}CEO blinds",
                }
            },
            j_cbean_colon_chalk = { -- Chalk | Common | ?? | ??
                name = "Chalk",
                text = {
                    "{C:white,X:mult}X#1#{} Mult",
                    "Permanently increase winning",
                    "{C:attention}Ante{} by {C:attention}+#2#{} when obtained",
                    '{C:inactive}"Chalk is aid"',
                }
            },
            j_cbean_colon_f180 = { -- Full 180 | Common | ?? | tbd
                name = "Full 180",
                text = {
                    "Blind order in current {C:attention}Ante{} is {C:dark_edition,E:1}randomized",
                    "{C:attention}Bases{} are kept in the same order", -- What is a "Base"
                }
            },
            j_cbean_colon_lawOrder = { -- Law And Order | Common | ?? | tbd
                name = "Law And Order",
                text = {
                    "{C:attention}Triple Blind requirement{} of {s:0.9,C:chips}Teeny Blinds",
                    "{C:attention}Halve Blind requirement{} of {E:1,C:money}CEO Blinds",
                }
            },
            j_cbean_colon_loanshark = { -- Loan Shark | Common | ?? | tbd
                name = "Loan Shark",
                text = {
                    "Lose {C:money$5{} when defeating a {s:0.9,C:chips}Teeny{}, {C:blue}Small{}, or {C:attention}Big Blind",
                    "Gain {C:money}$15{} when defeating a {C:attention}Boss{} or {E:1,C:money}CEO{C:money} Blind",
                }
            },
            j_cbean_colon_lumberjack = { -- Lumber Jack | Common | ?? | tbd
                name = "Lumber Jack", -- canio but you gotta hit the road
                text = {
                    "All {C:attention}held in hand{} jacks are destroyed",
                    "Gains {C:mult}+4{} mult when a jack is destroyed",
                    "{C:inactive}(Currently {C:mult}+0{C:inactive} mult)"
                }
            },
            j_cbean_colon_pibble = { -- Pebble | Common | ?? | bitter/Jam?
                name = "Pebble",
                text = {
                    "{C:blue}Small Blinds{} are replaced with {s:0.9,C:chips}Teeny Blinds",
                    "{C:money}Big Blinds{} are replaced with {C:blue}Small Blinds",
                }
            },

                    -- UNCOMMON 5/6

            j_cbean_colon_careerladder = { -- Career Ladder | Uncommon | ??? | tbd
                name = "Career Ladder",
                text = {
                    "All {C:attention}Boss Blinds{} are replaced by {E:1,C:money}CEO Blinds",
                    "All {E:1,C:attention}Showdown Boss Blinds{} are replaced by {C:attention}Boss Blinds",
                    "All {E:1,C:money,s:1.1}Showdown CEO Blinds{} are replaced by {E:1,C:money}CEO Blinds",
                },
            },
            j_cbean_colon_mucube = { -- mu cube | Uncommon | ??? | BitterDoes
                name = "Mu Cube",
                text = {
                    "Scored 4s give {X:mult,C:white}X#1#{} mult every {C:attention}#3#",
                    "Scored {}4s give {X:mult,C:white}X#2#{} mult every {C:attention}#5#",
                    "{C:inactive}(Currently {C:attention}#4#{C:inactive}/#3# and {C:attention}#6#{C:inactive}/#5#)",
                },
            },
            j_cbean_colon_rna = { -- RNA | Uncommon | Bitter | Bitter
                name = "RNA",
                text = {
                    "If {C:attention}first hand{} of round has only {C:attention}1", 
                    "add a permanent copy to deck and draw to {C:attention}hand", 
                    "{C:inactive}(Copy will not have any {C:dark_edition}editions{C:inactive} or {C:attention}seals{C:inactive})"},
            },
            j_cbean_colon_hedgehog = { -- Shadow | Uncommon | ??? | BitterDoes
                name = "Shadow",
                text = {
                    "When a {C:attention}Booster Pack{} is bought from the shop",
                    "create its {C:attention}corresponding{} Tag",
                },
            },
            j_cbean_colon_sproinky = { -- Sproinky | Uncommon | ??? | BitterDoes
                name = "Sproinky",
                text = {
                    "{C:attention}Played and unscoring cards{} become Steel",
                    "Played {C:attention}Steel Cards{} become",
                    "{C:red,E:2}permanently {C:red}debuffed"
                },
            },

                    -- RARE 5/4

            j_cbean_colon_bigshot = { -- Big Shot | Rare | George | BitterDoes
                name = "Big Shot",
                text = {
                    "When a {C:attention}Big Blind{} is defeated,",
                    "earn between {C:money}$-199.7{} and {C:money}$199.7",
                },
            },
            j_cbean_colon_modernity = { -- Modernity | Rare | glitch | jam
                name = "Modernity",
                text = {
                    "This Joker gains {C:white,X:mult}X#1#{} Mult",
                    "when {C:attention}Blind{} is skipped",
                    "This Joker loses {C:white,X:mult}X#2#{} Mult",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive}(Currently {C:white,X:mult}X#3#{C:inactive} Mult)",
                },
            },
            j_cbean_colon_spectaro = { -- Spectaro | Rare | ?? | Bitter
                name = "Spectaro",
                text = {
                    "Creates a {C:spectral}spectral{} card on beating",
                    "{s:0.9,C:chips}Teeny{} or {E:1,C:money}CEO{} Blind {C:attention}without discarding",
                },
            },
            j_cbean_colon_packing = { -- Square Packing | Rare | ??? | jam or glitch idk
                name = "Square Packing",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "every {C:attention}#2# {C:inactive}[#3#]{C:attention} Blinds{} selected",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                },
            },
            j_cbean_colon_jester = { -- Square Packing | Rare | ??? | jam or glitch idk
                name = "Jester",
                text = {
                    "Each {C:attention}Ace{} held in hand gives {C:white,X:mult}X1.5{} Mult",
                },
            },

                    -- LEGENDARIES 3/3

            j_cbean_colon_soph = { -- Sophron | Legendary | Bitter | Bitter
                name = "Sophron",
                text = {
                    "{C:attention}Retrigger{} each played card",                        -- redo colors
                    "for each card to the left of it"
                },
            },
            j_cbean_colon_plato = { -- Plato | Legendary | glitch | tbd
                name = "Plato",
                text = {
                    "All {E:1,C:money}CEO Blinds{} are replaced by ",
                    "a random {V:1}Lowercase Greek Blind"
                },
            },
            j_cbean_colon_aris = { -- Aristotle | legendary | glitch | tbd
                name = "Aristotle",
                text = {
                    "Open 1 {C:dark_edition}Blessing{} {C:attention}Pack{} when a {E:1, C:money}CEO Blind{} is defeated",
                    "When a {C:dark_edition}Blessing{} is obtained from a {C:attention}Booster Pack{},",
                    "create 1 {C:spectral}Taa Marbuta"
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
            coldbean_art = { "Art: #1#" },
            coldbean_code = { "Code: #1#" },
            coldbean_team = { "Team: #1#" },
            coldbean_idea = {"Idea: #1#"}
        },
        v_text = {},
    },
}