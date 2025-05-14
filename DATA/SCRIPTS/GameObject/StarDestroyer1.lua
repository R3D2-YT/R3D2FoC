-- $Id: //depot/Projects/StarWars/Run/Data/Scripts/GameObject/StarDestroyer1.lua#1 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--              $File: //depot/Projects/StarWars/Run/Data/Scripts/GameObject/StarDestroyer1.lua $
--
--    Original Author: R3D2
--
--            $Author: R3D2 $
--
--            $Change: 1 $
--
--          $DateTime: 2025/13/5 18:04 $
--
--          $Revision: #1 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

 

function Definitions() 

    ServiceRate = 5.0 

 

    FighterGroup = nil 

	HeavyFighterGroup = nil 

    BomberGroup = nil 

	HeavyBomberGroup = nil 

	InterceptorGroup = nil 

 

    MaxFighterCount = 6

	MaxHeavyFighterCount = 4

    MaxBomberCount = 5

	MaxHeavyBomberCount = 0

	MaxInterceptorCount = 0

 

    FighterCount = 0 

	HeavyFighterCount = 0 

    BomberCount = 0 

	HeavyBomberCount = 0 

	InterceptorCount = 0 

 

    FighterType = nil 

	HeavyFighterType = nil 

    BomberType = nil 

	HeavyBomberType = nil 

	InterceptorType = nil

end 

 

function On_Enter_Space() 

    local faction = Object.Get_Owner().Get_Faction_Name() 

 

    if faction == "EMPIRE" then 

        FighterType =  Find_Object_Type("TIE_Fighter_Squadron") 

		HeavyFighterType =  Find_Object_Type("TIE_Brute_Squadron") 

		InterceptorType =  Find_Object_Type("TIE_Interceptor_Squadron") 

        BomberType = Find_Object_Type("TIE_Bomber_Squadron") 

		HeavyBomberType = Find_Object_Type("TIE_Heavy_Bomber_Squadron")

	if faction == "ERIADU" then 

        FighterType =  Find_Object_Type("TIE_Fighter_Squadron") 

		HeavyFighterType =  Find_Object_Type("TIE_Brute_Squadron") 

		InterceptorType =  Find_Object_Type("TIE_Interceptor_Squadron") 

        BomberType = Find_Object_Type("TIE_Bomber_Squadron") 

		HeavyBomberType = Find_Object_Type("TIE_Heavy_Bomber_Squadron")

 

    elseif faction == "REBEL" then 

        FighterType = Find_Object_Type("Z95_Headhunter_Rebel_Squadron") 

		HeavyFighterType =  Find_Object_Type("Rebel_X-Wing_Squadron") 

		InterceptorType =  Find_Object_Type("A_Wing_Squadron") 

        BomberType = Find_Object_Type("Y-Wing_Squadron")  

		HeavyBomberType = Find_Object_Type("B-Wing_Squadron")

 

    elseif faction == "REPUBLIC" then 

        FighterType = Find_Object_Type("Z95_Headhunter_Rebel_Squadron") 

		HeavyFighterType =  Find_Object_Type("Rebel_X-Wing_Squadron") 

		InterceptorType =  Find_Object_Type("A_Wing_Squadron") 

        BomberType = Find_Object_Type("Y-Wing_Squadron")  

		HeavyBomberType = Find_Object_Type("B-Wing_Squadron")

 

    else 

        DebugMessage("Unknown faction: " .. tostring(faction)) 

    end 

 

    Register_Timer_Func(Initial_Launch, 2.0) 

end 

 

function Initial_Launch() 

    local position = Object.Get_Position() 

    local player = Object.Get_Owner() 

 

    if FighterType and FighterCount < MaxFighterCount then 

        local squad = Spawn_Unit(FighterType, position, player) 

        FighterGroup = squad[1] 

        Object.Attach_Child(FighterGroup) 

        FighterCount = FighterCount + 1 

    end 

	if HeavyFighterType and HeavyFighterCount < MaxHeavyFighterCount then 

        local squad = Spawn_Unit(FighterType, position, player) 

        HeavyFighterGroup = squad[1] 

        Object.Attach_Child(FighterGroup) 

        HeavyFighterCount = HeavyFighterCount + 1 

    end 

 

    if BomberType and BomberCount < MaxBomberCount then 

        local squad = Spawn_Unit(BomberType, position, player) 

        BomberGroup = squad[1] 

        Object.Attach_Child(BomberGroup) 

 

        BomberCount = BomberCount + 1 

    end 

end 

 

function Service() 

    local position = Object.Get_Position() 

    local player = Object.Get_Owner() 

 

    if (not FighterGroup or FighterGroup.Is_Dead()) and FighterCount < MaxFighterCount then 

        local squad = Spawn_Unit(FighterType, position, player) 

        FighterGroup = squad[1] 

        Object.Attach_Child(FighterGroup) 

        FighterCount = FighterCount + 1 

    end 

	if (not HeavyFighterGroup or HeavyFighterGroup.Is_Dead()) and HeavyFighterCount < MaxHeavyFighterCount then 

        local squad = Spawn_Unit(HeavyFighterType, position, player) 

        HeavyFighterGroup = squad[1] 

        Object.Attach_Child(HeavyFighterGroup) 

        HeavyFighterCount = HeavyFighterCount + 1 

    end 

 

    if (not BomberGroup or BomberGroup.Is_Dead()) and BomberCount < MaxBomberCount then 

        local squad =  

 

Spawn_Unit(BomberType, position, player) 

        BomberGroup = squad[1] 

        Object.Attach_Child(BomberGroup) 

        BomberCount = BomberCount + 1 

    end 

end 
