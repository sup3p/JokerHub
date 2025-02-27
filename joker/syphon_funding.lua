SMODS.Joker {
	key = "syphon_funding",
	config = {
		extra = {
			dollars = 3
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.dollars}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 2, y = 3 },
	cost = 8,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.setting_blind and context.cardarea == G.jokers then
				local this_joker_index = nil
				local syphoned_something = false
				for i = 1, #G.jokers.cards do
					local joker = G.jokers.cards[i]
					joker.jh_syphoned = nil
					if this_joker_index then
						syphoned_something = true
						joker.jh_syphoned = true
						SMODS.debuff_card(joker, true, "jh_syphon")
					elseif joker == card then
						this_joker_index = i
					end
				end
				if syphoned_something then
					return {
						message = localize('k_jokerhub_syphon'),
						card = card,
						colour = G.C.GREEN,
					}
				end
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
		local earnings = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].jh_syphoned then earnings = earnings + (G.jokers.cards[i].sell_cost * card.ability.extra.dollars) end
		end
		return earnings
	end
}
