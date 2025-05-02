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
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_CCOGM_ERA", 15, nil, "Hissa_Loop", 0)
        end

        if self.entry_time <= 5 then

            StoryUtil.SetPlanetRestricted("BYSS", 1)
            StoryUtil.SetPlanetRestricted("THE_MAW", 1)
            StoryUtil.SetPlanetRestricted("KATANA_SPACE", 1)

            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Praetor",
                "Eidolon",
                "Beta_ETR_3_Squadron",
                "TaggeCo_HQ",
                "Imperial_AT_PT_Company",
                -- Historical-only units
                "Imperial_Navy_Commando_Squad"
            }, false)
            
            UnitUtil.SetLockList("EMPIRE", {
                "YE_4_Squadron",
                "Imperial_PX10_Company",
                "Imperial_TNT_Company",
				"Scimitar_Squadron_Location_Set"
            })
    
        else

            StoryUtil.SetPlanetRestricted("THYFERRA", 0)
            StoryUtil.SetPlanetRestricted("KESSEL", 0)

            if self.Active_Planets["KESSEL"] then
                local planet = FindPlanet("Kessel")
                if planet.Get_Owner() ~= Find_Player("Neutral") then
                    ChangePlanetOwnerAndReplace(planet, Find_Player("Empire"))
                end
            end

            self.IsardSpawns = require("eawx-mod-icw/spawn-sets/EraTwoIsardProgressSetWarlord")
            for planet, spawnlist in pairs(self.IsardSpawns) do
                StoryUtil.SpawnAtSafePlanet(planet, Find_Player("Warlords"), self.Active_Planets, spawnlist)  
            end

            UnitUtil.SetLockList("EMPIRE", {
                "Eidolon",
                "Beta_ETR_3_Squadron",
                "Imperial_AT_PT_Company",
                "Rebuild_Brashin"
            }, false)
                
            UnitUtil.SetLockList("EMPIRE", {
                "Strike_Cruiser",
                "YE_4_Squadron",
                "Imperial_PX10_Company",
                "Imperial_TNT_Company"
            })

            UnitUtil.DespawnList{
                "Dummy_Regicide_CCoGM",
            }

            --Leaving Pestage causes Fel/181st and Broadside [if you haven't picked Isard] to exit; Phennir/181st and Fel/Gray to enter
            UnitUtil.SetLockList("EMPIRE", {
                "Soontir_Fel_181st_Location_Set",
                "Shadow_Squadron_Location_Set"
            }, false)
            Upgrade_Fighter_Hero("SOONTIR_FEL_181ST_SQUADRON","TURR_PHENNIR_TIE_INTERCEPTOR_181ST_SQUADRON")
            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)
            UnitUtil.SetLockList("EMPIRE", {
                "Turr_Phennir_TIE_Interceptor_Location_Set",
				"Scimitar_Squadron_Location_Set"
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
        for planet, herolist in pairs(self.Starting_Spawns["CCOGM"]) do
            for _, hero_table in pairs(herolist) do
                if starting_era == false and hero_table.progress == false then

                else
                    StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end
        for planet, herolist in pairs(self.Starting_Spawns["PESTAGE"]) do
            for _, hero_table in pairs(herolist) do
                if hero_table.remove_ccogm == true then
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
        if (self.current_time >= 60) and (self.LeaderApproach == false) then
            self.LeaderApproach = true
            if Find_Player("local") == Find_Player("Empire") then
                StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_THRAWN_CONTACT", 15, nil, "Thrawn_Loop", 0)

                local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
                local regime_display_event = plot.Get_Event("Thrawn_Request_Dialog")

                regime_display_event.Add_Dialog_Text("TEXT_CAMPAIGN_EVENT_PROGRESS_THRAWN_HERO_LOSS")
                for planet, herolist in pairs(self.Starting_Spawns["CCOGM"]) do  
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