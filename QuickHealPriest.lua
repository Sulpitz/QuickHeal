local L					= AceLibrary("AceLocale-2.2"):new("QuickHeal")
local BS				= AceLibrary("Babble-Spell-2.2")

local function writePriestLine(s,r,g,b)
	if DEFAULT_CHAT_FRAME then
		--DEFAULT_CHAT_FRAME:AddMessage(s, r or 1, g or 1, b or 0.5)
	end
end

QuickHealHealInfoFrame = {}
QuickHealHealInfoFrameFontstring = {}

function QuickHealFindGroupMembers()

	local name
	local numRaidMembers = GetNumRaidMembers()
	local playerSubGroup
	local subgroup
	local subgroupTbl = {}

	for x = 1, numRaidMembers, 1 do
		name, _, subgroup, _, _ = GetRaidRosterInfo(x)
		if name == GetUnitName("player") then
			playerSubGroup = subgroup
			break
		end
	end

	for x = 1, numRaidMembers, 1 do
		name, _, subgroup, _, _ = GetRaidRosterInfo(x)
		if subgroup == playerSubGroup then
			subgroupTbl[name] = x
		end
	end
	return subgroupTbl  
end

function QuickHealPohTest()

	QuickHealHealInfoFrame = CreateFrame("Frame", UIParent) 
	QuickHealHealInfoFrame:SetPoint("CENTER",-190, -25)  
	QuickHealHealInfoFrame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"})
	QuickHealHealInfoFrame:SetWidth(200)
	QuickHealHealInfoFrame:SetHeight(22)

	QuickHealHealInfoFrameFontstring = QuickHealHealInfoFrame:CreateFontString(nil, "OVERLAY")  
	QuickHealHealInfoFrameFontstring:SetPoint("CENTER",0, 0)  
	QuickHealHealInfoFrameFontstring:SetFont("Fonts\\FRIZQT__.TTF", 9)
	QuickHealHealInfoFrameFontstring:SetText("Mytext")

if false then
	local party = QuickHealFindGroupMembers()

	--find if PoH is vaiable
	local unit
	local partyTotalPredictedheal = 0
	local partyPlayerPredictedLeastMissingHealth = 200000
	local partyPredictedMissingHealth = 0
	local partyPlayerPredictedMissingHealth
	local partyPlayersToHeal = 0

	for k, v in pairs(party) do
	unit = "raid" .. v
	if CheckInteractDistance(unit, 4) then
		partyPlayerPredictedMissingHealth = UnitHealthMax(unit) - UnitHealth(unit) - HealComm:getHeal(UnitName(unit))
		writePriestLine("°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°")
		writePriestLine(L["Player: "] .. k .. L[" ID: "] .. v .. L[" unit: "] .. unit)
		writePriestLine(L["partyPlayerPredictedMissingHealth: "] .. partyPlayerPredictedMissingHealth)
		writePriestLine(L["UnitHealthMax: "] .. UnitHealthMax(unit))
		writePriestLine(L["UnitHealth: "] .. UnitHealth(unit))
		if partyPlayerPredictedMissingHealth < partyPlayerPredictedLeastMissingHealth then
			partyPlayerPredictedLeastMissingHealth = partyPlayerPredictedMissingHealth
		end
		partyPlayersToHeal = partyPlayersToHeal + 1
		partyPredictedMissingHealth = partyPredictedMissingHealth + partyPlayerPredictedMissingHealth
	else
		writePriestLine(L["NOT Range: "] .. k)
	end

	local SpellIDPoH = QuickHeal_GetSpellIDs(BS['Prayer of Healing']);
	for k, v in pairs(SpellIDPoH) do
		writePriestLine(k .. " spellIDS: " .. v)
	end

	healneedGrp = partyPlayerPredictedLeastMissingHealth

	end

	writePriestLine(L["least missing Health: "] .. partyPlayerPredictedLeastMissingHealth)
	writePriestLine(L["All missing Health: "] .. partyPredictedMissingHealth)
	end
end

