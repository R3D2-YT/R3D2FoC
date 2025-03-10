require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("eawx-util/ChangeOwnerUtilities")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)

        self.LeaderApproach = false
        self.LeadingEmpire = GlobalValue.Get("IMPERIAL_REMNANT")
        self.progress_fired = true
        GlobalValue.Set("REGIME_INDEX", 4)
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.DarkEmpireUnits =  {
            "Eclipse_Star_Destroyer",
            "Sovereign",
            "MTC_Sensor",
            "MTC_Support",
            "TaggeCo_HQ",
            "Hunter_Killer_Probot",
            "Imperial_XR85_Company",
            "Imperial_Chrysalide_Company",
            "Imperial_Dark_Jedi_Squad",
            "Imperial_Dark_Stormtrooper_Squad",
            "Imperial_Compforce_Assault_Squad"}
 

        Find_Player(self.LeadingEmpire).Lock_Tech(Find_Object_Type("Dummy_Regicide_Palpatine"))

        if Find_Player("local") == Find_Player("Empire") then
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_PALPATINE_ERA", 15, nil, "Palpatine_Reborn_Loop", 0)
        end
        
        if Find_Player(self.LeadingEmpire) == Find_Player("EMPIRE") then
            Find_Player("Empire").Lock_Tech(Find_Object_Type("Dummy_Regicide_Thrawn"))
            Find_Player("Empire").Lock_Tech(Find_Object_Type("Project_Ambition_Dummy"))
            Find_Player("Empire").Lock_Tech(Find_Object_Type("Dummy_Regicide_CCoGM"))       
        end

        Story_Event("PALPATINE_REQUEST_COMPLETED")
        Story_Event("GC_CORUSCANT_EVAC_LONG")

        if self.entry_time <= 5 then

            StoryUtil.SetPlanetRestricted("THE_MAW", 1)

            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Executor",
                "Eidolon",
                "Imperial_PX10_Company",
                  -- Historical-only units
                "Imperial_Navy_Commando_Squad"
            }, false)
            
            if Find_Player("local") == Find_Player("Empire") then
                Story_Event("PALPATINE_WELCOME")
            end

            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)
            Set_To_First_Extant_Host("WEDGE_ROGUES_LOCATION_SET", Find_Player("Rebel"), true)

        else

            StoryUtil.SetPlanetRestricted("BYSS", 0)
            StoryUtil.SetPlanetRestricted("THYFERRA", 0)
            StoryUtil.SetPlanetRestricted("KESSEL", 0)
            StoryUtil.SetPlanetRestricted("KATANA_SPACE", 0)

            if self.Active_Planets["BYSS"] then
                local planet = FindPlanet("Byss")
                if planet.Get_Owner() ~= Find_Player(self.LeadingEmpire) then
                    ChangePlanetOwnerAndRetreat(planet, Find_Player(self.LeadingEmpire))
                end
            end
        
                local spawn_list_Palpatine = {
                    "Dark_Empire_Cloning_Facility"
                }
        
                if Find_Player(self.LeadingEmpire) ~= Find_Player("local") then
                    spawn_list_Palpatine = {
                            -- "Empire_Shipyard_Level_Four",
                            -- "Empire_Star_Base_4",
                            -- "Empire_MoffPalace",
                            -- "E_Ground_Barracks",
                            -- "E_Ground_Light_Vehicle_Factory",
                            -- "E_Ground_Heavy_Vehicle_Factory",
                            -- "E_Ground_Advanced_Vehicle_Factory",
                            -- "Ground_Hypervelocity_Gun",
                            "Dark_Empire_Cloning_Facility",
                            "Imperial_Stormtrooper_Squad",
                            "Imperial_Stormtrooper_Squad",
                            "Imperial_AT_ST_Company",
                            "Imperial_AT_PT_Company",
                            "Imperial_IDT_Group",
                            "Imperial_Century_Tank_Company",
                            "Imperial_AT_AT_Company",
                            "Imperial_XR85_Company",
                            "WORLD_DEVASTATOR_BATTLECRUISER",
                            "WORLD_DEVASTATOR_BATTLECRUISER",
                            "Generic_Star_Destroyer",
                            "Generic_Procursator",
                            "Generic_Procursator",
                            "MTC_Support",
                            "MTC_Support",
                            "Generic_Acclamator_Assault_Ship_Leveler",
                            "Generic_Acclamator_Assault_Ship_Leveler",
                            "Vindicator_Cruiser",   
                            "Vindicator_Cruiser",   
                            "Vindicator_Cruiser",   
                            "Victory_II_Frigate",
                            "Victory_II_Frigate",
                            "Raider_Corvette",
                            "Raider_Corvette",
                            "Raider_Corvette",
                            "Raider_Corvette",
                            "Raider_Corvette",
                            "Raider_Corvette",
                            "Raider_Corvette",     
                            "Raider_Corvette",
                            "CR90_Zsinj",
                            "CR90_Zsinj",
                            "CR90_Zsinj",
                            "CR90_Zsinj",
                            "CR90_Zsinj",
                            "CR90_Zsinj"
                    }
                end
                StoryUtil.SpawnAtSafePlanet("BYSS", Find_Player(self.LeadingEmpire), self.Active_Planets, spawn_list_Palpatine)  
                
                UnitUtil.SetLockList("EMPIRE", {
                    "Generic_Praetor"
                })

                UnitUtil.DespawnList{
                    "Dummy_Regicide_Palpatine"
                }    
            
                UnitUtil.SetLockList(self.LeadingEmpire, self.DarkEmpireUnits)
            
        end
        
        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["PALPATINE"]) do
            for _, hero_table in pairs(herolist) do
                if starting_era == false and hero_table.progress == false then

                else
                    StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end

        local Grath = Find_First_Object("Grath_Stormtrooper")
            
        if TestValid(Grath) then
            if Find_Player(self.LeadingEmpire) == Grath.Get_Owner() then
                UnitUtil.ReplaceAtLocation("Grath_Stormtrooper", "Grath_Dark_Stormtrooper_Team")
            end
        end
        
        local Veers = Find_First_Object("Veers_AT_AT_Walker")
        if TestValid(Veers) then
            if Find_Player(self.LeadingEmpire) == Veers.Get_Owner() then
                UnitUtil.ReplaceAtLocation("Veers_AT_AT_Walker", "Veers_Chariot_Team")
            end
        end
    end,
    on_update = function(self, state_context)
        self.current_time = GetCurrentTime() - self.entry_time
        if (self.current_time >= 60) and (self.LeaderApproach == false) and (self.current_time - self.entry_time) <= 402 then
            self.LeaderApproach = true
            if Find_Player("local") == Find_Player(self.LeadingEmpire) then
                StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_JAX_CONTACT", 15, nil, nil, 0)

                local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
                local regime_display_event = plot.Get_Event("Jax_Request_Dialog")

                regime_display_event.Add_Dialog_Text("TEXT_CAMPAIGN_EVENT_PROGRESS_JAX_LOSS_HERO")
                for planet, herolist in pairs(self.Starting_Spawns["PALPATINE"]) do  
                    for _, hero_table in pairs(herolist) do
                        if hero_table.remove == true then     
                            regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
                        end
                    end
                end
                Story_Event("JAX_REQUEST_STARTED")
                Find_Player(self.LeadingEmpire).Unlock_Tech(Find_Object_Type("Dummy_Regicide_Jax"))

            end
        end
    end,
    on_exit = function(self, state_context)

        local LeadingEmpire = GlobalValue.Get("IMPERIAL_REMNANT")
        local despawn_list = {
            "Dark_Empire_Cloning_Facility",
            "Klev_Battlecruiser_Devastator"
        }
    
        local checkobject = nil
        for _, object in pairs(despawn_list) do
            checkObject = Find_First_Object(object)
            if TestValid(checkObject) then
                checkObject.Despawn()
            end
        end

        UnitUtil.SetLockList(LeadingEmpire, {
            "Eclipse_Star_Destroyer",
            "Sovereign",
            "TaggeCo_HQ",
            "Hunter_Killer_Probot",
            "Imperial_Chrysalide_Company",
            "Imperial_Dark_Jedi_Squad",
            "Imperial_Dark_Stormtrooper_Squad",
            "Imperial_Compforce_Assault_Squad"
        }, false)

        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["PALPATINE"]) do
            for _, hero_table in pairs(herolist) do
                if hero_table.remove == true then
                    local target_object = Find_First_Object(hero_table.object)
                    if hero_table.override then
                        target_object = Find_First_Object(hero_table.override)
                    end
                    if TestValid(target_object) then
                        target_object.Despawn()
                    end
                end
            end
        end

    end
}