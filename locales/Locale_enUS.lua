local L = LibStub("AceLocale-3.1"):NewLocale("QuickHeal", "enUS", true, true);


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


if L then
	-- LUA COMMON ROTATIONS LUA --
	L[" will be used when out of combat. "] = true
	L[" will be used in combat if the target has less than "] = true
	L[" will always be used in combat, and "] = true
	L[" will only be used in combat if the healing done is greater than the greatest "] = true
	L["% life, and "] = true
	L["% life, and only if the healing done is greater than the greatest "] = true
	L[" will be used otherwise. "] = true
	L[" will never be used. "] = true
	L[" will always be used in and out of combat. "] = true
	L[" available. "] = true
	L["Equipment Healing Bonus: %d"] = true
	L["Improved Healing modifier: %f"] = true
	L["Target is healthy"] = true
	L["Target debuff healing modifier"] = true
	L["BUFF: Hand of Edward the Odd (out of combat healing forced)"] = true
	L["BUFF: Nature's Swiftness (out of combat healing forced)"] = true
	
	-- LUA priest --
	L["Player: "] = true
	L[" ID: "] = true
	L[" unit: "] = true
	L["partyPlayerPredictedMissingHealth: "] = true
	L["UnitHealthMax: "] = true
	L["UnitHealth: "] = true
	L["NOT Range: "] = true
	L["partyPlayersToHeal: "] = true
	L["least missing Health: "] = true
	L["All missing Health: "] = true
	L[" or "] = true
	L["Spiritual Guidance Bonus: %f"] = true
	L["Final Healing Bonus (1.5,2.0,2.5,3.0)"] = true
	L["Spiritual Healing modifier: %f"] = true
	L["Inner Focus or Spirit of Redemption active"] = true
	L["SpellIDs: "] = true
	L["Found LH up to rank %d, H up top rank %d, GH up to rank %d, and FH up to rank %d"] = true
	L["Not in combat or target healthy or no flash heal available, will use closest available LH, H or GH (not FH)"] = true
	L["In combat and target unhealthy and player has flash heal, will only use FH"] = true
	L["healneedGrp: "] = true
	L["HealSizePoH: "] = true
	L[", in PoH Range: "] = true
	L["HPS_NH: "] = true
	L["HPS_FH: "] = true
	L["HPS_PoH: "] = true
	L["USING FH"] = true
	L["USING POH"] = true
	L["Set SpellID: "] = true
	L[" from SpellIDGrp "] = true
	L["Final SpellID: "] = true
	
	-- LUA paladin --
	L["Final Healing Bonus (1.5,2.5)"] = true
	L["Healing Light talentmodification: %f"] = true
	L["Found HL up to rank %d, and found FL up to rank %d"] = true
	L["Compare: FH "] = true
	L[" to NH "] = true
	
	-- LUA druid --
		--debug messages
	L["Final Healing Bonus (1.5,2.0,2.5,3.0,3.5,Regrowth)"] = true
	L["Gift of Nature modifier: %f"] = true
	L["Tranquil Spirit modifier: %f"] = true
	L["Moonglow modifier: %f"] = true
	L["BUFF: Clearcasting (Omen of Clarity)"] = true
	L["Found HT up to rank %d, RG up to rank %d"] = true
	L["Not in combat or target healthy or no Regrowth available, will use Healing Touch"] = true
	L["In combat and target unhealthy and Regrowth available, will use Regrowth"] = true
	
	-- LUA shaman --
	L[" will never be used in combat. "] = true
	L[" will only be used in combat if the target has more than "] = true
	L["Final Healing Bonus (1.5,2.0,2.5,3.0,LHW)"] = true
	L["Purification modifier: %f"] = true
	L["Healing Way healing modifier"] = true
	L["Found HW up to rank %d, and found LHW up to rank %d"] = true
	L["In combat, will prefer LHW"] = true
	L["Not in combat, will use closest available HW or LHW"] = true
	
	-- CORE LUA --
	--[ Settings ]--
	L["Healing %s with %s"] = true
	L["Healing you with %s"] = true
	--[ Keybinding ]--
	L["QuickHeal"] = true
	L["Heal"] = true
	L["Heal Subgroup"] = true
	L["Heal Party"] = true
	L["Heal MT"] = true
	L["Heal Non MT"] = true
	L["Heal Player"] = true
	L["Heal Target"] = true
	L["Heal Target's Target"] = true
	L["Toggle Healthy Threshold 0 / 100%"] = true
	L["Show/Hide Downrank Window"] = true
	L["Swich to Healmode 3"] = true
	--[ Titan Panel functions ]--
	L[" Configuration"] = true
	L["Click to toggle configuration panel"] = true
	-- Deliver message
	L["Healing"] = true		-- Translate same as QH_HEALING
	L["Info"] = true
	L["Blacklist"] = true
	L["Error"] = true
	-- QuickHeal_ListUnitEffects
	L["|cffffff80******* Buffs on "] = true
	L["Unknown"] = true
	L[" *******|r"] = true
	L["|cffffff80******* DeBuffs on "] = true
	--[ Initialisation ]--
	L["Important commands:\n'/qh cfg' to open configuration panel.\n'/qh help' to list available commands."] = true
	L["Version: "] = true
	L[" does not support "] = true
	L[" not loaded."] = true
	L[" for "] = true
	L[" Loaded. Usage: '/qh help'."] = true
	L["% of heal will be wasted ("] = true
	L[" Health)"] = true
	L["*Starting Monitor"] = true
	L["*Stopping Monitor"] = true
	L["Unknown Trigger"] = true
	-- UIErrorsFrame Hook
	L[". %s blacklisted for 5 sec."] = true
	L[". %s blacklisted for 2 sec."] = true
	L["Sending Addon version"] = true
	L["Unknown Event"] = true
	-- Items in the NotificationStyle ComboBox
	L["Normal"] = true
	L["Role-Playing"] = true
	-- Items in the MessageConfigure ComboBox
	L["Healing (Green)"] = true
	L["Info (Blue)"] = true
	L["Blacklist (Yellow)"] = true
	L["Error (Red)"] = true
	-- Get an explanation of effects based on current settings
	L["Will only heal targets with less than "] = true
	L["% health."] = true
	L[" is disabled.]"] = true
	L["If you have less than "] = true
	L["% health, you will become the target of the heal."] = true
	L["Self preservation disabled."] = true
	L["Pets will never be healed."] = true
	L["Pets will only be healed if no players need healing."] = true
	L["Pets will be considered equal to players."] = true
	L["Healing target will receive notification by whisper."] = true
	L["Healing target will not receive notification by whisper."] = true
	L["Notification will be delivered to channel '"] = true
	L["' if it exists."] = true
	L["Enter a channel name to deliver notification to a channel."] = true
	L["Notification will not be delivered to a channel."] = true
	L["Notification will be delivered to raid chat when in a raid"] = true
	L["Notification will not be delivered to raid chat."] = true
	L["Notification will be delivered to party chat when in a party"] = true
	L["Notification will not be delivered to party chat."] = true
	-- Return true if the unit is healable by player
	L["is not a friend"] = true
	L["is an enemy"] = true
	L["can be attacked by player"] = true
	L["is not connected"] = true
	L["is dead or ghost"] = true
	L["is not visible to client"] = true
	-- Returns an estimate of the units heal need for external units
	L["Health deficit estimate ("] = true
	L["********** Self Preservation **********"] = true
	L["********** Target Priority **********"] = true
	L["********** Heal Subgroup **********"] = true
	L["********** Heal Party **********"] = true
	L["********** Heal MT **********"] = true
	L["********** Heal Non MT **********"] = true
	L["********** Heal **********"] = true
	-- Examine Healable Players
	L["is out-of-range or unhealable"] = true
	L["is blacklisted"] = true
	-- If Normal notification style is selected override random number (also if healing self)
	L["%s is looking pale, gonna heal you with %s."] = true
	L["%s doesn't look so hot, healing with %s."] = true
	L["I know it's just a flesh wound %s, but I'm healing you with %s."] = true
	L["Oh great, %s is bleeding all over, %s should take care of that."] = true
	L["Death is near %s... or is it? Perhaps a heal with %s will keep you with us."] = true
	L["%s, lack of health got you down? %s to the rescue!"] = true
	L["%s is being healed with %s."] = true
	-- orc
	L["Zug Zug %s with %s."] = true
	L["Loktar! %s is being healed with %s."] = true
	L["Health gud %s, %s make you healthy again!"] = true
	-- tauren
	L["By the spirits, %s be healed with %s."] = true
	L["Ancestors, save %s with %s."] = true
	L["Your noble sacrifice is not in vain %s, %s will keep you in the fight!"] = true
	-- troll
	L["Whoa mon, doncha be dyin' on me yet! %s is gettin' %s'd."] = true
	L["Haha! %s keeps dyin' an da %s voodoo, keeps bringin' em back!."] = true
	L["Doncha tink the heal is comin' %s, %s should keep ya' from whinin' too much!"] = true
	-- night elf" then
	L["Asht'velanon, %s! Elune sends you the gift of %s."] = true
	L["Remain vigilent %s, the Goddess' %s shall revitalize you!"] = true
	L["By Elune's grace I grant you this %s, %s."] = true
	-- If the healing target is targettarget change current healable target to targettarget
	L["Healable target preventing healing, temporarily switching target to target's target"] = true
	L["Healable target preventing healing, temporarily clearing target"] = true
	-- Get spell info
	L["  Casting: "] = true
	L[" on "] = true
	L[", ID: "] = true
	L["Casting "] = true
	-- The spell is awaiting target selection, write to screen if the spell can actually be cast
	-- Write to center of screen
	L["Casting %s on yourself"] = true
	L["Casting %s on %s"] = true
	L["Spell cannot target "] = true
	L["Reacquired previous target"] = true
	-- Only one instance of QuickHeal allowed at a time
	L["Massive overheal aborted."] = true
	L["Healing in progress, command ignored"] = true
	-- Decode special values for Target
	L["You are not in a raid"] = true
	-- Target is specified, check it
	L["********** Heal "] = true
	L[" **********"] = true
	-- Does not need healing
	L["You don't need healing"] = true
	L[" doesn't need healing"] = true
	L["'s Target ("] = true
	L[") doesn't need healing"] = true
	-- Unit is not healable, report reason and return
	L["You don't have a target"] = true
	L[" doesn't have a target"] = true
	L[") cannot be healed"] = true
	-- Unit exists but cannot be healed
	L["You cannot be healed"] = true
	L["Unit does not exist"] = true
	-- Means that FindWhoToHeal couldn't cast the CheckSpell
	L["No players assigned as Main Tank by Raid Leader"] = true
	L["No Main Tank to heal"] = true
	L["No one to heal"] = true
	L["You don't need healing"] = true
	-- Target acquired
	L["  Healing target: %s (%s)"] = true
	-- Failed to decode the string
	L["Spell not found"] = true
	L["You have no healing spells to cast"] = true
	-- QuickHeal_Command(msg)
	L[" debug mode enabled"] = true
	L[" debug mode disabled"] = true
	L[" reset to default configuration"] = true
	-- Print usage information
	L[" Usage:"] = true
	L["/qh cfg - Opens up the configuration panel."] = true
	L["/qh toggle - Swiches between only Flashheals and or Normal Heals (Healthy Threshold 0% or 100%)."] = true
	L["/qh healmode [1,2,3]| hm [1,2,3] - Swich to healmode 1, 2 or 3. 1: default; 2: Flash Heal / Holy Light; 3: max HPS"] = true
	L["/qh downrank | dr - Opens the slider to limit QuickHeal to use only lower ranks."] = true
	L["/qh - Heals the party/raid member that most need it with the best suited healing spell."] = true
	L["/qh player - Forces the target of the healing to be yourself."] = true
	L["/qh target - Forces the target of the healing to be your current target."] = true
	L["/qh targettarget - Forces the target of the healing to be your current target's target."] = true
	L["/qh party - Restricts the healing to the party when in a raid."] = true
	L["/qh mt - Restricts the healing to the Main Tanks defined by the Raid Leader in CTRaidAssist or oRA."] = true
	L["/qh nonmt - Restricts the healing to players who are not defined as Main Tanks by the Raid Leader in CTRaidAssist or oRA."] = true
	L["/qh subgroup - Forces the healing to the groups selected in the configuration panel."] = true
	L["/qh reset - Reset configuration to default parameters for all classes."] = true
	L["/qh healpct - Will prioritise the player with the lowest percentage of health."] = true
end
