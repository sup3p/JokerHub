SMODS.Joker {
	key = "going_viral",
	loc_txt = {
		name = 'Going Viral',
		text = {
			"This Joker gains {C:mult}+#2#{} Mult each played hand.",
			"{C:attention}Joker{} and {C:attention}consumable{} cards in",
			"packs or shop have a {C:green}#3# in #4#{} chance",
			"to be replaced with {C:attention}Going Viral{}.",
			"{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult)",
		}
	},
	config = {
		extra = {
			mult = 0,
			scaling = 3,
			odds = 4
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult, card.ability.extra.scaling, G.GAME.probabilities.normal, card.ability.extra.odds}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 2, y = 0 },
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.cardarea == G.jokers and context.before and not (context.individual or context.repetition) and not context.blueprint then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.scaling * (G.GAME.soil_mod or 1)
				return {
				  message = localize('k_upgrade_ex'),
				  colour = G.C.MULT,
				  card = card
				}
			end
			
			--Scoring
			if context.joker_main and context.cardarea == G.jokers then
				return {
				  mult_mod = card.ability.extra.mult,
				  message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
				}
			end
		end
	end
}
