SMODS.Joker {
	key = "mulligan",
	config = {
		extra = {
			score_limit = 15,
			hands = 1,
			max_hands = 3,
			hands_given = 0
		}
	},
	rarity = 1,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.score_limit, card.ability.extra.hands, card.ability.extra.max_hands}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 1, y = 3 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.setting_blind and not context.blueprint then
				card.ability.extra.hands_given = 0
			end

			if context.cardarea == G.jokers and context.after then
				local hand_score = (hand_chips * mult)
				if hand_score <= G.GAME.blind.chips * (card.ability.extra.score_limit / 100) and card.ability.extra.hands_given < card.ability.extra.max_hands then
					if not context.blueprint then
						card.ability.extra.hands_given = card.ability.extra.hands_given + card.ability.extra.hands
					end
					ease_hands_played(card.ability.extra.hands)
					G.E_MANAGER:add_event(Event({func = function()
						card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_hands', vars = {card.ability.extra.hands}}})
					return true end }))
				end
			end
		end
	end
}
