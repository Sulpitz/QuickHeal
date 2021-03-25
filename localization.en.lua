local L					= AceLibrary("AceLocale-2.2"):new("QuickHeal")

	-- English localization


	-- XML
	QH_CONFIGURATION = "QuickHeal Configuration";
	QH_GENERAL = "General";
	QH_SUBGROUP_SETUP = "Subgroup Setup";
	QH_MESSAGES_NOTIFICATION = "Messages and Notification";
	QH_OK = "OK";
	QH_DEFAULT = "Default";
	QH_TARGET_PRIORITY = "Target Priority";
	QH_QUICKCLICK = "QuickClick";
	QH_HEALING_NOTIFICATIONS = "Healing Notifications:";
	QH_WHISPER = "Whisper";
	QH_CHANNEL = "Channel";
	QH_PARTY = "Party";
	QH_RAID = "Raid";
	QH_TARGET_CHANNEL = "Target Channel:";
	QH_CHAT_STYLE = "Chat Style:";
	QH_HEALING_BAR = "Healing Bar:";
	QH_DISPLAY_HEALING_BAR = "Display Healing Bar";
	QH_SCREEN_MESSAGES = "Screen Messages:";
	QH_CONFIGURE = "Configure:";
	QH_CENTER_OF_SCREEN = "Center of Screen";
	QH_CHAT_WINDOW = "Chat Window";
	QH_OVERHEAL_MESSAGES = "Overheal Messages:";
	QH_ABOVE_HEALING_BAR = "Above Healing Bar";
	QH_PLAY_SOUND_OVERHEAL = "Play Sound on Excessive Overheal";
	QH_RAID_GROUPS_SUBGROUP = "Raid groups included in 'Subgroup':";
	QH_GROUP_1 = "Group 1";
	QH_GROUP_2 = "Group 2";
	QH_GROUP_3 = "Group 3";
	QH_GROUP_4 = "Group 4";
	QH_GROUP_5 = "Group 5";
	QH_GROUP_6 = "Group 6";
	QH_GROUP_7 = "Group 7";
	QH_GROUP_8 = "Group 8";
	QH_NOTE = "Note: The 'Subgroup' is healed by the '/qh subgroup' command or 'Heal Subgroup' key binding.";

	-- XML Slider text
	QH_GENERAL_HEALING_THRESHOLD = "General Healing Threshold: ";
	QH_HEALTHY_THRESHOLD = "Healthy Threshold: ";
	QH_SELF_PRESERVATION_THRESHOLD = "Self Preservation Threshold: ";
	QH_PET_PRIORITY = "Pet Priority: ";
	-- Tooltips
	QH_CHECK_MAXIMUM_PRIORITY = "Check this option to give your target maximum priority";
	QH_CHECK_HEALING_MOUSE = "Check this option to enable healing with the mouse";
	-- Tooltips variants answer
	QH_HEALING_BAR_IS = "Healing bar is";
	QH_NOT = " not ";
	QH_DISPLAYED = "displayed.";
	QH_HEALING = "Healing"; -- MessageConfigure ComboBox --> -- XML-827, depends on - Deliver message ["Healing"] = 
	QH_MESSAGES = " messages are";
	QH_DELIVERED_CENTER_SCREEN = "delivered to center of screen.";
	QH_DELIVERED_CHAT_WINDOW = "delivered to chat window.";
	QH_OVERHEAL_STATUS = "Overheal status is";
	QH_DISPLAYED_CENTER_SCREEN = "displayed at center of screen.";
	QH_DISPLAYED_ABOVE_BAR = "displayed above the Healing Bar.";
	QH_SOUND_ALERT = "A sound alert is";
	QH_PLAYED_OVERHEAL = "played in case of excessive overheal.";
	QH_RAID_GROUP_1 = "Raid group 1 will";
	QH_RAID_GROUP_2 = "Raid group 2 will";
	QH_RAID_GROUP_3 = "Raid group 3 will";
	QH_RAID_GROUP_4 = "Raid group 4 will";
	QH_RAID_GROUP_5 = "Raid group 5 will";
	QH_RAID_GROUP_6 = "Raid group 6 will";
	QH_RAID_GROUP_7 = "Raid group 7 will";
	QH_RAID_GROUP_8 = "Raid group 8 will";
	QH_BE_HEALED = "be healed.";
	-- "DownrankValueNH: ";					not involved
	-- "General Healing Threshold: ";		not involved

	-- XML Healing bar
	HB_HEALING_TARGET = "Healing Target";
	HB_CONFIGURATION = "Healing Bar Configuration\nLeft-click to drag.\nRight-click to re-attach to Casting Bar.";

