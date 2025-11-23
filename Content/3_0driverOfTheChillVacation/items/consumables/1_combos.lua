SMODS.ConsumableType {
    key = '0chill_combo',
    default = 'c_cbean_0chill_starter1',
    primary_colour = HEX('E89A35'), --placeholder for now, we can update these once we know what we want to do.
    secondary_colour = HEX('BA6900'), --placeholder for now, we can update these once we know what we want to do.
    collection_rows = { 6, 6 },
    shop_rate = 1,
    loc_txt = {
        name = "Combo",
        collection = "Combo",
        undiscovered = {
            name = "Not Discovered",
            text = {
                "Purchase this card",
                "in an unseeded",
                "run to learn",
                "what it does"
            }
        }
    },
}

SMODS.Consumable {
    key = '0chill_starter1',
    set = '0chill_combo',
    atlas = '0chill_combo_atlas',
    config = { },
    pos = { x = 2, y = 0 },
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "", --TODO
        art = "",  --TODO
        code = "Inspector_B",
    },
    generate_ui = 0,
    loc_txt = {
        name = 'The Placeholder',
        text = {
            "Lorem Ipsem",
            "Lorem Ipsem",
            "Lorem Ipsem"
        }
    },
    calculate = function(self, card, context)


    end
}

SMODS.Consumable {
    key = '0chill_taunt1',
    set = '0chill_combo',
    atlas = '0chill_combo_atlas',
    config = {},
    pos = { x = 2, y = 0 },
    beans_credits = {
        team = {"0 Driver Of",
                "The Chill Vacation"
                },
        idea = "", --TODO
        art = "",  --TODO
        code = "Inspector_B",
    },
    generate_ui = 0,
    loc_txt = {
        name = 'The Placeholder 2',
        text = {
            "Lorem Ipsem",
            "Lorem Ipsem",
            "Lorem Ipsem"
        }
    },
}