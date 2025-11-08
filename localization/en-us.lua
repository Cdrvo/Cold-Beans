return {
    descriptions = {
        Back = {},
        Blind = {
            bl_cbean_colon_treasure = {
                name = "The Treasure",
                text = {
                    "When {C:money}${} is earned increase",
                    "Blind size by {X:purple} X0.2 {} base"
                }
            },
            bl_cbean_colon_gate = {
                name = "The Gate",
                text = {
                    "Bigger blind size"
                }
            },
            bl_cbean_colon_sheet = {
                name = "The Sheet",
                text = {
                    "Debuff all held in hand #1#s", -- [most held in hand rank]
                    "Debuff all played #2#s" -- [most played rank]
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
        Edition = {},
        Enhanced = {},
        Joker = {
            j_cbean_colon_chalk = {
                name = "Chalk",
                text = {
                    "{C:white,X:mult}X#1#{} Mult",
                    "Permanently increase winning",
                    "{C:attention}Ante{} by {C:attention}+#2#{} when obtained",
                    "{C:inactive}\"Chalk is aid\"",
                }
            },
            j_cbean_colon_soph = {
                name = "Sophron",
                text = {
                    "{C:attention}Retrigger{} each played card",
                    "for each card to the left of it"
                },
            },
            j_cbean_colon_plato = {
                name = "Plato",
                text = {
                    "All {C:attention}CEO Blinds{} are replaced by ",
                    "a random {V:1}Lowercase Greek Blind"
                },
            },
            j_cbean_colon_aris = {
                name = "Aristotle",
                text = {
                    "Open 1 {C:dark_edition}Blessing{} {C:attention}Pack{} when a {C:attention}CEO Blind{} is defeated",
                    "When a {C:dark_edition}Blessing{} is obtained from a {C:attention}Booster Pack{},",
                    "create 1 {C:spectral}Taa Marbuta{}"
                },
            },
            j_cbean_colon_modernity = {
                name = "Modernity",
                text = {
                    "This Joker gains {C:white,X:mult}X#1#{} Mult",
                    "when {C:attention}Blind{} is skipped",
                    "This Joker loses {C:white,X:mult}X#2#{} Mult",
                    "when {C:attention}Blind{} is selected",
                    "{C:inactive}(Currently {C:white,X:mult}X#3#{C:inactive} Mult)",
                },
            },
            j_cbean_colon_rna = {
                name = "RNA",
                text = {
                    "If {C:attention}first hand{} of round has only {C:attention}1", 
                    "add a permanent copy to deck and draw to {C:attention}hand{}", 
                    "{C:inactive}(Copy will not have any {C:dark_edition}editions{C:inactive} or {C:attention}seals{C:inactive})"},
            },
            j_cbean_colon_sproinky = {
                name = "Sproinky",
                text = {
                    "Played and unscoring cards become {C:attention}Steel",
                    "Played {C:attention}Steel Cards{} become",
                    "{C:red,E:2}permanently {C:red}debuffed"
                },
            },
            j_cbean_colon_packing = {
                name = "Square Packing",
                text = {
                    "Gains {X:mult,C:white}X3.877084{} Mult every {C:attention}11 Blinds{} selected",
                    "{C:inactive}(Currently {X:mult,C:white}x#1#{C:inactive}, on blind #4#)",
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
            cbean_colon_sheet_held = "(Most held rank)",
            cbean_colon_sheet_played = "(Most played rank)",
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