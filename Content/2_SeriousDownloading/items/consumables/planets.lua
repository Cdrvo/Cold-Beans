SMODS.Consumable {
    key = 'sdown_gay_planet',
    set = 'Planet',
    atlas = 'sdown_other_atlas',
    config = { hand_type = 'cbean_sdown_antistraight', softlock = true },
    pos = { x = 1, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    generate_ui = 0,
    process_loc_text = function(self)
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key] = {}
        G.localization.descriptions[self.set][self.key].text = target_text
    end
}

SMODS.Consumable {
    key = 'sdown_gayflush_planet',
    set = 'Planet',
    atlas = 'sdown_other_atlas',
    config = { hand_type = 'cbean_sdown_antistraight_flush', softlock = true },
    pos = { x = 1, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    generate_ui = 0,
    process_loc_text = function(self)
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key] = {}
        G.localization.descriptions[self.set][self.key].text = target_text
    end
}



SMODS.Consumable {
    key = 'sdown_bobtail_planet',
    set = 'Planet',
    atlas = 'sdown_other_atlas',
    config = { hand_type = 'cbean_sdown_bobtail', softlock = true },
    pos = { x = 1, y = 0 },
    beans_credits = {
        team = "SeriousDownloading",
        idea = "Athebyne",
        art = "TBA",
        code = "Athebyne",
    },
    generate_ui = 0,
    process_loc_text = function(self)
        local target_text = G.localization.descriptions[self.set]['c_mercury'].text
        SMODS.Consumable.process_loc_text(self)
        G.localization.descriptions[self.set][self.key] = {}
        G.localization.descriptions[self.set][self.key].text = target_text
    end
}