L:RegisterTranslations("enUS", function() return {
	
	-- LUA COMMON ROTATIONS LUA --
	[" will be used when out of combat. "] = true,
	[" will be used in combat if the target has less than "] = true,
	[" will always be used in combat, and "] = true,
	[" will only be used in combat if the healing done is greater than the greatest "] = true,
	["% life, and "] = true,
	["% life, and only if the healing done is greater than the greatest "] = true,
	[" will be used otherwise. "] = true,
	[" will never be used. "] = true,
	[" will always be used in and out of combat. "] = true,
	[" available. "] = true,
	["Equipment Healing Bonus: %d"] = true,
	["Improved Healing modifier: %f"] = true,
	["Target is healthy"] = true,
	["Target debuff healing modifier"] = true,
	["BUFF: Hand of Edward the Odd (out of combat healing forced)"] = true,
	["BUFF: Nature's Swiftness (out of combat healing forced)"] = true,
	
	-- LUA priest --
	["Player: "] = true,
	[" ID: "] = true,
	[" unit: "] = true,
	["partyPlayerPredictedMissingHealth: "] = true,
	["UnitHealthMax: "] = true,
	["UnitHealth: "] = true,
	["NOT Range: "] = true,
	["partyPlayersToHeal: "] = true,
	["least missing Health: "] = true,
	["All missing Health: "] = true,
	[" or "] = true,
	["Spiritual Guidance Bonus: %f"] = true,
	["Final Healing Bonus (1.5,2.0,2.5,3.0)"] = true,
	["Spiritual Healing modifier: %f"] = true,
	["Inner Focus or Spirit of Redemption active"] = true,
	["SpellIDs: "] = true,
	["Found LH up to rank %d, H up top rank %d, GH up to rank %d, and FH up to rank %d"] = true,
	["Not in combat or target healthy or no flash heal available, will use closest available LH, H or GH (not FH)"] = true,
	["In combat and target unhealthy and player has flash heal, will only use FH"] = true,
	["healneedGrp: "] = true,
	["HealSizePoH: "] = true,
	[", in PoH Range: "] = true,
	["HPS_NH: "] = true,
	["HPS_FH: "] = true,
	["HPS_PoH: "] = true,
	["USING FH"] = true,
	["USING POH"] = true,
	["Set SpellID: "] = true,
	[" from SpellIDGrp "] = true,
	["Final SpellID: "] = true,
	
	-- LUA paladin --
	["Final Healing Bonus (1.5,2.5)"] = true,
	["Healing Light talentmodification: %f"] = true,
	["Found HL up to rank %d, and found FL up to rank %d"] = true,
	["Compare: FH "] = true,
	[" to NH "] = true,
	
	-- LUA druid --
		--debug messages
	["Final Healing Bonus (1.5,2.0,2.5,3.0,3.5,Regrowth)"] = true,
	["Gift of Nature modifier: %f"] = true,
	["Tranquil Spirit modifier: %f"] = true,
	["Moonglow modifier: %f"] = true,
	["BUFF: Clearcasting (Omen of Clarity)"] = true,
	["Found HT up to rank %d, RG up to rank %d"] = true,
	["Not in combat or target healthy or no Regrowth available, will use Healing Touch"] = true,
	["In combat and target unhealthy and Regrowth available, will use Regrowth"] = true,
	
	-- LUA shaman --
	[" will never be used in combat. "] = true,
	[" will only be used in combat if the target has more than "] = true,
	["Final Healing Bonus (1.5,2.0,2.5,3.0,LHW)"] = true,
	["Purification modifier: %f"] = true,
	["Healing Way healing modifier"] = true,
	["Found HW up to rank %d, and found LHW up to rank %d"] = true,
	["In combat, will prefer LHW"] = true,
	["Not in combat, will use closest available HW or LHW"] = true,
	
	-- CORE LUA --
	--[ Settings ]--
	["Healing %s with %s"] = true,
	["Healing you with %s"] = true,
	--[ Keybinding ]--
	["QuickHeal"] = true,
	["Heal"] = true,
	["Heal Subgroup"] = true,
	["Heal Party"] = true,
	["Heal MT"] = true,
	["Heal Non MT"] = true,
	["Heal Player"] = true,
	["Heal Target"] = true,
	["Heal Target's Target"] = true,
	["Toggle Healthy Threshold 0 / 100%"] = true,
	["Show/Hide Downrank Window"] = true,
	["Swich to Healmode 3"] = true,
	--[ Titan Panel functions ]--
	[" Configuration"] = true,
	["Click to toggle configuration panel"] = true,
	-- Deliver message
	["Healing"] = true,		-- Breaks messages on the screen, do not translate.
	["Info"] = true,								--
	["Blacklist"] = true,			--
	["Error"] = true,							--
	-- QuickHeal_ListUnitEffects
	["|cffffff80******* Buffs on "] = true,
	["Unknown"]= true,
	[" *******|r"] = true,
	["|cffffff80******* DeBuffs on "] = true,
	--[ Initialisation ]--
	["Important commands:\n'/qh cfg' to open configuration panel.\n'/qh help' to list available commands."] = true,
	["Version: "] = true,
	[" does not support "] = true,
	[" not loaded."] = true,
	[" for "] = true,
	[" Loaded. Usage: '/qh help'."] = true,
	["% of heal will be wasted ("] = true,
	[" Health)"] = true,
	["*Starting Monitor"] = true,
	["*Stopping Monitor"] = true,
	["Unknown Trigger"] = true,
	-- UIErrorsFrame Hook
	[". %s blacklisted for 5 sec."] = true,
	[". %s blacklisted for 2 sec."] = true,
	["Blacklist"] = true,  -- ?? need test ?? var
	["Sending Addon version"] = true,
	["Unknown Event"] = true,
	-- Items in the NotificationStyle ComboBox
	["Normal"] = true,
	["Role-Playing"] = true,
	-- Items in the MessageConfigure ComboBox
	["Healing (Green)"] = true,
	["Info (Blue)"] = true,
	["Blacklist (Yellow)"] = true,
	["Error (Red)"] = true,
	-- Get an explanation of effects based on current settings
	["Will only heal targets with less than "] = true,
	["% health."] = true,
	[" is disabled.]"] = true,
	["If you have less than "] = true,
	["% health, you will become the target of the heal."] = true,
	["Self preservation disabled."] = true,
	["Pets will never be healed."] = true,
	["Pets will only be healed if no players need healing."] = true,
	["Pets will be considered equal to players."] = true,
	["Healing target will receive notification by whisper."] = true,
	["Healing target will not receive notification by whisper."] = true,
	["Notification will be delivered to channel '"] = true,
	["' if it exists."] = true,
	["Enter a channel name to deliver notification to a channel."] = true,
	["Notification will not be delivered to a channel."] = true,
	["Notification will be delivered to raid chat when in a raid"] = true,
	["Notification will not be delivered to raid chat."] = true,
	["Notification will be delivered to party chat when in a party"] = true,
	["Notification will not be delivered to party chat."] = true,
	-- Return true if the unit is healable by player
	["is not a friend"] = true,
	["is an enemy"] = true,
	["can be attacked by player"] = true,
	["is not connected"] = true,
	["is dead or ghost"] = true,
	["is not visible to client"] = true,
	-- Returns an estimate of the units heal need for external units
	["Health deficit estimate ("] = true,
	["********** Self Preservation **********"] = true,
	["********** Target Priority **********"] = true,
	["********** Heal Subgroup **********"] = true,
	["********** Heal Party **********"] = true,
	["********** Heal MT **********"] = true,
	["********** Heal Non MT **********"] = true,
	["********** Heal **********"] = true,
	-- Examine Healable Players
	["is out-of-range or unhealable"] = true,
	["is blacklisted"] = true,
	-- If Normal notification style is selected override random number (also if healing self)
	["%s is looking pale, gonna heal you with %s."] = true,
	["%s doesn't look so hot, healing with %s."] = true,
	["I know it's just a flesh wound %s, but I'm healing you with %s."] = true,
	["Oh great, %s is bleeding all over, %s should take care of that."] = true,
	["Death is near %s... or is it? Perhaps a heal with %s will keep you with us."] = true,
	["%s, lack of health got you down? %s to the rescue!"] = true,
	["%s is being healed with %s."] = true,
	-- orc
	["Zug Zug %s with %s."] = true,
	["Loktar! %s is being healed with %s."] = true,
	["Health gud %s, %s make you healthy again!"] = true,
	-- tauren
	["By the spirits, %s be healed with %s."] = true,
	["Ancestors, save %s with %s."] = true,
	["Your noble sacrifice is not in vain %s, %s will keep you in the fight!"] = true,
	-- troll
	["Whoa mon, doncha be dyin' on me yet! %s is gettin' %s'd."] = true,
	["Haha! %s keeps dyin' an da %s voodoo, keeps bringin' em back!."] = true,
	["Doncha tink the heal is comin' %s, %s should keep ya' from whinin' too much!"] = true,
	-- night elf" then
	["Asht'velanon, %s! Elune sends you the gift of %s."] = true,
	["Remain vigilent %s, the Goddess' %s shall revitalize you!"] = true,
	["By Elune's grace I grant you this %s, %s."] = true,
	-- If the healing target is targettarget change current healable target to targettarget
	["Healable target preventing healing, temporarily switching target to target's target"] = true,
	["Healable target preventing healing, temporarily clearing target"] = true,
	-- Get spell info
	["  Casting: "] = true,
	[" on "] = true,
	[", ID: "] = true,
	["Casting "] = true,
	-- The spell is awaiting target selection, write to screen if the spell can actually be cast
	-- Write to center of screen
	["Casting %s on yourself"] = true,
	["Casting %s on %s"] = true,
	["Spell cannot target "] = true,
	["Reacquired previous target"] = true,
	-- Only one instance of QuickHeal allowed at a time
	["Massive overheal aborted."] = true,
	["Healing in progress, command ignored"] = true,
	-- Decode special values for Target
	["You are not in a raid"] = true,
	-- Target is specified, check it
	["********** Heal "] = true,
	[" **********"] = true,
	-- Does not need healing
	["You don't need healing"] = true,
	[" doesn't need healing"] = true,
	["'s Target ("] = true,
	[") doesn't need healing"] = true,
	-- Unit is not healable, report reason and return
	["You don't have a target"] = true,
	[" doesn't have a target"] = true,
	[") cannot be healed"] = true,
	-- Unit exists but cannot be healed
	["You cannot be healed"] = true,
	["Unit does not exist"] = true,
	-- Means that FindWhoToHeal couldn't cast the CheckSpell
	["No players assigned as Main Tank by Raid Leader"] = true,
	["No Main Tank to heal"] = true,
	["No one to heal"] = true,
	["You don't need healing"] = true,
	-- Target acquired
	["  Healing target: %s (%s)"] = true,
	-- Failed to decode the string
	["Spell not found"] = true,
	["You have no healing spells to cast"] = true,
	-- QuickHeal_Command(msg)
	[" debug mode enabled"] = true,
	[" debug mode disabled"] = true,
	[" reset to default configuration"] = true,
	-- Print usage information
	[" Usage:"] = true,
	["/qh cfg - Opens up the configuration panel."] = true,
	["/qh toggle - Swiches between only Flashheals and or Normal Heals (Healthy Threshold 0% or 100%)."] = true,
	["/qh healmode [1,2,3]| hm [1,2,3] - Swich to healmode 1, 2 or 3. 1: default; 2: Flash Heal / Holy Light; 3: max HPS"] = true,
	["/qh downrank | dr - Opens the slider to limit QuickHeal to use only lower ranks."] = true,
	["/qh - Heals the party/raid member that most need it with the best suited healing spell."] = true,
	["/qh player - Forces the target of the healing to be yourself."] = true,
	["/qh target - Forces the target of the healing to be your current target."] = true,
	["/qh targettarget - Forces the target of the healing to be your current target's target."] = true,
	["/qh party - Restricts the healing to the party when in a raid."] = true,
	["/qh mt - Restricts the healing to the Main Tanks defined by the Raid Leader in CTRaidAssist or oRA."] = true,
	["/qh nonmt - Restricts the healing to players who are not defined as Main Tanks by the Raid Leader in CTRaidAssist or oRA."] = true,
	["/qh subgroup - Forces the healing to the groups selected in the configuration panel."] = true,
	["/qh reset - Reset configuration to default parameters for all classes."] = true,
	["/qh healpct - Will prioritise the player with the lowest percentage of health."] = true,
} end)
