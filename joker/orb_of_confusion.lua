SMODS.Joker {
	key = "orb_of_confusion",
	config = {
		extra = {
			x_mult = 3
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 1, y = 0 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.setting_blind then
				G.GAME.blind.confusion = true
			end
			
			if context.before --[[and context.cardarea == G.jokers]] then
				if G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
					for i = 1, #context.full_hand do
						if context.full_hand[i].facing == 'back' then
							context.full_hand[i]:flip()
						end
					end
				end
			end
			
			--Scoring
			if context.joker_main then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
		end
	end
}
