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

SMODS.Sound({
  key = "eightyseven",
  path = "6_NameTeam/cbean_eightyseven.ogg"
})

for i = 1, 7 do
  SMODS.Sound({
    key = "markiplier-0" .. i,
    path = "6_NameTeam/cbean_markiplier-0" .. i .. ".ogg"
  })
end