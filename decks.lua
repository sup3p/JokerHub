SMODS.Atlas {
    key = "atlas_decks",
    px = 71,
    py = 95,
    path = "jh_decks.png"
  }

SMODS.Back{
    name = "Filmmaker's Deck",
    key = "film_deck",
    pos = {x = 0, y = 0},
	atlas = "atlas_decks",
    config = {
		voucher = "v_directors_cut"
	},
    loc_txt = {
        name = "Filmmaker's Deck",
        text ={
            "Start with {C:red,T:v_directors_cut}Director's Cut{}.",
			"{C:attention}Boss Blind{} reroll cost is",
			"reduced to {C:money}$5{}.",
			"Any {C:attention}Boss Blind{} can appear",
			"on any {C:attention}Ante{}.",
		},
    },
    apply = function()
		
        G.E_MANAGER:add_event(Event({
            func = function()
                
                return true
            end
        }))
    end
}