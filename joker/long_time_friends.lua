SMODS.Joker {
	key = "long_time_friends",
	config = {
		extra = {
			x_mult = 1,
			scaling = 0.25
		}
	},
	rarity = 3,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult, card.ability.extra.scaling}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 4, y = 3 },
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if not card.debuff then
			--Upgrade
			if context.selling_card and context.card.ability and context.card.ability.eternal then
				card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.scaling
				if next(SMODS.find_mod("Maximus")) then SMODS.calculate_context({scaling_card = true}) end
				return {
					message = localize('k_upgrade_ex'),
					colour = G.C.MULT,
					card = card
				}
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
	end,
	in_pool = function(self, args)
		return G.GAME.modifiers.enable_eternals_in_shop
	end
}
