require("eawx-util/StoryUtil")
require("eawx-util/ChangeOwnerUtilities")
require("PGStoryMode")
require("PGSpawnUnits")
require("eawx-util/ChangeOwnerUtilities")

return {
    on_enter = function(self, state_context)

        self.LeaderApproach = false
        self.LeadingEmpire = GlobalValue.Get("IMPERIAL_REMNANT")
        GlobalValue.Set("REGIME_INDEX", 6)
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.progress = GlobalValue.Get("PROGRESS_REGIME")
        self.progress_fired = true

        self.ImperialTable = {
            "Empire",
            "Greater_Maldrood",
            "Zsinj_Empire",
            "Eriadu_Authority",
            "Pentastar"
        }
        for _, faction in pairs(self.ImperialTable) do
            Find_Player(faction).Lock_Tech(Find_Object_Type("Dummy_Regicide_Daala"))
        end

        Story_Event("DAALA_REQUEST_COMPLETED")

        if Find_Player("local") == Find_Player(self.LeadingEmpire) then
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_DAALA_ERA", 15, nil, "Daala_Loop", 0)
        end

        if self.entry_time <= 5 then

            UnitUtil.SetLockList("EMPIRE", {
                "Eidolon",
                "IPV1_System_Patrol_Craft",
                "Imperial_PX10_Company",
                "TaggeCo_HQ",
                -- Historical-only units
                "Imperial_Navy_Commando_Squad"
            }, false) 
        
            UnitUtil.SetLockList("EMPIRE", {
                "Nebulon_B_Empire",
                "Crusader_Gunship",
                "Delta_JV7_Squadron",
                "Imperial_Dwarf_Spider_Droid_Company",
                "Cygnus_HQ"
            })
            
            if Find_Player("local") == Find_Player("Empire") then
                Story_Event("DAALA_WELCOME")
            end

            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)
            Set_To_First_Extant_Host("WEDGE_ROGUES_LOCATION_SET", Find_Player("Rebel"), true)

        else

            StoryUtil.SetPlanetRestricted("THE_MAW", 0)
            
            UnitUtil.SetLockList("EMPIRE", {
                "IPV1_System_Patrol_Craft"
            }, false)

            --Regular Imperial asset progression
            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Executor",
                "Nebulon_B_Empire",
                "Crusader_Gunship",
                "Imperial_Dwarf_Spider_Droid_Company"
            })

            if self.Active_Planets["THE_MAW"] then
                local planet = FindPlanet("The_Maw")
                if planet.Get_Owner() ~= Find_Player("Neutral") then
                    ChangePlanetOwnerAndRetreat(planet, Find_Player(self.LeadingEmpire))
                end
                local spawn_list_Daala = {
                    -- "Empire_Shipyard_Level_Three",
                    -- "Empire_Star_Base_4",
                    -- "Empire_MoffPalace",
                    -- "E_Ground_Barracks",
                    "Imperial_Stormtrooper_Squad",
                    "Imperial_Stormtrooper_Squad",
                    "Generic_Star_Destroyer",
                    "Generic_Star_Destroyer",
                    "Generic_Star_Destroyer",
                    "Crusader_Gunship",
                    "Crusader_Gunship",
                    "Strike_Cruiser",
                    "Strike_Cruiser",
                    "Carrack_Cruiser",
                    "Carrack_Cruiser"
                }
                SpawnList(spawn_list_Daala, planet, Find_Player(self.LeadingEmpire), true, false)

            end

            self.DespawnList = {
                "Dummy_Regicide_Daala",
            }

            for _, object in pairs(self.DespawnList) do
                checkObject = Find_First_Object(object)
                if TestValid(checkObject) then
                    checkObject.Despawn()
                end
            end

            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)

            crossplot:publish("ERA_SIX_TRANSITION", "empty")

        end

        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["DAALA"]) do
            for _, hero_table in pairs(herolist) do
                if starting_era == false and hero_table.progress == false then

                else
                    StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end

    end,
    on_update = function(self, state_context)
        self.current_time = GetCurrentTime() - self.entry_time
        if (self.current_time >= 60) and (self.LeaderApproach == false) and (self.progress == true) then
            self.LeaderApproach = true
            if Find_Player("local") == Find_Player(self.LeadingEmpire) then
                StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_PELLAEON_CONTACT", 15, nil, "Daala_Loop", 0)

                local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
                local regime_display_event = plot.Get_Event("Pellaeon_Request_Dialog")

                regime_display_event.Add_Dialog_Text("TEXT_CAMPAIGN_EVENT_PROGRESS_PELLAEON_LOSS_HERO")
                for planet, herolist in pairs(self.Starting_Spawns["DAALA"]) do  
                    for _, hero_table in pairs(herolist) do
                        if hero_table.remove == true then     
                            regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
                        end
                    end
                end

                Story_Event("PELLAEON_REQUEST_STARTED")
                Find_Player(self.LeadingEmpire).Unlock_Tech(Find_Object_Type("Dummy_Regicide_Pellaeon"))
            end
        end
    end,
    on_exit = function(self, state_context)
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["DAALA"]) do
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