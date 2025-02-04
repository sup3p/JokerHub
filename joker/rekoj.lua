SMODS.Joker {
	key = "rekoj",
	config = {
		extra = {
			mult = 15
		}
	},
	rarity = 1,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 0, y = 2 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			--Scoring
			if context.joker_main and context.cardarea == G.jokers then
				local correct_order = true
				local unique_ranks = {}
				local current_rank = 0
				for i = 1, #context.scoring_hand do
					local card_rank = context.scoring_hand[i]:get_id()
					if card_rank >= current_rank then
						if card_rank ~= current_rank then
							table.insert(unique_ranks, current_rank)
						end
						current_rank = card_rank
					else
						correct_order = false
						break
					end
				end
				
				if correct_order and #unique_ranks > 1 then
					return {
					  mult_mod = card.ability.extra.mult,
					  message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
					}
				end
			end
		end
	end
}
