local old_generate_ui = SMODS.Joker.generate_ui

SMODS.Joker {
	key = "hudson",
	loc_txt = {
		name = 'Hudson',
		text = {
			"Each {C:attention}7{} held in hand",
			"copies ability of {C:attention}Joker{}",
			"to the left of this Joker."
		}
	},
	config = {
		extra = {
			incompatible_jokers = {
				"Mime"
			}
		}
	},
	rarity = 4,
	loc_vars = function(self, info_queue, card)
		return {vars = {}}
	end,
	atlas = "atlas_jokers",
	pos = { x = 3, y = 2 },
	soul_pos = { x = 4, y = 2 },
	cost = 20,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff then
			local other_joker = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
			end
			
			if other_joker and not jh_contains(card.ability.extra.incompatible_jokers, other_joker.ability.name) then
				if context.extra_repetition then
					if context.individual then
						if context.hand_card:get_id() == 7 then
							context.blueprint = 1
							context.blueprint_card = context.hand_card
							local fake_context = context
							fake_context.individual = false
							fake_context.repetition = true
							local other_joker_ret = other_joker:calculate_joker(fake_context)
							if other_joker_ret then
								other_joker_ret.card = context.hand_card
								return other_joker_ret
							end
						end
					end
				elseif context.cardarea == G.hand then
					if context.other_card and context.other_card:get_id() == 7 and not context.other_card.debuff then
						if context.individual then
							if not context.discard then
								if not context.repetition then
									if not context.end_of_round then
										local fake_context = context
										fake_context.joker_main = true
										fake_context.cardarea = G.jokers
										fake_context.blueprint = 1
										fake_context.blueprint_card = context.other_card
										fake_context.individual = nil
										local other_joker_ret = other_joker:calculate_joker(fake_context)
										return other_joker_ret
									else
										context.blueprint = 1
										context.blueprint_card = context.other_card
										local other_joker_ret = other_joker:calculate_joker(context)
										return other_joker_ret
									end
								end
							else
								local fake_context = context
								fake_context.cardarea = G.jokers
								fake_context.blueprint = 1
								fake_context.blueprint_card = context.other_card
								local other_joker_ret = other_joker:calculate_joker(fake_context)
								return other_joker_ret
							end
						else
							local fake_context = context
							fake_context.cardarea = G.jokers
							fake_context.blueprint = 1
							fake_context.blueprint_card = context.other_card
							local other_joker_ret = other_joker:calculate_joker(fake_context)
							return other_joker_ret
						end
					end
				elseif context.cardarea == G.play then
					if context.hand_card and context.hand_card:get_id() == 7 then
						local fake_context = context
						fake_context.blueprint = 1
						fake_context.blueprint_card = context.hand_card
						local other_joker_ret = other_joker:calculate_joker(context)
						if other_joker_ret then
							other_joker_ret.card = context.hand_card
							return other_joker_ret
						end
					end
				end
			end
		end
	end,
	update = function(self, card, dt)
		if G.STAGE == G.STAGES.RUN then
			local other_joker = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
			end
			if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat and not jh_contains(card.ability.extra.incompatible_jokers, other_joker.ability.name) then
				card.ability.blueprint_compat = 'compatible'
			else
				card.ability.blueprint_compat = 'incompatible'
			end
		end
	end,
	generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		old_generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
		if G.STAGE == G.STAGES.RUN then
			card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''; card.ability.blueprint_compat_check = nil
			table.insert(desc_nodes, {
					{n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
						{n=G.UIT.C, config={ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = 'blueprint_compat'}, nodes={
							{n=G.UIT.T, config={ref_table = card.ability, ref_value = 'blueprint_compat_ui',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
						}}
					}}
				}
			)
		end
	end
}


--testing deck
SMODS.Back{
    name = "Hudson Deck",
    key = "hudson_deck",
    pos = {x = 0, y = 3},
    config = {polyglass = true},
    loc_txt = {
        name = "Hudson Test Deck",
        text ={
            "Start with Hudson"
        },
    },
    apply = function()
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({key = "j_jokerhub_hudson"})
                return true
            end
        }))
    end
}