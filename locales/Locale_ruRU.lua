local L = LibStub("AceLocale-3.1"):NewLocale("QuickHeal", "ruRU", false);
if not L then return end

	-- Russian localization
if GetLocale() == "ruRU" then
	
	-- XML
	QH_CONFIGURATION = "Настройка QuickHeal";
	QH_GENERAL = "Основные";
	QH_SUBGROUP_SETUP = "Настройка Подгруппы";
	QH_MESSAGES_NOTIFICATION = "Сообщения и Уведомления";
	QH_OK = "OK";
	QH_DEFAULT = "По умолчанию";
	QH_TARGET_PRIORITY = "Приоритет цели";
	QH_QUICKCLICK = "QuickClick";
	QH_HEALING_NOTIFICATIONS = "Лечащие уведомления:";
	QH_WHISPER = "Шепот";
	QH_CHANNEL = "Канал";
	QH_PARTY = "Группа";
	QH_RAID = "Рейд";
	QH_TARGET_CHANNEL = "Название канала:";
	QH_CHAT_STYLE = "Стиль чата:";
	QH_HEALING_BAR = "Полоса лечения:";
	QH_DISPLAY_HEALING_BAR = "Показать полосу лечения";
	QH_SCREEN_MESSAGES = "Сообщения на экране:";
	QH_CONFIGURE = "Настройка:";
	QH_CENTER_OF_SCREEN = "Центр экрана";
	QH_CHAT_WINDOW = "Окно чата";
	QH_OVERHEAL_MESSAGES = "Сообщения о избыточном исцелении:";
	QH_ABOVE_HEALING_BAR = "Над полосой исцеления";
	QH_PLAY_SOUND_OVERHEAL = "Проигрывать звук при избыточном исцелении";
	QH_RAID_GROUPS_SUBGROUP = "Группы рейда влюченные в 'Подгруппу':";
	QH_GROUP_1 = "Группа 1";
	QH_GROUP_2 = "Группа 2";
	QH_GROUP_3 = "Группа 3";
	QH_GROUP_4 = "Группа 4";
	QH_GROUP_5 = "Группа 5";
	QH_GROUP_6 = "Группа 6";
	QH_GROUP_7 = "Группа 7";
	QH_GROUP_8 = "Группа 8";
	QH_NOTE = "Заметка: 'Подгруппа' лечится командой '/qh subgroup' или назначением кнопки 'Лечить Подгруппу'.";
	
	-- XML Slider text
	QH_GENERAL_HEALING_THRESHOLD = "Порог основного лечения: ";
	QH_HEALTHY_THRESHOLD = "Порог здоровья: ";
	QH_SELF_PRESERVATION_THRESHOLD = "Порог самосохранения: ";
	QH_PET_PRIORITY = "Приоритет питомца: ";
	-- Tooltips
	QH_CHECK_MAXIMUM_PRIORITY = "Эта опция дает максимальный приоритет вашей цели";
	QH_CHECK_HEALING_MOUSE = "Эта опция включает лечение мышью";
	-- Tooltips variants answer
	QH_HEALING_BAR_IS = "Полоса лечения";
	QH_NOT = " не ";
	QH_DISPLAYED = "отображается.";
	QH_HEALING = "Лечение"; -- MessageConfigure ComboBox --> -- XML-827, depends on - Deliver message ["Healing"] = 
	QH_MESSAGES = " - сообщения";
	QH_DELIVERED_CENTER_SCREEN = "будут показаны по центру экрана";
	QH_DELIVERED_CHAT_WINDOW = "будут доставлены в чат.";
	QH_OVERHEAL_STATUS = "Состояние избыточного исцеления";
	QH_DISPLAYED_CENTER_SCREEN = "отображается по центру экрана.";
	QH_DISPLAYED_ABOVE_BAR = "отображается над Полосой лечения.";
	QH_SOUND_ALERT = "Звуковой сигнал";
	QH_PLAYED_OVERHEAL = "будет проигран в случае избыточного исцеления.";
	QH_RAID_GROUP_1 = "Рейд группа 1";
	QH_RAID_GROUP_2 = "Рейд группа 2";
	QH_RAID_GROUP_3 = "Рейд группа 3";
	QH_RAID_GROUP_4 = "Рейд группа 4";
	QH_RAID_GROUP_5 = "Рейд группа 5";
	QH_RAID_GROUP_6 = "Рейд группа 6";
	QH_RAID_GROUP_7 = "Рейд группа 7";
	QH_RAID_GROUP_8 = "Рейд группа 8";
	QH_BE_HEALED = "будет исцелена.";
	-- "DownrankValueNH: ";					not involved
	-- "General Healing Threshold: ";		not involved
	
	-- XML Healing bar
	HB_HEALING_TARGET = "Цель исцеления";
	HB_CONFIGURATION = "Настройка полосы лечения\nЛевый-клик для перемещения.\nПравый-клик прикрепить к Полосе произнесения.";
