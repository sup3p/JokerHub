-- Code below I took from Paperback
-- Disable specific jokers by commenting them out
local ENABLED_JOKERS = {
	--Common
	"broker",
	"rekoj",
	"da_joki",
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

function jh_contains(array, value)
    for k, v in ipairs(array) do
        if v == value then
            return true  -- Value found
        end
    end
    return false  -- Value not found
end

function jh_find_ranks()
	local found_ranks = {}
	if G.playing_cards then
		for key, value in pairs(G.playing_cards) do
			if not SMODS.has_no_rank(value) and not jh_contains(found_ranks, value:get_id()) then
				local new_rank = value:get_id()
				table.insert(found_ranks, new_rank)
			end
		end
	end
	return found_ranks
end

function jh_pick_new_rank(exclude_rank) 
	local ranks_in_deck = jh_find_ranks()
	if #ranks_in_deck > 0 then
		for i=1,#ranks_in_deck do
			if ranks_in_deck[i] == exclude_rank then
				table.remove(ranks_in_deck, i)
				break
			end
		end
		local index = math.min(math.floor(pseudorandom(pseudoseed('forbiddenfruit'..G.GAME.round_resets.ante)) * #ranks_in_deck) + 1, #ranks_in_deck)
		return ranks_in_deck[index]
	else
		return 14
	end
end

--For cross-mod compatibility with Maximus
function jh_scale_group_chat()
	local groupchats = SMODS.find_card('j_mxms_group_chat')
	if next(groupchats) then
		for k, v in pairs(groupchats) do
			v.ability.extra.chips = v.ability.extra.chips + 2 * G.GAME.soil_mod
			v:juice_up(0.3, 0.4)
		end
	end
end

SMODS.Atlas {
  key = "atlas_jokers",
  px = 71,
  py = 95,
  path = "jh_jokers.png"
}

SMODS.Atlas {
  key = "atlas_decks",
  px = 71,
  py = 95,
  path = "jh_decks.png"
}

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

G.C.PINK = HEX('ff7df4')
G.C.SILVER = HEX('9396c2')

--[[
local old_calculate_reps = SMODS.calculate_repetitions
SMODS.calculate_repetitions = function(card, context, reps)
	local reps = old_calculate_reps(card, context, reps)
	--Get repetitions from joker effects on held cards
	--print("hook!")
	for k = 1, #G.hand.cards do
		context.individual = true
		context.extra_repetition = true
		context.repetition = nil
		context.hand_card = G.hand.cards[k]
		for i = 1, #G.jokers.cards do
			local _card = G.jokers.cards[i]
			--calculate the held card effects
			local eval, post = eval_card(_card, context)
			if next(post) then SMODS.trigger_effects(post, card) end
			local rt = eval and eval.retriggers and #eval.retriggers or 0
			for key, value in pairs(eval) do
				if value.repetitions and key ~= 'retriggers' then

					for h=1, value.repetitions do
						value.card = value.card or _card
						reps[#reps+1] = {key = value}
						for i=1, rt do
							local rt_eval, rt_post = eval_card(_card, context)
							if next(rt_post) then SMODS.trigger_effects(rt_post, card) end
							rt_eval.card = rt_eval.card or _card
							reps[#reps+1] = {key = value}
						end
					end
				end
			end
		end
		context.extra_repetition = nil
	end
	return reps
end]]

SMODS.Back{
    name = "Filmmaker's Deck",
    key = "film_deck",
    pos = {x = 0, y = 0},
	atlas = "atlas_decks",
    config = {
		voucher = "v_directors_cut"
	},
    loc_txt = {
        name = "Filmmaker's Deck",
        text ={
            "Start with {C:red,T:v_directors_cut}Director's Cut{}.",
			"{C:attention}Boss Blind{} reroll cost is",
			"reduced to {C:money}$5{}.",
			"Any {C:attention}Boss Blind{} can appear",
			"on any {C:attention}Ante{}.",
		},
    },
    apply = function()
		
        G.E_MANAGER:add_event(Event({
            func = function()
                
                return true
            end
        }))
    end
}

SMODS.Stake {
	prefix_config = false,
	key = "stake_jokerhub_pink",
	applied_stakes = { "stake_purple" },
	loc_txt = {
		name = "Pink Stake",
		text = {
			"{C:attention}Showdown boss{} and end of game",
			"is on {C:attention}Ante 9{}."
		},
		sticker = {
			name = "Pink Sticker",
			text = {
				"Used this Joker",
				"to win on {C:attention}Pink",
				"{C:attention}Stake{} difficulty",
			}
		}
	},
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
	key = "stake_silver",
	applied_stakes = { "pink" },
	loc_txt = {
		name = "Silver Stake",
		text = {
			"Required score scales",
            "faster for each {C:attention}Ante",
		},
		sticker = {
			name = "Silver Sticker",
			text = {
				"Used this Joker",
				"to win on {C:attention}Silver",
				"{C:attention}Stake{} difficulty",
			}
		}
	},
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

if next(SMODS.find_mod("maximus")) then
	table.insert(food_jokers, {
		key = 'j_jokerhub_forbidden_fruit',
		name = 'Forbidden Fruit'
	})
end


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