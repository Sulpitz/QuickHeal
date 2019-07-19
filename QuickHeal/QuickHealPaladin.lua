local L                 = AceLibrary("AceLocale-2.2"):new("QuickHeal")
local BS                = AceLibrary("Babble-Spell-2.2")

function QuickHeal_Paladin_GetRatioHealthyExplanation()
    local RatioHealthy = QuickHeal_GetRatioHealthy();
    local RatioFull = QuickHealVariables["RatioFull"];

    if RatioHealthy >= RatioFull then
        return BS['Holy Light'] .. L[" will never be used in combat. "];
    else
        if RatioHealthy > 0 then
            return BS['Holy Light'] .. L[" will only be used in combat if the target has more than "] .. RatioHealthy*100 .. L["% life, and only if the healing done is greater than the greatest "] .. BS['Flash of Light'] .. L[" available. "];          
        else
            return BS['Holy Light'] .. L[" will only be used in combat if the healing done is greater than the greatest "] .. BS['Flash of Light'] .. L[" available. "];         
        end
    end
end

function QuickHeal_Paladin_SetDownrankGUI()
-- convert default (priest) downrank window to Paladin with only FH Slider shown
        --QuickHealDownrank_Slider_NH:Hide();
        --QuickHealDownrank_RankNumberTop:Hide();
        --QuickHealDownrank_MarkerTop:Hide()
        --QuickHealDownrank_MarkerBot:Hide()
        --QuickHeal_DownrankSlider:SetHeight(40)
        --QuickHealDownrank_Slider_FH:SetPoint("TOPLEFT", 20, -10)
        QuickHealDownrank_MarkerTop:Hide()
        QuickHealDownrank_MarkerBot:Show()
        QuickHealDownrank_Slider_FH:SetMinMaxValues(1,6);
        QuickHealDownrank_Slider_FH:SetValue(6)
        QuickHealDownrank_Slider_NH:SetMinMaxValues(1,9)
        QuickHealDownrank_Slider_NH:SetValue(9)
        --QuickHealDownrank_RankNumberBot:SetPoint("CENTER", 108, 1)

end


function QuickHeal_Paladin_FindSpellToUse(Target)
    local SpellID = nil;
    local HealSize = 0;

    -- +Healing-PenaltyFactor = (1-((20-LevelLearnt)*0.0375)) for all spells learnt before level 20
    local PF1 = 0.2875;
    local PF6 = 0.475;
    local PF14 = 0.775;

    -- Local aliases to access main module functionality and settings
    local RatioFull = QuickHealVariables["RatioFull"];
    local RatioHealthy = QuickHeal_GetRatioHealthy();
    local UnitHasHealthInfo = QuickHeal_UnitHasHealthInfo;
    local EstimateUnitHealNeed = QuickHeal_EstimateUnitHealNeed;
    local GetSpellIDs = QuickHeal_GetSpellIDs;
    local debug = QuickHeal_debug;

    -- Return immediatly if no player needs healing
    if not Target then
        return SpellID,HealSize;
    end

    -- Determine health and healneed of target
    local healneed;
    local Health;

    if UnitHasHealthInfo(Target) then
        -- Full info available
        healneed = UnitHealthMax(Target) - UnitHealth(Target) - HealComm:getHeal(UnitName(Target)); -- Implementatio for HealComm
        Health = UnitHealth(Target) / UnitHealthMax(Target);
    else
        -- Estimate target health
        healneed = EstimateUnitHealNeed(Target,true);
        Health = UnitHealth(Target)/100;
    end

    -- if BonusScanner is running, get +Healing bonus
    local Bonus = 0;
    if (BonusScanner) then
        Bonus = tonumber(BonusScanner:GetBonus("HEAL"));
        debug(string.format(L["Equipment Healing Bonus: %d"], Bonus));
    end

    -- Calculate healing bonus
    local healMod15 = (1.5/3.5) * Bonus;
    local healMod25 = (2.5/3.5) * Bonus;
    debug(L["Final Healing Bonus (1.5,2.5)"], healMod15,healMod25);

    local InCombat = UnitAffectingCombat('player') or UnitAffectingCombat(Target);

    -- Healing Light Talent (increases healing by 4% per rank)
    local _,_,_,_,talentRank,_ = GetTalentInfo(1,5); 
    local hlMod = 4*talentRank/100 + 1;
    debug(string.format(L["Healing Light talentmodification: %f"], hlMod))

    local TargetIsHealthy = Health >= RatioHealthy;
    local ManaLeft = UnitMana('player');

    if TargetIsHealthy then
        debug(L["Target is healthy"],Health);
    end

	-- ** needs reimplementation
    ---- Detect proc of 'Hand of Edward the Odd' mace (next spell is instant cast)
	--local HandOfEdward = false
    --if QuickHeal_DetectBuff('player',"Spell_Holy_SearingLight") then
    --    debug("BUFF: Hand of Edward the Odd (Healmode 3 forced)");
    --    HandOfEdward = true
    --end
    
    -- Get total healing modifier (factor) caused by healing target debuffs
    local HDB = QuickHeal_GetHealModifier(Target);
    debug(L["Target debuff healing modifier"],HDB);
    healneed = healneed/HDB;

    -- Get a list of ranks available of 'Lesser Healing Wave' and 'Healing Wave'
    local SpellIDsHL = GetSpellIDs(BS['Holy Light']);
    local SpellIDsFL = GetSpellIDs(BS['Flash of Light']);
    local maxRankHL = table.getn(SpellIDsHL);
    local maxRankFL = table.getn(SpellIDsFL);
    local NoFL = maxRankFL < 1;
    debug(string.format(L["Found HL up to rank %d, and found FL up to rank %d"], maxRankHL, maxRankFL))

    
    
    -- below changed to not differentiate between in or out if combat. Original code down below
    -- Find suitable SpellID based on the defined criteria
    local k = 1;
    local K = 1;
    if InCombat then
        local k = 0.9; -- In combat means that target is loosing life while casting, so compensate           
        local K = 0.8; -- k for fast spells (LHW and HW Rank 1 and 2) and K for slow spells (HW)            3 = 4 | 3 < 4 | 3 > 4
    end
    