end

if L then
	
	-- LUA COMMON ROTATIONS LUA --
	L[" will be used when out of combat. "] = " будут использоваться вне боя. "
	L[" will be used in combat if the target has less than "] = " будет использоваться в бою если у цели менее "
	L[" will always be used in combat, and "] = " будет использоваться в бою, и "
	L[" will only be used in combat if the healing done is greater than the greatest "] = " будет использоваться только в бою, если сделанное лечение больше, чем наибольшее "
	L["% life, and "] = "% жизни, и "
	L["% life, and only if the healing done is greater than the greatest "] = "% жизни, и только если сделанное исцеление больше, чем наибольшее "
	L[" will be used otherwise. "] = " будет использоваться вне боя. "
	L[" will never be used. "] = " никогда не будет использоваться. "
	L[" will always be used in and out of combat. "] = " будут использоваться в бою и вне боя. "
	L[" available. "] = " доступно. "
	L["Equipment Healing Bonus: %d"] = "Бонус лечения от Экипировки: %d"
	L["Improved Healing modifier: %f"] = "Модификатор улучшенного исцеления: %f"
	L["Target is healthy"] = "Цель здорова"
	L["Target debuff healing modifier"] = "Модификатор исцеления цели - дебафы"
	L["BUFF: Hand of Edward the Odd (out of combat healing forced)"] = "БАФФ: Рука Эдварда Странного (вне боя - отмена лечения)"
	L["BUFF: Nature's Swiftness (out of combat healing forced)"] = "БАФФ: Природная стремительность (вне боя - отмена лечения)"
	
	-- LUA priest --
	L["Player: "] = "Игрок: "
	L[" ID: "] = " ID: "
	L[" unit: "] = " unit: "
	L["partyPlayerPredictedMissingHealth: "] = "ПрогнозируемоеНедостающееЗдоровьеГруппыИгрока: "
	L["UnitHealthMax: "] = "UnitHealthMax: "
	L["UnitHealth: "] = "UnitHealth: "
	L["NOT Range: "] = "Вне досягаемости: "
	L["partyPlayersToHeal: "] = "partyPlayersToHeal: "
	L["least missing Health: "] = "least missing Health: "
	L["All missing Health: "] = "All missing Health: "
	L[" or "] = " или "
	L["Spiritual Guidance Bonus: %f"] = "Бонус Духовного Направления: %f"
	L["Final Healing Bonus (1.5,2.0,2.5,3.0)"] = "Общий бонус лечения (1.5,2.0,2.5,3.0)"
	L["Spiritual Healing modifier: %f"] = "Модификатор духовного направления: %f"
	L["Inner Focus or Spirit of Redemption active"] = "Внутренний огонь или Дух воздаяния активны"
	L["SpellIDs: "] = "SpellIDs: "
	L["Found LH up to rank %d, H up top rank %d, GH up to rank %d, and FH up to rank %d"] = "Найдено М.И. уровень %d, И. уровень %d, В.И. уровень %d, и Б.И. уровень %d"
	L["Not in combat or target healthy or no flash heal available, will use closest available LH, H or GH (not FH)"] = "Не в бою или цель здорова или Быстрое исцеление не доступно, будет использоваться самый доступный М.И., И. или В.И. (нет Б.И.)"
	L["In combat and target unhealthy and player has flash heal, will only use FH"] = "В бою и цель нездорова, игрок имеет Быстрое исцеление, будет использоваться только Б.И."
	L["healneedGrp: "] = "НужноИсцеленияГруппе: "
	L["HealSizePoH: "] = "РазмерИсцеленияМол.Исц.: "
	L[" in PoH Range: "] = " в диапазоне Мол.Исц.: "
	L["HPS_NH: "] = "ХПС_NH: " -- ??
	L["HPS_FH: "] = "ХПС_Б.И.: "
	L["HPS_PoH: "] = "ХПС_Мол.Исц.: "
	L["USING FH"] = "ИСПОЛЬЗУЮ Б.И."
	L["USING POH"] = "ИСПОЛЬЗУЮ Мол.Исц."
	L["Set SpellID: "] = "Set SpellID: "
	L[" from SpellIDGrp "] = " from SpellIDGrp "
	L["Final SpellID: "] = "Final SpellID: "
	
	-- LUA paladin --
	L["Final Healing Bonus (1.5,2.5)"] = "Общий бонус лечения (1.5,2.5)"
	L["Healing Light talentmodification: %f"] = "Модификатор таланта Исцеляющий Свет: %f"
	L["Found HL up to rank %d, and found FL up to rank %d"] = "Найден С.Н. уровень %d, и найдена В.С. уровень %d"
	L["Compare: FH "] = "Сравнение: FH "
	L[" to NH "] = " с NH "
	
	-- LUA druid --
		--debug messages
	L["Final Healing Bonus (1.5,2.0,2.5,3.0,3.5,Regrowth)"] = "Общий бонус лечения (1.5,2.0,2.5,3.0,3.5,Восстановление)"
	L["Gift of Nature modifier: %f"] = "Модификатор Дар природы: %f"
	L["Tranquil Spirit modifier: %f"] = "Модификатор Мирный дух: %f"
	L["Moonglow modifier: %f"] = "Модификатор Лунное сияние: %f"
	L["BUFF: Clearcasting (Omen of Clarity)"] = "БАФФ: Ясность мысли (Знамение ясности)"
	L["Found HT up to rank %d, RG up to rank %d"] = "Найден HT уровень %d, RG уровень %d"
	L["Not in combat or target healthy or no Regrowth available, will use Healing Touch"] = "Не в бою или цель здорова, или нет Восстановления, будет использоваться Целительное прикосновение"
	L["In combat and target unhealthy and Regrowth available, will use Regrowth"] = "В бою и цель нездорова и доступно Восстановление, будет использоваться Восстановление"
	
	-- LUA shaman --
	L[" will never be used in combat. "] = " никогда не будет использоваться в бою. "
	L[" will only be used in combat if the target has more than "] = " будет использоваться только в бою, если у цели больше чем "
	L["Final Healing Bonus (1.5,2.0,2.5,3.0,LHW)"] = "Общий бонус лечения (1.5,2.0,2.5,3.0,М.В.И.)"
	L["Purification modifier: %f"] = "Модификатор Очищение : %f"
	L["Healing Way healing modifier"] = "Модификатор Путь исцеления"
	L["Found HW up to rank %d, and found LHW up to rank %d"] = "Найдено В.И. уровень %d, и найдено М.В.И. уровень %d"
	L["In combat, will prefer LHW"] = "В бою, предпочтение М.В.И"
	L["Not in combat, will use closest available HW or LHW"] = "Не в бою, будет исользоваться ближайший доступный В.И или М.В.И."
	
	-- CORE LUA --
	--[ Settings ]--
	L["Healing %s with %s"] = "Исцеление %s - %s"
	L["Healing you with %s"] = "Исцеляю тебя: %s"
	--[ Keybinding ]--
	L["QuickHeal"] = "Быстрое Лечение"
	L["Heal"] = "Лечение"
	L["Heal Subgroup"] = "Лечить Подгруппу"
	L["Heal Party"] = "Лечить Группу"
	L["Heal MT"] = "Лечить Танков"
	L["Heal Non MT"] = "Лечить не Танков"
	L["Heal Player"] = "Лечить Игрока"
	L["Heal Target"] = "Лечить Цель"
	L["Heal Target's Target"] = "Лечить Цель-Цели"
	L["Toggle Healthy Threshold 0 / 100%"] = "Переключить порог здоровья 0 / 100%"
	L["Show/Hide Downrank Window"] = "Показать / Скрыть Окно Уровня"
	L["Swich to Healmode 3"] = "Переключить в Режим 3"
	--[ Titan Panel functions ]--
	L[" Configuration"] = " Настройки"
	L["Click to toggle configuration panel"] = "Нажмите, чтобы открыть панель настроек"
	-- Deliver message
	L["Healing"] = "Лечение"	-- Переводить так же как QH_HEALING
	L["Info"] = "Информация"
	L["Blacklist"] = "Черный список"
	L["Error"] = "Ошибка"
	-- QuickHeal_ListUnitEffects
	L["|cffffff80******* Buffs on "] = "|cffffff80******* Баффы на "
	L["Unknown"]= "Неизвестно"
	L[" *******|r"] = " *******|r"
	L["|cffffff80******* DeBuffs on "] = "|cffffff80******* ДеБаффы на "
	--[ Initialisation ]--
	L["Important commands:\n'/qh cfg' to open configuration panel.\n'/qh help' to list available commands."] = "Важные команды:\n'/qh cfg' открыть панель настройки.\n'/qh help' список доступных команд."
	L["Version: "] = "Версия: "
	L[" does not support "] = " не поддерживает "
	L[" not loaded."] = " не загружен."
	L[" for "] = " для "
	L[" Loaded. Usage: '/qh help'."] = " Загружен. Подсказка: '/qh help'."
	L["% of heal will be wasted ("] = "% лечения будет потрачено ("
	L[" Health)"] = " Здоровья)"
	L["*Starting Monitor"] = "*Запускаю монитор"
	L["*Stopping Monitor"] = "*Останавливаю монитор"
	L["Unknown Trigger"] = "Неизвестный триггер"
	-- UIErrorsFrame Hook
	L[". %s blacklisted for 5 sec."] = ". %s в черном списке на 5 сек."
	L[". %s blacklisted for 2 sec."] = ". %s в черном списке на 2 сек."
	L["Sending Addon version"] = "Sending Addon version"
	L["Unknown Event"] = "Неизвестное событие"
	-- Items in the NotificationStyle ComboBox
	L["Normal"] = "Нормальный"
	L["Role-Playing"] = "Ролевый"
	-- Items in the MessageConfigure ComboBox
	L["Healing (Green)"] = "Лечение (Зеленый)"
	L["Info (Blue)"] = "Информация (Синий)"
	L["Blacklist (Yellow)"] = "Черный список (Желтый)"
	L["Error (Red)"] = "Ошибка (Красный)"
	-- Get an explanation of effects based on current settings
	L["Will only heal targets with less than "] = "Будет лечить только цели с менее, чем "
	L["% health."] = "% здоровья."
	L[" is disabled.]"] = " отключен."
	L["If you have less than "] = "Если у вас менее "
	L["% health, you will become the target of the heal."] = "% здоровья, вы станете целью лечения."
	L["Self preservation disabled."] = "Самосохранение отключено."
	L["Pets will never be healed."] = "Питомцы не будут лечится."
	L["Pets will only be healed if no players need healing."] = "Питомцы будут лечится если нет игроков для лечения."
	L["Pets will be considered equal to players."] = "Лечение питомцев будет предпочтительней игроков."
	L["Healing target will receive notification by whisper."] = "Цель лечения получит уведомление шепотом."
	L["Healing target will not receive notification by whisper."] = "Цель лечения не получит уведомление шепотом."
	L["Notification will be delivered to channel '"] = "Уведомление будет доставлено на канал '"
	L["' if it exists."] = "' если он существует."
	L["Enter a channel name to deliver notification to a channel."] = "Введите имя канала для доставки уведомления."
	L["Notification will not be delivered to a channel."] = "Уведомление не будет доставлено на канал."
	L["Notification will be delivered to raid chat when in a raid"] = "Уведомление будет доставлено в чат рейда, когда вы в рейде"
	L["Notification will not be delivered to raid chat."] = "Уведомление не будет доставлено в чат рейда."
	L["Notification will be delivered to party chat when in a party"] = "Уведомление будет доставлено в чат группы, когда вы в группе"
	L["Notification will not be delivered to party chat."] = "Уведомление не будет доставлено в чат группы."
	-- Return true if the unit is healable by player
	L["is not a friend"] = "не друг"
	L["is an enemy"] = "враг"
	L["can be attacked by player"] = "может быть атакован игроком"
	L["is not connected"] = "не подключен"
	L["is dead or ghost"] = "мертв или призрак"
	L["is not visible to client"] = "не видим для клиента"
	-- Returns an estimate of the units heal need for external units
	L["Health deficit estimate ("] = "Оценка дефицита здоровья ("
	L["********** Self Preservation **********"] = "********** Самосохранение **********"
	L["********** Target Priority **********"] = "********** Приоритет целей **********"
	L["********** Heal Subgroup **********"] = "********** Исцеляю Подгруппу **********"
	L["********** Heal Party **********"] = "********** Исцеляю Группу **********"
	L["********** Heal MT **********"] = "********** Исцеляю Танков **********"
	L["********** Heal Non MT **********"] = "********** Исцеляю Не танков **********"
	L["********** Heal **********"] = "********** Исцеляю **********"
	-- Examine Healable Players
	L["is out-of-range or unhealable"] = "недосягаем или неизлечим"
	L["is blacklisted"] = "добавлен в черный список"
	-- If Normal notification style is selected override random number (also if healing self)
	L["%s is looking pale, gonna heal you with %s."] = "%s выглядишь бледным, тебя вылечит - %s."
	L["%s doesn't look so hot, healing with %s."] = "%s не выглядишь бодрым, исцелит - %s."
	L["I know it's just a flesh wound %s, but I'm healing you with %s."] = "Я знаю, что это просто ранка %s, тебя подлечит - %s."
	L["Oh great, %s is bleeding all over, %s should take care of that."] = "О, отлично, %s истекает кровью, %s позаботиться об этом."
	L["Death is near %s... or is it? Perhaps a heal with %s will keep you with us."] = "Смерть рядом %s... или нет? Возможно, %s сохранит тебя с нами."
	L["%s, lack of health got you down? %s to the rescue!"] = "%s, нехватка здоровья тебя расстроила? %s спешит на помощь!"
	L["%s is being healed with %s."] = "%s будет исцелен - %s."
	-- orc
	L["Zug Zug %s with %s."] = "Zug Zug %s с - %s."
	L["Loktar! %s is being healed with %s."] = "Loktar! %s будешь исцелен - %s."
	L["Health gud %s, %s make you healthy again!"] = "Бог здоровья %s, %s сделает тебя снова здоровым!"
	-- tauren
	L["By the spirits, %s be healed with %s."] = "Духи, %s исцелят тебя - %s."
	L["Ancestors, save %s with %s."] = "Предки, спасите %s с помощью - %s."
	L["Your noble sacrifice is not in vain %s, %s will keep you in the fight!"] = "Твоя благородная жертва не напрасна %s, %s поддержит тебя в бою!"
	-- troll
	L["Whoa mon, doncha be dyin' on me yet! %s is gettin' %s'd."] = "Whoa mon, doncha be dyin' on me yet! %s is gettin' %s'd."
	L["Haha! %s keeps dyin' an da %s voodoo, keeps bringin' em back!."] = "Haha! %s keeps dyin' an da %s voodoo, keeps bringin' em back!."
	L["Doncha tink the heal is comin' %s, %s should keep ya' from whinin' too much!"] = "Doncha tink the heal is comin' %s, %s should keep ya' from whinin' too much!"
	-- night elf" then
	L["Asht'velanon, %s! Elune sends you the gift of %s."] = "Asht'velanon, %s! Элуна отправляет тебе подарок of %s."
	L["Remain vigilent %s, the Goddess' %s shall revitalize you!"] = "Оставайся бдительным %s, Богиня' %s оживит тебя!"
	L["By Elune's grace I grant you this %s, %s."] = "По милости Элуны я даю тебе это %s, %s."
	-- If the healing target is targettarget change current healable target to targettarget
	L["Healable target preventing healing, temporarily switching target to target's target"] = "Исцеляемая цель предотвратила лечение, временно переключаю цель на цель-цели"
	L["Healable target preventing healing, temporarily clearing target"] = "Исцеляемая цель предотвратила лечение, временно переключаюсь с цели"
	-- Get spell info
	L["  Casting: "] = "  Произношу: "
	L[" on "] = " на "
	L[" ID: "] = " ID: "
	L["Casting "] = "Произношу: "
	-- The spell is awaiting target selection, write to screen if the spell can actually be cast
	-- переменные категории не изменены.
	-- Write to center of screen
	L["Casting %s on yourself"] = "Произношу %s на себя"
	L["Casting %s on %s"] = "Произношу %s на %s"
	L["Spell cannot target "] = "Заклинание не может быть для этой цели "
	L["Reacquired previous target"] = "Возвращена предыдущая цель"
	-- Only one instance of QuickHeal allowed at a time
	L["Massive overheal aborted."] = "Массовый перехил, отмена."
	L["Healing in progress, command ignored"] = "Лечение в процессе, команды игнорируются"
	-- Decode special values for Target
	L["You are not in a raid"] = "Ты не в рейде"
	-- Target is specified, check it
	L["********** Heal "] = "********** Лечение "
	L[" **********"] = " **********"
	-- Does not need healing
	L["You don't need healing"] = "Тебе не нужно лечение"
	L[" doesn't need healing"] = " не нужно лечение"
	L["'s Target ("] = " - Цель ("
	L[") doesn't need healing"] = ") не нуждается в лечении"
	-- Unit is not healable, report reason and return
	L["You don't have a target"] = "У вас нет цели"
	L[" doesn't have a target"] = " нет цели"
	L[") cannot be healed"] = ") не может быть вылечена"
	-- Unit exists but cannot be healed
	L["You cannot be healed"] = "Ты не можешь быть вылечен"
	L["Unit does not exist"] = "Единица не существует"
	-- Means that FindWhoToHeal couldn't cast the CheckSpell
	L["No players assigned as Main Tank by Raid Leader"] = "Нет игроков назначеных Главными танками Рейд Лидером"
	L["No Main Tank to heal"] = "Нет Главного танка для лечения"
	L["No one to heal"] = "Не кого лечить"
	L["You don't need healing"] = "Вам не нужно лечение"
	-- Target acquired
	L["  Healing target: %s (%s)"] = "  Цель лечения: %s (%s)"
	-- Failed to decode the string
	L["Spell not found"] = "Заклинания не найдены"
	L["You have no healing spells to cast"] = "У вас нет заклинаний исцеления для произнесения"
	-- QuickHeal_Command(msg)
	L[" debug mode enabled"] = " режим отладки влючен"
	L[" debug mode disabled"] = " режим отладки отключен"
	L[" reset to default configuration"] = " сброс настроек по умолчанию"
	-- Print usage information
	L[" Usage:"] = " Использование:"
	L["/qh cfg - Opens up the configuration panel."] = "/qh cfg - Открывает панель настройки."
	L["/qh toggle - Swiches between only Flashheals and or Normal Heals (Healthy Threshold 0% or 100%)."] = "/qh toggle - Переключение между только Быстрым исцением и/или Нормальным исцелением (Лимит лечения 0% или 100%)."
	L["/qh healmode [1,2,3]| hm [1,2,3] - Swich to healmode 1, 2 or 3. 1: default; 2: Flash Heal / Holy Light; 3: max HPS"] = "/qh healmode [1,2,3]| hm [1,2,3] - Переключает режим лечения 1, 2 или 3. 1: стандартный; 2: Быстрое исцеление / Свет небес; 3: макс. ХПС"
	L["/qh downrank | dr - Opens the slider to limit QuickHeal to use only lower ranks."] = "/qh downrank | dr - Открывает ползунок ограничения быстрого исцеления для использования только низких уровней заклинаний."
	L["/qh - Heals the party/raid member that most need it with the best suited healing spell."] = "/qh - Лечение членов группы/рейда которым нужно лечение с наиболее подходящим заклинанием исцеления."
	L["/qh player - Forces the target of the healing to be yourself."] = "/qh player - Принудительно цель исцеления - на себя."
	L["/qh target - Forces the target of the healing to be your current target."] = "/qh target - Принудительно цель исцеления - ваша цель."
	L["/qh targettarget - Forces the target of the healing to be your current target's target."] = "/qh targettarget - Принудительно цель исцеления - цель вашей цели."
	L["/qh party - Restricts the healing to the party when in a raid."] = "/qh party - Ограничение лечения рейда, для вашей группы."
	L["/qh mt - Restricts the healing to the Main Tanks defined by the Raid Leader in CTRaidAssist or oRA."] = "/qh mt - Ограничение лечения, для Главных танков назначенных РЛ в CTRaidAssist или oRA."
	L["/qh nonmt - Restricts the healing to players who are not defined as Main Tanks by the Raid Leader in CTRaidAssist or oRA."] = "/qh nonmt - Ограничение лечения, для игроков не назначенных как Главные танки РЛ в CTRaidAssist или oRA."
	L["/qh subgroup - Forces the healing to the groups selected in the configuration panel."] = "/qh subgroup - Принудительное лечение выбранной группы в панели настройки."
	L["/qh reset - Reset configuration to default parameters for all classes."] = "/qh reset - Сброс настроек до стандартных значений."
	L["/qh healpct - Will prioritise the player with the lowest percentage of health."] = "/qh healpct - Приоритет для игрока с наименьшим процентом здоровья."
end
