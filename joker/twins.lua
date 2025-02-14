SMODS.Joker {
	key = "twins",
	config = {
		extra = {
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 1, y = 1 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.cardarea == G.jokers and context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
				if next(context.poker_hands["Pair"]) and next(context.poker_hands["Flush"]) then
					local card_type = 'Tarot'
					local cards_to_make = 1
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						cards_to_make = 2
					end
					G.E_MANAGER:add_event(Event({
						trigger = 'before',
						delay = 0.0,
						func = (function()
								local card = create_card(card_type,G.consumeables, nil, nil, nil, nil, nil, 'sup')
								card:add_to_deck()
								G.consumeables:emplace(card)
								if cards_to_make == 2 then
									local copy = copy_card(card)
									copy:add_to_deck()
									G.consumeables:emplace(copy)
								end
								G.GAME.consumeable_buffer = 0
							return true
						end)}))
					return {
						message = "+"..cards_to_make.." Tarot",
						colour = G.C.SECONDARY_SET.Tarot,
						card = card
					}
				end
			end
		end
	end
}
