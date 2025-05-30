SMODS.Joker {
	key = "snowball_effect",
	config = {
		extra = {
			x_mult = 1,
			scaling = 0.5
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult, card.ability.extra.scaling}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 3, y = 0 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if not card.debuff then
			--Upgrade/Reset
			if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
				if G.GAME.current_round.hands_played <= 1 then
					card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.scaling
					if next(SMODS.find_mod("Maximus")) then SMODS.calculate_context({scaling_card = true}) end
					return {
					  message = localize('k_upgrade_ex'),
					  colour = G.C.MULT,
					  card = card
					}
				elseif card.ability.extra.x_mult > 1 then
					card.ability.extra.x_mult = 1
					return {
						message = localize('k_reset'),
						colour = G.C.RED
					}
				end
			end
			
			--Scoring
			if context.joker_main and not card.debuff and card.ability.extra.x_mult > 1 then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
		end
	end
}
