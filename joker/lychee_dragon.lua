SMODS.Joker {
	key = "lychee_dragon",
	config = {
		extra = {
			x_mult = 0.1
		}
	},
	rarity = 4,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult}}
	end,
	atlas = "atlas_lychee",
	pos = { x = 0, y = 0 },
	soul_pos = { x = 1, y = 0 },
	cost = 20,
	pools = { Food = true },
	pixel_size = { w = 73, h = 95 },
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.individual and context.cardarea == G.play then
				if context.other_card:is_suit("Hearts") then
					context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 1
					context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.x_mult
					return {
						message = localize('k_upgrade_ex'),
						colour = G.C.MULT,
						card = card
					}
				end
			end
		end
	end
}