--DEFAULT_CHAT_FRAME:AddMessage("InCombat: " .. InCombat, r or 1, g or 1, b or 1)
	if quickHealHealMode == 3 then --and Health > RatioFullthen then
		local SpellIDNH = 0
		local SpellIDFH = 0
		local HealSizeNH = 0
		local HealSizeFH = 0    
		
		if maxRankFL >=1                                                                                         then SpellIDFH = SpellIDsFL[1]; HealSizeFH = 67 *hlMod+healMod15 else SpellID = SpellIDsHL[1]; HealSize = 43*hlMod+healMod25*PF1 end -- Default to rank 1 of FL or HL
        if healneed     > (103*hlMod+healMod15)     *k and ManaLeft >= 50  and maxRankFL >=2 and quickHealDownRankFH >= 2 then SpellIDFH = SpellIDsFL[2]; HealSizeFH = 103*hlMod+healMod15      end
        if healneed     > (154*hlMod+healMod15)     *k and ManaLeft >= 70  and maxRankFL >=3 and quickHealDownRankFH >= 3 then SpellIDFH = SpellIDsFL[3]; HealSizeFH = 154*hlMod+healMod15      end
        if healneed     > (209*hlMod+healMod15)     *k and ManaLeft >= 90  and maxRankFL >=4 and quickHealDownRankFH >= 4 then SpellIDFH = SpellIDsFL[4]; HealSizeFH = 209*hlMod+healMod15      end
        if healneed     > (283*hlMod+healMod15)     *k and ManaLeft >= 115 and maxRankFL >=5 and quickHealDownRankFH >= 5 then SpellIDFH = SpellIDsFL[5]; HealSizeFH = 283*hlMod+healMod15      end
        if healneed     > (363*hlMod+healMod15)     *k and ManaLeft >= 140 and maxRankFL >=6 and quickHealDownRankFH >= 6 then SpellIDFH = SpellIDsFL[6]; HealSizeFH = 363*hlMod+healMod15      end	
		
																													  SpellIDNH = SpellIDsHL[1]; HealSizeNH =  43 *hlMod+healMod25*PF1
		if healneed     > ( 83*hlMod+healMod25*PF6 )*K and ManaLeft >= 60  and maxRankHL >=2 and quickHealDownRankNH >= 2 then SpellIDNH = SpellIDsHL[2]; HealSizeNH =  83 *hlMod+healMod25*PF6  end
        if healneed     > (173*hlMod+healMod25*PF14)*K and ManaLeft >= 110 and maxRankHL >=3 and quickHealDownRankNH >= 3 then SpellIDNH = SpellIDsHL[3]; HealSizeNH = 173 *hlMod+healMod25*PF14 end
        if healneed     > (333*hlMod+healMod25)     *K and ManaLeft >= 190 and maxRankHL >=4 and quickHealDownRankNH >= 4 then SpellIDNH = SpellIDsHL[4]; HealSizeNH = 333 *hlMod+healMod25      end
        if healneed     > (522*hlMod+healMod25)     *K and ManaLeft >= 275 and maxRankHL >=5 and quickHealDownRankNH >= 5 then SpellIDNH = SpellIDsHL[5]; HealSizeNH = 522 *hlMod+healMod25      end
        if healneed     > (739*hlMod+healMod25)     *K and ManaLeft >= 365 and maxRankHL >=6 and quickHealDownRankNH >= 6 then SpellIDNH = SpellIDsHL[6]; HealSizeNH = 739 *hlMod+healMod25      end
        if healneed     > (999*hlMod+healMod25)     *K and ManaLeft >= 465 and maxRankHL >=7 and quickHealDownRankNH >= 7 then SpellIDNH = SpellIDsHL[7]; HealSizeNH = 999 *hlMod+healMod25      end
        if healneed     > (1317*hlMod+healMod25)    *K and ManaLeft >= 580 and maxRankHL >=8 and quickHealDownRankNH >= 8 then SpellIDNH = SpellIDsHL[8]; HealSizeNH = 1317*hlMod+healMod25      end
        if healneed     > (1680*hlMod+healMod25)    *K and ManaLeft >= 660 and maxRankHL >=9 and quickHealDownRankNH >= 9 then SpellIDNH = SpellIDsHL[9]; HealSizeNH = 1680*hlMod+healMod25      end
	
		if (HealSizeFH / 1.5) > (HealSizeNH / 2.5) then
			SpellID = SpellIDFH
			HealSize = HealSizeFH
		else
			SpellID = SpellIDNH
			HealSize = HealSizeNH
		end
    DEFAULT_CHAT_FRAME:AddMessage(L["Compare: FH "] .. math.ceil(HealSizeFH / 1.5) .. L[" to NH "] .. math.ceil(HealSizeNH / 2.5), r or 1, g or 1, b or 1)
		return SpellID,HealSize*HDB
		
	elseif quickHealHealMode == 1 or InCombat == false then --or Health < RatioFullthen then 164: attempt to compare number with nil
		if maxRankFL >=1                                                                                         then SpellID = SpellIDsFL[1]; HealSize = 67 *hlMod+healMod15 else SpellID = SpellIDsHL[1]; HealSize = 43*hlMod+healMod25*PF1 end -- Default to rank 1 of FL or HL
        if healneed     > (103*hlMod+healMod15)     *k and ManaLeft >= 50  and maxRankFL >=2 and quickHealDownRankFH >= 2 then SpellID = SpellIDsFL[2]; HealSize = 103*hlMod+healMod15      end
        if healneed     > (154*hlMod+healMod15)     *k and ManaLeft >= 70  and maxRankFL >=3 and quickHealDownRankFH >= 3 then SpellID = SpellIDsFL[3]; HealSize = 154*hlMod+healMod15      end
        if healneed     > (209*hlMod+healMod15)     *k and ManaLeft >= 90  and maxRankFL >=4 and quickHealDownRankFH >= 4 then SpellID = SpellIDsFL[4]; HealSize = 209*hlMod+healMod15      end
        if healneed     > (283*hlMod+healMod15)     *k and ManaLeft >= 115 and maxRankFL >=5 and quickHealDownRankFH >= 5 then SpellID = SpellIDsFL[5]; HealSize = 283*hlMod+healMod15      end
        if healneed     > (363*hlMod+healMod15)     *k and ManaLeft >= 140 and maxRankFL >=6 and quickHealDownRankFH >= 6 then SpellID = SpellIDsFL[6]; HealSize = 363*hlMod+healMod15      end	
		return SpellID,HealSize*HDB
		
	elseif quickHealHealMode == 2 then
																													  SpellID = SpellIDsHL[1]; HealSize =  43 *hlMod+healMod25*PF1
		if healneed     > ( 83*hlMod+healMod25*PF6 )*K and ManaLeft >= 60  and maxRankHL >=2 and quickHealDownRankNH >= 2 then SpellID = SpellIDsHL[2]; HealSize =  83 *hlMod+healMod25*PF6  end
        if healneed     > (173*hlMod+healMod25*PF14)*K and ManaLeft >= 110 and maxRankHL >=3 and quickHealDownRankNH >= 3 then SpellID = SpellIDsHL[3]; HealSize = 173 *hlMod+healMod25*PF14 end
        if healneed     > (333*hlMod+healMod25)     *K and ManaLeft >= 190 and maxRankHL >=4 and quickHealDownRankNH >= 4 then SpellID = SpellIDsHL[4]; HealSize = 333 *hlMod+healMod25      end
        if healneed     > (522*hlMod+healMod25)     *K and ManaLeft >= 275 and maxRankHL >=5 and quickHealDownRankNH >= 5 then SpellID = SpellIDsHL[5]; HealSize = 522 *hlMod+healMod25      end
        if healneed     > (739*hlMod+healMod25)     *K and ManaLeft >= 365 and maxRankHL >=6 and quickHealDownRankNH >= 6 then SpellID = SpellIDsHL[6]; HealSize = 739 *hlMod+healMod25      end
        if healneed     > (999*hlMod+healMod25)     *K and ManaLeft >= 465 and maxRankHL >=7 and quickHealDownRankNH >= 7 then SpellID = SpellIDsHL[7]; HealSize = 999 *hlMod+healMod25      end
        if healneed     > (1317*hlMod+healMod25)    *K and ManaLeft >= 580 and maxRankHL >=8 and quickHealDownRankNH >= 8 then SpellID = SpellIDsHL[8]; HealSize = 1317*hlMod+healMod25      end
        if healneed     > (1680*hlMod+healMod25)    *K and ManaLeft >= 660 and maxRankHL >=9 and quickHealDownRankNH >= 9 then SpellID = SpellIDsHL[9]; HealSize = 1680*hlMod+healMod25      end
		return SpellID,HealSize*HDB	
	end
end