function dummmyforlolz()

	--find if PoH is vaiable
	local party = GetHomePartyInfo()
	local partyPlayerPredictedMissingHealth = UnitHealthMax(unit) - UnitHealth(unit) - HealComm:getHeal(UnitName(unit))
	local partyTotalPredictedheal = 0
	local partyPlayerPredictedLeastMissingHealth = 10000
	local partyPlayerInRange = 5
	local partyPredictedMissingHealth

	for k, v in paris(party) do
		partyPlayerPredictedMissingHealth = UnitHealthMax(unit) - UnitHealth(unit) - HealComm:getHeal(UnitName(unit))
		partyTotalPredictedheal = partyTotalPredictedheal + partyPlayerPredictedMissingHealth
		if partyPlayerPredictedMissingHealth < partyPlayerPredictedLeastMissingHealth then
			partyPlayerPredictedLeastMissingHealth = partyPlayerPredictedMissingHealth
		end
		--inRange = UnitInRange("unit") or UnitInRange("name")
		--inRange = IsSpellInRange(index, "bookType", "unit") or IsSpellInRange("name", "unit")
		if not inRange then
			partyPlayerInRange = partyPlayerInRange - 1
		end
		-- PoH table here
		
		
		partyPredictedMissingHealth = partyPlayerInRange * partyPlayerPredictedLeastMissingHealth
	end

end

function QuickHeal_Priest_GetRatioHealthyExplanation()
	if QuickHealVariables.RatioHealthyPriest >= QuickHealVariables.RatioFull then
		return BS['Flash Heal'] .. L[" will always be used in combat, and "]  .. BS['Lesser Heal'] .. ", " .. BS['Heal'] .. L[" or "] .. BS['Greater Heal'] .. L[" will be used when out of combat. "];
	else
		if QuickHealVariables.RatioHealthyPriest > 0 then
			return BS['Flash Heal'] .. L[" will be used in combat if the target has less than "] .. QuickHealVariables.RatioHealthyPriest*100 .. L["% life, and "] .. BS['Lesser Heal'] .. ", " .. BS['Heal'] .. L[" or "] .. BS['Greater Heal'] .. L[" will be used otherwise. "];
		else
			return BS['Flash Heal'] .. L[" will never be used. "] .. BS['Lesser Heal'] .. ", " .. BS['Heal'] .. L[" or "] .. BS['Greater Heal'] .. L[" will always be used in and out of combat. "];
		end
	end
end

