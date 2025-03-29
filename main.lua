JHUB = {}

-- Code below I took from Paperback
-- Disable specific jokers by commenting them out
JHUB.ENABLED_JOKERS = {
	--Common
	"broker",
	"rekoj",
	"da_joki",
	"mulligan",
	"leap_frog",
	--Uncommon
	"orb_of_confusion",
	"going_viral",
	"snowball_effect",
	"face_value",
	"twins",
	"union_member_card",
	"gambit",
	"syphon_funding",
	"metal_joker",
	--Rare
	"forbidden_fruit",
	"demon_core",
	"last_hurrah",
	"garbage_bag",
	"long_time_friends",
	--Legendary
	"hudson",
	"amamiya",
	"lychee_dragon"
}

JHUB.vanilla_food = {
	j_gros_michel = true,
	j_egg = true,
	j_ice_cream = true,
	j_cavendish = true,
	j_turtle_bean = true,
	j_diet_cola = true,
	j_popcorn = true,
	j_ramen = true,
	j_selzer = true,
}

assert(SMODS.load_file('functions.lua'))()

SMODS.Atlas {
  key = "atlas_jokers",
  px = 71,
  py = 95,
  path = "jh_jokers.png"
}

SMODS.Atlas {
	key = "atlas_lychee",
	px = 73,
	py = 95,
	path = "jh_lychee.png"
  }

G.C.PINK = HEX('ff7df4')
G.C.SILVER = HEX('9396c2')

assert(SMODS.load_file('decks.lua'))()

assert(SMODS.load_file('stakes.lua'))()

-- Register the jokers in custom order
for i = 1, #JHUB.ENABLED_JOKERS do
  local status, err = pcall(function()
    return NFS.load(SMODS.current_mod.path .. "/joker/" .. JHUB.ENABLED_JOKERS[i] .. ".lua")()
  end)
  sendDebugMessage("Loaded joker: " .. JHUB.ENABLED_JOKERS[i], "JokerHub")

  -- If a file didn't load correctly, display the file in question and return
  if not status then
    error(JHUB.ENABLED_JOKERS[i] .. ": " .. err)
  end
end

assert(SMODS.load_file('challenges.lua'))()