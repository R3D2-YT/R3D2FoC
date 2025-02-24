require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("eawx-util/ChangeOwnerUtilities")

return {
    on_enter = function(self, state_context)

        self.LeaderApproach = false
        self.LeadingEmpire = GlobalValue.Get("IMPERIAL_REMNANT")
        GlobalValue.Set("REGIME_INDEX", 5)
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.progress = GlobalValue.Get("PROGRESS_REGIME")
        self.progress_fired = true

        --Interim(?) edge case handling: if the Leading Empire (whether Legitimacy winner or default Green) has no safe planets when Palpy dies. ~Mord
        if not StoryUtil.FindFriendlyPlanet(Find_Player(self.LeadingEmpire)) then
            GlobalValue.Set("GOV_EMP_DISABLE_MULTIMEDIA_HOLO", 1)
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_JAX_EMPIRE_DEFEATED", 15, nil, "Carnor_Loop", 0, nil, {r = 255, g = 255, b = 100})
            StoryUtil.SetPlanetRestricted("THE_MAW", 0)
        end

        self.ImperialTable = {
            "Empire",
            "Greater_Maldrood",
            "Zsinj_Empire",
            "Eriadu_Authority",
            "Pentastar"
        }
        for _, faction in pairs(self.ImperialTable) do
            Find_Player(faction).Lock_Tech(Find_Object_Type("Dummy_Regicide_Jax"))
        end

        Story_Event("JAX_REQUEST_COMPLETED")

        if Find_Player("local") == Find_Player(self.LeadingEmpire) then
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_JAX_ERA", 15, nil, "Carnor_Loop", 0)
        end

        if self.entry_time <= 5 then

            StoryUtil.SetPlanetRestricted("THE_MAW", 1)

            UnitUtil.SetLockList("EMPIRE", {
                "Generic_Executor",
                "Eidolon",
                "Imperial_Dark_Jedi_Squad",
                "Imperial_PX10_Company",
                -- Historical-only units
                "Imperial_Navy_Commando_Squad"             
            }, false)

            UnitUtil.SetLockList("EMPIRE", {
                "Delta_JV7_Squadron",
                "Cygnus_HQ"
            })
            
            if Find_Player("local") == Find_Player("Empire") then
                Story_Event("CARNOR_WELCOME")
            end

            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)
            Set_To_First_Extant_Host("WEDGE_ROGUES_LOCATION_SET", Find_Player("Rebel"), true)
            
        else
            UnitUtil.SetLockList(self.LeadingEmpire, {
                "Eclipse_Star_Destroyer",
                "Sovereign",
                "Hunter_Killer_Probot",
                "Imperial_Chrysalide_Company",
                "Imperial_Dark_Jedi_Squad",
                "Imperial_Dark_Stormtrooper_Squad",
                "Imperial_Compforce_Assault_Squad"
            }, false)

            UnitUtil.SetLockList(self.LeadingEmpire, {
                "Delta_JV7_Squadron",
                "Cygnus_HQ"
            })
            
            UnitUtil.DespawnList{
                "Dummy_Regicide_Jax"
            }
        end

        Set_To_First_Extant_Host("TURR_PHENNIR_TIE_INTERCEPTOR_LOCATION_SET", Find_Player("Empire"), true)

        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["CARNOR"]) do
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
                StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_DAALA_CONTACT", 15, nil, "Daala_Loop", 0)

                local plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.XML")
                local regime_display_event = plot.Get_Event("Palpatine_Request_Dialog")

                regime_display_event.Add_Dialog_Text("TEXT_CAMPAIGN_EVENT_PROGRESS_DAALA_LOSS_HERO")
                for planet, herolist in pairs(self.Starting_Spawns["CARNOR"]) do  
                    for _, hero_table in pairs(herolist) do
                        if hero_table.remove == true then     
                            regime_display_event.Add_Dialog_Text("REGIME_CHANGES", Find_Object_Type(hero_table.object))
                        end
                    end
                end
                Story_Event("DAALA_REQUEST_STARTED")
                Find_Player(self.LeadingEmpire).Unlock_Tech(Find_Object_Type("Dummy_Regicide_Daala"))

            end
        end
    end,
    on_exit = function(self, state_context)
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["CARNOR"]) do
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