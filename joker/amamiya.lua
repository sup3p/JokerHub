function JHUB.get_amamiya_effect(card, context, boss_key, vars)
	--local vars = JHUB.get_amamiya_vars(card, boss_key, context)

	if boss_key == "bl_manacle" then --The Manacle
		if context.add_to_deck then
			G.hand:change_size(vars.hand_size_mod)
		end
		if context.remove_from_deck then
			G.hand:change_size(-vars.hand_size_mod)
		end
	elseif boss_key == "bl_ox" then --The Ox
		if not card.debuff and context.cardarea == G.jokers and context.before and context.scoring_name == G.GAME.current_round.most_played_poker_hand then
			ease_dollars(vars.dollars)
			G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + vars.dollars
			G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
			return {
				message = localize('$')..vars.dollars,
				colour = G.C.MONEY
			}
		end
	elseif boss_key == "bl_wall" or boss_key == "bl_final_vessel" then --The Wall and Violet Vessel
		if context.joker_main and not card.debuff then
			return {
				Xmult_mod = vars.x_mult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { vars.x_mult } },
				card = card,
			}
		end
	elseif boss_key == "bl_arm" then --The Arm
		if not card.debuff and context.cardarea == G.jokers and context.before and G.GAME.current_round.hands_played == 0 then
			return {
				card = self,
				level_up = true,
				message = localize('k_level_up_ex')
			}
		end
	elseif boss_key == "bl_club" or boss_key == "bl_goad" or boss_key == "bl_window" or boss_key == "bl_head" then --Suit debuffers
		if not card.debuff and context.repetition and context.cardarea == G.play and context.other_card and context.other_card:is_suit(vars.suit) then
			return {
				repetitions = 1
			}
		end
	elseif boss_key == "bl_plant" then --The Plant
		if not card.debuff and context.repetition and context.cardarea == G.play and context.other_card and context.other_card:is_face() then
			return {
				repetitions = 1
			}
		end
	elseif boss_key == "bl_pillar" then --The Pillar
		if not card.debuff and context.individual and context.cardarea == G.play then
			context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + vars.chips
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS,
				card = card,
				target_card = context.other_card
			}
		end
	elseif boss_key == "bl_water" then --The Water
		if context.add_to_deck then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards + vars.discards
            ease_discard(vars.discards)
		end
		if context.remove_from_deck then
			G.GAME.round_resets.discards = G.GAME.round_resets.discards - vars.discards
            ease_discard(-vars.discards)
		end
	elseif boss_key == "bl_needle" then --The Needle
		if context.add_to_deck then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands + vars.hands
		end
		if context.remove_from_deck then
			G.GAME.round_resets.hands = G.GAME.round_resets.hands - vars.hands
		end
	elseif boss_key == "bl_final_leaf" then --The Verdant Leaf
		if not context.from_debuff then
			if context.add_to_deck then
				G.jokers.config.card_limit = G.jokers.config.card_limit + vars.slots
			end
			if context.remove_from_deck then
				G.jokers.config.card_limit = G.jokers.config.card_limit - vars.slots
			end
		end
	elseif boss_key == "bl_tooth" then --The Tooth
		if not card.debuff and context.cardarea == G.jokers and context.before then
			for i = 1, #context.scoring_hand do
				G.E_MANAGER:add_event(Event({func = function() context.scoring_hand[i]:juice_up(); card:juice_up(); return true end })) 
				ease_dollars(vars.dollars)
				delay(0.23)
			end
		end
	elseif boss_key == "bl_flint" then --The Flint
		if not card.debuff and context.cardarea == G.jokers and context.jh_scoring_before then
			return {
				x_chips = vars.x_chips,
				x_mult = vars.x_mult,
			}
		end
	elseif boss_key == "bl_final_bell" then --Cerulean Bell
		if context.add_to_deck and not card.ability.extra.bell_index then
			card.ability.extra.bell_index = 1
		end
		if not card.debuff and context.cardarea == G.jokers and context.before then
			card.ability.extra.bell_index = pseudorandom(pseudoseed("amamiya_bell"), 1, #context.scoring_hand)
		end
		if not card.debuff and context.repetition and context.cardarea == G.play and context.other_card and context.other_card == context.scoring_hand[card.ability.extra.bell_index] then
			return {
				repetitions = vars.repetitions
			}
		end
	elseif boss_key == "bl_hook" then --The Hook
		if (context.add_to_deck and not card.ability.extra.hook_used) or (context.cardarea == G.jokers and context.end_of_round) then
			card.ability.extra.hook_used = 0
		end
		if not card.debuff and context.pre_discard and context.cardarea == G.jokers and card.ability.extra.hook_used < vars.max then
			if #context.full_hand == vars.cards then
				card.ability.extra.hook_used = card.ability.extra.hook_used + 1
				G.E_MANAGER:add_event(Event({func = (function()
					ease_discard(1)
					card:juice_up()
				return true end)}))
			end
		end
	elseif boss_key == "bl_ReduxArcanum_bane" then --The Bane (Redux Arcanum)
		if context.add_to_deck then
			G.consumeables.config.card_limit = G.consumeables.config.card_limit + vars.slots
		end
		if context.remove_from_deck then
			G.consumeables.config.card_limit = G.consumeables.config.card_limit - vars.slots
		end
	elseif boss_key == "bl_psychic" or boss_key == "bl_final_acorn" then --The Psychic/Amber Acorn
		--Pass through
	elseif boss_key == "bl_mouth" then --The Mouth
		if not card.debuff and context.joker_main and G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
			return {
				message = localize{type='variable',key='a_xmult',vars={vars.x_mult}},
				Xmult_mod = vars.x_mult,
			}
		end
	elseif boss_key == "bl_eye" then --The Eye
		if not card.debuff and context.joker_main and not G.GAME.hands[context.scoring_name] or G.GAME.hands[context.scoring_name].played_this_round < 1 then
			return {
				message = localize{type='variable',key='a_xmult',vars={vars.x_mult}},
				Xmult_mod = vars.x_mult,
			}
		end
	elseif boss_key == "bl_final_heart" then --Crimson Heart
		if (context.add_to_deck and not card.ability.extra.crimson_card) or (context.cardarea == G.jokers and context.after and not card.debuff) then
			card.ability.extra.crimson_card = {}
			local valid_indexes = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].config.center_key ~= "j_jokerhub_amamiya" then table.insert(valid_indexes, i) end
			end
			local selected_index = pseudorandom_element(valid_indexes, pseudoseed("amamiya_crimson"))
			card.ability.extra.crimson_card = {
				name = localize{type="name_text", set=G.jokers.cards[selected_index].config.center.set, key=G.jokers.cards[selected_index].config.center.key},
				id = G.jokers.cards[selected_index].ID
			}
		end
		if not card.debuff and context.retrigger_joker_check and not context.retrigger_joker and context.other_card.ability then
            if context.other_card.ID == card.ability.extra.crimson_card.id then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
	elseif boss_key == "bl_poke_cgoose" then --Chartreuse Chamber (Pokermon)
		if context.add_to_deck then
			if not G.GAME.energy_plus then
				G.GAME.energy_plus = vars.energy
			else
				G.GAME.energy_plus = G.GAME.energy_plus + vars.energy
			end
		end
		if context.remove_from_deck then
			if not G.GAME.energy_plus then
				G.GAME.energy_plus = 0
			else
				G.GAME.energy_plus = G.GAME.energy_plus - vars.energy
			end
		end
	elseif boss_key == "bl_house" then --The House
		if context.setting_blind and context.cardarea == G.jokers then
			for key, card in pairs(G.playing_cards) do
                card.ability.jh_initial_hand = nil
            end
		end
		if context.first_hand_drawn and context.cardarea == G.jokers then
			print(#G.hand.cards)
			for key, card in pairs(G.hand.cards) do
                card.ability.jh_initial_hand = true
            end
		end
		if not card.debuff and context.individual and context.cardarea == G.hand then
			if context.other_card.ability.jh_initial_hand and not context.other_card.debuff then
				return {
					x_mult = vars.x_mult,
					target_card = context.other_card
				}
			end
		end
	elseif boss_key == "bl_fish" then --The Fish
		if not card.debuff and context.repetition and context.cardarea == G.play and context.other_card and G.GAME.current_round.hands_left == 0 then
			return {
				repetitions = 1
			}
		end
	elseif boss_key == "bl_wheel" then --The Wheel
		if not card.debuff and context.end_of_round and context.cardarea == G.hand and context.individual then
			if not context.other_card.edition and pseudorandom(pseudoseed("amamiya_wheel")) < vars.numerator / vars.denominator then
				local edition = poll_edition("amamiya_wheel_edition", nil, true, true, {"e_foil", "e_holo","e_polychrome"})
				local edition_card = context.other_card
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
					edition_card:set_edition(edition, true)
					card:juice_up()
				return true end }))
			end
		end
	elseif boss_key == "bl_mark" then --The Mark
		if not card.debuff and context.end_of_round and context.cardarea == G.hand and context.individual and context.other_card:is_face() then
			return {
				dollars = vars.dollars,
				target_card = context.other_card
			}
		end
	elseif boss_key == "bl_mxms_rot" then --The Rot (Maximus)
		if not card.debuff and context.repetition and context.cardarea == G.play and context.other_card and pseudorandom(pseudoseed("amamiya_rot")) < vars.numerator / vars.denominator then
			return {
				repetitions = 2
			}
		end
	elseif boss_key == "bl_mxms_grinder" then --The Grinder (Maximus)
		if not card.debuff and context.cardarea == G.jokers and context.before and G.GAME.current_round.hands_played == 0 then
			local unsealed_cards = {}
			for i = 1, #context.scoring_hand do
				if not context.scoring_hand[i].seal then table.insert(unsealed_cards, context.scoring_hand[i]) end
			end
			if #unsealed_cards > 0 then
				local seal_card = unsealed_cards[pseudorandom(pseudoseed("amamiya_grinder"), 1, #unsealed_cards)]
				G.E_MANAGER:add_event(Event({func = function()
					seal_card:set_seal(SMODS.poll_seal({guaranteed = true}))
					seal_card:juice_up()
				return true end }))
				return {
					message = localize('k_jokerhub_sealed'),
				}
			end
		end
	else --Default ability
		if context.joker_main and not card.debuff then
			return {
				chip_mod = vars.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { vars.chips } },
				colour = G.C.CHIPS,
			}
		end
	end
end

function JHUB.get_amamiya_vars(card, boss_key, context)
	context = context or {}

	if boss_key == "bl_manacle" then return { hand_size_mod = 1 } end --The Manacle
	if boss_key == "bl_ox" or boss_key == "bl_mark" then return { dollars = 3 } end --The Ox
	if boss_key == "bl_wall" then return { x_mult = 2 } end --The Wall
	if boss_key == "bl_final_vessel" or boss_key == "bl_mouth" or boss_key == "bl_eye" then return { x_mult = 3 } end --Violet Vessel/The Mouth/The Eye
	if boss_key == "bl_club" then return { suit = "Clubs" } end --The Club
	if boss_key == "bl_goad" then return { suit = "Spades" } end --The Spades
	if boss_key == "bl_window" then return { suit = "Diamonds" } end --The Spades
	if boss_key == "bl_head" then return { suit = "Hearts" } end --The Head
	if boss_key == "bl_pillar" then return { chips = 5 } end --The Pillar
	if boss_key == "bl_water" then return { discards = 1 } end --The Water
	if boss_key == "bl_needle" then return { hands = 1 } end --The Needle
	if boss_key == "bl_final_leaf" or boss_key == "bl_ReduxArcanum_bane" then return { slots = 1 } end --Verdant Leaf/The Bane
	if boss_key == "bl_tooth" then return { dollars = 1 } end --The Tooth
	if boss_key == "bl_flint" then return { x_mult = 1.5, x_chips = 1.5 } end --The Flint
	if boss_key == "bl_final_bell" then return { repetitions = 3 } end --Cerulean Bell
	if boss_key == "bl_hook" then return { cards = 2, max = 3, used = card.ability.extra.hook_used } end --The Hook
	if boss_key == "bl_final_heart" then return { card_name = card.ability.extra.crimson_card and card.ability.extra.crimson_card.name or "nothing" } end --Crimson Heart
	if boss_key == "bl_poke_cgoose" then return { energy = 2 } end --Chartreuse Chamber
	if boss_key == "bl_house" then return { x_mult = 1.5 } end --The House
	if boss_key == "bl_wheel" then return { numerator = G.GAME.probabilities.normal, denominator = 7 } end --The Wheel
	if boss_key == "bl_mxms_rot" then return { numerator = G.GAME.probabilities.normal, denominator = 4 } end --The Rot (Maximus)
	if boss_key == "bl_final_acorn" then 
		local ret = {}
		ret.colours = {}
		for i = 1, 5 do
			local card = JHUB.card_at_deck_pos(i)
			if card then
				ret["card_"..i.."_rank"] = localize(card.base.value, "ranks")
				ret["card_"..i.."_suit"] = localize(card.base.suit, "suits_plural")
				ret.colours[i] = G.C.SUITS[card.base.suit]
			else
				ret["card_"..i.."_rank"] = "None"
				ret["card_"..i.."_suit"] = "None"
				ret.colours[i] = G.C.FILTER
			end
		end
		return ret
	end

	return { chips = 125 }
end

--Compatibility Helper function

function JHUB.add_amamiya_effect(new_boss_key, new_vars, new_effect)
	--Add new vars
	local old_get_vars = JHUB.get_amamiya_vars
	JHUB.get_amamiya_vars = function(card, boss_key, context)
		context = context or {}
		if boss_key == new_boss_key then return new_vars end
		return old_get_vars(card, boss_key, context)
	end

	--Add new effect
	local old_get_amamiya_effect = JHUB.get_amamiya_effect
	JHUB.get_amamiya_effect = function(card, context, boss_key, vars)
		local ret = nil
		if boss_key == new_boss_key then
			ret = new_effect(card, context, boss_key, vars)
		end
		if not ret then
			ret = old_get_amamiya_effect(card, context, boss_key, vars)
		end
		return ret
	end
end

function JHUB.calculate_amamiya(card, context)
	local reps = 0
	for key, value in pairs(card.ability.extra.boss_abilities) do
		local effect_ret = JHUB.get_amamiya_effect(card, context, key, JHUB.get_amamiya_vars(card, key, context))
		if effect_ret then
			if effect_ret.repetitions then
				reps = reps + effect_ret.repetitions
			else
				SMODS.calculate_effect(effect_ret, effect_ret.target_card or effect_ret.card or card)
			end
		end
	end
	if reps > 0 then
		return {
			message = localize('k_again_ex'),
			repetitions = reps,
			card = card
		}
	end
end

SMODS.Joker {
	key = "amamiya",
	config = {
		extra = {
			boss_abilities = {}
		}
	},
	rarity = 4,
	loc_vars = function(self, info_queue, card)
		for key, value in pairs(card.ability.extra.boss_abilities) do
			local prepended_key = "jokerhub_amamiya_ability_"..key
			if not G.localization.descriptions.Other[prepended_key] then
				prepended_key = "jokerhub_amamiya_ability_unknown"
			end
			local vars = {}
			for var_key, var_value in JHUB.pairs_by_keys(JHUB.get_amamiya_vars(card, key)) do 
				if var_key ~= "colours" then
					table.insert(vars, var_value)
				else
					vars.colours = var_value
				end
			end
			info_queue[#info_queue+1] = {set = 'Other', key = prepended_key, vars = vars}
		end
		return {vars = {}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 0, y = 4 },
	soul_pos = { x = 1, y = 4 },
	cost = 20,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			calc_ret = JHUB.calculate_amamiya(card, context)

			--Add new abilities
			if context.cardarea == G.jokers and context.end_of_round then
				if G.GAME.blind.boss and not card.ability.extra.boss_abilities[G.GAME.blind.config.blind.key] then
					card.ability.extra.boss_abilities[G.GAME.blind.config.blind.key] = true
					--Do add-to-deck effects for the specified ability, for stuff like hand size
					local cont = {add_to_deck = true}
					local enable_ability_ret = JHUB.get_amamiya_effect(card, cont, G.GAME.blind.config.blind.key, JHUB.get_amamiya_vars(card, G.GAME.blind.config.blind.key, cont))
					SMODS.calculate_effect({
						message = localize('k_upgrade_ex'),
						card = card
					}, card)
					if enable_ability_ret then SMODS.calculate_effect(enable_ability_ret, card) end
				end
			end

			return calc_ret
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		JHUB.calculate_amamiya(card, {add_to_deck = true, from_debuff = from_debuff})
	end,
	remove_from_deck = function(self, card, from_debuff)
		JHUB.calculate_amamiya(card, {remove_from_deck = true, from_debuff = from_debuff})
	end,
}