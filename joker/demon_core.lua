SMODS.Joker {
	key = "demon_core",
	loc_txt = {
		name = 'Demon Core',
		text = {
			"{X:mult,C:white}X#1#{} Mult",
			"{C:green}#2# in #3#{} chance to destroy",
			"all {C:attention}Jokers{} when hand is played."
		}
	},
	config = {
		extra = {
			x_mult = 4,
			odds = 90
		}
	},
	rarity = 3,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult, G.GAME.probabilities.normal, card.ability.extra.odds}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 0, y = 1 },
	cost = 7,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = false,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			
			--Scoring
			if context.joker_main then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
			
			--Destroying
			if context.cardarea == G.jokers and context.after then
				if pseudorandom(pseudoseed("demoncore"..G.GAME.round_resets.ante)) < G.GAME.probabilities.normal / card.ability.extra.odds then
					local pessimistics = SMODS.find_card('j_mxms_pessimistic')
                    if next(pessimistics) then
                        for k, v in pairs(pessimistics) do
                            v.ability.extra.mult = v.ability.extra.mult +
                                (card.ability.extra.odds - G.GAME.probabilities.normal) * G.GAME.soil_mod
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                func = function()
                                    v:juice_up(0.3, 0.4)
                                    return true;
                                end
                            }))
                        end
                    end
					for i = 1, #G.jokers.cards do
						if not G.jokers.cards[i].ability.eternal then
							G.jokers.cards[i].getting_sliced = true
						end
					end
					G.E_MANAGER:add_event(Event({func = function()
                        (context.blueprint_card or card):juice_up(0.8, 0.8)
						for i = 1, #G.jokers.cards do
							if not G.jokers.cards[i].ability.eternal then
								G.jokers.cards[i]:start_dissolve({G.C.RED}, nil, 1.6)
							end
						end
                    return true end }))
					return {
					  message = "Irradiated!",--localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
					  card = card,
					  colour = G.C.GREEN,
					}
				end
			end
		end
	end
}
