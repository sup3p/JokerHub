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
function JHUB.scale_group_chat()
	local groupchats = SMODS.find_card('j_mxms_group_chat')
	if next(groupchats) then
		for k, v in pairs(groupchats) do
			v.ability.extra.chips = v.ability.extra.chips + 2 * G.GAME.soil_mod
			v:juice_up(0.3, 0.4)
		end
	end
end