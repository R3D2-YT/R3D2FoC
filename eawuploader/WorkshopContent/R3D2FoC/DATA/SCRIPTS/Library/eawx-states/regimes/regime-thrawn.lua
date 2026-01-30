require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")

return {
    on_enter = function(self, state_context)

        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        GlobalValue.Set("REGIME_INDEX", 3)
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.LeadingEmpire = Find_Player("Empire")
        self.LeaderApproach = true
        
        Find_Player("Empire").Lock_Tech(Find_Object_Type("Dummy_Regicide_Thrawn"))

        Story_Event("THRAWN_REQUEST_COMPLETED")
        if self.Active_Planets["CORUSCANT"] then
            Story_Event("GC_DELTA_SOURCE_INIT")
        end
        if self.Active_Planets["KATANA_SPACE"] then
            Story_Event("GC_KATANA_FLEET")
        end

        Story_Event("THRAWN_REQUEST_COMPLETED")

        if Find_Player("local") == self.LeadingEmpire then
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_THRAWN_ERA", 15, nil, "Thrawn_Loop", 0)
        end

        if self.entry_time <= 5 then

            StoryUtil.SetPlanetRestricted("BYSS", 1)
            StoryUtil.SetPlanetRestricted("THE_MAW", 1)

            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Executor",
                "Generic_Praetor",
                "Eidolon",
                "TaggeCo_HQ",
                "Imperial_PX10_Company",
                -- Historical-only units
                "Imperial_Navy_Commando_Squad"
            }, false)
            
            UnitUtil.SetLockList("EMPIRE", {
                "Imperial_Boarding_Shuttle",
                "Imperial_Ysalamiri_Stormtrooper_Squad",
                "Noghri_Assassin_Squad"
            })

            if Find_Player("local") == Find_Player("Empire") then
                Story_Event("THRAWN_WELCOME")
            end

        else
            StoryUtil.SetPlanetRestricted("KATANA_SPACE", 0)

            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Executor",
                "YE_4_Squadron",
                "Imperial_PX10_Company",
                "Imperial_TNT_Company",
                "Vessery_Stranger_Location_Set",
                "Shadow_Squadron_Location_Set",
				"Scimitar_Squadron_Location_Set",
                "Rebuild_Brashin"
            }, false)

            UnitUtil.SetLockList("EMPIRE", {
                "Imperial_Boarding_Shuttle",
                "Beta_ETR_3_Squadron",
                "Imperial_Ysalamiri_Stormtrooper_Squad",
                "Noghri_Assassin_Squad",
                "Imperial_AT_PT_Company"
            })

            UnitUtil.DespawnList{
                "Dummy_Regicide_Thrawn",
                "Isard_Lusankya",
                "Thrawn_Grey_Wolf"
            }

            Clear_Fighter_Hero("VESSERY_STRANGER_SQUADRON")
            
        end

        Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)

        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["THRAWN"]) do
            for _, hero_table in pairs(herolist) do
                if starting_era == false and hero_table.progress == false then

                else
                    StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end
        for planet, herolist in pairs(self.Starting_Spawns["CCOGM"]) do
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
        for planet, herolist in pairs(self.Starting_Spawns["ISARD"]) do
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

    end,
    on_update = function(self, state_context)
        -- self.current_time = GetCurrentTime() - self.entry_time
        -- if (self.current_time >= 60) and (self.LeaderApproach == false) then
        --     self.LeaderApproach = true
        --     if Find_Player("local") == Find_Player("Empire") then

        --         local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
        --         local regime_display_event = plot.Get_Event("TBD Warning")

        --         for planet, herolist in pairs(self.Starting_Spawns["THRAWN"]) do  
        --             for _, hero_table in pairs(herolist) do
        --                 if hero_table.remove == true then     
        --                     regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
        --                 end
        --             end
        --         end

        --         Story_Event("TBD Warning")
        --     end
        -- end
    end,
    on_exit = function(self, state_context)
    end
}