SMODS.Joker {
	key = "broker",
	config = {
		extra = {
			chips = 0,
			scaling = 4
		}
	},
	rarity = 1,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.scaling, card.ability.extra.chips}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 2, y = 1 },
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if not card.debuff then
			--Scoring
			if context.joker_main and to_number(card.ability.extra.chips) > 0 then
				return {
					chip_mod = card.ability.extra.chips,
					message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
					colour = G.C.CHIPS,
					card = card,
				}
			end
		end
	end
}
