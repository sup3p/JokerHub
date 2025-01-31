SMODS.Joker {
	key = "garbage_bag",
	loc_txt = {
		name = 'Garbage Bag',
		text = {
			"Unused {C:red}discards{} are carried",
			"into the next round.",
			"{C:inactive}(Max of {C:red}#1#{C:inactive} discards){}"
		}
	},
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
				ease_discard(card.ability.extra.carryover)
			end
			
			if context.end_of_round and not context.repetition and not context.individual then
				card.ability.extra.carryover = math.min(G.GAME.current_round.discards_left, card.ability.extra.max_carryover)
			end
		end
	end
}
