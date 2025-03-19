local old_has_enhance = SMODS.has_enhancement
SMODS.has_enhancement = function(card, key)
	if next(SMODS.find_card("j_jokerhub_metal_joker")) then
		if (key == 'm_gold' and card.config.center.key == 'm_steel') or (key == 'm_steel' and card.config.center.key == 'm_gold') then
			return true
		end
	end
	return old_has_enhance(card, key)
end

SMODS.Enhancement:take_ownership("m_steel", {
	calculate = function(self, card, context)
		if next(SMODS.find_card("j_jokerhub_metal_joker")) and not card.debuff and context.playing_card_end_of_round and context.cardarea == G.hand then
			return {
				dollars = G.P_CENTERS.m_gold.config.h_dollars,
			}
		end
	end
})

SMODS.Enhancement:take_ownership("m_gold", {
	calculate = function(self, card, context)
		if next(SMODS.find_card("j_jokerhub_metal_joker")) and not card.debuff and context.main_scoring and context.cardarea == G.hand then
			return {
				x_mult = G.P_CENTERS.m_steel.config.h_x_mult,
			}
		end
	end
})

SMODS.Joker {
	key = "metal_joker",
	config = {
		extra = {
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 2, y = 4 },
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			
		end
	end
}
