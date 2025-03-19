return {
    descriptions = {
        Back={
            b_jokerhub_film_deck = {
                name = "Filmmaker's Deck",
                text ={
                    "Start with {C:red,T:v_directors_cut}Director's Cut{}.",
                    "{C:attention}Boss Blind{} reroll cost is",
                    "reduced to {C:money}$5{}.",
                    "Any {C:attention}Boss Blind{} can appear",
                    "on any {C:attention}Ante{}.",
                },
            },
        },
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
            j_jokerhub_broker = {
                name = 'Broker',
                text = {
                    "Earn no {C:attention}Interest{}.",
                    "This Joker gains {C:chips}+#1#{} Chips for",
                    "every {C:money}$1{} of {C:attention}Interest{} that",
                    "would've been earned.",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                }
            },
            j_jokerhub_da_joki = {
                name = 'Da Joki',
                text = {
                    "This Joker gains {C:mult}+#2#{} Mult per {C:attention}2{} played",
                    "hands if both hands are the same",
                    "{C:attention}hand type{}, otherwise {C:mult}-#3#{} Mult.",
                    "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult, {C:attention}#4#{C:inactive})"
                }
            },
            j_jokerhub_demon_core = {
                name = 'Demon Core',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance to destroy",
                    "all {C:attention}Jokers{} when hand is played."
                }
            },
            j_jokerhub_face_value = {
                name = 'Face Value',
                text = {
                    "Every played {C:attention}face card{}",
                    "permanently gains",
                    "{C:mult}+#1#{} Mult when scored."
                }
            },
            j_jokerhub_forbidden_fruit = {
                name = 'Forbidden Fruit',
                text = {
                    "This Joker gains {X:mult,C:white}X#2#{} Mult per hand played.",
                    "{S:1.1,C:red,E:2}Self destructs{} if hand contains a",
                    "scoring {C:attention}#3#{}, rank changes every round.",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
                }
            },
            j_jokerhub_gambit = {
                name = 'Gambit',
                text = {
                    "This Joker gains {X:mult,C:white} X#2# {} Mult",
                    "for every {C:attention}food Joker{}",
                    "that is destroyed.",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
                }
            },
            j_jokerhub_garbage_bag = {
                name = 'Garbage Bag',
                text = {
                    "Unused {C:red}discards{} are carried",
                    "into the next round.",
                    "{C:inactive}(Max of {C:red}#1#{C:inactive} discards){}"
                }
            },
            j_jokerhub_going_viral = {
                name = 'Going Viral',
                text = {
                    "This Joker gains {C:mult}+#2#{} Mult each played hand.",
                    "{C:attention}Joker{} and {C:attention}consumable{} cards in",
                    "packs or shop have a {C:green}#3# in #4#{} chance",
                    "to be replaced with {C:attention}Going Viral{}.",
                    "{C:inactive}(Currently {C:mult}+#1#{} {C:inactive}Mult)",
                }
            },
            j_jokerhub_hudson = {
                name = 'Hudson',
                text = {
                    "Copies ability of {C:attention}Joker{} to the left.",
                    "This Joker triggers once for",
                    "each {C:attention}7{} held in hand."
                }
            },
            j_jokerhub_last_hurrah = {
                name = 'Last Hurrah',
                text = {
                    "If this Joker is in the {C:attention}last{} position,",
                    "retrigger {C:attention}last{} played card used in scoring",
                    "{C:attention}1{} additional time for every {C:money}$#1#{} you have",
                    "{C:inactive}(Max of {C:attention}#2#{C:inactive} retriggers){}, then set money to {C:money}$0{}.",
                    "{C:inactive}(Currently {C:attention}#3#{} {C:inactive}retriggers)",
                }
            },
            j_jokerhub_orb_of_confusion = {
                name = 'Orb of Confusion',
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:attention}First hand{} of each round",
                    "is drawn face down."
                }
            },
            j_jokerhub_rekoj = {
                name = 'rekoJ',
                text = {
                    "{C:mult}+#1#{} Mult if poker hand contains at",
                    "least {C:attention}2{} scored {C:attention}ranks{} and scored {C:attention}ranks{}",
                    "are arranged from lowest to highest."
                }
            },
            j_jokerhub_snowball_effect = {
                name = 'Snowball Effect',
                text = {
                    "This Joker gains {X:mult,C:white} X#2# {} Mult",
                    "per {C:attention}consecutive Blind{}",
                    "beaten on the {C:attention}first hand{}.",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
                }
            },
            j_jokerhub_twins = {
                name = 'Twins',
                text = {
                    "Create {C:attention}2{} of a random {C:tarot}Tarot{}",
                    "card if poker hand contains",
                    "a {C:attention}Flush{} and a {C:attention}Pair{}.",
                    "{C:inactive}(Must have room)"
                }
            },
            j_jokerhub_union_member_card = {
                name = 'Union Member Card',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if all other",
                    "owned {C:attention}Jokers{} are {C:blue}Common{}.",
                }
            },
            j_jokerhub_mulligan = {
                name = 'Mulligan',
                text = {
                    "If played hand scores",
                    "{C:attention}#1#%{} or less of required",
                    "chips, gain {C:blue}+#2#{} hand",
                    "{C:inactive}(Max of {C:blue}#3#{C:inactive} per round)"
                }
            },
            j_jokerhub_syphon_funding = {
                name = 'Syphon Funding',
                text = {
                    "Debuff jokers to the right",
                    "when {C:attention}Blind{} is selected",
                    "Earns {C:money}triple{} the sell value",
                    "of each joker debuffed this",
                    "way at end of round"
                }
            },
            j_jokerhub_leap_frog = {
                name = 'Leap Frog',
                text = {
                    "{C:chips}+#1#{} Chips per {C:attention}Joker{} to the left if",
                    "there are more than there were",
                    "during any hand this round",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive} Jokers)"
                }
            },
            j_jokerhub_long_time_friends = {
                name = 'Long Time Friends',
                text = {
                    "{C:attention}Eternal{} jokers can be sold.",
                    "This Joker gains {X:mult,C:white}X#2#{} Mult",
                    "when an {C:attention}Eternal{} joker is sold",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
                }
            },
            j_jokerhub_amamiya = {
                name = 'Amamiya',
                text = {
                    "When {C:attention}Boss Blind{} is defeated,",
                    "this Joker permanantly gains",
                    "an {C:attention}ability{} based on",
                    "the {C:attention}Boss Blind{}"
                }
            },
            j_jokerhub_metal_joker = {
                name = 'Metal Joker',
                text = {
                    "{C:attention}Steel{} cards are considered",
                    "{C:attention}Gold{} cards and vice versa"
                }
            },
        },
        Other={
            jokerhub_pink_sticker = {
                name = "Pink Sticker",
                text = {
                    "Used this Joker",
                    "to win on {C:attention}Pink",
                    "{C:attention}Stake{} difficulty",
                }
            },
            jokerhub_stake_silver_sticker = {
                name = "Silver Sticker",
                text = {
                    "Used this Joker",
                    "to win on {C:attention}Silver",
                    "{C:attention}Stake{} difficulty",
                }
            },
            jokerhub_card_extra_mult = {
                text = { "{C:mult}+#1#{} extra mult" }
            },
            jokerhub_amamiya_ability_bl_manacle = {
                name = "The Manacle's Heart",
                text = { "{C:attention}+#1#{} hand size" }
            },
            jokerhub_amamiya_ability_bl_ox = {
                name = "The Ox's Heart",
                text = {
                    "Earn {C:money}$#1#{} when your most",
                    "played {C:attention}poker hand{} is played"
                }
            },
            jokerhub_amamiya_ability_bl_wall = {
                name = "The Wall's Heart",
                text = { "{X:mult,C:white}X#1#{} Mult" }
            },
            jokerhub_amamiya_ability_bl_final_vessel = {
                name = "Violet Vessel's Heart",
                text = { "{X:mult,C:white}X#1#{} Mult" }
            },
            jokerhub_amamiya_ability_bl_arm = {
                name = "The Arm's Heart",
                text = {
                    "Upgrade level of {C:attention}first{} played",
                    "{C:attention}poker hand{} each round"
                }
            },
            jokerhub_amamiya_ability_bl_club = {
                name = "The Club's Heart",
                text = {
                    "Retrigger all",
                    "played {C:club}Club{} cards",
                }
            },
            jokerhub_amamiya_ability_bl_goad = {
                name = "The Goad's Heart",
                text = {
                    "Retrigger all",
                    "played {C:spades}Spade{} cards",
                }
            },
            jokerhub_amamiya_ability_bl_window = {
                name = "The Window's Heart",
                text = {
                    "Retrigger all",
                    "played {C:diamonds}Diamond{} cards",
                }
            },
            jokerhub_amamiya_ability_bl_head = {
                name = "The Head's Heart",
                text = {
                    "Retrigger all",
                    "played {C:hearts}Heart{} cards",
                }
            },
            jokerhub_amamiya_ability_bl_plant = {
                name = "The Plant's Heart",
                text = {
                    "Retrigger all",
                    "played {C:attention}face{} cards",
                }
            },
            jokerhub_amamiya_ability_bl_pillar = {
                name = "The Pillar's Heart",
                text = {
                    "Every played {C:attention}card{}",
                    "permanently gains",
                    "{C:mult}+#1#{} Mult when scored",
                },
            },
            jokerhub_amamiya_ability_bl_water = {
                name = "The Water's Heart",
                text = {
                    "{C:red}+#1#{} discard",
                    "each round",
                }
            },
            jokerhub_amamiya_ability_bl_needle = {
                name = "The Needle's Heart",
                text = {
                    "{C:blue}+#1#{} hand",
                    "each round",
                }
            },
            jokerhub_amamiya_ability_bl_final_leaf = {
                name = "Verdant Leaf's Heart",
                text = { "{C:dark_edition}+#1#{} Joker slot" }
            },
            jokerhub_amamiya_ability_bl_tooth = {
                name = "The Tooth's Heart",
                text = {
                    "Earn {C:money}$#1#{} per scored",
                    "card played"
                }
            },
            jokerhub_amamiya_ability_bl_flint = {
                name = "The Flint's Heart",
                text = {
                    "{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips",
                    "before cards are scored"
                }
            },
            jokerhub_amamiya_ability_bl_final_bell = {
                name = "Cerulean Bell's Heart",
                text = {
                    "Retrigger a {C:attention}random{} played",
                    "card used in scoring",
                    "{C:attention}#1#{} additional times",
                }
            },
            jokerhub_amamiya_ability_bl_ReduxArcanum_bane = {
                name = "The Bane's Heart",
                text = { "{C:attention}+#1#{} consumable slot" }
            },
            jokerhub_amamiya_ability_unknown = {
                name = "Unknown Blind's Heart",
                text = { "{C:chips}+#1#{} Chips" }
            },
            jokerhub_amamiya_ability_bl_hook = {
                name = "The Hook's Heart",
                text = {
                    "If {C:attention}discarded{} hand",
                    "contains exactly {C:attention}#2#{}",
                    "cards, gain {C:red}+1{} discard",
                    "{C:inactive}(Max of {C:red}+#1#{C:inactive} per round)"
                }
            },
            jokerhub_amamiya_ability_bl_psychic = {
                name = "The Psychic's Heart",
                text = {
                    "Every {C:attention}played card",
                    "counts in scoring",
                }
            },
        },
        Planet={},
        Spectral={},
        Stake={
            stake_jokerhub_pink = {
                name = "Pink Stake",
                text = {
                    "{C:attention}Showdown boss{} and end of game",
                    "is on {C:attention}Ante 9{}.",
                    "{s:0.8}Applies Purple Stake and below"
                },
            },
            stake_jokerhub_stake_silver = {
                name = "Silver Stake",
                text = {
                    "Required score scales",
                    "faster for each {C:attention}Ante",
                    "{s:0.8}Applies Pink Stake and below"
                },
            },
        },
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={
            c_jokerhub_covid_19 = "COVID-19",
            c_jokerhub_another_mans_treasure = "Another Man's Treasure",
            c_jokerhub_dinner_time = "Dinner Time"
        },
        collabs={},
        dictionary={
            k_jokerhub_syphon = "Syphoned!",
        },
        high_scores={},
        labels={},
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={
            a_discards="+#1# Discards",
        },
        v_text={},
    },
}