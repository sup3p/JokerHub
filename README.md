# JokerHub
 A vanilla-balanced content pack for Balatro

 Requires [Steamodded](https://github.com/Steamodded/smods) and [Lovely](https://github.com/ethangreen-dev/lovely-injector)

## Current Additions
- 15 new Jokers
    - 5 Commons
    - 9 Uncommons
    - 5 Rares
    - 3 Legendaries
- 2 new Stakes
    - **Pink Stake:** Bumps the final Ante up to 9, while applying all changes of Purple Stake and below.
    - **Silver Stake:** All changes from Pink Stake, but blinds scale even faster now!
- 1 new Deck
    - **Filmmaker's Deck:** Starting you off with Director's Cut and halved boss reroll cost, this deck allows *any* boss blind to show up on *any* Ante, including showdown bosses!

# Compatibility
JokerHub has built-in compatiblity with Maximus. If you're a mod creator looking to add compatibility, here are the things you'll need to account for.

## Gambit
Gambit uses a Food pool to know what jokers are food jokers, the same pool system used by Paperback and Maximus. To add your own jokers to this pool, you can simply add `pools = { Food = true }` to your joker's definition.

## Amamiya
A helper function is provided to assist in adding new effects to Amamiya, `JHUB.add_amamiya_effect(new_boss_key, new_vars, new_effect)`. You can call this function when loading your mod to add a new effect, assuming your mod loads after JokerHub.
### new_boss_key
The simplest argument, `new_boss_key` is simply the key of the boss blind as a string.
### new_vars
`new_vars` takes a table with values to be used by the effect. As an example, the table for *The Wheel's* effect looks like `{ numerator = G.GAME.probabilities.normal, denominator = 7 }`. These vars can then be used by the effect function, for example as `vars.numerator` in the case of *The Wheel*. These values are also passed into `loc_vars` *in alphabetical order*. You can also add a `colours` entry to this table, and it will be passed into `loc_vars` appropriately for variable colors.
### new_effect
This is where the effect is calculated. `new_effect` should be passed as a function with the arguments `(card, context, boss_key, vars)`, and the function operates very similarly to a joker's `calculate` function. The same table of values that can be returned by a calculate function can be returned by this function, and the return table also supports the value `target_card`, which is the card that the effect should display on if not Amamiya itself.
- `card` - The Amamiya card object being operated on
- `context` - The context being passed into the joker. Any context normally checked by a joker can be used, as well as the contexts `context.add_to_deck` and `context.remove_from_deck` if you need to do something when the effect is gained or when the joker is lost. These two contexts will also set `context.from_debuff` to be true or false, as they are also run when the joker is debuffed/undebuffed.
- `boss_key` - The key of the boss blind who's effect is being calculated. It should be generally unneccesary to check this, as the helper function already checks for the matching boss blind key before running `new_effect`
- `vars` - A table of values passed into this function by `new_vars`. See above.

Below are a few examples of how you might use the function.
```lua
--The Manacle - +1 hand size
JHUB.add_amamiya_effect("bl_manacle", { hand_size_mod = 1 }, function(card, context, boss_key, vars)
    if context.add_to_deck then
        G.hand:change_size(vars.hand_size_mod)
    end
    if context.remove_from_deck then
        G.hand:change_size(-vars.hand_size_mod)
    end
end)

--The Ox - Earn $3 if played hand is the most played hand
JHUB.add_amamiya_effect("bl_ox", { dollars = 3 }, function(card, context, boss_key, vars)
    if not card.debuff and context.cardarea == G.jokers and context.before and context.scoring_name == G.GAME.current_round.most_played_poker_hand then
        ease_dollars(vars.dollars)
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + vars.dollars
        G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
        return {
            message = localize('$')..vars.dollars,
            colour = G.C.MONEY
        }
    end
end)

--Cerulean Bell - Retrigger one random scored card 3 times
--If you need to keep track of a variable long-term, you can add the variable to Amamiya's extra table in context.add_to_deck, as shown here
JHUB.add_amamiya_effect("bl_ox", { repetitions = 3 }, function(card, context, boss_key, vars)
    if context.add_to_deck and not card.ability.extra.bell_index then
        card.ability.extra.bell_index = 1
    end
    if not card.debuff and context.cardarea == G.jokers and context.before then
        card.ability.extra.bell_index = pseudorandom(pseudoseed("amamiya_bell"), 1, #context.scoring_hand)
    end
    if not card.debuff and context.repetition and context.cardarea == G.play and context.other_card and context.other_card == context.scoring_hand[card.ability.extra.bell_index] then
        return {
            repetitions = vars.repetitions
        }
    end
end)
```
### Localization
Finally, a localization table needs to be added for the tooltip that displays the effect. This can be done in your localization file as such, using *The Wheel* as an example
```lua
descriptions = {
    Other = {
        jokerhub_amamiya_ability_bl_wheel = {
            name="The Wheel's Heart",
            text={
                "Cards held in hand at end of",
                "round have {C:green}#2# in #1#{} chance to gain",
                "{C:dark_edition}Foil{}, {C:dark_edition}Holographic{}, or {C:dark_edition}Polychrome{}",
            },
        },
    }
}
```
Once again, notice how the values are passed in *alphabetical order* (in this case value 2 is the numerator and value 1 is the denominator). Keep this in mind if you're passing multiple values.

## Credits
- ScrimGrim: concept and art for Orb of Confusion
- Doodlesack12: concept and art for Going Viral, Snowball Effect, and Demon Core
- Quackers T. Encheese: concept and art for Da Joki
- kars_on_mars: art for Mulligan