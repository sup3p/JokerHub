function clamp(value, minimum, maximum)
	return math.max(math.min(value, maximum), minimum)
end

SMODS.Joker {
	key = "last_hurrah",
	config = {
		extra = {
			dollars_per_trigger = 3,
			max_retriggers = 50
		}
	},
	rarity = 3,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.dollars_per_trigger, card.ability.extra.max_retriggers, clamp(math.floor(G.GAME.dollars / card.ability.extra.dollars_per_trigger), 0, card.ability.extra.max_retriggers)}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 3, y = 1 },
	cost = 8,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff and G.jokers.cards[#G.jokers.cards] == card then
			if context.repetition and context.cardarea == G.play and G.GAME.dollars > 0 then
				if context.other_card == context.scoring_hand[#context.scoring_hand] then
					local retriggers = clamp(math.floor(G.GAME.dollars / card.ability.extra.dollars_per_trigger), 0, card.ability.extra.max_retriggers)
					return {
                        message = localize('k_again_ex'),
                        repetitions = retriggers,
                        card = card
                    }
				end
			end
			
			if context.cardarea == G.jokers and context.after then
				if G.GAME.dollars ~= 0 then
					local money_loss = -G.GAME.dollars
					return {
						dollars = money_loss,
						card = card
					}
				end
			end
		end
	end
}
