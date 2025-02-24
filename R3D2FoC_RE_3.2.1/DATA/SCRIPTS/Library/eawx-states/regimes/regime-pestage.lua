require("eawx-util/StoryUtil")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)

        self.IsardApproach = false
        self.HissaApproach = false
        self.progress_fired = false
        GlobalValue.Set("REGIME_INDEX", 1)
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.progress = GlobalValue.Get("PROGRESS_REGIME")
        self.LeadingEmpire = Find_Player("Empire")

        if Find_Player("local") == self.LeadingEmpire then
            StoryUtil.Multimedia("TEXT_CONQUEST_WARLORDS_IR_INTRO_PESTAGE", 15, nil, "Pestage_Loop", 0)
            Story_Event("PESTAGE_WELCOME")
        end

        StoryUtil.SetPlanetRestricted("BYSS", 1)
        StoryUtil.SetPlanetRestricted("THE_MAW", 1)
        StoryUtil.SetPlanetRestricted("THYFERRA", 1)
        StoryUtil.SetPlanetRestricted("KESSEL", 1)
        StoryUtil.SetPlanetRestricted("KATANA_SPACE", 1)

        UnitUtil.SetLockList("EMPIRE", {
            "Generic_Praetor",
            "Strike_Cruiser",
            "TaggeCo_HQ",
            "Imperial_PX10_Company",
            "Imperial_AT_AT_Refit_Company",
            "Imperial_AT_ST_A_Company",
            -- Historical-only units
            "Imperial_Navy_Commando_Squad"
        }, false)

        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["PESTAGE"]) do
            for _, hero_table in pairs(herolist) do
               if starting_era == false and hero_table.progress == false then

                else
                   StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end

        --181st setup (default settings are Phennir 181st, Fel Nssis so Pestage regime needs override)
        UnitUtil.SetLockList("EMPIRE", {
            "Turr_Phennir_TIE_Interceptor_Location_Set"
        }, false)
        Clear_Fighter_Hero("TURR_PHENNIR_TIE_INTERCEPTOR_181ST_SQUADRON")

        UnitUtil.SetLockList("EMPIREOFTHEHAND", {
            "Soontir_Fel_Gray_Location_Set"
        }, false)
        Clear_Fighter_Hero("SOONTIR_FEL_GRAY_SQUADRON")

        UnitUtil.SetLockList("EMPIRE", {
            "Soontir_Fel_181st_Location_Set",
            "Shadow_Squadron_Location_Set"
        })
        Set_Fighter_Hero("SOONTIR_FEL_181ST_SQUADRON", "ROGRISS_AGONIZER")		

    end,
    on_update = function(self, state_context)
        self.current_time = GetCurrentTime()
        
        if (self.current_time >= 40) and (self.IsardApproach == false) and (self.progress == true) then
            self.IsardApproach = true
            if Find_Player("local") == Find_Player("Empire") then
                StoryUtil.Multimedia("TEXT_STORY_IR_ERA_2_PROJECT_AMBITION", 15, nil, "Isard_Loop", 0)
            end
        end
        if (self.current_time >= 60) and (self.HissaApproach == false)  and (self.progress == true) then
            self.HissaApproach = true
            if Find_Player("local") == Find_Player("Empire") then
                StoryUtil.Multimedia("TEXT_STORY_IR_ERA_2_CCOGM", 15, nil, "Hissa_Loop", 0)
            end
        end
        if (self.current_time >= 80) and (self.progress_fired == false) and (self.HissaApproach == true)  and (self.progress == true) then
            self.progress_fired = true
            if Find_Player("local") == Find_Player("Empire") then
                
                local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
                local regime_display_event = plot.Get_Event("Project_Ambition_Dialog")

                regime_display_event.Add_Dialog_Text("Supporting either new regime will result in the following heroes leaving:")

                for planet, herolist in pairs(self.Starting_Spawns["PESTAGE"]) do  
                    for _, hero_table in pairs(herolist) do
                        if hero_table.remove_isard == true and hero_table.remove_ccogm == true then     
                            regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
                        end
                    end
                end
                regime_display_event.Add_Dialog_Text("TEXT_NONE")
                regime_display_event.Add_Dialog_Text("Supporting the Central Committee will result in the following heroes leaving:")
                for planet, herolist in pairs(self.Starting_Spawns["PESTAGE"]) do  
                    for _, hero_table in pairs(herolist) do
                        if hero_table.remove_isard == false and hero_table.remove_ccogm == true then     
                            regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
                        end
                    end
                end

                Story_Event("PROJECT_AMBITION_STARTED")
                Find_Player("Empire").Unlock_Tech(Find_Object_Type("Project_Ambition_Dummy"))
                Find_Player("Empire").Unlock_Tech(Find_Object_Type("Dummy_Regicide_CCoGM"))
            end
        end
    end,
    on_exit = function(self, state_context)
    end
}