require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")
require("PGStoryMode")
require("PGSpawnUnits")
require("eawx-util/ChangeOwnerUtilities")

return {
    on_enter = function(self, state_context)

        self.LeadingEmpire = GlobalValue.Get("IMPERIAL_REMNANT")
        GlobalValue.Set("REGIME_INDEX", 7)
        self.LeaderApproach = false
        self.progress_fired = true
   
        self.Active_Planets = StoryUtil.GetSafePlanetTable()
        self.entry_time = GetCurrentTime()
        self.plot = Get_Story_Plot("Conquests\\Events\\EventLogRepository.xml")
        self.progress = GlobalValue.Get("PROGRESS_REGIME")

        --Interim(?) edge case handling: if the Leading Empire (whether Legitimacy winner or default Green) has no safe planets when Daala dies. ~Mord
        if not StoryUtil.FindFriendlyPlanet(Find_Player(self.LeadingEmpire)) then
            GlobalValue.Set("GOV_EMP_DISABLE_MULTIMEDIA_HOLO", 1)
            StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_PELLAEON_EMPIRE_DEFEATED", 15, nil, "Pellaeon_Loop", 0, nil, {r = 255, g = 255, b = 100})
        end

        self.ImperialTable = {
            "Empire",
            "Greater_Maldrood",
            "Zsinj_Empire",
            "Eriadu_Authority",
            "Pentastar"
        }
        for _, faction in pairs(self.ImperialTable) do
            Find_Player(faction).Lock_Tech(Find_Object_Type("Dummy_Regicide_Pellaeon"))
        end

        Story_Event("PELLAEON_REQUEST_COMPLETED")

        -- Historic GCs with Pellaeon tend to be more unique scripts (at least one of them). Should be redone longer-term.
        if self.progress == true then
            if Find_Player("local") == Find_Player(self.LeadingEmpire) then
                StoryUtil.Multimedia("TEXT_CONQUEST_EVENT_IR_PELLAEON_ERA", 15, nil, "Pellaeon_Loop", 0)
            end
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
                "RogrissUpgrade",
                "PellaeonUpgrade2",
                "Nebulon_B_Empire",
                "Crusader_Gunship",
                "Imperial_Dwarf_Spider_Droid_Company",
                -- Integrated factions
                "Crimson_Victory",
                "PellaeonUpgrade",
            })
            
            if Find_Player("local") == Find_Player("Empire") then
                Story_Event("PELLAEON_WELCOME")
            end

            --181st setup (default settings are Phennir Interceptor 181st, so Pellaeon regime needs override)
            UnitUtil.SetLockList("EMPIRE", {
                "Turr_Phennir_TIE_Interceptor_Location_Set"
            }, false)
            Upgrade_Fighter_Hero("TURR_PHENNIR_TIE_INTERCEPTOR_181ST_SQUADRON","TURR_PHENNIR_TIE_DEFENDER_181ST_SQUADRON")
            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_DEFENDER_LOCATION_SET", Find_Player("Empire"), true)
			UnitUtil.SetLockList("EMPIRE", {
                "Turr_Phennir_TIE_Defender_Location_Set"
            })

            Set_To_First_Extant_Host("WEDGE_ROGUES_LOCATION_SET", Find_Player("Rebel"), true)

        else
            --if you entered Pellaeon's regime voluntarily, spawn Daala/Daala_Scylla, preferably on Hakassi.
            if TestValid(Find_First_Object("Dummy_Regicide_Pellaeon")) then
                StoryUtil.SpawnAtSafePlanet("HAKASSI", Find_Player(self.LeadingEmpire), self.Active_Planets, {"Daala_Scylla"})  
            end
            
            UnitUtil.SetLockList(self.LeadingEmpire, {
                "Delta_JV7_Squadron",
                "Cygnus_HQ"
            }, false)
        
            UnitUtil.DespawnList{
                "Dummy_Regicide_Pellaeon",
                "Daala_Knight_Hammer"
            }

            UnitUtil.SetLockList(self.LeadingEmpire, {
                "RogrissUpgrade",
                "PellaeonUpgrade2"
            })

            --181st setup (default settings are Phennir Interceptor 181st, so Pellaeon regime needs override)
            UnitUtil.SetLockList("EMPIRE", {
                "Turr_Phennir_TIE_Interceptor_Location_Set"
            }, false)
            Upgrade_Fighter_Hero("TURR_PHENNIR_TIE_INTERCEPTOR_181ST_SQUADRON","TURR_PHENNIR_TIE_DEFENDER_181ST_SQUADRON")
            Set_To_First_Extant_Host("TURR_PHENNIR_TIE_DEFENDER_LOCATION_SET", Find_Player("Empire"), true)
            UnitUtil.SetLockList("EMPIRE", {
                "Turr_Phennir_TIE_Defender_Location_Set"
            })

        end

        local starting_era = false
        if self.entry_time <= 5 then
            starting_era = true
        end
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["PELLAEON"]) do
            for _, hero_table in pairs(herolist) do
                if starting_era == false and hero_table.progress == false then

                else
                    StoryUtil.SpawnAtSafePlanet(planet, self.LeadingEmpire, self.Active_Planets, {hero_table.object})  
                end
            end
        end

    end,
    on_update = function(self, state_context)
    end,
    on_exit = function(self, state_context)
        self.Starting_Spawns = require("eawx-mod-icw/spawn-sets/EmpireProgressSet")
        for planet, herolist in pairs(self.Starting_Spawns["PELLAEON"]) do
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