function Back:nteam_apply_sticker(key)
    self.ability[key] = true
    local sticker_table = SMODS.Stickers[key]
    if sticker_table.config and next(sticker_table.config) then
        self.ability[key] = {}
        for k, v in pairs(sticker_table.config) do
            if type(v) == "table" then
                self.ability[key][k] = copy_table(v)
            else
                self.ability[key][k] = v
            end
        end
    end
end

function Back:nteam_remove_sticker(key)
    self.ability[key] = nil
end