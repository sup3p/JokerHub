local old_generate_ui = SMODS.Joker.generate_ui

SMODS.Joker {
	key = "hudson",
	config = {
		extra = {
			incompatible_jokers = {
				--"j_mime",
				--"j_blueprint",
				--"j_brainstorm"
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
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	calculate = function(self, card, context)
		if not card.debuff and not context.no_blueprint then
			local other_joker = nil
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i-1] end
			end
			if other_joker and other_joker ~= card and not JHUB.contains(card.ability.extra.incompatible_jokers, other_joker.config.center.key) then
				local returns = {}
				local return_metadata = {}
				local ret_repetitions = 0
				for k = 1, #G.hand.cards do
					if G.hand.cards[k]:get_id() == 7 and not G.hand.cards[k].debuff then
						local held_card = G.hand.cards[k]
						
						--Check how many times a 7 should retrigger
						local retriggers = { 1 }
						if held_card.seal == 'Red' then
							table.insert(retriggers, {
								message = localize('k_again_ex'),
								repetitions = 1,
								card = held_card
							})
						end
						for joker_i = 1, #G.jokers.cards do
							if G.jokers.cards[joker_i] ~= card then
								local fake_context = {
									cardarea = G.hand, -- G.hand, G.deck and G.discard optionally enabled
									full_hand = context.full_hand,
									scoring_hand = context.scoring_hand,
									scoring_name = context.scoring_name,
									poker_hands = context.poker_hands,
									repetition = true,
									card_effects = { eval_card(held_card, context) } -- this is the table of effects that has been calculated
								}
								local joker_ret = G.jokers.cards[joker_i]:calculate_joker(fake_context)
								context.blueprint_card = nil
								if joker_ret then
									table.insert(retriggers, joker_ret)
								end
							end
						end
						
						
						for trigger = 1, #retriggers do
							local fake_context = context
							fake_context.blueprint = 1
							--fake_context.blueprint_card = card
							local other_joker_ret = other_joker:calculate_joker(fake_context)
							if other_joker_ret then
								table.insert(returns, other_joker_ret)
								return_metadata[#returns] = {
									seven = G.hand.cards[k],
									retrigger_data = retriggers[trigger]
								}
								if other_joker_ret.repetitions then
									ret_repetitions = ret_repetitions + other_joker_ret.repetitions
								end
							end
						end
						
					end
				end
				if #returns > 0 then
					return {
						func = function()
							for return_i = 1, #returns do
								if return_metadata[return_i].retrigger_data ~= 1 then
									SMODS.calculate_effect(return_metadata[return_i].retrigger_data, return_metadata[return_i].retrigger_data.card)
								end
								G.E_MANAGER:add_event(Event({
									func = function()
										return_metadata[return_i].seven:juice_up()
										return true
									end
								}))
								SMODS.calculate_effect(returns[return_i], card)
							end
						end,
						repetitions = ret_repetitions > 0 and ret_repetitions or nil,
						message = ret_repetitions > 0 and localize('k_again_ex') or nil,
						card = card
					}
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
			if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat and not JHUB.contains(card.ability.extra.incompatible_jokers, other_joker.config.center.key) then
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


--[[testing deck
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
}]]