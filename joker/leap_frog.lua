SMODS.Joker {
	key = "leap_frog",
	config = {
		extra = {
			chips = 30,
			jokers_to_left = 0
		}
	},
	rarity = 1,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.chips, card.ability.extra.jokers_to_left}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 3, y = 3 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.jokers_to_left = 0
		end
		if not card.debuff then
			--Scoring
			if context.joker_main and context.cardarea == G.jokers then
				local new_jokers_to_left = 0
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] == card then
						break
					else
						new_jokers_to_left = new_jokers_to_left + 1
					end
				end
				if new_jokers_to_left > card.ability.extra.jokers_to_left then
					card.ability.extra.jokers_to_left = new_jokers_to_left
					local chip_result = card.ability.extra.jokers_to_left * card.ability.extra.chips
					return {
						chip_mod = chip_result,
						message = localize { type = 'variable', key = 'a_chips', vars = { chip_result } },
						colour = G.C.CHIPS,
					}
				end
			end
		end
	end
}