function QuickHeal_Priest_FindSpellToUse(Target)
	local SpellID = nil;
	local SpellIDGrp = nil;
	local HealSize = 0;
	-- Return immediatly if no player needs healing
	if not Target then
		return SpellID,HealSize;
	end

	-- +Healing-PenaltyFactor = (1-((20-LevelLearnt)*0.0375)) for all spells learnt before level 20
	local PF1 = 0.2875;
	local PF4 = 0.4;
	local PF10 = 0.625;
	local PF18 = 0.925;

	-- Determine health and healneed of target
	local healneed;
	local Health;
	local healneedGrp;

	if QuickHeal_UnitHasHealthInfo(Target) then
		-- Full info available
		healneed = UnitHealthMax(Target) - UnitHealth(Target) - HealComm:getHeal(UnitName(Target)); -- Implementatin for HealComm
		Health = UnitHealth(Target) / UnitHealthMax(Target);
	else
		-- Estimate target health
		healneed = QuickHeal_EstimateUnitHealNeed(Target,true); -- needs HealComm implementation maybe
		Health = UnitHealth(Target)/100;
	end

	-- if BonusScanner is running, get +Healing bonus
	local Bonus = 0;
	if (BonusScanner) then
		Bonus = tonumber(BonusScanner:GetBonus("HEAL"));
		QuickHeal_debug(string.format(L["Equipment Healing Bonus: %d"], Bonus));
	end

	-- Spiritual Guidance - Increases spell damage and healing by up to 5% (per rank) of your total Spirit.
	local _,_,_,_,talentRank,_ = GetTalentInfo(2,14);
	local _,Spirit,_,_ = UnitStat('player',5);
	local sgMod = Spirit * 5*talentRank/100;
	QuickHeal_debug(string.format(L["Spiritual Guidance Bonus: %f"], sgMod));

	-- Calculate healing bonus
	local healMod15 = (1.5/3.5) * (sgMod + Bonus);
	local healMod20 = (2.0/3.5) * (sgMod + Bonus);
	local healMod25 = (2.5/3.5) * (sgMod + Bonus);
	local healMod30 = (3.0/3.5) * (sgMod + Bonus);
	QuickHeal_debug(L["Final Healing Bonus (1.5,2.0,2.5,3.0)"], healMod15,healMod20,healMod25,healMod30);

	local InCombat = UnitAffectingCombat('player') or UnitAffectingCombat(Target);

	-- Spiritual Healing - Increases healing by 2% per rank on all spells
	local _,_,_,_,talentRank,_ = GetTalentInfo(2,15);
	local shMod = 2*talentRank/100 + 1;
	QuickHeal_debug(string.format(L["Spiritual Healing modifier: %f"], shMod));

	-- Improved Healing - Decreases mana usage by 5% per rank on LH,H and GH
	local _,_,_,_,talentRank,_ = GetTalentInfo(2,10); 
	local ihMod = 1 - 5*talentRank/100;
	QuickHeal_debug(string.format(L["Improved Healing modifier: %f"], ihMod));

	local TargetIsHealthy = Health >= QuickHealVariables.RatioHealthyPriest;
	local ManaLeft = UnitMana('player');

	if TargetIsHealthy then
		QuickHeal_debug(L["Target is healthy"],Health);
	end

	-- Detect proc of 'Hand of Edward the Odd' mace (next spell is instant cast)
	if QuickHeal_DetectBuff('player',"Spell_Holy_SearingLight") then
		QuickHeal_debug(L["BUFF: Hand of Edward the Odd (out of combat healing forced)"]);
		InCombat = false;
	end

	-- Detect Inner Focus or Spirit of Redemption (hack ManaLeft and healneed)
	if QuickHeal_DetectBuff('player',"Spell_Frost_WindWalkOn",1) or QuickHeal_DetectBuff('player',"Spell_Holy_GreaterHeal") then
		QuickHeal_debug(L["Inner Focus or Spirit of Redemption active"]);
		ManaLeft = UnitManaMax('player'); -- Infinite mana
		healneed = 10^6; -- Deliberate overheal (mana is free)
	end

	-- Get total healing modifier (factor) caused by healing target debuffs
	local HDB = QuickHeal_GetHealModifier(Target);
	QuickHeal_debug(L["Target debuff healing modifier"],HDB);
	healneed = healneed/HDB;

	-- Get a list of ranks available for all spells
	local SpellIDsLH = QuickHeal_GetSpellIDs(BS['Lesser Heal']);
	local SpellIDsH  = QuickHeal_GetSpellIDs(BS['Heal']);
	local SpellIDsGH = QuickHeal_GetSpellIDs(BS['Greater Heal']);
	local SpellIDsFH = QuickHeal_GetSpellIDs(BS['Flash Heal']);
	local SpellIDPoH = QuickHeal_GetSpellIDs(BS['Prayer of Healing']);

	local maxRankLH = table.getn(SpellIDsLH);
	local maxRankH  = table.getn(SpellIDsH);
	local maxRankGH = table.getn(SpellIDsGH);
	local maxRankFH = table.getn(SpellIDsFH);
	local maxRankPoH = table.getn(SpellIDPoH);

	for k, v in pairs(SpellIDPoH) do
		writePriestLine(L["SpellIDs: "] .. k .. " " .. v)
	end
	QuickHeal_debug(string.format(L["Found LH up to rank %d, H up top rank %d, GH up to rank %d, and FH up to rank %d"], maxRankLH, maxRankH, maxRankGH, maxRankFH));


	local partyPlayersToHeal = 0 --why out of scope?
	--Examine Group for PoH
	if quickHealHealMode == 3 then
		local party = QuickHealFindGroupMembers()

		local unit
		local partyTotalPredictedheal = 0
		local partyPlayerPredictedLeastMissingHealth = 200000
		local partyPredictedMissingHealth = 0
		local partyPlayerPredictedMissingHealth

		for k, v in pairs(party) do
			unit = "raid" .. v
			if CheckInteractDistance(unit, 4) then
				partyPlayerPredictedMissingHealth = UnitHealthMax(unit) - UnitHealth(unit) - HealComm:getHeal(UnitName(unit))
				writePriestLine("°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°")
				writePriestLine(L["Player: "] .. k .. L[" ID: "] .. v .. L[" unit: "] .. unit)
				writePriestLine(L["partyPlayerPredictedMissingHealth: "] .. partyPlayerPredictedMissingHealth)
				writePriestLine(L["UnitHealthMax: "] .. UnitHealthMax(unit))
				writePriestLine(L["UnitHealth: "] .. UnitHealth(unit))
				if partyPlayerPredictedMissingHealth < partyPlayerPredictedLeastMissingHealth then
					partyPlayerPredictedLeastMissingHealth = partyPlayerPredictedMissingHealth
			end
			partyPlayersToHeal = partyPlayersToHeal + 1
			writePriestLine(L["partyPlayersToHeal: "] .. partyPlayersToHeal)
			partyPredictedMissingHealth = partyPredictedMissingHealth + partyPlayerPredictedMissingHealth
		else
			writePriestLine(L["NOT Range: "] .. k)
		end
	end

		healneedGrp = partyPlayerPredictedLeastMissingHealth
		--
		--writePriestLine("PoH Rank 1 " .. math.floor(311*shMod+healMod30/2 ))
		--writePriestLine("PoH Rank 2 " .. math.floor(458*shMod+healMod30/2 ))
		--writePriestLine("PoH Rank 3 " .. math.floor(676*shMod+healMod30/2 ))
		--writePriestLine("PoH Rank 4 " .. math.floor(965*shMod+healMod30/2 ))
		--writePriestLine("PoH Rank 5 " .. math.floor(1070*shMod+healMod30/2))
	end

	-- Compensation for health lost during combat
	local k=1.0;
	local K=1.0;
	if InCombat then
		k=0.9;
		K=0.8;
	end

	if quickHealHealMode == 1 then
		-- Find suitable SpellID based on the defined criteria
		if not InCombat or TargetIsHealthy or maxRankFH<1 then
			-- Not in combat or target is healthy so use the closest available mana efficient healing
			QuickHeal_debug(string.format(L["Not in combat or target healthy or no flash heal available, will use closest available LH, H or GH (not FH)"]))
			if Health < QuickHealVariables.RatioFull then
				SpellID = SpellIDsLH[1]; HealSize = 53*shMod+healMod15*PF1; -- Default to LH
				if healneed > (  84*shMod+healMod20*PF4) *k and ManaLeft >=  45*ihMod and maxRankLH >=2 and quickHealDownRankNH >= 2  then SpellID = SpellIDsLH[2]; HealSize =   84*shMod+healMod20*PF4  end
				if healneed > ( 154*shMod+healMod25*PF10)*K and ManaLeft >=  75*ihMod and maxRankLH >=3 and quickHealDownRankNH >= 3  then SpellID = SpellIDsLH[3]; HealSize =  154*shMod+healMod25*PF10 end
				if healneed > ( 318*shMod+healMod30*PF18)*K and ManaLeft >= 155*ihMod and maxRankH  >=1 and quickHealDownRankNH >= 4  then SpellID = SpellIDsH[1] ; HealSize =  318*shMod+healMod30*PF18 end
				if healneed > ( 460*shMod+healMod30)*K      and ManaLeft >= 205*ihMod and maxRankH  >=2 and quickHealDownRankNH >= 5  then SpellID = SpellIDsH[2] ; HealSize =  460*shMod+healMod30      end
				if healneed > ( 604*shMod+healMod30)*K      and ManaLeft >= 255*ihMod and maxRankH  >=3 and quickHealDownRankNH >= 6  then SpellID = SpellIDsH[3] ; HealSize =  604*shMod+healMod30      end
				if healneed > ( 758*shMod+healMod30)*K      and ManaLeft >= 305*ihMod and maxRankH  >=4 and quickHealDownRankNH >= 7  then SpellID = SpellIDsH[4] ; HealSize =  758*shMod+healMod30      end
				if healneed > ( 956*shMod+healMod30)*K      and ManaLeft >= 370*ihMod and maxRankGH >=1 and quickHealDownRankNH >= 8  then SpellID = SpellIDsGH[1]; HealSize =  956*shMod+healMod30      end
				if healneed > (1219*shMod+healMod30)*K      and ManaLeft >= 455*ihMod and maxRankGH >=2 and quickHealDownRankNH >= 9  then SpellID = SpellIDsGH[2]; HealSize = 1219*shMod+healMod30      end
				if healneed > (1523*shMod+healMod30)*K      and ManaLeft >= 545*ihMod and maxRankGH >=3 and quickHealDownRankNH >= 10 then SpellID = SpellIDsGH[3]; HealSize = 1523*shMod+healMod30      end
				if healneed > (1902*shMod+healMod30)*K      and ManaLeft >= 655*ihMod and maxRankGH >=4 and quickHealDownRankNH >= 11 then SpellID = SpellIDsGH[4]; HealSize = 1902*shMod+healMod30      end
				if healneed > (2080*shMod+healMod30)*K      and ManaLeft >= 710*ihMod and maxRankGH >=5 and quickHealDownRankNH >= 12 then SpellID = SpellIDsGH[5]; HealSize = 2080*shMod+healMod30      end
			end
		else
			-- In combat and target is unhealthy and player has flash heal
			QuickHeal_debug(string.format(L["In combat and target unhealthy and player has flash heal, will only use FH"]));
			if Health < QuickHealVariables.RatioFull then
				SpellID = SpellIDsFH[1]; HealSize = 215*shMod+healMod15; -- Default to FH
				if healneed > (286*shMod+healMod15)*k and ManaLeft >= 155 and maxRankFH >=2 and quickHealDownRankFH >= 2 then SpellID = SpellIDsFH[2]; HealSize = 286*shMod+healMod15 end
				if healneed > (360*shMod+healMod15)*k and ManaLeft >= 185 and maxRankFH >=3 and quickHealDownRankFH >= 3 then SpellID = SpellIDsFH[3]; HealSize = 360*shMod+healMod15 end
				if healneed > (439*shMod+healMod15)*k and ManaLeft >= 215 and maxRankFH >=4 and quickHealDownRankFH >= 4 then SpellID = SpellIDsFH[4]; HealSize = 439*shMod+healMod15 end
				if healneed > (567*shMod+healMod15)*k and ManaLeft >= 265 and maxRankFH >=5 and quickHealDownRankFH >= 5 then SpellID = SpellIDsFH[5]; HealSize = 567*shMod+healMod15 end
				if healneed > (704*shMod+healMod15)*k and ManaLeft >= 315 and maxRankFH >=6 and quickHealDownRankFH >= 6 then SpellID = SpellIDsFH[6]; HealSize = 704*shMod+healMod15 end
				if healneed > (885*shMod+healMod15)*k and ManaLeft >= 380 and maxRankFH >=7 and quickHealDownRankFH >= 7 then SpellID = SpellIDsFH[7]; HealSize = 885*shMod+healMod15 end
			end
		end

	elseif quickHealHealMode == 2 then
		SpellID = SpellIDsFH[1]; HealSize = 215*shMod+healMod15; -- Default to FH
		if healneed > (286*shMod+healMod15)*k and ManaLeft >= 155 and maxRankFH >=2 and quickHealDownRankFH >= 2 then SpellID = SpellIDsFH[2]; HealSize = 286*shMod+healMod15 end
		if healneed > (360*shMod+healMod15)*k and ManaLeft >= 185 and maxRankFH >=3 and quickHealDownRankFH >= 3 then SpellID = SpellIDsFH[3]; HealSize = 360*shMod+healMod15 end
		if healneed > (439*shMod+healMod15)*k and ManaLeft >= 215 and maxRankFH >=4 and quickHealDownRankFH >= 4 then SpellID = SpellIDsFH[4]; HealSize = 439*shMod+healMod15 end
		if healneed > (567*shMod+healMod15)*k and ManaLeft >= 265 and maxRankFH >=5 and quickHealDownRankFH >= 5 then SpellID = SpellIDsFH[5]; HealSize = 567*shMod+healMod15 end
		if healneed > (704*shMod+healMod15)*k and ManaLeft >= 315 and maxRankFH >=6 and quickHealDownRankFH >= 6 then SpellID = SpellIDsFH[6]; HealSize = 704*shMod+healMod15 end
		if healneed > (885*shMod+healMod15)*k and ManaLeft >= 380 and maxRankFH >=7 and quickHealDownRankFH >= 7 then SpellID = SpellIDsFH[7]; HealSize = 885*shMod+healMod15 end

	-- Healmode 3
	elseif quickHealHealMode == 3 then
		--writePriestLine("quickHealHealMode 3")
		local SpellIDNH = 0
		local SpellIDFH = 0
		local HealSizeNH = 0
		local HealSizeFH = 0
		local HealSizePoH = 0
		local SpellIDGrp = 0

		--Check NormalHeal
		SpellIDNH = SpellIDsLH[1]; HealSizeNH = 53*shMod+healMod15*PF1; -- Default to LH
		if healneed > (  84*shMod+healMod20*PF4) *k and ManaLeft >=  45*ihMod and maxRankLH >=2 and quickHealDownRankNH >= 2  then SpellIDNH = SpellIDsLH[2]; HealSizeNH =   84*shMod+healMod20*PF4  end
		if healneed > ( 154*shMod+healMod25*PF10)*K and ManaLeft >=  75*ihMod and maxRankLH >=3 and quickHealDownRankNH >= 3  then SpellIDNH = SpellIDsLH[3]; HealSizeNH =  154*shMod+healMod25*PF10 end
		if healneed > ( 318*shMod+healMod30*PF18)*K and ManaLeft >= 155*ihMod and maxRankH  >=1 and quickHealDownRankNH >= 4  then SpellIDNH = SpellIDsH[1] ; HealSizeNH =  318*shMod+healMod30*PF18 end
		if healneed > ( 460*shMod+healMod30)*K      and ManaLeft >= 205*ihMod and maxRankH  >=2 and quickHealDownRankNH >= 5  then SpellIDNH = SpellIDsH[2] ; HealSizeNH =  460*shMod+healMod30      end
		if healneed > ( 604*shMod+healMod30)*K      and ManaLeft >= 255*ihMod and maxRankH  >=3 and quickHealDownRankNH >= 6  then SpellIDNH = SpellIDsH[3] ; HealSizeNH =  604*shMod+healMod30      end
		if healneed > ( 758*shMod+healMod30)*K      and ManaLeft >= 305*ihMod and maxRankH  >=4 and quickHealDownRankNH >= 7  then SpellIDNH = SpellIDsH[4] ; HealSizeNH =  758*shMod+healMod30      end
		if healneed > ( 956*shMod+healMod30)*K      and ManaLeft >= 370*ihMod and maxRankGH >=1 and quickHealDownRankNH >= 8  then SpellIDNH = SpellIDsGH[1]; HealSizeNH =  956*shMod+healMod30      end
		if healneed > (1219*shMod+healMod30)*K      and ManaLeft >= 455*ihMod and maxRankGH >=2 and quickHealDownRankNH >= 9  then SpellIDNH = SpellIDsGH[2]; HealSizeNH = 1219*shMod+healMod30      end
		if healneed > (1523*shMod+healMod30)*K      and ManaLeft >= 545*ihMod and maxRankGH >=3 and quickHealDownRankNH >= 10 then SpellIDNH = SpellIDsGH[3]; HealSizeNH = 1523*shMod+healMod30      end
		if healneed > (1902*shMod+healMod30)*K      and ManaLeft >= 655*ihMod and maxRankGH >=4 and quickHealDownRankNH >= 11 then SpellIDNH = SpellIDsGH[4]; HealSizeNH = 1902*shMod+healMod30      end
		if healneed > (2080*shMod+healMod30)*K      and ManaLeft >= 710*ihMod and maxRankGH >=5 and quickHealDownRankNH >= 12 then SpellIDNH = SpellIDsGH[5]; HealSizeNH = 2080*shMod+healMod30      end

		--Check Flash Heal
		SpellIDFH = SpellIDsFH[1]; HealSizeFH = 215*shMod+healMod15; -- Default to FH
		if healneed > (286*shMod+healMod15)*k and ManaLeft >= 155 and maxRankFH >=2 and quickHealDownRankFH >= 2 then SpellIDFH = SpellIDsFH[2]; HealSizeFH = 286*shMod+healMod15 end
		if healneed > (360*shMod+healMod15)*k and ManaLeft >= 185 and maxRankFH >=3 and quickHealDownRankFH >= 3 then SpellIDFH = SpellIDsFH[3]; HealSizeFH = 360*shMod+healMod15 end
		if healneed > (439*shMod+healMod15)*k and ManaLeft >= 215 and maxRankFH >=4 and quickHealDownRankFH >= 4 then SpellIDFH = SpellIDsFH[4]; HealSizeFH = 439*shMod+healMod15 end
		if healneed > (567*shMod+healMod15)*k and ManaLeft >= 265 and maxRankFH >=5 and quickHealDownRankFH >= 5 then SpellIDFH = SpellIDsFH[5]; HealSizeFH = 567*shMod+healMod15 end
		if healneed > (704*shMod+healMod15)*k and ManaLeft >= 315 and maxRankFH >=6 and quickHealDownRankFH >= 6 then SpellIDFH = SpellIDsFH[6]; HealSizeFH = 704*shMod+healMod15 end
		if healneed > (885*shMod+healMod15)*k and ManaLeft >= 380 and maxRankFH >=7 and quickHealDownRankFH >= 7 then SpellIDFH = SpellIDsFH[7]; HealSizeFH = 885*shMod+healMod15 end

		--Check Prayer of Heal
		writePriestLine(L["healneedGrp: "] .. healneedGrp)
		SpellIDGrp = SpellIDPoH[1]; HealSizePoH = 0
		if healneedGrp > (311*shMod+healMod30/2 ) *k and ManaLeft  >=  410  and maxRankPoH >=1 and quickHealDownRankNH >= 8  then SpellIDGrp = SpellIDPoH[1]; HealSizePoH =   311*shMod+healMod30/2 end
		if healneedGrp > (458*shMod+healMod30/2 ) *k and ManaLeft  >=  560  and maxRankPoH >=1 and quickHealDownRankNH >= 9  then SpellIDGrp = SpellIDPoH[2]; HealSizePoH =   458*shMod+healMod30/2 end
		if healneedGrp > (676*shMod+healMod30/2 ) *k and ManaLeft  >=  770  and maxRankPoH >=1 and quickHealDownRankNH >= 10 then SpellIDGrp = SpellIDPoH[3]; HealSizePoH =   676*shMod+healMod30/2 end
		if healneedGrp > (965*shMod+healMod30/2 ) *k and ManaLeft  >=  1030 and maxRankPoH >=1 and quickHealDownRankNH >= 11 then SpellIDGrp = SpellIDPoH[4]; HealSizePoH =   965*shMod+healMod30/2 end
		if healneedGrp > (1070*shMod+healMod30/2) *k and ManaLeft >=   1070 and maxRankPoH >=1 and quickHealDownRankNH >= 12 then SpellIDGrp = SpellIDPoH[5]; HealSizePoH =  1070*shMod+healMod30/2 end


		--writePriestLine("HealSize_FH " .. HealSizeFH)
		--writePriestLine("HealSize_NH " .. HealSizeNH)
		--writePriestLine("HealSize_PoH " .. HealSizePoH * partyPlayersToHeal)
		--writePriestLine("SpellIDNH: " .. SpellIDNH)
		--writePriestLine("SpellIDFH: " .. SpellIDFH)
		--writePriestLine("SpellIDPoH: " .. SpellIDGrp)
		local HealHPS = (HealSizeNH / 2.5)
		local HPS_FH = HealSizeFH / 1.5
		local HPS_PoH = ((HealSizePoH * partyPlayersToHeal)/3)
		if HealSizeNH then
		SpellID = SpellIDNH
		--writePriestLine("Set SpellID: " ..SpellID .. " from SpellIDNH " .. SpellIDNH)
		HealSize = HealSizeNH
		writePriestLine(L["HealSizePoH: "] .. HealSizePoH .. L[", in PoH Range: "] .. partyPlayersToHeal)
		writePriestLine(L["HPS_NH: "] .. HealHPS)
		writePriestLine(L["HPS_FH: "] .. HPS_FH)
		writePriestLine(L["HPS_PoH: "] .. HPS_PoH)  
		--writePriestLine(HPS_FH .. " > " .. HealHPS)
	end
	if HPS_FH > HealHPS then
		SpellID = SpellIDFH
		--writePriestLine("Set SpellID: " .. SpellID .. " from SpellIDFH " .. SpellIDFH)
		writePriestLine(L["USING FH"])
		HealSize = HealSizeFH
	end
	if HPS_PoH > HealHPS then
		writePriestLine(L["USING POH"])
		SpellID = SpellIDGrp
		writePriestLine(L["Set SpellID: "] .. SpellID .. L[" from SpellIDGrp "] .. SpellIDGrp)
		HealSize = HealSizePoH
	end

	--QuickHealHealInfoFrameFontstring:SetText("HPS_NH: " .. math.floor(HealHPS) .. " | HPS_FH: " .. math.floor(HPS_FH) .. " | HPS_PoH: " .. math.floor(HPS_PoH))
	end
	writePriestLine(L["Final SpellID: "] .. SpellID)
	return SpellID,HealSize*HDB;
end
