function JHUB.contains(array, value)
    for k, v in ipairs(array) do
        if v == value then
            return true  -- Value found
        end
    end
    return false  -- Value not found
end

function JHUB.find_ranks()
	local found_ranks = {}
	if G.playing_cards then
		for key, value in pairs(G.playing_cards) do
			if not SMODS.has_no_rank(value) and not JHUB.contains(found_ranks, value:get_id()) then
				local new_rank = value:get_id()
				table.insert(found_ranks, new_rank)
			end
		end
	end
	return found_ranks
end

function JHUB.pick_new_rank(exclude_rank) 
	local ranks_in_deck = JHUB.find_ranks()
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
if not Card.scale_value then
	function Card:scale_value(applied_value, scalar)
		return applied_value + scalar
	end
end

-- Initialize Food pool if not existing, which may be created by other mods.
-- Any joker can add itself to this pool by adding a pools table to its definition
-- Credits to Cryptid for the idea
if not SMODS.ObjectTypes.Food then
	SMODS.ObjectType {
		key = 'Food',
		default = 'j_egg',
		cards = {
			["j_gros_michel"] = true,
			["j_egg"] = true,
			["j_ice_cream"] = true,
			["j_cavendish"] = true,
			["j_turtle_bean"] = true,
			["j_diet_cola"] = true,
			["j_popcorn"] = true,
			["j_ramen"] = true,
			["j_selzer"] = true,
		},
	}
end

---Checks if a provided card is classified as a "Food Joker"
function JHUB.is_food(card)
	local center = type(card) == "string"
		and G.P_CENTERS[card]
		or (card.config and card.config.center)
  
	if not center then
	  return false
	end
  
	-- If the center has the Food pool in its definition
	if center.pools and center.pools.Food then
	  return true
	end
  
	-- If it doesn't, we check if this is a vanilla food joker
	return JHUB.vanilla_food[center.key]
end

--Empty function to be hooked by Amamiya
SMODS.current_mod.process_loc_text = function()
    
end