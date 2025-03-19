function JHUB.get_amamiya_effect(card, context, boss_key)
	local vars = JHUB.get_amamiya_vars(card, boss_key, context)

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
			context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
			context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + vars.mult
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
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
		if context.pre_discard and context.cardarea == G.jokers and card.ability.extra.hook_used < vars.max then
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
	elseif boss_key == "bl_psychic" then --The Psychic
		--Pass through
	else --Default ability
		--[[
		local prepended_key = "jokerhub_amamiya_ability_"..boss_key
		if context.add_to_deck and not G.localization.descriptions.Other[prepended_key] then
			--Hook localization to add a new entry
			local new_loc = {
				name = G.localization.descriptions.Blind[boss_key].name.."'s Heart",
				text = { "{C:chips}+#1#{} Chips" }
			}
			local old_loc_process = SMODS.find_mod("jokerhub")[1].process_loc_text
			SMODS.find_mod("jokerhub")[1].process_loc_text = function()
				G.localization.descriptions.Other[prepended_key] = new_loc
				old_loc_process()
			end
			init_localization()
		end]]
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
	if boss_key == "bl_ox" then return { dollars = 4 } end --The Ox
	if boss_key == "bl_wall" then return { x_mult = 2 } end --The Wall
	if boss_key == "bl_final_vessel" then return { x_mult = 3 } end --Violet Vessel
	if boss_key == "bl_club" then return { suit = "Clubs" } end --The Club
	if boss_key == "bl_goad" then return { suit = "Spades" } end --The Spades
	if boss_key == "bl_window" then return { suit = "Diamonds" } end --The Spades
	if boss_key == "bl_head" then return { suit = "Hearts" } end --The Head
	if boss_key == "bl_pillar" then return { mult = 1 } end --The Pillar
	if boss_key == "bl_water" then return { discards = 1 } end --The Water
	if boss_key == "bl_needle" then return { hands = 1 } end --The Needle
	if boss_key == "bl_final_leaf" or boss_key == "bl_ReduxArcanum_bane" then return { slots = 1 } end --Verdant Leaf and The Bane
	if boss_key == "bl_tooth" then return { dollars = 1 } end --The Tooth
	if boss_key == "bl_flint" then return { x_mult = 1.5, x_chips = 1.5 } end --The Flint
	if boss_key == "bl_final_bell" then return { repetitions = 3 } end --Cerulean Bell
	if boss_key == "bl_hook" then return { cards = 2, max = 3, used = card.ability.extra.hook_used } end --The Hook

	return { chips = 125 }
end

function JHUB.calculate_amamiya(card, context)
	local reps = 0
	for key, value in pairs(card.ability.extra.boss_abilities) do
		local effect_ret = JHUB.get_amamiya_effect(card, context, key)
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
			for var_key, var_value in pairs(JHUB.get_amamiya_vars(card, key)) do table.insert(vars, var_value) end
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
			--Add new abilities
			if context.cardarea == G.jokers and context.end_of_round then
				if G.GAME.blind.boss and not card.ability.extra.boss_abilities[G.GAME.blind.config.blind.key] then
					card.ability.extra.boss_abilities[G.GAME.blind.config.blind.key] = true
					--Do add-to-deck effects for the specified ability, for stuff like hand size
					local enable_ability_ret = JHUB.get_amamiya_effect(card, {add_to_deck = true}, G.GAME.blind.config.blind.key)
					SMODS.calculate_effect({
						message = localize('k_upgrade_ex'),
						card = card
					}, card)
					if enable_ability_ret then SMODS.calculate_effect(enable_ability_ret, card) end
				end
			end

			calc_ret = JHUB.calculate_amamiya(card, context)

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