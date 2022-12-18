local L = AceLibrary("AceLocale-2.2"):new("QuickHeal")

-- Russian localization
L:RegisterTranslations("ruRU", function()
	-- XML
	QH_CONFIGURATION = "Настройка QuickHeal"
	QH_GENERAL = "Основные"
	QH_SUBGROUP_SETUP = "Настройка Подгруппы"
	QH_MESSAGES_NOTIFICATION = "Сообщения и Уведомления"
	QH_OK = "OK"
	QH_DEFAULT = "По умолчанию"
	QH_TARGET_PRIORITY = "Приоритет цели"
	QH_QUICKCLICK = "QuickClick"
	QH_HEALING_NOTIFICATIONS = "Лечащие уведомления:"
	QH_WHISPER = "Шепот"
	QH_CHANNEL = "Канал"
	QH_PARTY = "Группа"
	QH_RAID = "Рейд"
	QH_TARGET_CHANNEL = "Название канала:"
	QH_CHAT_STYLE = "Стиль чата:"
	QH_HEALING_BAR = "Полоса лечения:"
	QH_DISPLAY_HEALING_BAR = "Показать полосу лечения"
	QH_SCREEN_MESSAGES = "Сообщения на экране:"
	QH_CONFIGURE = "Настройка:"
	QH_CENTER_OF_SCREEN = "Центр экрана"
	QH_CHAT_WINDOW = "Окно чата"
	QH_OVERHEAL_MESSAGES = "Сообщения о избыточном исцелении:"
	QH_ABOVE_HEALING_BAR = "Над полосой исцеления"
	QH_PLAY_SOUND_OVERHEAL = "Проигрывать звук при избыточном исцелении"
	QH_RAID_GROUPS_SUBGROUP = "Группы рейда влюченные в 'Подгруппу':"
	QH_GROUP_1 = "Группа 1"
	QH_GROUP_2 = "Группа 2"
	QH_GROUP_3 = "Группа 3"
	QH_GROUP_4 = "Группа 4"
	QH_GROUP_5 = "Группа 5"
	QH_GROUP_6 = "Группа 6"
	QH_GROUP_7 = "Группа 7"
	QH_GROUP_8 = "Группа 8"
	QH_NOTE = "Заметка: 'Подгруппа' лечится командой '/qh subgroup' или назначением кнопки 'Лечить Подгруппу'."

	-- XML Slider text
	QH_GENERAL_HEALING_THRESHOLD = "Порог основного лечения: "
	QH_HEALTHY_THRESHOLD = "Порог здоровья: "
	QH_SELF_PRESERVATION_THRESHOLD = "Порог самосохранения: "
	QH_PET_PRIORITY = "Приоритет питомца: "
	-- Tooltips
	QH_CHECK_MAXIMUM_PRIORITY = "Эта опция дает максимальный приоритет вашей цели"
	QH_CHECK_HEALING_MOUSE = "Эта опция включает лечение мышью"
	-- Tooltips variants answer
	QH_HEALING_BAR_IS = "Полоса лечения"
	QH_NOT = " не "
	QH_DISPLAYED = "отображается."
	QH_HEALING = "Лечение" -- MessageConfigure ComboBox --> -- XML-827, depends on - Deliver message ["Healing"] =
	QH_MESSAGES = " - сообщения"
	QH_DELIVERED_CENTER_SCREEN = "будут показаны по центру экрана"
	QH_DELIVERED_CHAT_WINDOW = "будут доставлены в чат."
	QH_OVERHEAL_STATUS = "Состояние избыточного исцеления"
	QH_DISPLAYED_CENTER_SCREEN = "отображается по центру экрана."
	QH_DISPLAYED_ABOVE_BAR = "отображается над Полосой лечения."
	QH_SOUND_ALERT = "Звуковой сигнал"
	QH_PLAYED_OVERHEAL = "будет проигран в случае избыточного исцеления."
	QH_RAID_GROUP_1 = "Рейд группа 1"
	QH_RAID_GROUP_2 = "Рейд группа 2"
	QH_RAID_GROUP_3 = "Рейд группа 3"
	QH_RAID_GROUP_4 = "Рейд группа 4"
	QH_RAID_GROUP_5 = "Рейд группа 5"
	QH_RAID_GROUP_6 = "Рейд группа 6"
	QH_RAID_GROUP_7 = "Рейд группа 7"
	QH_RAID_GROUP_8 = "Рейд группа 8"
	QH_BE_HEALED = "будет исцелена."
	-- "DownrankValueNH: ";					not involved
	-- "General Healing Threshold: ";		not involved

	-- XML Healing bar
	HB_HEALING_TARGET = "Цель исцеления"
	HB_CONFIGURATION = "Настройка полосы лечения\nЛевый-клик для перемещения.\nПравый-клик прикрепить к Полосе произнесения."

	return {
		-- LUA COMMON ROTATIONS LUA --
		[" will be used when out of combat. "] = " будут использоваться вне боя. ",
		[" will be used in combat if the target has less than "] = " будет использоваться в бою если у цели менее ",
		[" will always be used in combat, and "] = " будет использоваться в бою, и ",
		[" will only be used in combat if the healing done is greater than the greatest "] = " будет использоваться только в бою, если сделанное лечение больше, чем наибольшее ",
		["% life, and "] = "% жизни, и ",
		["% life, and only if the healing done is greater than the greatest "] = "% жизни, и только если сделанное исцеление больше, чем наибольшее ",
		[" will be used otherwise. "] = " будет использоваться вне боя. ",
		[" will never be used. "] = " никогда не будет использоваться. ",
		[" will always be used in and out of combat. "] = " будут использоваться в бою и вне боя. ",
		[" available. "] = " доступно. ",
		["Equipment Healing Bonus: %d"] = "Бонус лечения от Экипировки: %d",
		["Improved Healing modifier: %f"] = "Модификатор улучшенного исцеления: %f",
		["Target is healthy"] = "Цель здорова",
		["Target debuff healing modifier"] = "Модификатор исцеления цели - дебафы",
		["BUFF: Hand of Edward the Odd (out of combat healing forced)"] = "БАФФ: Рука Эдварда Странного (вне боя - отмена лечения)",
		["BUFF: Nature's Swiftness (out of combat healing forced)"] = "БАФФ: Природная стремительность (вне боя - отмена лечения)",

		-- LUA priest --
		["Player: "] = "Игрок: ",
		[" ID: "] = " ID: ",
		[" unit: "] = " unit: ",
		["partyPlayerPredictedMissingHealth: "] = "ПрогнозируемоеНедостающееЗдоровьеГруппыИгрока: ",
		["UnitHealthMax: "] = "UnitHealthMax: ",
		["UnitHealth: "] = "UnitHealth: ",
		["NOT Range: "] = "Вне досягаемости: ",
		["partyPlayersToHeal: "] = "partyPlayersToHeal: ",
		["least missing Health: "] = "least missing Health: ",
		["All missing Health: "] = "All missing Health: ",
		[" or "] = " или ",
		["Spiritual Guidance Bonus: %f"] = "Бонус Духовного Направления: %f",
		["Final Healing Bonus (1.5,2.0,2.5,3.0)"] = "Общий бонус лечения (1.5,2.0,2.5,3.0)",
		["Spiritual Healing modifier: %f"] = "Модификатор духовного направления: %f",
		["Inner Focus or Spirit of Redemption active"] = "Внутренний огонь или Дух воздаяния активны",
		["SpellIDs: "] = "SpellIDs: ",
		["Found LH up to rank %d, H up top rank %d, GH up to rank %d, and FH up to rank %d"] = "Найдено М.И. уровень %d, И. уровень %d, В.И. уровень %d, и Б.И. уровень %d",
		["Not in combat or target healthy or no flash heal available, will use closest available LH, H or GH (not FH)"] = "Не в бою или цель здорова или Быстрое исцеление не доступно, будет использоваться самый доступный М.И., И. или В.И. (нет Б.И.)",
		["In combat and target unhealthy and player has flash heal, will only use FH"] = "В бою и цель нездорова, игрок имеет Быстрое исцеление, будет использоваться только Б.И.",
		["healneedGrp: "] = "НужноИсцеленияГруппе: ",
		["HealSizePoH: "] = "РазмерИсцеленияМол.Исц.: ",
		[", in PoH Range: "] = " в диапазоне Мол.Исц.: ",
		["HPS_NH: "] = "ХПС_NH: ", -- ??
		["HPS_FH: "] = "ХПС_Б.И.: ",
		["HPS_PoH: "] = "ХПС_Мол.Исц.: ",
		["USING FH"] = "ИСПОЛЬЗУЮ Б.И.",
		["USING POH"] = "ИСПОЛЬЗУЮ Мол.Исц.",
		["Set SpellID: "] = "Set SpellID: ",
		[" from SpellIDGrp "] = " from SpellIDGrp ",
		["Final SpellID: "] = "Final SpellID: ",

		-- LUA paladin --
		["Final Healing Bonus (1.5,2.5)"] = "Общий бонус лечения (1.5,2.5)",
		["Healing Light talentmodification: %f"] = "Модификатор таланта Исцеляющий Свет: %f",
		["Found HL up to rank %d, and found FL up to rank %d"] = "Найден С.Н. уровень %d, и найдена В.С. уровень %d",
		["Compare: FH "] = "Сравнение: FH ",
		[" to NH "] = " с NH ",

		-- LUA druid --
		--debug messages
		["Final Healing Bonus (1.5,2.0,2.5,3.0,3.5,Regrowth)"] = "Общий бонус лечения (1.5,2.0,2.5,3.0,3.5,Восстановление)",
		["Gift of Nature modifier: %f"] = "Модификатор Дар природы: %f",
		["Tranquil Spirit modifier: %f"] = "Модификатор Мирный дух: %f",
		["Moonglow modifier: %f"] = "Модификатор Лунное сияние: %f",
		["BUFF: Clearcasting (Omen of Clarity)"] = "БАФФ: Ясность мысли (Знамение ясности)",
		["Found HT up to rank %d, RG up to rank %d"] = "Найден HT уровень %d, RG уровень %d",
		["Not in combat or target healthy or no Regrowth available, will use Healing Touch"] = "Не в бою или цель здорова, или нет Восстановления, будет использоваться Целительное прикосновение",
		["In combat and target unhealthy and Regrowth available, will use Regrowth"] = "В бою и цель нездорова и доступно Восстановление, будет использоваться Восстановление",

		-- LUA shaman --
		[" will never be used in combat. "] = " никогда не будет использоваться в бою. ",
		[" will only be used in combat if the target has more than "] = " будет использоваться только в бою, если у цели больше чем ",
		["Final Healing Bonus (1.5,2.0,2.5,3.0,LHW)"] = "Общий бонус лечения (1.5,2.0,2.5,3.0,М.В.И.)",
		["Purification modifier: %f"] = "Модификатор Очищение : %f",
		["Healing Way healing modifier"] = "Модификатор Путь исцеления",
		["Found HW up to rank %d, and found LHW up to rank %d"] = "Найдено В.И. уровень %d, и найдено М.В.И. уровень %d",
		["In combat, will prefer LHW"] = "В бою, предпочтение М.В.И",
		["Not in combat, will use closest available HW or LHW"] = "Не в бою, будет исользоваться ближайший доступный В.И или М.В.И.",

		-- CORE LUA --
		--[ Settings ]--
		["Healing %s with %s"] = "Исцеление %s - %s",
		["Healing you with %s"] = "Исцеляю тебя: %s",
		--[ Keybinding ]--
		["QuickHeal"] = "Быстрое Лечение",
		["Heal"] = "Лечение",
		["Heal Subgroup"] = "Лечить Подгруппу",
		["Heal Party"] = "Лечить Группу",
		["Heal MT"] = "Лечить Танков",
		["Heal Non MT"] = "Лечить не Танков",
		["Heal Player"] = "Лечить Игрока",
		["Heal Target"] = "Лечить Цель",
		["Heal Target's Target"] = "Лечить Цель-Цели",
		["Toggle Healthy Threshold 0 / 100%"] = "Переключить порог здоровья 0 / 100%",
		["Show/Hide Downrank Window"] = "Показать/Скрыть Окно Уровня",
		["Swich to Healmode 3"] = "Переключить в Режим 3",
		--[ Titan Panel functions ]--
		[" Configuration"] = " Настройки",
		["Click to toggle configuration panel"] = "Нажмите, чтобы открыть панель настроек",
		-- Deliver message
		["Healing"] = "Лечение", -- Переводить так же как QH_HEALING
		["Info"] = "Информация",
		["Blacklist"] = "Черный список",
		["Error"] = "Ошибка",
		-- QuickHeal_ListUnitEffects
		["|cffffff80******* Buffs on "] = "|cffffff80******* Баффы на ",
		["Unknown"] = "Неизвестно",
		[" *******|r"] = " *******|r",
		["|cffffff80******* DeBuffs on "] = "|cffffff80******* ДеБаффы на ",
		--[ Initialisation ]--
		["Important commands:\n'/qh cfg' to open configuration panel.\n'/qh help' to list available commands."] = "Важные команды:\n'/qh cfg' открыть панель настройки.\n'/qh help' список доступных команд.",
		["Version: "] = "Версия: ",
		[" does not support "] = " не поддерживает ",
		[" not loaded."] = " не загружен.",
		[" for "] = " для ",
		[" Loaded. Usage: '/qh help'."] = " Загружен. Подсказка: '/qh help'.",
		["% of heal will be wasted ("] = "% лечения будет потрачено (",
		[" Health)"] = " Здоровья)",
		["*Starting Monitor"] = "*Запускаю монитор",
		["*Stopping Monitor"] = "*Останавливаю монитор",
		["Unknown Trigger"] = "Неизвестный триггер",
		-- UIErrorsFrame Hook
		[". %s blacklisted for 5 sec."] = ". %s в черном списке на 5 сек.",
		[". %s blacklisted for 2 sec."] = ". %s в черном списке на 2 сек.",
		["Sending Addon version"] = nil,
		["Unknown Event"] = "Неизвестное событие",
		-- Items in the NotificationStyle ComboBox
		["Normal"] = "Нормальный",
		["Role-Playing"] = "Ролевый",
		-- Items in the MessageConfigure ComboBox
		["Healing (Green)"] = "Лечение (Зеленый)",
		["Info (Blue)"] = "Информация (Синий)",
		["Blacklist (Yellow)"] = "Черный список (Желтый)",
		["Error (Red)"] = "Ошибка (Красный)",
		-- Get an explanation of effects based on current settings
		["Will only heal targets with less than "] = "Будет лечить только цели с менее, чем ",
		["% health."] = "% здоровья.",
		[" is disabled.]"] = " отключен.",
		["If you have less than "] = "Если у вас менее ",
		["% health, you will become the target of the heal."] = "% здоровья, вы станете целью лечения.",
		["Self preservation disabled."] = "Самосохранение отключено.",
		["Pets will never be healed."] = "Питомцы не будут лечится.",
		["Pets will only be healed if no players need healing."] = "Питомцы будут лечится если нет игроков для лечения.",
		["Pets will be considered equal to players."] = "Лечение питомцев будет предпочтительней игроков.",
		["Healing target will receive notification by whisper."] = "Цель лечения получит уведомление шепотом.",
		["Healing target will not receive notification by whisper."] = "Цель лечения не получит уведомление шепотом.",
		["Notification will be delivered to channel '"] = "Уведомление будет доставлено на канал '",
		["' if it exists."] = "' если он существует.",
		["Enter a channel name to deliver notification to a channel."] = "Введите имя канала для доставки уведомления.",
		["Notification will not be delivered to a channel."] = "Уведомление не будет доставлено на канал.",
		["Notification will be delivered to raid chat when in a raid"] = "Уведомление будет доставлено в чат рейда, когда вы в рейде",
		["Notification will not be delivered to raid chat."] = "Уведомление не будет доставлено в чат рейда.",
		["Notification will be delivered to party chat when in a party"] = "Уведомление будет доставлено в чат группы, когда вы в группе",
		["Notification will not be delivered to party chat."] = "Уведомление не будет доставлено в чат группы.",
		-- Return true if the unit is healable by player
		["is not a friend"] = "не друг",
		["is an enemy"] = "враг",
		["can be attacked by player"] = "может быть атакован игроком",
		["is not connected"] = "не подключен",
		["is dead or ghost"] = "мертв или призрак",
		["is not visible to client"] = "не видим для клиента",
		-- Returns an estimate of the units heal need for external units
		["Health deficit estimate ("] = "Оценка дефицита здоровья (",
		["********** Self Preservation **********"] = "********** Самосохранение **********",
		["********** Target Priority **********"] = "********** Приоритет целей **********",
		["********** Heal Subgroup **********"] = "********** Исцеляю Подгруппу **********",
		["********** Heal Party **********"] = "********** Исцеляю Группу **********",
		["********** Heal MT **********"] = "********** Исцеляю Танков **********",
		["********** Heal Non MT **********"] = "********** Исцеляю Не танков **********",
		["********** Heal **********"] = "********** Исцеляю **********",
		-- Examine Healable Players
		["is out-of-range or unhealable"] = "недосягаем или неизлечим",
		["is blacklisted"] = "добавлен в черный список",
		-- If Normal notification style is selected override random number (also if healing self)
		["%s is looking pale, gonna heal you with %s."] = "%s выглядишь бледным, тебя вылечит - %s.",
		["%s doesn't look so hot, healing with %s."] = "%s не выглядишь бодрым, исцелит - %s.",
		["I know it's just a flesh wound %s, but I'm healing you with %s."] = "Я знаю, что это просто ранка %s, тебя подлечит - %s.",
		["Oh great, %s is bleeding all over, %s should take care of that."] = "О, отлично, %s истекает кровью, %s позаботиться об этом.",
		["Death is near %s... or is it? Perhaps a heal with %s will keep you with us."] = "Смерть рядом %s... или нет? Возможно, %s сохранит тебя с нами.",
		["%s, lack of health got you down? %s to the rescue!"] = "%s, нехватка здоровья тебя расстроила? %s спешит на помощь!",
		["%s is being healed with %s."] = "%s будет исцелен - %s.",
		-- orc
		["Zug Zug %s with %s."] = "Zug Zug %s с - %s.",
		["Loktar! %s is being healed with %s."] = "Loktar! %s будешь исцелен - %s.",
		["Health gud %s, %s make you healthy again!"] = "Бог здоровья %s, %s сделает тебя снова здоровым!",
		-- tauren
		["By the spirits, %s be healed with %s."] = "Духи, %s исцелят тебя - %s.",
		["Ancestors, save %s with %s."] = "Предки, спасите %s с помощью - %s.",
		["Your noble sacrifice is not in vain %s, %s will keep you in the fight!"] = "Твоя благородная жертва не напрасна %s, %s поддержит тебя в бою!",
		-- troll
		["Whoa mon, doncha be dyin' on me yet! %s is gettin' %s'd."] = "Whoa mon, doncha be dyin' on me yet! %s is gettin' %s'd.",
		["Haha! %s keeps dyin' an da %s voodoo, keeps bringin' em back!."] = "Haha! %s keeps dyin' an da %s voodoo, keeps bringin' em back!.",
		["Doncha tink the heal is comin' %s, %s should keep ya' from whinin' too much!"] = "Doncha tink the heal is comin' %s, %s should keep ya' from whinin' too much!",
		-- night elf" then
		["Asht'velanon, %s! Elune sends you the gift of %s."] = "Asht'velanon, %s! Элуна отправляет тебе подарок of %s.",
		["Remain vigilent %s, the Goddess' %s shall revitalize you!"] = "Оставайся бдительным %s, Богиня' %s оживит тебя!",
		["By Elune's grace I grant you this %s, %s."] = "По милости Элуны я даю тебе это %s, %s.",
		-- If the healing target is targettarget change current healable target to targettarget
		["Healable target preventing healing, temporarily switching target to target's target"] = "Исцеляемая цель предотвратила лечение, временно переключаю цель на цель-цели",
		["Healable target preventing healing, temporarily clearing target"] = "Исцеляемая цель предотвратила лечение, временно переключаюсь с цели",
		-- Get spell info
		["  Casting: "] = "  Произношу: ",
		[" on "] = " на ",
		[" ID: "] = " ID: ",
		["Casting "] = "Произношу: ",
		-- The spell is awaiting target selection, write to screen if the spell can actually be cast
		-- Write to center of screen
		["Casting %s on yourself"] = "Произношу %s на себя",
		["Casting %s on %s"] = "Произношу %s на %s",
		["Spell cannot target "] = "Заклинание не может быть для этой цели ",
		["Reacquired previous target"] = "Возвращена предыдущая цель",
		-- Only one instance of QuickHeal allowed at a time
		["Massive overheal aborted."] = "Массовый перехил, отмена.",
		["Healing in progress, command ignored"] = "Лечение в процессе, команды игнорируются",
		-- Decode special values for Target
		["You are not in a raid"] = "Ты не в рейде",
		-- Target is specified, check it
		["********** Heal "] = "********** Лечение ",
		[" **********"] = " **********",
		-- Does not need healing
		["You don't need healing"] = "Тебе не нужно лечение",
		[" doesn't need healing"] = " не нужно лечение",
		["'s Target ("] = " - Цель (",
		[") doesn't need healing"] = ") не нуждается в лечении",
		-- Unit is not healable, report reason and return
		["You don't have a target"] = "У вас нет цели",
		[" doesn't have a target"] = " нет цели",
		[") cannot be healed"] = ") не может быть вылечен",
		-- Unit exists but cannot be healed
		["You cannot be healed"] = "Ты не можешь быть вылечен",
		["Unit does not exist"] = "Единица не существует",
		-- Means that FindWhoToHeal couldn't cast the CheckSpell
		["No players assigned as Main Tank by Raid Leader"] = "Нет игроков назначеных Главными танками Рейд Лидером",
		["No Main Tank to heal"] = "Нет Главного танка для лечения",
		["No one to heal"] = "Не кого лечить",
		["You don't need healing"] = "Вам не нужно лечение",
		-- Target acquired
		["  Healing target: %s (%s)"] = "  Цель лечения: %s (%s)",
		-- Failed to decode the string
		["Spell not found"] = "Заклинания не найдены",
		["You have no healing spells to cast"] = "У вас нет заклинаний исцеления для произнесения",
		-- QuickHeal_Command(msg)
		[" debug mode enabled"] = " режим отладки влючен",
		[" debug mode disabled"] = " режим отладки отключен",
		[" reset to default configuration"] = " сброс настроек по умолчанию",
		-- Print usage information
		[" Usage:"] = " Использование:",
		["/qh cfg - Opens up the configuration panel."] = "/qh cfg - Открывает панель настройки.",
		["/qh toggle - Swiches between only Flashheals and or Normal Heals (Healthy Threshold 0% or 100%)."] = "/qh toggle - Переключение между только Быстрым исцением и/или Нормальным исцелением (Лимит лечения 0% или 100%).",
		["/qh healmode [1,2,3]| hm [1,2,3] - Swich to healmode 1, 2 or 3. 1: default; 2: Flash Heal / Holy Light; 3: max HPS"] = "/qh healmode [1,2,3]| hm [1,2,3] - Переключает режим лечения 1, 2 или 3. 1: стандартный; 2: Быстрое исцеление / Свет небес; 3: макс. ХПС",
		["/qh downrank | dr - Opens the slider to limit QuickHeal to use only lower ranks."] = "/qh downrank | dr - Открывает ползунок ограничения быстрого исцеления для использования только низких уровней заклинаний.",
		["/qh - Heals the party/raid member that most need it with the best suited healing spell."] = "/qh - Лечение членов группы/рейда которым нужно лечение с наиболее подходящим заклинанием исцеления.",
		["/qh player - Forces the target of the healing to be yourself."] = "/qh player - Принудительно цель исцеления - на себя.",
		["/qh target - Forces the target of the healing to be your current target."] = "/qh target - Принудительно цель исцеления - ваша цель.",
		["/qh targettarget - Forces the target of the healing to be your current target's target."] = "/qh targettarget - Принудительно цель исцеления - цель вашей цели.",
		["/qh party - Restricts the healing to the party when in a raid."] = "/qh party - Ограничение лечения рейда, для вашей группы.",
		["/qh mt - Restricts the healing to the Main Tanks defined by the Raid Leader in CTRaidAssist or oRA."] = "/qh mt - Ограничение лечения, для Главных танков назначенных РЛ в CTRaidAssist или oRA.",
		["/qh nonmt - Restricts the healing to players who are not defined as Main Tanks by the Raid Leader in CTRaidAssist or oRA."] = "/qh nonmt - Ограничение лечения, для игроков не назначенных как Главные танки РЛ в CTRaidAssist или oRA.",
		["/qh subgroup - Forces the healing to the groups selected in the configuration panel."] = "/qh subgroup - Принудительное лечение выбранной группы в панели настройки.",
		["/qh reset - Reset configuration to default parameters for all classes."] = "/qh reset - Сброс настроек до стандартных значений.",
		["/qh healpct - Will prioritise the player with the lowest percentage of health."] = "/qh healpct - Приоритет для игрока с наименьшим процентом здоровья.",
	}
end)
