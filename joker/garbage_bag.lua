SMODS.Joker {
	key = "garbage_bag",
	config = {
		extra = {
			carryover = 0,
			max_carryover = 10
		}
	},
	
	rarity = 3,
	atlas = "atlas_jokers",
	pos = { x = 4, y = 1 },
	cost = 7,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.max_carryover}}
	end,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff and not context.blueprint then
			if context.setting_blind and card.ability.extra.carryover > 0 then
				G.E_MANAGER:add_event(Event({func = function()
					ease_discard(card.ability.extra.carryover)
					card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_discards', vars = {card.ability.extra.carryover}}})
				return true end }))
			end
			
			if context.end_of_round and not context.repetition and not context.individual then
				card.ability.extra.carryover = math.min(G.GAME.current_round.discards_left, card.ability.extra.max_carryover)
			end
		end
	end
}
