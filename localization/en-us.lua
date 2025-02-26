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
                    "Earn {C:money}$#1#{} at end of round for",
                    "each joker debuffed this way"
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
            }
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