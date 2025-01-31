LOVELY_INTEGRITY = 'c77e5688b0a53deaa69dd9249830a8eeb6ccdc4e5441569e9624d900465e6d24'

LOVELY_INTEGRITY = '5ba9899346053e7618f1c30acbb32253ad4b58ca3cc8936a228924c363aa04fb'

LOVELY_INTEGRITY = '27676975e1c4dd53925e338f9164ec8d936db2163dafa28e7b05fd94a5695710'

LOVELY_INTEGRITY = '92de68be4139b11ca8b7d1c81220e074e8b43304cbcb4f80cb81feaf746baa42'

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
		--Paperback
		"j_paperback_nachos",
		"j_paperback_complete_breakfast",
		"j_paperback_crispy_taco",
		"j_paperback_soft_taco",
		"j_paperback_dreamsicle",
		"j_paperback_cake_pop",
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
	loc_txt = {
		name = 'Gambit',
		text = {
			"This Joker gains {X:mult,C:white} X#2# {} Mult",
			"for every {C:attention}food Joker{}",
			"that is destroyed.",
			"{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
		}
	},
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
			if context.joker_main and not card.debuff then
				return {
				  Xmult_mod = card.ability.extra.x_mult,
				  message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
				  card = card,
				}
			end
		end
	end
}
