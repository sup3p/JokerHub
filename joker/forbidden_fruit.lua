SMODS.Joker {
	key = "forbidden_fruit",
	config = {
		extra = {
			x_mult = 1,
			scaling = 0.1,
			rank = JHUB.pick_new_rank(0)
		}
	},
	rarity = 3,
	loc_vars = function(self, info_queue, card)
		local visible_rank
		if card.ability.extra.rank == 11 then
			visible_rank = "Jack"
		elseif card.ability.extra.rank == 12 then
			visible_rank = "Queen"
		elseif card.ability.extra.rank == 13 then
			visible_rank = "King"
		elseif card.ability.extra.rank == 14 then
			visible_rank = "Ace"
		else
			visible_rank = tostring(card.ability.extra.rank)
		end
		return {vars = {card.ability.extra.x_mult, card.ability.extra.scaling, visible_rank}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 0, y = 0 },
	cost = 8,
	pools = {
		Food = true
	},
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = false,
	calculate = function(self, card, context)
		if not card.debuff then
			--Upgrade/Reset
			if context.cardarea == G.jokers and context.before and not (context.individual or context.repetition) and not context.blueprint then
				local reset = false
				for i = 1, #context.scoring_hand do
					local rank_check = false
					if next(SMODS.find_card('j_mxms_perspective')) and (card.ability.extra.rank == 6 or card.ability.extra.rank == 9) then
						rank_check = (card.ability.extra.rank == 6 or card.ability.extra.rank == 9)
					else
						rank_check = (context.scoring_hand[i]:get_id() == card.ability.extra.rank)
					end
					if rank_check and not context.scoring_hand[i].debuff then
						reset = true
						break
					end
				end
				if reset then
					card.ability.extra.x_mult = 1
					G.E_MANAGER:add_event(Event({
						func = function()
							play_sound('tarot1')
							card.T.r = -0.2
							card:juice_up(0.3, 0.4)
							card.states.drag.is = true
							card.children.center.pinch.x = true
							G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
								func = function()
										G.jokers:remove_card(self)
										card:remove()
										card = nil
									return true; end})) 
							return true
						end
					}))
					return {
						message = localize('k_eaten_ex'),
						colour = G.C.RED,
						--card = card
					}
				else
					card.ability.extra.x_mult = card:scale_value(card.ability.extra.x_mult, card.ability.extra.scaling)
					return {
					  message = localize('k_upgrade_ex'),
					  colour = G.C.MULT,
					  card = card
					}
				end
			end
			
			--Scoring
			if context.joker_main and not card.debuff and card.ability.extra.x_mult ~= 1 then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
			
			--Pick rank
			if context.end_of_round and not context.repetition and not context.individual and not context.blueprint and not next(SMODS.find_card("j_mxms_stop_sign")) then
				
				card.ability.extra.rank = JHUB.pick_new_rank(card.ability.extra.rank)
			end
		end
	end
}
