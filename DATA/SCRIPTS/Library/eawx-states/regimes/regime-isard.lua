require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("eawx-util/ChangeOwnerUtilities")

return {
    on_enter = function(self, state_context)

        self.LeaderApproach = false
        self.progress_fired = true
        GlobalValue.Set("REGIME_INDEX", 2)
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.progress = GlobalValue.Get("PROGRESS_REGIME")
        self.LeadingEmpire = Find_Player("Empire")

        self.LeadingEmpire.Lock_Tech(Find_Object_Type("Project_Ambition_Dummy"))
        self.LeadingEmpire.Lock_Tech(Find_Object_Type("Dummy_Regicide_CCoGM"))

        if self.Active_Planets["KALIST"] then
            if FindPlanet("KALIST").Get_Owner() == Find_Player("Warlords") then
                local spawn_list = {"Harrsk_Whirlwind"}
                SpawnList(spawn_list, FindPlanet("KALIST"), Find_Player("Warlords"), true, false)
            end
        end

        Story_Event("PROJECT_AMBITION_COMPLETED")

        if Find_Player("local") == self.LeadingEmpire then
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_YSANNE_ERA", 15, nil, "Isard_Loop", 0)
        end

        if self.entry_time <= 5 then

            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Praetor",
                "Eidolon",
                "TaggeCo_HQ",
                "Imperial_PX10_Company",
                -- Historical-only units
                "Imperial_Navy_Commando_Squad"
            }, false)
            
            UnitUtil.SetLockList("EMPIRE", {
                "Vessery_Stranger_Location_Set",
                "Shadow_Squadron_Location_Set"
            })
            
            if Find_Player("local") == Find_Player("Empire") then
                Story_Event("ISARD_WELCOME")
            end

            StoryUtil.SetPlanetRestricted("BYSS", 1)
            StoryUtil.SetPlanetRestricted("THE_MAW", 1)
            StoryUtil.SetPlanetRestricted("KATANA_SPACE", 1)
    
        else

            StoryUtil.SetPlanetRestricted("THYFERRA", 0)
            StoryUtil.SetPlanetRestricted("KESSEL", 0)

            if self.Active_Planets["THYFERRA"] then
                local planet = FindPlanet("Thyferra")
                if planet.Get_Owner() ~= Find_Player("Neutral") then
                        ChangePlanetOwnerAndReplace(planet, Find_Player("Empire"))
                end
            end

            self.CCoGMSpawns = require("eawx-mod-icw/spawn-sets/EraTwoCCoGMProgressSetWarlord")
            if self.Active_Planets["KESSEL"] then
                for planet, spawnlist in pairs(self.CCoGMSpawns) do
                    SpawnList(spawnlist, FindPlanet("Kessel"), Find_Player("Warlords"), true, false)  
                end
            end


            UnitUtil.SetLockList("EMPIRE", {
                "Eidolon"
            }, false)
                
            UnitUtil.SetLockList("EMPIRE", {
                "Strike_Cruiser",
                "Vessery_Stranger_Location_Set",
            })

            UnitUtil.DespawnList{
                "Project_Ambition_Dummy",
            }

            --Leaving Pestage causes Fel/181st to exit; Phennir/181st and Fel/Gray to enter
            UnitUtil.SetLockList("EMPIRE", {
                "Soontir_Fel_181st_Location_Set"
            }, false)
            Upgrade_Fighter_Hero("SOONTIR_FEL_181ST_SQUADRON","TURR_PHENNIR_TIE_INTERCEPTOR_181ST_SQUADRON")
            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)
            UnitUtil.SetLockList("EMPIRE", {
                "Turr_Phennir_TIE_Interceptor_Location_Set",
                "Vessery_Stranger_Location_Set"
            })

            UnitUtil.SetLockList("EMPIREOFTHEHAND", {
                "Soontir_Fel_Gray_Location_Set"
            })
            Set_To_First_Extant_Host("SOONTIR_FEL_GRAY_LOCATION_SET", Find_Player("Empireofthehand"))

            crossplot:publish("CHECK_ELIGIBILITY_FEL_CHILDREN")
            
        end

        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["ISARD"]) do
            for _, hero_table in pairs(herolist) do
                if starting_era == false and hero_table.progress == false then

                else
                    StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end
        for planet, herolist in pairs(self.Starting_Spawns["PESTAGE"]) do
            for _, hero_table in pairs(herolist) do
                if hero_table.remove_isard == true then
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

    end,
    on_update = function(self, state_context)
        self.current_time = GetCurrentTime() - self.entry_time
        if (self.current_time >= 60) and (self.LeaderApproach == false) and (self.progress == true) then
            self.LeaderApproach = true
            if Find_Player("local") == Find_Player("Empire") then
                StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_THRAWN_CONTACT", 15, nil, "Thrawn_Loop", 0)

                local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
                local regime_display_event = plot.Get_Event("Thrawn_Request_Dialog")
                
                regime_display_event.Add_Dialog_Text("TEXT_CAMPAIGN_EVENT_PROGRESS_THRAWN_HERO_LOSS")
                for planet, herolist in pairs(self.Starting_Spawns["ISARD"]) do  
                    for _, hero_table in pairs(herolist) do
                        if hero_table.remove == true then     
                            regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
                        end
                    end
                end

                Story_Event("THRAWN_REQUEST_STARTED")
                Find_Player("Empire").Unlock_Tech(Find_Object_Type("Dummy_Regicide_Thrawn"))
            end
        end
    end,
    on_exit = function(self, state_context)
    end
}