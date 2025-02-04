local chal_params = {
    restrictions = {
        banned_cards = {
            {id = "c_judgement"},
            {id = "c_wraith"},
            {id = "c_soul"},
            {id = "j_riff_raff"}
        },
        banned_tags = {
            {id = "tag_top_up"}
        }
    }
}

if next(SMODS.find_mod("maximus")) then
	table.insert(chal_params.restrictions.banned_cards, {id = "j_mxms_chef"})
end

SMODS.Challenge {
    key = "covid_19",
    jokers = {
        {
            id = "j_oops",
            edition = "negative",
            eternal = true
        },
        {
            id = "j_jokerhub_going_viral",
            eternal = true
        }
    },
    restrictions = chal_params.restrictions
}

chal_params = {
    restrictions = {
        banned_cards = {
            {id = "v_seed_money"},
            {id = "v_money_tree"},
            {id = "v_wasteful"},
            {id = "v_recyclomancy"},
            {id = "j_to_the_moon"},
            {id = "j_drunkard"},
            {id = "j_merry_andy"},
            {id = "j_jokerhub_broker"},
        },
        banned_other = {
            {id = "bl_water", type = "blind"}
        }
    }
}

if next(SMODS.find_mod("tesseract")) then
	table.insert(chal_params.restrictions.banned_cards, {id = "j_tes_waterfall"})
end
if next(SMODS.find_mod("maximus")) then
	table.insert(chal_params.restrictions.banned_cards, {id = "v_mxms_launch_code"})
    table.insert(chal_params.restrictions.banned_cards, {id = "v_mxms_warp_drive"})
end

SMODS.Challenge {
    key = "another_mans_treasure",
    jokers = {
        {
            id = "j_delayed_grat",
            edition = "negative",
            eternal = true
        },
        {
            id = "j_jokerhub_garbage_bag",
            eternal = true
        }
    },
    rules = {
        modifiers = {
            { id = "discards", value = 1 }
        },
        custom = {
            { id = "no_interest" },
            { id = "no_extra_hand_money" }
        }
    },
    restrictions = chal_params.restrictions
}

if next(SMODS.find_mod("maximus")) then
    chal_params = {
        restrictions = {
            banned_cards = {
            },
        }
    }

    local foods = jh_get_food_jokers()
    for i = 1, #foods do
        local add = true
        if (string.find(foods[i], "j_paperback") and not next(SMODS.find_mod("paperback")))
        or (string.find(foods[i], "j_lady") and not next(SMODS.find_mod("Lady")))
        or (string.find(foods[i], "j_tes_") and not next(SMODS.find_mod("tesseract"))) 
        or foods[i] == "j_jokerhub_garbage_bag" then
            add = false
        end
        if add then table.insert(chal_params.restrictions.banned_cards, {id = foods[i]}) end
    end

    SMODS.Challenge {
        key = "dinner_time",
        jokers = {
            {
                id = "j_jokerhub_gambit",
                eternal = true
            },
            {
                id = "j_mxms_chef",
                eternal = true
            }
        },
        rules = {
            modifiers = {
            },
            custom = {
                {
                    id = "mxms_X_blind_scale",
                    value = 2
                },
                {
                    id = "jh_chef_ignores_bans"
                }
            }
        },
        restrictions = chal_params.restrictions
    }
end