SMODS.Joker {
	key = "union_member_card",
	config = {
		extra = {
			Xmult = 4
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.Xmult}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 1, y = 2 },
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			--Scoring
			if context.joker_main then
				local union = true
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.rarity ~= 1 then
						union = false
						break
					end
				end
				if union then
					return {
					  Xmult_mod = card.ability.extra.Xmult,
					  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
					  card = card,
					}
				end
			end
		end
	end
}
