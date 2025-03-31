SMODS.Joker {
	key = "face_value",
	config = {
		extra = {
			mult = 1
		}
	},
	
	-- Sets the sprite and hitbox
	set_ability = function(self, card, initial, delay_sprites)
		local w_scale, h_scale = 71 / 71, 71 / 95

		card.T.h = card.T.h * h_scale
		card.T.w = card.T.w * w_scale
	end,

	set_sprites = function(self, card, front)
		local w_scale, h_scale = 71 / 71, 71 / 95

		card.children.center.scale.y = card.children.center.scale.y * h_scale
		card.children.center.scale.x = card.children.center.scale.x * w_scale
	end,

	load = function(self, card, card_table, other_card)
		local w_scale, h_scale = 71 / 71, 71 / 95

		card.T.h = card.T.h * h_scale
		card.T.w = card.T.w * w_scale
	end,
	
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.mult}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 4, y = 0 },
	cost = 5,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			if context.individual and context.cardarea == G.play then
				if context.other_card:is_face() then
					context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
					context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult
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
