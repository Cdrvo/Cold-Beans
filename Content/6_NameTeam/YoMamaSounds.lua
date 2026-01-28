for i = 1, 100 do
  local num = string.format("%02d", i)
  SMODS.Sound({
    key = "yomama-" .. num,
    path = "6_NameTeam/Yo Mama/cbean_yomama-" .. num .. ".ogg"
  })
end

SMODS.Sound({
  key = "yomama_intro",
  path = "6_NameTeam/Yo Mama/cbean_yomama_intro.ogg"
})