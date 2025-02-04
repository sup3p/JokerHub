jh_get_food_jokers = function()
	return {
		--Base game
		"j_gros_michel",
		"j_egg",
		"j_ice_cream",
		"j_cavendish",
		"j_turtle_bean",
		"j_popcorn",
		"j_ramen",
		--JokerHub
		"j_jokerhub_forbidden_fruit",
		"j_jokerhub_garbage_bag",
		--Maximus
		"j_mxms_fortune_cookie",
		"j_mxms_leftovers",
		"j_mxms_four_course_meal",
		"j_mxms_endless_breadsticks",
		--Paperback
		"j_paperback_nachos",
		"j_paperback_complete_breakfast",
		"j_paperback_crispy_taco",
		"j_paperback_soft_taco",
		"j_paperback_dreamsicle",
		"j_paperback_cakepop",
		"j_paperback_caramel_apple",
		"j_paperback_charred_marshmallow",
		"j_paperback_joker_cookie",
		"j_paperback_apple",
		--Lady Luck
		"j_lady_cheeseburger",
		--Cryptid
		--[[
		"Nostalgic Candy",
		"Pickle",
		"Chili Pepper",
		"Pumpkin",
		"Cotton Candy",
		"Wrapped Candy",
		"Chocolate Die",
		"Carved Pumpkin",
		"Clicked Cookie",
		"Candy Dagger",
		"Candy Cane",
		"Candy Buttons",
		"Jawbreaker",
		"Mellowcreme",
		"Brittle Candy",
		"Candy Sticks",
		"Circulus Pistoris",
		"Energia",
		--Minty's Silly Mod
		"Frozen Yogurt",
		"Churu Treat",]]
		--Tesseract
		"j_tes_apple_pie",
		"j_tes_pineapple",
		"j_tes_blue_java",
	}
end

local remove_ref = Card.remove
function Card.remove(self)
	if self.added_to_deck and self.ability.set == 'Joker' and not G.CONTROLLER.locks.selling_card then
		for k, v in ipairs(G.jokers.cards) do
			if v.config.center_key == 'j_jokerhub_gambit' then
				if jh_contains(jh_get_food_jokers(), self.config.center_key) then
					v.ability.extra.x_mult = v.ability.extra.x_mult + v.ability.extra.scaling * (G.GAME.soil_mod or 1)
					jh_scale_group_chat()
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
				if jh_contains(jh_get_food_jokers(), context.destroyed_card.ability.name) then
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
