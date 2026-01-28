return {
    descriptions = {
        Back={
            b_jokerhub_film_deck = {
                name = "Колода режиссёра",
                text ={
                    "Начните с купона {C:red,T:v_directors_cut}Режиссёрская версия{}.",
                    "Стоимость обновления {C:attention}Босс-блайнда{}",
                    "снижена до {C:money}$5{}.",
                    "Любой {C:attention}Босс-блайнд{} может появиться",
                    "на любом {C:attention}Анте{}.",
                },
            },
        },
        Blind={},
        Edition={},
        Enhanced={},
        Joker={
            j_jokerhub_broker = {
                name = 'Брокер',
                text = {
                    "Вы не получаете {C:attention}Бонус{}",
                    "Этот джокер получает {C:chips}+#1#{} фишек за",
                    "каждый {C:money}$1{} {C:attention}Бонуса{}, который",
                    "мог быть получен",
                    "{C:inactive}(Сейчас: {C:chips}+#2#{C:inactive} фишек)"
                }
            },
            j_jokerhub_da_joki = {
                name = 'Да Джоки',
                text = {
                    "Этот джокер получает {C:mult}+#2#{} множ. за каждые {C:attention}2{}",
                    "сыгранные руки, если обе руки имеют",
                    "одинаковую {C:attention}покерную комбинацию{}, иначе {C:mult}-#3#{} множ.",
                    "{C:inactive}(Сейчас: {C:mult}+#1#{} {C:inactive}множ., {C:attention}#4#{C:inactive})"
                }
            },
            j_jokerhub_demon_core = {
                name = 'Демоническое ядро',
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "Имеет шанс {C:green}#2# к #3#{} уничтожить",
                    "всех {C:attention}джокеров{} при игре руки"
                }
            },
            j_jokerhub_face_value = {
                name = 'Номинал',
                text = {
                    "Каждая сыгранная {C:attention}карта с лицом{}",
                    "навсегда получает",
                    "{C:mult}+#1#{} множ. при подсчёте"
                }
            },
            j_jokerhub_forbidden_fruit = {
                name = 'Запретный плод',
                text = {
                    "Этот джокер получает {X:mult,C:white}X#2#{} множ. за сыгранную руку",
                    "{S:1.1,C:red,E:2}Самоуничтожается{}, если в руке есть",
                    "подсчитываемая {C:attention}#3#{}, достоинство меняется каждый раунд",
                    "{C:inactive}(Сейчас: {X:mult,C:white} X#1# {C:inactive} множ.)"
                }
            },
            j_jokerhub_gambit = {
                name = 'Гамбит',
                text = {
                    "Этот джокер получает {X:mult,C:white} X#2# {} множ.",
                    "за каждого уничтоженного",
                    "{C:attention}едового джокера{}",
                    "{C:inactive}(Сейчас: {X:mult,C:white} X#1# {C:inactive} множ.)"
                }
            },
            j_jokerhub_garbage_bag = {
                name = 'Мешок для мусора',
                text = {
                    "Неиспользованные {C:red}сбросы{} переносятся",
                    "в следующий раунд",
                    "{C:inactive}(Максимум {C:red}#1#{C:inactive} сбросов){}"
                }
            },
            j_jokerhub_going_viral = {
                name = 'В тренде',
                text = {
                    "Этот джокер получает {C:mult}+#2#{} множ. за каждую сыгранную руку",
                    "{C:attention}Джокеры{} и {C:attention}расходники{} в",
                    "наборах или магазине имеют шанс {C:green}#3# к #4#{}",
                    "быть заменёнными на джокера {C:attention}В тренде{}",
                    "{C:inactive}(Сейчас: {C:mult}+#1#{} {C:inactive}множ.)",
                }
            },
            j_jokerhub_hudson = {
                name = 'Хадсон',
                text = {
                    "Копирует способность {C:attention}джокера{} слева",
                    "Этот джокер срабатывает один раз",
                    "за каждую {C:attention}7-ку{}, удерживаемую в руке"
                }
            },
            j_jokerhub_last_hurrah = {
                name = 'Прощальный салют',
                text = {
                    "Если этот джокер находится в {C:attention}последней{} позиции,",
                    "эффекты {C:attention}последней{} сыгранной карты срабатывают",
                    "ещё {C:attention}1{} раз за каждые ваши {C:money}$#1#{}",
                    "{C:inactive}(Макс. {C:attention}#2#{C:inactive} повт. сраб.){}, затем деньги становятся {C:money}$0{}",
                    "{C:inactive}(Сейчас: {C:attention}#3#{} {C:inactive}повт. сраб.)",
                }
            },
            j_jokerhub_orb_of_confusion = {
                name = 'Сфера замешательства',
                text = {
                    "{X:mult,C:white}X#1#{} множ.",
                    "{C:attention}Первая рука{} каждого раунда",
                    "тянется рубашкой вверх"
                }
            },
            j_jokerhub_rekoj = {
                name = 'рекоДж',
                text = {
                    "{C:mult}+#1#{} множ., если покерная комбинация содержит",
                    "хотя бы {C:attention}2{} подсчитываемых {C:attention}достоинства{}, и они",
                    "расположены от младшего к старшему"
                }
            },
            j_jokerhub_snowball_effect = {
                name = 'Снежный ком',
                text = {
                    "Этот джокер получает {X:mult,C:white} X#2# {} множ.",
                    "за каждый {C:attention}блайнд{}, побеждённый",
                    "с {C:attention}первой руки{} подряд",
                    "{C:inactive}(Сейчас: {X:mult,C:white} X#1# {C:inactive} множ.)"
                }
            },
            j_jokerhub_twins = {
                name = 'Близнецы',
                text = {
                    "Создаёт {C:attention}2{} случ. карты {C:tarot}Таро{},",
                    "если покерная комбинация содержит",
                    "{C:attention}Флеш{} и {C:attention}Пару{}",
                    "{C:inactive}(Должно быть место)"
                }
            },
            j_jokerhub_union_member_card = {
                name = 'Карта члена профсоюза',
                text = {
                    "{X:mult,C:white}X#1#{} множ., если все остальные",
                    "имеющиеся {C:attention}джокеры{} — {C:blue}Обычные{}",
                }
            },
            j_jokerhub_mulligan = {
                name = 'Муллиган',
                text = {
                    "Если сыгранная рука набирает",
                    "{C:attention}#1#%{} или меньше от требуемых",
                    "фишек, даёт {C:blue}+#2#{} руку",
                    "{C:inactive}(Максимум {C:blue}#3#{C:inactive} за раунд)"
                }
            },
            j_jokerhub_syphon_funding = {
                name = 'Откачка средств',
                text = {
                    "Ослабляет джокеров справа",
                    "при выборе {C:attention}блайнда{}",
                    "Зарабатывает {C:money}тройную{} стоимость продажи",
                    "каждого ослабленного таким образом",
                    "джокера в конце раунда"
                }
            },
            j_jokerhub_leap_frog = {
                name = 'Чехарда',
                text = {
                    "{C:chips}+#1#{} фишек за каждого {C:attention}джокера{} слева, если",
                    "их больше, чем было",
                    "во время любой руки в этом раунде",
                    "{C:inactive}(Сейчас: {C:attention}#2#{C:inactive} джокеров)"
                }
            },
            j_jokerhub_long_time_friends = {
                name = 'Старые друзья',
                text = {
                    "{C:attention}Вечные{} джокеры могут быть проданы",
                    "Этот джокер получает {X:mult,C:white}X#2#{} множ.,",
                    "когда продаётся {C:attention}Вечный{} джокер",
                    "{C:inactive}(Сейчас: {X:mult,C:white} X#1# {C:inactive} множ.)"
                }
            },
            j_jokerhub_amamiya = {
                name = 'Амамия',
                text = {
                    "Когда {C:attention}Босс-блайнд{} побеждён,",
                    "этот джокер навсегда получает",
                    "{C:attention}способность{}, основанную на",
                    "этом {C:attention}Босс-блайнде{}"
                }
            },
            j_jokerhub_metal_joker = {
                name = 'Металлический джокер',
                text = {
                    "{C:attention}Стальные{} карты считаются",
                    "{C:attention}Золотыми{} картами и наоборот"
                }
            },
            j_jokerhub_lychee_dragon = {
                name = 'Дракон Личи',
                text = {
                    "Каждая сыгранная карта с",
                    "мастью {C:hearts}Червы{} навсегда",
                    "получает {X:mult,C:white}X#1#{} множ. при подсчёте"
                }
            },
        },
        Other={
            jokerhub_pink_sticker = {
                name = "Розовый стикер",
                text = {
                    "Этот джокер использовался",
                    "для победы с {C:attention}Розовой",
                    "{C:attention}ставкой{}",
                }
            },
            jokerhub_stake_silver_sticker = {
                name = "Серебряный стикер",
                text = {
                    "Этот джокер использовался",
                    "для победы с {C:attention}Серебряной",
                    "{C:attention}ставкой{}",
                }
            },
            jokerhub_card_extra_mult = {
                text = { "Дополнительно {C:mult}+#1#{} множ." }
            },
            jokerhub_amamiya_ability_bl_manacle = {
                name = "Сердце Кандалов",
                text = { "{C:attention}+#1#{} к размеру руки" }
            },
            jokerhub_amamiya_ability_bl_ox = {
                name = "Сердце Буйвола",
                text = {
                    "Даёт {C:money}$#1#{}, когда сыграна ваша",
                    "самая частая {C:attention}покерная комбинация{}"
                }
            },
            jokerhub_amamiya_ability_bl_wall = {
                name = "Сердце Стены",
                text = { "{X:mult,C:white}X#1#{} множ." }
            },
            jokerhub_amamiya_ability_bl_final_vessel = {
                name = "Сердце Фиолетового сосуда",
                text = { "{X:mult,C:white}X#1#{} множ." }
            },
            jokerhub_amamiya_ability_bl_arm = {
                name = "Сердце Руки",
                text = {
                    "Повышает уровень {C:attention}первой{} сыгранной",
                    "{C:attention}покерной комбинации{} в каждом раунде"
                }
            },
            jokerhub_amamiya_ability_bl_club = {
                name = "Сердце Трефы",
                text = {
                    "Эффекты всех сыгранных",
                    "карт {C:club}Треф{} срабатывают повторно",
                }
            },
            jokerhub_amamiya_ability_bl_goad = {
                name = "Сердце Стимула",
                text = {
                    "Эффекты всех сыгранных",
                    "карт {C:spades}Пик{} срабатывают повторно",
                }
            },
            jokerhub_amamiya_ability_bl_window = {
                name = "Сердце Окна",
                text = {
                    "Эффекты всех сыгранных",
                    "карт {C:diamonds}Бубен{} срабатывают повторно",
                }
            },
            jokerhub_amamiya_ability_bl_head = {
                name = "Сердце Головы",
                text = {
                    "Эффекты всех сыгранных",
                    "карт {C:hearts}Червей{} срабатывают повторно",
                }
            },
            jokerhub_amamiya_ability_bl_plant = {
                name = "Сердце Цветка",
                text = {
                    "Эффекты всех сыгранных",
                    "карт {C:attention}с лицом{} срабатывают повторно",
                }
            },
            jokerhub_amamiya_ability_bl_pillar = {
                name = "Сердце Столпа",
                text = {
                    "Каждая сыгранная {C:attention}карта{}",
                    "навсегда получает",
                    "{C:chips}+#1#{} фишек при подсчёте",
                },
            },
            jokerhub_amamiya_ability_bl_water = {
                name = "Сердце Воды",
                text = {
                    "{C:red}+#1#{} сброс",
                    "на каждый раунд",
                }
            },
            jokerhub_amamiya_ability_bl_needle = {
                name = "Сердце Иглы",
                text = {
                    "{C:blue}+#1#{} рука",
                    "на каждый раунд",
                }
            },
            jokerhub_amamiya_ability_bl_final_leaf = {
                name = "Сердце Зелёного листа",
                text = { "{C:dark_edition}+#1#{} слот джокера" }
            },
            jokerhub_amamiya_ability_bl_tooth = {
                name = "Сердце Зуба",
                text = {
                    "Даёт {C:money}$#1#{} за каждую",
                    "сыгранную карту"
                }
            },
            jokerhub_amamiya_ability_bl_flint = {
                name = "Сердце Кремня",
                text = {
                    "{X:mult,C:white}X#1#{} множ. и {X:chips,C:white}X#2#{} фишек",
                    "до подсчёта карт"
                }
            },
            jokerhub_amamiya_ability_bl_final_bell = {
                name = "Сердце Лазурного колокола",
                text = {
                    "Эффекты {C:attention}случайной{} сыгранной",
                    "карты при подсчёте срабатывают",
                    "ещё {C:attention}#1#{} раза",
                }
            },
            jokerhub_amamiya_ability_bl_ReduxArcanum_bane = {
                name = "Сердце Проклятия",
                text = { "{C:attention}+#1#{} слот для расходников" }
            },
            jokerhub_amamiya_ability_unknown = {
                name = "Сердце неизвестного блайнда",
                text = { "{C:chips}+#1#{} фишек" }
            },
            jokerhub_amamiya_ability_bl_hook = {
                name = "Сердце Крюка",
                text = {
                    "Если {C:attention}сброшенная{} рука",
                    "содержит ровно {C:attention}#1#{}",
                    "карт, даёт {C:red}+1{} сброс",
                    "{C:inactive}(Максимум {C:red}+#2#{C:inactive} за раунд)"
                }
            },
            jokerhub_amamiya_ability_bl_psychic = {
                name = "Сердце Экстрасенса",
                text = {
                    "Каждая {C:attention}сыгранная карта",
                    "учитывается при подсчёте",
                }
            },
            jokerhub_amamiya_ability_bl_mouth = {
                name="Сердце Пасти",
                text={
                    "{X:mult,C:white} X#1# {} множ., если сыгранная",
                    "{C:attention}покерная комбинация{} уже",
                    "была сыграна в этом раунде",
                },
            },
            jokerhub_amamiya_ability_bl_eye = {
                name="Сердце Ока",
                text={
                    "{X:mult,C:white} X#1# {} множ., если сыгранная",
                    "{C:attention}покерная комбинация{} ещё не",
                    "была сыграна в этом раунде",
                },
            },
            jokerhub_amamiya_ability_bl_final_heart = {
                name="Сердце Багрового сердца",
                text={
                    "Эффекты {C:attention}#1#{} срабатывают повторно, джокер",
                    "меняется с каждой сыгранной рукой",
                },
            },
            jokerhub_amamiya_ability_bl_poke_cgoose = {
                name="Сердце Шартрезной палаты",
                text={
                    "{C:pink}+#1#{} к лимиту энергии",
                },
            },
            jokerhub_amamiya_ability_bl_house = {
                name="Сердце Дома",
                text={
                    "Карты в {C:attention}первой полученной{} руке",
                    "дают {X:mult,C:white}X#1#{} множ., пока удерживаются",
                },
            },
            jokerhub_amamiya_ability_bl_fish = {
                name="Сердце Рыбы",
                text={
                    "Эффекты всех сыгранных",
                    "карт в {C:attention}последней",
                    "{C:attention}руке{} раунда срабатывают повторно",
                },
            },
            jokerhub_amamiya_ability_bl_wheel = {
                name="Сердце Колеса",
                text={
                    "Удерживаемые карты в конце раунда",
                    "имеют шанс {C:green}#2# к #1#{} получить",
                    "{C:dark_edition}Фольгированное{}, {C:dark_edition}Голографическое{} или {C:dark_edition}Полихромное{} издание",
                },
            },
            jokerhub_amamiya_ability_bl_mark = {
                name="Сердце Метки",
                text={
                    "Карты {C:attention}с лицом{}, удерживаемые в",
                    "руке, дают {C:money}$#1#{} в",
                    "конце раунда",
                },
            },
            jokerhub_amamiya_ability_bl_final_acorn = {
                name="Сердце Янтарного жёлудя",
                text={
                    "Карты на верху колоды:",
                    "{C:attention}#1#{} {V:1}#2#{}, {C:attention}#3#{} {V:2}#4#{},",
                    "{C:attention}#5#{} {V:3}#6#{}, {C:attention}#7#{} {V:4}#8#{},",
                    "{C:attention}#9#{} {V:5}#10#{}",
                },
            },
            jokerhub_amamiya_ability_bl_mxms_rot = {
                name="Сердце Гнили",
                text={
                    "Каждая сыгранная карта имеет",
                    "шанс {C:green}#2# к #1#{} сработать",
                    "{C:attention}дважды{}"
                },
            },
            jokerhub_amamiya_ability_bl_mxms_grinder = {
                name="Сердце Мясорубки",
                text={
                    "Добавляет случ. {C:attention}печать{} на",
                    "случ. подсчитываемую карту",
                    "в {C:attention}первой руке{} раунда"
                },
            },
        },
        Planet={},
        Spectral={},
        Stake={
            stake_jokerhub_pink = {
                name = "Розовая ставка",
                text = {
                    "{C:attention}Финальный блайнд{} и конец партии",
                    "находятся на {C:attention}Анте 9{}.",
                    "{s:0.8}Также включает Фиолетовую ставку и предыдущие"
                },
            },
            stake_jokerhub_stake_silver = {
                name = "Серебряная ставка",
                text = {
                    "Требования по очкам растут",
                    "быстрее с каждым {C:attention}Анте",
                    "{s:0.8}Также включает Розовую ставку и предыдущие"
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
            c_jokerhub_another_mans_treasure = "Чужое сокровище",
            c_jokerhub_dinner_time = "Время ужина"
        },
        collabs={},
        dictionary={
            k_jokerhub_syphon = "Откачано!",
            k_jokerhub_sealed = "Запечатано!",
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
            a_discards="+#1# Сбросов",
        },
        v_text={},
    },
}