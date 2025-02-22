-- Code below I took from Paperback
-- Disable specific jokers by commenting them out
local ENABLED_JOKERS = {
	--Common
	"broker",
	"rekoj",
	"da_joki",
	"mulligan",
	--Uncommon
	"orb_of_confusion",
	"going_viral",
	"snowball_effect",
	"face_value",
	"twins",
	"union_member_card",
	"gambit",
	--Rare
	"forbidden_fruit",
	"demon_core",
	"last_hurrah",
	"garbage_bag",
	--Legendary
	"hudson",
}

assert(SMODS.load_file('functions.lua'))()

SMODS.Atlas {
  key = "atlas_jokers",
  px = 71,
  py = 95,
  path = "jh_jokers.png"
}

G.C.PINK = HEX('ff7df4')
G.C.SILVER = HEX('9396c2')

assert(SMODS.load_file('decks.lua'))()

assert(SMODS.load_file('stakes.lua'))()
--[[
if next(SMODS.find_mod("maximus")) then
	table.insert(food_jokers, {
		key = 'j_jokerhub_forbidden_fruit',
		name = 'Forbidden Fruit'
	})
end]]

-- Register the jokers in custom order
for i = 1, #ENABLED_JOKERS do
  local status, err = pcall(function()
    return NFS.load(SMODS.current_mod.path .. "/joker/" .. ENABLED_JOKERS[i] .. ".lua")()
  end)
  sendDebugMessage("Loaded joker: " .. ENABLED_JOKERS[i], "JokerHub")

  -- If a file didn't load correctly, display the file in question and return
  if not status then
    error(ENABLED_JOKERS[i] .. ": " .. err)
  end
end

assert(SMODS.load_file('challenges.lua'))()