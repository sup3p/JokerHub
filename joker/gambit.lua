local remove_ref = Card.remove
function Card.remove(self)
	if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
		for k, v in ipairs(G.jokers.cards) do
			if v.config.center_key == 'j_jokerhub_gambit' then
				if JHUB.is_food(self) then
					v.ability.extra.x_mult = v.ability.extra.x_mult + v.ability.extra.scaling * (G.GAME.soil_mod or 1)
					JHUB.scale_group_chat()
					SMODS.calculate_effect({
						message = localize('k_upgrade_ex'),
						colour = G.C.MULT,
						card = v
					}, v)
				end
			end
		end
	end
	
	return remove_ref(self)
end

SMODS.Joker {
	key = "gambit",
	config = {
		extra = {
			x_mult = 1,
			scaling = 1
		}
	},
	rarity = 2,
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.extra.x_mult, card.ability.extra.scaling}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 2, y = 2 },
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		if not card.debuff then
			--Upgrading
			--[[
			if context.destroying_cards then
				print(context.destroyed_card.ability.name)
				if JHUB.contains(jh_get_food_jokers(), context.destroyed_card.ability.name) then
					card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.scaling
					return {
						message = localize('k_upgrade_ex'),
						colour = G.C.MULT,
						card = card
					}
				end
			end]]
			
			--Scoring
			if context.joker_main and not card.debuff and card.ability.extra.x_mult ~= 1 then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
		end
	end
}
