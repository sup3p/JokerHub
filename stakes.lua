SMODS.Atlas {
    key = "atlas_stickers",
    px = 71,
    py = 95,
    path = "jh_stickers.png"
  }
  
  SMODS.Atlas {
    key = "atlas_stakes",
    px = 29,
    py = 29,
    path = "jh_stakes.png"
}

SMODS.Stake {
	prefix_config = false,
	key = "stake_jokerhub_pink",
	applied_stakes = { "stake_purple" },
	atlas = "jokerhub_atlas_stakes",
	pos = { x = 0, y = 0 },
	sticker_atlas = "jokerhub_atlas_stickers",
	sticker_pos = { x = 0, y = 0 },
	unlocked = false,
	modifiers = function()
        G.GAME.win_ante = (G.GAME.win_ante or 8) + 1
    end,
	colour = G.C.PINK
}

SMODS.Stake {
	--yeah im aware the key should just be "silver" and not "stake_silver" but changing it now would fuck up saved stickers
	key = "stake_silver",
	applied_stakes = { "pink" },
	atlas = "atlas_stakes",
	pos = { x = 1, y = 0 },
	sticker_atlas = "atlas_stickers",
	sticker_pos = { x = 1, y = 0 },
	unlocked = false,
	modifiers = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
    end,
	shiny = true,
	colour = G.C.SILVER
}